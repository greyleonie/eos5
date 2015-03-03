package fcc.oa.workflow;


import java.sql.*;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import com.primeton.tp.common.xml.XmlUtil;

/**
 * @author Administrator
 * @version 1.0
 * @date 2007-3-26
 * @class_displayName WorkItemTrueEnd
 */

public class WorkItemTrueEnd {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_isEnd
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="count"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="多工作项参与的人数"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="工作项活动定义ID"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="工作项流程实例ID"
	 */
	public static int BL_isEnd(Document doc, BizContext param) throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		Node param2 = (Node) param.getParaObjectAt(2);
		Node param3 = (Node) param.getParaObjectAt(3);
		
		String activityDefID = param2.getFirstChild().getNodeValue();
		String processID = param3.getFirstChild().getNodeValue();
		
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		String participant = param1.getFirstChild().getNodeValue();
		String[] userIDs = participant.split(",");
		boolean complete = true;
		
		try{
			for(int i = 0; i < userIDs.length; i++) {
				if(userIDs[i]!=null && !"".equals(userIDs[i])) {
					int temp = getCount(con,userIDs[i],processID,activityDefID);
					if(temp > 0) {
						complete = false;
						break;
					}
				
				}
			
			
			}//for
			
			if(complete) XmlUtil.setNodeValue(param0,"0");
			
		}finally{
			
		}
		
		

		return 1;
	}
	
	
	private static int getCount(Connection con,String userID,String processID,String activityDefID) {
		int result = 0;
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "select count(*) as aa from WFWorkItem where currentState=10 and processInstID=" + processID + " and activityDefID='" + activityDefID + "' and participant='" + userID + "'";
		try{
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				result = rs.getInt("aa");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				
			}catch(Exception e) {
				
			}
		}
		return result;
	
	}

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_upbizPassParticipant
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="已经过的环节"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="当前环节"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="当前操作人"
	 */
	public static int BL_upbizPassParticipant(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		Node param2 = (Node)param.getParaObjectAt(2);
		
		
		String pass = param0.getFirstChild().getNodeValue();
		String currentNode = param1.getFirstChild().getNodeValue();
		String currentOperator = param2.getFirstChild().getNodeValue();
		
		String style = currentNode + ":" + currentOperator + ":";
		
		String result = pass;
		String tempResult = "";
		
		if(pass.indexOf(style) < 0) {
			result += style + "1,";
		}else{
			String[] allhj = pass.split(",");
			for(int i = 0; i < allhj.length; i++) {
				if(allhj[i]!=null && !"".equals(allhj[i])) {
					if(allhj[i].startsWith(style)) {
						int pos = allhj[i].lastIndexOf(":");
						String sum = allhj[i].substring(pos + 1);
						int val = Integer.parseInt(sum) + 1;
						String trueStyle = style + val;
						tempResult += trueStyle + ",";
						
					}else{
						tempResult += allhj[i] + ",";
					}
				}
			}
			
			result = tempResult;
			
		
		}
		
		XmlUtil.setNodeValue(param0,result);
		
		return 1;
	}
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_processParticipant
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="处理成正确参与者格式"
	 */
	public static int BL_processParticipant(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		
		String participant = param0.getFirstChild().getNodeValue();
		
		if(participant!=null && !"".equalsIgnoreCase(participant)) {
			participant = participant.replaceAll(";",",");
			XmlUtil.setNodeValue(param0,participant);
		
		}
		
		return 1;
	}
	
	
	public static void main(String[] args) {
		String test = "fcc;lzy;fzy;fhp";
		test = test.replaceAll(";",",");
		System.out.println("&&&&&&&&test=" + test);
	
	
	}
	
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getActivityWorkItem
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="流程实例"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="输出流程定义名"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="输出活动定义ID"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="输出活动实例"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="标志成功或失败"
	 */
	public static int BL_getActivityWorkItem(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		Node param2 = (Node)param.getParaObjectAt(2);
		Node param3 = (Node)param.getParaObjectAt(3);
		Node param4 = (Node)param.getParaObjectAt(4);
		Node param5 = (Node)param.getParaObjectAt(5);
		
		String processInstID = param0.getFirstChild().getNodeValue();
		
		String sql = "select top 1 activityInstID,processDefName,activityDefID,participant from WFWorkItem where processInstID=" + processInstID + " and (currentState=10 or currentState=4)";
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^rollback query sql:" + sql);
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		Statement st = null;
		ResultSet rs = null;
		
		try{
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				String activityInstID = String.valueOf(rs.getInt("activityInstID"));
				String processDefName = rs.getString("processDefName");
				String activityDefID = rs.getString("activityDefID");
				String participant = rs.getString("participant");
				XmlUtil.setNodeValue(param1,processDefName);
				XmlUtil.setNodeValue(param2,activityDefID);
				XmlUtil.setNodeValue(param3,activityInstID);
				XmlUtil.setNodeValue(param4,"1");
				XmlUtil.setNodeValue(param5,participant);
				
			}else{
				XmlUtil.setNodeValue(param4,"0");
				
			}
			
		}catch(Exception e) {
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(con!=null) con.close();
			}catch(Exception ee) {
				
			
			}
		
		}
		
		
		
		
		return 1;
	}
}