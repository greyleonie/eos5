package talent.core;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import com.primeton.tp.common.xml.XmlUtil;
import java.util.List;
import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;
import java.sql.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
/**
 * @author Administrator
 * @version 1.0
 * @date 2006-8-1
 * @class_displayName TaskCooperator
 */

public class TaskCooperator {

	/**
	 * 得到任务ids
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getTaskIds
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="人员名称"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="人员部门"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="任务(id1,id2,id3)"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="当前用户"
	 */
	public static int BL_getTaskIds(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		Node param2 = (Node) param.getParaObjectAt(2);
		Node param3 = null;
		if(param.getParaObjectAt(3)!=null) {
			param3 = (Node) param.getParaObjectAt(3);
			String fcc = XmlUtil.getNodeValue(param3);
			if(fcc == null || "".equalsIgnoreCase(fcc)) param3 = null;
		}
		
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		String curUser = null;
		if(param3!=null) curUser = XmlUtil.getNodeValue(param3);
		List allDeptList = getAllDept(con);//所有部门
		List allTaskList = getAllTask(con ,allDeptList,curUser);//所有任务
		if ( con != null) con.close();
		
		String userName = XmlUtil.getNodeValue(param0);
		String deptName = XmlUtil.getNodeValue(param1);
		fccLog.info("@@@@@@@@@@@@@@@@@@userName is: " + userName + "@@@@@@@@@@@@@@@@@@");
		fccLog.info("@@@@@@@@@@@@@@@@@@deptName is: " + deptName + "@@@@@@@@@@@@@@@@@@");
		
		
		if(userName!=null && !"".equalsIgnoreCase(userName)) {
			
			if(deptName!=null && !"".equalsIgnoreCase(deptName)) {
				String nodeValue = "";
				for(int i = 0; i < allTaskList.size(); i++) {
					TaskMember temp = (TaskMember) allTaskList.get(i);
					String taskId = temp.getTaskId();
					String actorName = temp.getActorName();
					String depName = temp.getDepName();
					
					if(actorName.indexOf(userName) != -1 && depName.indexOf(deptName) != -1) {
						nodeValue += taskId + ",";
					}
				}
				
				if(!"".equalsIgnoreCase(nodeValue)) {
					nodeValue = getOnlyIds(nodeValue);
					nodeValue = nodeValue.substring(0,nodeValue.lastIndexOf(","));
				}else {
					nodeValue = "-2,-3";
				}
				nodeValue = "(" + nodeValue + ")";
				fccLog.info("@@@@@@@@@@@@@@@@@@nodeValue is: " + nodeValue + "@@@@@@@@@@@@@@@@@@");
				XmlUtil.setNodeValue(param2,nodeValue);
				
			}else{
				String nodeValue = "";
				for(int i = 0; i < allTaskList.size(); i++) {
					TaskMember temp = (TaskMember) allTaskList.get(i);
					String taskId = temp.getTaskId();
					String actorName = temp.getActorName();
					String depName = temp.getDepName();
					
					if(actorName.indexOf(userName) != -1) {
						nodeValue += taskId + ",";
					}
				}
				if(!"".equalsIgnoreCase(nodeValue)) {
					nodeValue = getOnlyIds(nodeValue);
					nodeValue = nodeValue.substring(0,nodeValue.lastIndexOf(","));
				}else {
					nodeValue = "-2,-3";
				}
				nodeValue = "(" + nodeValue + ")";
				fccLog.info("@@@@@@@@@@@@@@@@@@nodeValue is: " + nodeValue + "@@@@@@@@@@@@@@@@@@");
				XmlUtil.setNodeValue(param2,nodeValue);
				
			}
			
		}else{
			
			if(deptName!=null && !"".equalsIgnoreCase(deptName)) {
				String nodeValue = "";
				for(int i = 0; i < allTaskList.size(); i++) {
					TaskMember temp = (TaskMember) allTaskList.get(i);
					String taskId = temp.getTaskId();
					String actorName = temp.getActorName();
					String depName = temp.getDepName();
					if(depName.indexOf(deptName) != -1) {
						nodeValue += taskId + ",";
					}
				}
				if(!"".equalsIgnoreCase(nodeValue)) {
					nodeValue = getOnlyIds(nodeValue);
					nodeValue = nodeValue.substring(0,nodeValue.lastIndexOf(","));
				}else {
					nodeValue = "-2,-3";
				}
				nodeValue = "(" + nodeValue + ")";
				fccLog.info("@@@@@@@@@@@@@@@@@@nodeValue is: " + nodeValue + "@@@@@@@@@@@@@@@@@@");
				XmlUtil.setNodeValue(param2,nodeValue);
				
			}else{
				String nodeValue = "";
				for(int i = 0; i < allTaskList.size(); i++) {
					TaskMember temp = (TaskMember) allTaskList.get(i);
					String taskId = temp.getTaskId();
					String actorName = temp.getActorName();
					String depName = temp.getDepName();
					nodeValue += taskId + ",";
					
				}
				if(!"".equalsIgnoreCase(nodeValue)) {
					nodeValue = getOnlyIds(nodeValue);
					nodeValue = nodeValue.substring(0,nodeValue.lastIndexOf(","));
				}else {
					nodeValue = "-2,-3";
				}
				nodeValue = "(" + nodeValue + ")";
				fccLog.info("@@@@@@@@@@@@@@@@@@nodeValue is: " + nodeValue + "@@@@@@@@@@@@@@@@@@");
				XmlUtil.setNodeValue(param2,nodeValue);
				
			}
			
		}
		

		return 1;
	}
	
	
	
	
	public static List getAllTask(Connection cn ,List depList,String curUser) {
		List taskList = new ArrayList();
		Statement st = null;
		ResultSet rs = null;
		Statement st1 = null;
		ResultSet rs1 = null;
		String sqlStr = "select A.*,B.OPERATORID,B.OPERATORNAME,B.USERID from TASK_ACTOR A left join EOSOPERATOR B on A.ACTORID=B.USERID";
		String sqlStr1 = "select A.*,B.OPERATORID,B.OPERATORNAME from TASK_COLLABORATION A left join EOSOPERATOR B on A.ORGANIGER=B.USERID";
		
		if(curUser!=null) {
			sqlStr += " where A.ACTORID='" + curUser + "'";
			sqlStr1 += " where A.ORGANIGER='" + curUser + "'";
		}
		
		fccLog.info("@@@@@@@@@@@@@@@@@@getAllTask sqlStr is: " + sqlStr + "@@@@@@@@@@@@@@@@@@");
		try{
			st = cn.createStatement();
			rs = st.executeQuery(sqlStr);
			while(rs.next()) {
				String taskId = String.valueOf(rs.getObject("TASKID"));
				String actorId = String.valueOf(rs.getObject("ACTORID"));
				String actorName = String.valueOf(rs.getObject("OPERATORNAME"));
				if(actorName==null || "".equals(actorName)) actorName = String.valueOf(rs.getObject("USERID"));
				String operatorId = String.valueOf(rs.getObject("OPERATORID"));
				String depName = getDepName(operatorId,depList);
				TaskMember temp = new TaskMember(taskId,actorId,actorName,depName,operatorId);
				taskList.add(temp);
			
			}
			if(curUser != null) {
				List midlist = getAllJoin(cn,depList);
				st1 = cn.createStatement();
				rs1 = st.executeQuery(sqlStr1);
				while(rs1.next()) {
					String taskId1 = String.valueOf(rs.getObject("TASKID"));
					String actorId1 = String.valueOf(rs.getObject("ORGANIGER"));
					String actorName1 = String.valueOf(rs.getObject("OPERATORNAME"));
					if(actorName1==null || "".equals(actorName1)) actorName1 = String.valueOf(rs.getObject("ORGANIGER"));
					String operatorId1 = String.valueOf(rs.getObject("OPERATORID"));
					String depName1 = getDepName(operatorId1,depList);
					
					String midname = getName(midlist,taskId1);
					String middep = getDeps(midlist,taskId1);
					if(midname!=null && !"".equalsIgnoreCase(midname)) actorName1 += "," + midname;
					if(middep!=null && !"".equalsIgnoreCase(middep)) depName1 += "," + middep;
					
					TaskMember temp1 = new TaskMember(taskId1,actorId1,actorName1,depName1,operatorId1);
					taskList.add(temp1);
				
				}
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(st != null) st.close();
				if(rs1 != null) rs1.close();
				if(st1 != null) st1.close();
				
			}catch(Exception ee) {
				
			}
		}
		return taskList;
		
	}
	
	
	
