package talent.core;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.w3c.dom.*;
import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import java.util.*;
/**
 * @author Administrator
 * @version 1.0
 * @date 2006-12-30
 * @class_displayName ChangeId2Name
 */

public class ChangeId2Name {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_changeId2Name
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="表名"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="要查询的字段名"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="该表的PK"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="id连接成的字符串"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="返回的name"
	 */
	public static int BL_changeId2Name(Document doc, BizContext param)
		throws Exception {
		String tabName = (String) param.getParaObjectAt(0);
		String targetField = (String) param.getParaObjectAt(1);
		String pk = (String) param.getParaObjectAt(2);
		String ids = (String) param.getParaObjectAt(3);
		PersistenceBroker db = param.getDBBroker();
		Node node = (Node) param.getParaObjectAt(4);
	    String names=(String)ChangeId2Name.changeId2Name(db,tabName,targetField,pk,ids);
	    XmlUtil.setNodeValue(node,names);
	   
		return 1;
	}
	
	public static String changeId2Name(PersistenceBroker db,String tabName,String targetField,String tabPK,String oldStr){
		String newString="";
		if (oldStr == null||oldStr.equals(""))
			return "";		
	//System.out.println("=======tabName:"+tabName+"  ids:"+oldStr);
		boolean canExec=false;
		String idList[] = oldStr.split(",");
		int index=oldStr.indexOf(",");		
		String sql = "select "+targetField+" from "+tabName+" where ";
		
		if(index==-1){			
			  canExec=true;
		}
		
		for(int i=0; i< idList.length; i++){
			if(idList[i]!=null&&!idList[i].equals("")){
			if(i!=(idList.length-1)){
				sql += tabPK+"='" + idList[i] + "' or ";
				canExec=true;
			}else {
				canExec=true;
				sql += tabPK+"='" + idList[i] + "'"; 
			}
			}
		}
		
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{	
			//System.out.println("===================sql:"+sql);
			cn = db.getConnection();
			st = cn.createStatement();	
			if(canExec){				
				rs = st.executeQuery(sql);
			}else{
				return "";		
			}
						
			while(rs.next()){
				newString += rs.getString(1) + ",";
			}
			if(newString!=null&&!newString.equals(""))newString = newString.substring(0,newString.length()-1);
			
		}catch(Exception e){
			System.out.println("------------error:"+e);
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		
		return newString;
	}
	
	

	/**
	 * 把字符串分解并重新组合为sql查询条件语句
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_changeIdsToSqlstr
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输出节点"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输入要转化的字符串"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="输入字段名称"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="输入连接字符串 (or/and/...)"
	 */
	public static int BL_changeIdsToSqlstr(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		String param2 = (String)param.getParaObjectAt(2);
		String param3 = (String)param.getParaObjectAt(3);
		String sqlWhere="";
		String str=XmlUtil.getNodeValue(param1);
		if(str!=null&&(!str.equals(""))){
			String idList[]=str.split(",");
			for(int i=0; i< idList.length; i++){
				if(idList[i]!=null&&!idList[i].equals("")){
					if(i!=(idList.length-1)){
						sqlWhere +=" "+ param2+"=" + idList[i] + " " +param3;
						
					}else {
						sqlWhere +=" "+ param2+"=" + idList[i] + " "; 
					}
				}
			}
			XmlUtil.setNodeValue(param0,sqlWhere);
		}
		return 1;
	}
	/**
	 * 取得用","分割的子字符串个数
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_subStringCount
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="子串个数"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="要分割的字符串"
	 */
	public static int BL_subStringCount(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		int count = getsubStrCount(param1,",");
		XmlUtil.setNodeValue(param0,String.valueOf(count));
		return 1;
	}
	
	public static int getsubStrCount(String sourceStr,String regex)throws Exception{
		int count = 0;
		if(sourceStr==null||sourceStr.equals("")) return 0;
		int bs = 0;
		while(!sourceStr.equals("")){
            bs=sourceStr.indexOf(regex);
            if(bs==-1){            //分割符已在最后
            	break;
            }
            String str=sourceStr.substring(0,bs);
            if(!str.equals("")) count++;
            if(bs==(sourceStr.length()-1)){
                break;
            }else{
            	sourceStr=sourceStr.substring(bs+regex.length(),sourceStr.length());
            }
        }
		return count + 1;
	}
	/**
	 * 将姓名字符串取得默认的几个名字,多余的名称用...表示
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_DefaultNameString
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="输出后的名字的字符串"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="需要改变的名字字符串"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="取得几个名字的数目"
	 */
	public static int BL_DefaultNameString(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		String param2 = (String)param.getParaObjectAt(2);
		int count = Integer.parseInt(param2);
		String subName = getNameString(param1,",",count);
		XmlUtil.setNodeValue(param0,subName);
		return 1;
	}
	
	public static String getNameString(String sourceStr,String regex,int count) throws Exception{
		String subName ="";
		int regexCount = 0;
		int temp=0;
		for(int i=0;i<sourceStr.length();i++){
			 if(sourceStr.indexOf(regex,i)!=-1){
			 	regexCount++;
			 	i = sourceStr.indexOf(regex,i)+regex.length()-1;
			 	temp = i;
			 }
			 if(regexCount==count) break;
		}
		if(regexCount<=count-1){
			subName =  sourceStr;
		}else{
			subName = sourceStr.substring(0,temp) + "...";
		}
		
		return subName;
	}
	
	/**
	 * 设置字符串显示默认子字符串,不显示的用"..."表示
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_DefaultSubString
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="输出的子字符串"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="需要输入的字符串"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="显示子字符串的长度"
	 */
	public static int BL_DefaultSubString(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		String param2 = (String)param.getParaObjectAt(2);
		int count = Integer.parseInt(param2);
		String subString = getSubString(param1,count);
		XmlUtil.setNodeValue(param0,subString);
		return 1;
	}
	
	public static String getSubString(String sourceStr,int count) throws Exception{
		String subString ="";
		
		if(sourceStr.length()>count){
		    subString = sourceStr.substring(0,count)+"...";
		}else{
			subString = sourceStr;
		}
		
		return subString;
	}
}