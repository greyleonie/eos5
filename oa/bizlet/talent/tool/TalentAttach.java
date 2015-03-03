package talent.tool;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import com.primeton.tp.common.xml.*;
import java.sql.*;
import java.io.*;
/**
 * @author Administrator
 * @version 1.0
 * @date 2005-7-23
 * @class_displayName TalentAttach
 */

public class TalentAttach {
	public static final String TOOL_MAILATTCH = "TOOL_MailAttch";

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_mailAttach
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="附件的大小tempsize"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="附件ids，用|分开的一个字符串 FWAttchId"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="一个可用的附件的list"
	 */
	public static int BL_mailAttach(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);//tempsize
		Node param1 = (Node) param.getParaObjectAt(1);//FWAttchId
		Node param2 = (Node) param.getParaObjectAt(2);//返回一个list
		Node param3 = (Node) param.getParaObjectAt(3);//mailid
		Node param4 = (Node) param.getParaObjectAt(4);//用户帐号
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String uploadsize = param0.getFirstChild().getNodeValue();
		double totalsize = Double.parseDouble(uploadsize);//总共大小
		String attachids = param1.getFirstChild().getNodeValue();
		System.out.print(attachids);
		String deleteids[] = attachids.split("\\|");//所有被删除的附件id
		
		String mailid = param3.getFirstChild().getNodeValue();
		String useraccount = param4.getFirstChild().getNodeValue();
		PersistenceBroker db = param.getDBBroker();
		String range = "(";
		String sqlstr = "select * from "+ TalentAttach.TOOL_MAILATTCH + " where MAILID=" +mailid;
		if(deleteids.length>0&&attachids!=null&&!("".equals(attachids))){
			System.out.print(deleteids.length);
			for(int i=0;i<deleteids.length;i++){
				range+=deleteids[i] + ",";
			}//for
			
			range = range.substring(0,range.length()-1) + ")";
			sqlstr+=" and ATTACHID not in "+range;
			
		}//if
		System.out.print(sqlstr);
		try{
			con = db.getConnection();
			st = con.createStatement();
			rs = st.executeQuery(sqlstr);
			while(rs.next()){
				Node entity = doc.createElement("TOOL_MailAttch");
				Node aName = doc.createElement("ATTCHNAME");
				Node apath = doc.createElement("FILEPATH");
				Node atype = doc.createElement("REMARK");
				String attachName = rs.getString("ATTCHNAME");
				String tempfilePath = rs.getString("FILEPATH");
				String filetype = rs.getString("REMARK");
				String truefilePath = TalentAttach.getDstFile(useraccount,tempfilePath);
				totalsize+=TalentAttach.fileCopy(truefilePath,tempfilePath);
				XmlUtil.setNodeValue(aName,attachName);
				XmlUtil.setNodeValue(apath,truefilePath);
				XmlUtil.setNodeValue(atype,filetype);
				entity.appendChild(aName);
				entity.appendChild(apath);
				entity.appendChild(atype);
				param2.appendChild(entity);
			    
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(con!=null) con.close();
				
			}catch(Exception ex){
				ex.printStackTrace();
			}
		
		}
		
		Double d = new Double(totalsize);
		Integer i = new Integer(d.intValue());
		XmlUtil.setNodeValue(param0,i.toString());

		return 1;
	}
	
	public static double fileCopy(String dstfile,String srcfile) throws Exception{
		double total = 0.00;
		int pos = dstfile.lastIndexOf("\\");
		String path = dstfile.substring(0,pos);
		String filename = dstfile.substring(pos+1,dstfile.length());
		File dir = new File(path);
		if(!dir.isFile()){
			if(!dir.exists()) dir.mkdirs();
		}
		File infile = new File(srcfile);
		File outfile = new File(path,filename);
		
		FileInputStream in = new FileInputStream(infile);
		BufferedInputStream bufin = new BufferedInputStream(in);
		
		FileOutputStream out = new FileOutputStream(outfile);
		BufferedOutputStream bufout = new BufferedOutputStream(out);
		byte[] bsize = new byte[1024];
		int i = 0;
		
		while((i=bufin.read(bsize))!=-1){
			bufout.write(bsize,0,i);
			total+=i;
		
		}
		
		return total;
	 
	}
	
	public static String getDstFile(String useraccount,String srcfile) throws Exception{
		String result = "";
		
		int pos = srcfile.lastIndexOf("\\");
		String filename = srcfile.substring(pos+1);
		String temp = srcfile.substring(0,pos);
		int i = temp.lastIndexOf("\\");
		String prepath = temp.substring(0,i+1);
		result = prepath + useraccount + "\\" + filename;
		return result;
	}

}