	public static List getAllDept(Connection cn) {
		List deptList = new ArrayList();
		Statement st = null;
		ResultSet rs = null;
		String sqlStr = "select E.*,F.ORGNAME from EOSORG_T_EMPORGREF E left join EOSORG_T_ORGANIZATION F on E.ORGID=F.ORGID";
		try{
			st = cn.createStatement();
			rs = st.executeQuery(sqlStr);
			while(rs.next()) {
				String orgId = String.valueOf(rs.getObject("ORGID"));
				String operatorId = String.valueOf(rs.getObject("OPERATORID"));
				String orgName = String.valueOf(rs.getObject("ORGNAME"));
				TaskDept temp = new TaskDept(orgId,operatorId,orgName);
				deptList.add(temp);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if(rs != null) rs.close();
				if(st != null) st.close();
				
			}catch(Exception ee) {
				
			}
			
		}
		
		return deptList;
		
	}
	
	
	public static String getDepName(String operatorId,List depList) {
		String result = "";
		String vresult = "";
		for(int i = 0; i < depList.size(); i++) {
			TaskDept temp = (TaskDept) depList.get(i);
			if(operatorId.equalsIgnoreCase(temp.getOperatorId())) {
				vresult += temp.getOrgName() + ",";
			}
		
		}
		if(!"".equalsIgnoreCase(vresult)) {
			vresult = vresult.substring(0,vresult.lastIndexOf(","));
			result = vresult;
		
		}
		return result;
		
	}
	
