package talent.core;
import org.w3c.dom.*;
import org.apache.commons.logging.*;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import com.primeton.tp.common.xml.XmlUtil;

/**
 * @author Administrator
 * @version 1.0
 * @date 2006-4-24
 * @class_displayName TalentUtil
 */

public class TalentUtil {
	public static Log fccLog = LogFactory.getLog(TalentUtil.class);
	

	/**
	 * 得到各用户所属部门及职位
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getOrgPos
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="用户列表list[@type='men']"
	 */
	public static int BL_getOrgPos(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		
		PersistenceBroker db = param.getDBBroker();
		
		List personOrg = TalentUtil.getAllPTOMap(db);
		List personOrg2 = TalentUtil.getAllPTOMap2(db);
		//List personJob = TalentUtil.getAllPTPMap(db);
		
		
		NodeList nodelist = param0.getChildNodes();
		
		for(int i = 0; i < nodelist.getLength(); i++) {
			Element ele = (Element) nodelist.item(i);
			
			String operatorId = ele.getElementsByTagName("operatorID").item(0).getFirstChild().getNodeValue();
			
			String orgId = TalentUtil.getOrg(personOrg,operatorId);
			if("-2".equalsIgnoreCase(orgId)) orgId = TalentUtil.getOrg(personOrg2,operatorId);
			//String jobId = TalentUtil.getJob(personJob,operatorId);
			
			Element tempOrg = doc.createElement("ORGID");
			//Element tempJob = doc.createElement("JOBID");
			XmlUtil.setNodeValue(tempOrg,orgId);
			//XmlUtil.setNodeValue(tempJob,jobId);
			ele.appendChild(tempOrg);
			//ele.appendChild(tempJob);
		
		}

		return 1;
	}
	
	
	public static List getAllPTOMap(PersistenceBroker db) {
		List list = new ArrayList();
		String sqlstr = "select * from EOSORG_T_EMPORGREF";
		
		fccLog.info("人员部门查询SQL：" + sqlstr);
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sqlstr);
			while(rs.next()) {
				String orgId = String.valueOf(rs.getInt("ORGID"));
				String operatorId = String.valueOf(rs.getInt("OPERATORID"));
				PersonToOrg temp = new PersonToOrg(orgId,operatorId);
				list.add(temp);
			
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
		}
		return list;
	
	}
	
	public static List getAllPTOMap2(PersistenceBroker db) {
		List list = new ArrayList();
		
		String sqlstr = "select OPERATORID,ORGID from EOSORG_T_EMPLOYEE where ORGID is not null";
		fccLog.info("人员部门查询SQL：" + sqlstr);
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sqlstr);
			while(rs.next()) {
				String operatorId = String.valueOf(rs.getInt("OPERATORID"));
				String orgId = String.valueOf(rs.getInt("ORGID"));
				
				PersonToOrg temp = new PersonToOrg(orgId,operatorId);
				list.add(temp);
			
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
		}
		return list;
	
	}
	
	
	public static List getAllPTPMap(PersistenceBroker db) {
		List list = new ArrayList();
		String sqlstr = "select * from SYS_JOBPERSON";
		fccLog.info("人员岗位查询SQL：" + sqlstr);
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(sqlstr);
			while(rs.next()) {
				String jobId = String.valueOf(rs.getInt("JOBID"));
				String operatorId = String.valueOf(rs.getInt("OPERATORID"));
				PersonToPos temp = new PersonToPos(jobId,operatorId);
				list.add(temp);
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
		}
		return list;
	
	
	}
	
	public static String getOrg(List list,String operatorId) {
		String orgId = "";
		for(int i = 0; i < list.size(); i++) {
			PersonToOrg temp = (PersonToOrg) list.get(i);
			if(temp.getOperatorId().equalsIgnoreCase(operatorId)){
				orgId += temp.getOrgId() + ",";
				
			}
		
		}
		if("".equalsIgnoreCase(orgId)) orgId = "-2";
		if(!"-2".equalsIgnoreCase(orgId)) orgId = orgId.substring(0,orgId.lastIndexOf(","));
		
		return orgId;
	
	}
	
	public static String getJob(List list,String operatorId) {
		String jobId = "-2";
		for(int i = 0; i < list.size(); i++) {
			PersonToPos temp = (PersonToPos) list.get(i);
			if(temp.getOperatorId().equalsIgnoreCase(operatorId)) {
				jobId = temp.getPosId();
				break;
			}
		}
		return jobId;
	
	}
	
	
	

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_sortOrgByLevel
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="把部门按部门树排序"
	 */
	public static int BL_sortOrgByLevel(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);//list[@type='orglist']/EOSORG_T_Organization
		NodeList allorg = param0.getChildNodes();
		
		if(allorg!=null && allorg.getLength() > 0) {
			for(int i = 0; i < allorg.getLength(); i++){
				Node node = allorg.item(i);
				Element ele = (Element) node;
				Node parentOrgNode = ele.getElementsByTagName("PARENTORGID").item(0);
				if(XmlUtil.getNodeValue(parentOrgNode) == null || "".equalsIgnoreCase(String.valueOf(XmlUtil.getNodeValue(parentOrgNode)))) {
					XmlUtil.setNodeValue(parentOrgNode,"0");
				}
			}
			
		
		}
		
		
		List tempList = new ArrayList();
		int level = 1;
		String pId = "0";
		
		startsort(tempList,allorg,pId,level);
		if(allorg!=null && allorg.getLength() > 0) {
			for(int i = 0; i < allorg.getLength(); i++) {
				param0.removeChild(allorg.item(i));
			}
		}
		if(tempList.size() > 0) {
			for(int j = 0; j < tempList.size(); j++) {
				Node nd = (Node) tempList.get(j);
				param0.appendChild(nd);
			}
		}
		
		
		return 1;
	}
	
	public static void startsort(List save,NodeList allorg,String pId,int level) {
		if(allorg!=null && allorg.getLength() > 0) {
			for(int i = 0; i < allorg.getLength(); i++) {
				Node node = allorg.item(i);
				Element ele = (Element) node;//EOSORG_T_Organization
				Node parentOrgNode = ele.getElementsByTagName("PARENTORGID").item(0);//parentOrgID
				Node orgNameNode = ele.getElementsByTagName("ORGNAME").item(0);//orgName
				Node orgIdNode = ele.getElementsByTagName("ORGID").item(0);//orgID
				
				String parentId = XmlUtil.getNodeValue(parentOrgNode);
				String orgName = XmlUtil.getNodeValue(orgNameNode);
				String orgId = XmlUtil.getNodeValue(orgIdNode);
				if(parentId.equalsIgnoreCase(pId)) {
					String temp = getVirtulValue(orgName,level);
					XmlUtil.setNodeValue(orgNameNode,temp);
					save.add(node);
					
					if(hasChild(allorg,orgId)){
						level++;
						startsort(save,allorg,orgId,level);
						level--;
					}
					
					
					
				}
				
				
			}
		}
		
	}
	
	
	public static String getVirtulValue(String curValue,int level) {
		String result = "";
		for(int i = 0; i < level; i++) {
			result += "&nbsp;";
		}
		result += curValue;
		
		
		return result;
		
	}
	
	public static boolean hasChild(NodeList allorg,String orgId) {
		boolean has = false;
		for(int i = 0; i < allorg.getLength(); i++) {
			Node node = allorg.item(i);
			Element ele = (Element) node;//EOSORG_T_Organization
			Node parentOrgNode = ele.getElementsByTagName("PARENTORGID").item(0);//parentOrgID
			String parentId = XmlUtil.getNodeValue(parentOrgNode);
			if(parentId.equals(orgId)) {
				return true;
			}
		}
		return has;
		
	}
}