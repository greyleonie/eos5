package talent.tool;
import org.w3c.dom.*;

import talent.tool.MailDirectory;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import com.primeton.tp.common.xml.*;

import java.sql.Connection;
import java.sql.Statement;

import java.sql.ResultSet;
import java.util.*;
import java.text.DecimalFormat;
/**
 * @author Administrator
 * @version 1.0
 * @date 2005-7-4
 * @class_displayName TalentMail
 */

public class TalentMail {
	public static final String TOOL_MailDirectory = "TOOL_MailDirectory";//个人邮件夹表    1
	public static final String TOOL_Mail = "TOOL_Mail";                  //电子邮件表      2
	public static final String TOOL_MailCapacity = "TOOL_MailCapacity";  //邮箱容量表      3
	public static final String TOOL_MailInfo = "TOOL_MailInfo";          //个人邮箱参数表   4
	public static final String TOOL_MailAttch = "TOOL_MailAttch";        //邮件附件表       5
	public static final String TOOL_MAILGROUP = "TOOL_MAILGROUP";        //邮件组群表       6
	public static final String TOOL_MAILSERVER = "TOOL_MAILSERVER";      //邮件服务器表     7
	

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_folderManage
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc=""
	 */
	public static int BL_folderManage(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		Node param2 = (Node)param.getParaObjectAt(2);
		
		
		String userid = ((Element)param0).getElementsByTagName("operatorID").item(0).getFirstChild().getNodeValue();//得到用户帐号
		PersistenceBroker db = param.getDBBroker();
		
		
		ResultSet rss = null;
		List folders = TalentMail.getMailFolder(db,userid);//得到所有的邮件夹
		int capacity = TalentMail.getMailCapacity(db,userid);//得到邮箱容量
		int totalnum = 0;//邮件总数
		//int totalbyte = 0;//邮件总共大小
		double totalbyte = 0.000;
		int size = folders.size();//邮件夹数量
		Connection cn = db.getConnection();
		Statement sts = cn.createStatement();
		for(int i=0;i<size;i++){
			MailDirectory tempfolder = (MailDirectory)folders.get(i);
			int mailid = tempfolder.getId();
			String id = String.valueOf(mailid);
			String name = tempfolder.getMaildirName();
			String flag = tempfolder.getFlag();
			int mailnum = 0;//邮件数
			int newmail = 0;//新邮件数
			//int usednum = 0;//使用空间
			double usednum = 0.000;
			
			Element entity = doc.createElement("Folder");//创建邮件夹元素
			Element tempId = doc.createElement("FolderId");//创建邮件夹标识
			XmlUtil.setNodeValue(tempId,id);//设置邮件夹标识的值
			
			Element tempName = doc.createElement("FolderName");//创建邮件夹名字元素
			XmlUtil.setNodeValue(tempName,name);//设置邮件夹名字的值
			
			Element tempFlag = doc.createElement("FolderFlag");//创建邮件夹flag
			XmlUtil.setNodeValue(tempFlag,flag);//设置邮件夹flag的值
			
			Element tempmailNum = doc.createElement("MailNum");//创建邮件数目元素
			Element tempnewMail = doc.createElement("NewMail");//创建新邮件元素
			Element tempusedNum = doc.createElement("UsedNum");//创建占用空间元素
			
			String sqlstr ="select * from "+TalentMail.TOOL_Mail+" where MAILDIRID="+mailid+" and USERACCOUNT='"+userid+"'";
			rss = sts.executeQuery(sqlstr);
			while(rss.next()){
				mailnum++;//邮件数加1
				String state = rss.getString("READFLAG");
				if(state.equalsIgnoreCase("0")) newmail++;//末读邮件数
				//usednum+=rss.getInt("MAILSIZE");//使用空间数
				usednum+=rss.getDouble("MAILSIZE");
			}//while
			rss.close();
			totalnum+=mailnum;
			totalbyte+=usednum;
			XmlUtil.setNodeValue(tempmailNum,String.valueOf(mailnum));
			XmlUtil.setNodeValue(tempnewMail,String.valueOf(newmail));
			XmlUtil.setNodeValue(tempusedNum,String.valueOf(usednum));
			entity.appendChild(tempId);
			entity.appendChild(tempName);
			entity.appendChild(tempFlag);
			entity.appendChild(tempmailNum);
			entity.appendChild(tempnewMail);
			entity.appendChild(tempusedNum);
			param1.appendChild(entity);
			
		}//for
		if(rss!=null) rss.close();
		if(sts!=null) sts.close();
		if(cn!=null) cn.close();
		Element mailtotal = doc.createElement("MailTotal");//邮件总数
		XmlUtil.setNodeValue(mailtotal,String.valueOf(totalnum));
		Element mailsize = doc.createElement("MailSize");//邮箱占用空间
		XmlUtil.setNodeValue(mailsize,String.valueOf(totalbyte));
		Element mailcapacity = doc.createElement("MailCapacity");//邮箱容量
		XmlUtil.setNodeValue(mailcapacity,String.valueOf(capacity));
		Element msize = doc.createElement("MailMSize");//邮件M使用大小
		
		String m="";
		double usedsize =(double)totalbyte;
		System.out.print("**************"+totalbyte+"***************");
		if(totalbyte>1024*1024){ 
			usedsize =(double)totalbyte/(1024*1024);
			DecimalFormat dft = new DecimalFormat("####.000");
			m = dft.format(usedsize)+"MB";
		}else{
			m=String.valueOf(usedsize)+"Byte";
		}
		 
		
		 
		XmlUtil.setNodeValue(msize,m);
		Node root = param2;
		//Node root = doc.getDocumentElement().getElementsByTagName("data").item(0);
		
		root.appendChild(mailtotal);
		root.appendChild(mailsize);
		root.appendChild(mailcapacity);
		root.appendChild(msize);
		
		
		return 1;
	}
	
	public static List getMailFolder(PersistenceBroker db,String userid) throws Exception{
		List list = new ArrayList();
		String sqlstr = "select * from "+TalentMail.TOOL_MailDirectory+" where USERACCOUNT='000000' or USERACCOUNT='"+userid+"' order by MAILDIRID";
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			con = db.getConnection();
			st = con.createStatement();
			rs = st.executeQuery(sqlstr);
			if (rs != null) {
			   while(rs.next()){
				  MailDirectory folder = new MailDirectory(rs.getInt("MAILDIRID"),rs.getString("USERACCOUNT"),rs.getString("MAILDIRNAME"),rs.getString("FLAG"),rs.getString("REMARK"));
				  list.add(folder);
			   }
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			if(con!=null) con.close();
		}
	
		return list;
	}
	
	public static int getMailCapacity(PersistenceBroker db,String userid) throws Exception{
		int capacity = 60;
		String sqlstr = "select * from "+TalentMail.TOOL_MailCapacity+" where USERACCOUNT='"+userid+"'";
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			con = db.getConnection();
			st = con.createStatement();
			rs = st.executeQuery(sqlstr);
			if(rs.next()){
				capacity = rs.getInt("MAILCAPACITY");
			}
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			if(con!=null) con.close();
			
		}
		return capacity;
	}
	
	
	
	
}