	private static Log fccLog = LogFactory.getLog(TaskCooperator.class);

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getJoinInfo
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="返回参与人员及部门"
	 */
	public static int BL_getJoinInfo(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		List allDeptList = getAllDept(con);//所有部门
		List allTaskList = getAllTask(con ,allDeptList,null);//所有任务
		if ( con != null) con.close();
		
		for(int i = 0; i < allTaskList.size(); i++) {
			TaskMember temp = (TaskMember) allTaskList.get(i);
			String taskId = temp.getTaskId();
			String actorName = temp.getActorName();
			String depName = temp.getDepName();
			Element entity = doc.createElement("entity");
			Element ta = doc.createElement("taskid");
			Element ac = doc.createElement("actorname");
			Element de = doc.createElement("depname");
			XmlUtil.setNodeValue(ta,taskId);
			XmlUtil.setNodeValue(ac,actorName);
			XmlUtil.setNodeValue(de,depName);
			entity.appendChild(ta);
			entity.appendChild(ac);
			entity.appendChild(de);
			
			param0.appendChild(entity);
			
			
		}
		
		return 1;
		
	}
	
	public static String getOnlyIds(String ids) {
		String[] temp = ids.split(",");
		String result = "";
		Set set = new HashSet();
		for(int i = 0; i < temp.length; i++) {
			set.add(temp[i]);
		}
		List list = new ArrayList(set);
		for(int i = 0; i < list.size(); i++) {
			result += (String) list.get(i) + ",";
		}
		
		return result;
		
	
	}
	
	public static List getAllJoin(Connection cn,List depList) {
		String sqlStr = "select A.*,B.OPERATORID,B.OPERATORNAME,B.USERID from TASK_ACTOR A left join EOSOPERATOR B on A.ACTORID=B.USERID";
		List list = new ArrayList();
		Statement st = null;
		ResultSet rs = null;
		try{
			st = cn.createStatement();
			rs = st.executeQuery(sqlStr);
			while(rs.next()) {
				String taskId = String.valueOf(rs.getObject("TASKID"));
				String actorId = String.valueOf(rs.getObject("ACTORID"));
				String actorName = String.valueOf(rs.getObject("OPERATORNAME"));
				if(actorName==null || "".equals(actorName)) actorName = String.valueOf(rs.getObject("USERID"));
				String operatorId = String.valueOf(rs.getObject("OPERATORID"));
				String depName = getDepName(operatorId,depList);
				TaskMember temp = new TaskMember(taskId,actorId,actorName,depName,operatorId);
				list.add(temp);
			
			}
		}catch(Exception e) {
			
		}finally{
			try{
				if(rs != null) rs.close();
				if(st != null) st.close();
				
			}catch(Exception ee) {
				
			}
		}
		return list;
		
	}
	
	public static String getName(List list,String taskId) {
		String result = "";
		for(int i = 0; i < list.size(); i++) {
			TaskMember temp = (TaskMember) list.get(i);
			String taskIdf = temp.getTaskId();
			String name = temp.getActorName();
			if(taskId.equals(taskIdf)) {
				result += name + ",";
			}
			
			
		}
		if(!"".equalsIgnoreCase(result)) result = result.substring(0,result.lastIndexOf(","));
		
		return result;
	}
	
	public static String getDeps(List list,String taskId) {
		String result = "";
		for(int i = 0; i < list.size(); i++) {
			TaskMember temp = (TaskMember) list.get(i);
			String taskIdf = temp.getTaskId();
			String name = temp.getDepName();
			if(taskId.equals(taskIdf)) {
				result += name + ",";
			}
			
			
		}
		if(!"".equalsIgnoreCase(result)) result = result.substring(0,result.lastIndexOf(","));
		
		return result;
	}
	
	
	
	
}