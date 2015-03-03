package fcc.oa.workflow;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.w3c.dom.*;

import talent.core.TalentFunctions;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import com.primeton.tp.common.xml.XmlUtil;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-3-16
 * @class_displayName WorkItemUnionEntity
 */

public class WorkItemUnionEntity {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_unionWorkItem
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="符合条件的业务实体集合"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="当前用户USEID"
	 * @bizlet_param passing="in" type="EOSEntityList" value="/" name="" desc="委托人列表"
	 */
	public static int BL_unionWorkItem(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		Node param2 = null;
		
		if(param.getLength()>=3)
			param2 = (Node) param.getParaObjectAt(2);
		String userID = param1.getFirstChild().getNodeValue();
		String currentUser = userID ;
		PersistenceBroker db = param.getDBBroker();
		Connection con = db.getConnection();
		
		try{
			if(param2!=null){
				NodeList agentList = param2.getChildNodes();
				for (int i = 0; i<agentList.getLength();i++){
					Element agent = (Element) agentList.item(i);
					String agentFrom = TalentFunctions.getNodeValueByTagName(agent , "agentFrom");
					currentUser = currentUser + ","+agentFrom;
				}
			}
			NodeList entityList = param0.getChildNodes();
			for(int i = 0; i < entityList.getLength(); i++) {
				Element entity = (Element) entityList.item(i);
				String processInstID = entity.getElementsByTagName("processInstID").item(0).getFirstChild().getNodeValue();
				String participant0 = entity.getElementsByTagName("participant").item(0).getFirstChild().getNodeValue();
				//String actSql = "select * from WFActivityInst  where processInstID = " + processInstID +"  and currentState = 2  ";
				String actSql = "select * from WFActivityInst a,WFWorkItem i  where i.activityInstID=a.activityInstID and a.processInstID = " + processInstID +"  and a.currentState = 2 and (i.participant = '" + currentUser + "' or i.participant in (select rolename from eosoperatorrole eor,eosrole er where er.roleid=eor.roleid and eor.operatorid=(select operatorid from eosoperator where userid='"+currentUser+"')))";
				Statement st= con.createStatement();
				ResultSet rs0 = st.executeQuery(actSql);
				String activityInstID = null;
				String activityInstName = "结束";
				if(rs0.next()){
					activityInstID = rs0.getString("activityInstID");
					activityInstName = rs0.getString("activityInstName");
				}
				//System.out.println("activityInstName " + activityInstName);
				rs0.close();
				if(activityInstID != null){
					String tempSql = "select I.workItemID,I.workItemName,I.currentState,I.participant,I.isTimeOut,I.limitNum,I.startTime,I.endTime,I.actionURL,I.processInstID,I.activityInstID,I.timeOutNum,I.activityInstName,I.processDefID,I.processDefName,I.activityDefID,I.agentUser,p.currentState as processState from WFWorkItem I left join WFProcessInst P on I.processInstID=P.processInstID where 1=1 ";
					tempSql += "and (I.currentState=10 or I.currentState=4 ) " ;
					tempSql += "and I.activityInstID=" + activityInstID;
				
					System.out.println("############tempSQL is:" + tempSql);
				
				

					ResultSet rs = st.executeQuery(tempSql);
					int num = 0;
					while(rs.next()) {
						num++;
						String workItemID = String.valueOf(rs.getInt("workItemID"));
						String workItemName = rs.getString("workItemName");
						String currentState = String.valueOf(rs.getInt("currentState"));
						String participant = rs.getString("participant");
						String isTimeOut = rs.getString("isTimeOut");
						String limitNum = String.valueOf(rs.getInt("limitNum"));
						String startTime = rs.getString("startTime");
						String endTime = rs.getString("endTime");
						String actionURL = rs.getString("actionURL");
						
						//String processInstIDf = String.valueOf(rs.getInt("processInstID"));
						//String activityInstID = String.valueOf(rs.getInt("activityInstID"));
						String timeOutNum =  String.valueOf(rs.getInt("timeOutNum"));
						//String activityInstName = rs.getString("activityInstName");
						
						String processDefID = String.valueOf(rs.getInt("processDefID"));
						String processDefName = rs.getString("processDefName");
						String activityDefID  = rs.getString("activityDefID");
						String agentUser  = rs.getString("agentUser");
						String processState = String.valueOf(rs.getInt("processState"));
						
						//System.out.println("currentUser ==>"+ currentUser);
						//System.out.println("participant ==>"+ participant);
						//System.out.println("participant0 ==>"+ participant0);
						//System.out.println("userID ==>"+ userID);
						Element currentStateElement = doc.createElement("currentState");
						Element workItemIDElement = doc.createElement("workItemID");
						if(num==1){
						    XmlUtil.setNodeValue(currentStateElement,currentState);
						    XmlUtil.setNodeValue(workItemIDElement,workItemID);
						    
						}
						if((currentState.equals("10")&&isParticipant(currentUser,participant)
								||(currentState.equals("4")&&(isParticipant(currentUser,participant)||participant0.indexOf(userID)>=0)))) {	
							
							//Element workItemNameElement = doc.createElement("workItemName");
							
							Element participantElement = doc.createElement("WFparticipant");
							Element isTimeOutElement = doc.createElement("isTimeOut");
							Element limitNumElement = doc.createElement("limitNum");
							Element remainTimeElement = doc.createElement("RemainTime");
							Element startTimeElement = doc.createElement("startTime");
							Element endTimeElement = doc.createElement("endTime");
							Element actionURLElement = doc.createElement("actionURL");
							//Element processInstIDElement = doc.createElement("processInstID");
							Element activityInstIDElement = doc.createElement("activityInstID");
							Element timeOutNumElement = doc.createElement("timeOutNum");
							Element activityInstNameElement = doc.createElement("activityInstName");
							Element processDefIDElement = doc.createElement("processDefID");
							Element processDefNameElement = doc.createElement("processDefName");
							Element activityDefIDElement = doc.createElement("activityDefID");
							Element processStateElement = doc.createElement("processState");
							Element agentUserElement = doc.createElement("agentUser");
							
							XmlUtil.setNodeValue(workItemIDElement,workItemID);
							//XmlUtil.setNodeValue(workItemNameElement,workItemName);
							XmlUtil.setNodeValue(currentStateElement,currentState);
							XmlUtil.setNodeValue(participantElement,participant);
							XmlUtil.setNodeValue(isTimeOutElement,isTimeOut);
							XmlUtil.setNodeValue(limitNumElement,limitNum);
							XmlUtil.setNodeValue(remainTimeElement,getRemainTime(limitNum,startTime));
							XmlUtil.setNodeValue(startTimeElement,startTime);
							XmlUtil.setNodeValue(endTimeElement,endTime);
							XmlUtil.setNodeValue(actionURLElement,actionURL);
							//XmlUtil.setNodeValue(processInstIDElement,processInstIDf);
							XmlUtil.setNodeValue(activityInstIDElement,activityInstID);
							XmlUtil.setNodeValue(timeOutNumElement,timeOutNum);
							XmlUtil.setNodeValue(activityInstNameElement,activityInstName);
							XmlUtil.setNodeValue(processDefIDElement,processDefID);
							XmlUtil.setNodeValue(processDefNameElement,processDefName);
							XmlUtil.setNodeValue(activityDefIDElement,activityDefID);
							XmlUtil.setNodeValue(processStateElement,processState);
							XmlUtil.setNodeValue(agentUserElement,agentUser);
							
							//entity.appendChild(workItemIDElement);
							//entity.appendChild(workItemNameElement);
							
							entity.appendChild(workItemIDElement);
							entity.appendChild(participantElement);
							entity.appendChild(limitNumElement);
							entity.appendChild(remainTimeElement);
							entity.appendChild(startTimeElement);
							entity.appendChild(endTimeElement);
							entity.appendChild(actionURLElement);
							//entity.appendChild(processInstIDElement);
							entity.appendChild(activityInstIDElement);
							entity.appendChild(timeOutNumElement);
							entity.appendChild(activityInstNameElement);
							entity.appendChild(processDefIDElement);
							entity.appendChild(processDefNameElement);
							entity.appendChild(activityDefIDElement);
							entity.appendChild(processStateElement);
							entity.appendChild(agentUserElement);
							Element participantExtElement = doc.createElement("participantExt");
							XmlUtil.setNodeValue(participantExtElement,getParticipantExt(participant,participant0,userID));
							entity.appendChild(participantExtElement);
							entity.appendChild(currentStateElement);
							break;	
						}
						//entity.appendChild(currentStateElement);
						//entity.appendChild(workItemIDElement);
						}
					
					
					
				
			
				
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				
				if(num == 0) {
					Element workItemIDElement = doc.createElement("workItemID");
					//Element workItemNameElement = doc.createElement("workItemName");
					Element currentStateElement = doc.createElement("currentState");
					Element participantElement = doc.createElement("participant");
					Element isTimeOutElement = doc.createElement("isTimeOut");
					Element limitNumElement = doc.createElement("limitNum");
					Element startTimeElement = doc.createElement("startTime");
					Element endTimeElement = doc.createElement("endTime");
					Element actionURLElement = doc.createElement("actionURL");
					//Element processInstIDElement = doc.createElement("processInstID");
					Element activityInstIDElement = doc.createElement("activityInstID");
					Element timeOutNumElement = doc.createElement("timeOutNum");
					Element activityInstNameElement = doc.createElement("activityInstName");
					Element processDefIDElement = doc.createElement("processDefID");
					Element processDefNameElement = doc.createElement("processDefName");
					Element activityDefIDElement = doc.createElement("activityDefID");
					Element processStateElement = doc.createElement("processState");
					
					XmlUtil.setNodeValue(workItemIDElement,"");
					//XmlUtil.setNodeValue(workItemNameElement,"");
					XmlUtil.setNodeValue(currentStateElement,"");
					XmlUtil.setNodeValue(participantElement,"");
					XmlUtil.setNodeValue(isTimeOutElement,"");
					XmlUtil.setNodeValue(limitNumElement,"");
					XmlUtil.setNodeValue(startTimeElement,"");
					XmlUtil.setNodeValue(endTimeElement,"");
					XmlUtil.setNodeValue(actionURLElement,"#");
					//XmlUtil.setNodeValue(processInstIDElement,"");
					XmlUtil.setNodeValue(activityInstIDElement,"");
					XmlUtil.setNodeValue(timeOutNumElement,"");
					XmlUtil.setNodeValue(activityInstNameElement,"");
					XmlUtil.setNodeValue(processDefIDElement,"");
					XmlUtil.setNodeValue(processDefNameElement,"");
					XmlUtil.setNodeValue(activityDefIDElement,"");
					XmlUtil.setNodeValue(processStateElement,"7");
					
					entity.appendChild(workItemIDElement);
					//entity.appendChild(workItemNameElement);
					entity.appendChild(currentStateElement);
					entity.appendChild(workItemIDElement);
					entity.appendChild(participantElement);
					entity.appendChild(limitNumElement);
					entity.appendChild(startTimeElement);
					entity.appendChild(endTimeElement);
					entity.appendChild(actionURLElement);
					//entity.appendChild(processInstIDElement);
					entity.appendChild(activityInstIDElement);
					entity.appendChild(timeOutNumElement);
					entity.appendChild(activityInstNameElement);
					entity.appendChild(processDefIDElement);
					entity.appendChild(processDefNameElement);
					entity.appendChild(activityDefIDElement);
					entity.appendChild(processStateElement);
				}
				}
			
				Element workItemNameElement = doc.createElement("workItemName");
				XmlUtil.setNodeValue(workItemNameElement,activityInstName);
				entity.appendChild(workItemNameElement);
			} //end for
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			try{
				if(con!=null) con.close();
				con = null;
				
			}catch(Exception ee) {
				
			}
			
		}

		return 1;
	}

	public static boolean isParticipant(String currentUser , String participant){
		String temp[] = currentUser.toLowerCase().split(",");
		for(int i = 0 ; i<temp.length ; i++){
			if(temp[i]!=null){
				if(participant.toLowerCase().trim().indexOf(temp[i].trim())>=0){
					return true;
				}
					
			}
		}
		
		return false;
	}
	
	public static String getParticipantExt(String participant ,String participant0 ,String userID){
		String temp =participant;
		if(!participant.equals(participant0)){
			temp = temp+","+participant0;
		}
		if(!participant.equals(userID)&&!userID.equals(participant0)){
			temp = temp +"," +userID;
		}
		return temp;
	}
	
	public static String getRemainTime(String limitNum ,String startTime){
		String temp = "";
		if(limitNum != ""){
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date curDate = new Date();
			long start = 0;
			long cur = curDate.getTime();
			long limit = Long.parseLong(limitNum);
			try {
				Date date =format.parse(startTime);
				start = date.getTime(); 

			} catch (ParseException e) {
				// TODO 自动生成 catch 块
				e.printStackTrace();
			}
			long remain = limit-cur + start;
			if(remain<=60*1000){
				temp = "超时";
			}else{
				temp = "剩余";
				temp += calcDHM(remain);
			}
		}
		return temp;
	}
	
	/*
	 * 计算天，小时，分
	 */

		public static String  calcDHM(long timeInSeconds) {

		long days,hours, minutes, seconds;
		days = timeInSeconds / (24*60*60*1000);
		timeInSeconds = timeInSeconds - (days * 24*60*60*1000);
		hours = timeInSeconds / (60*60*1000);
		timeInSeconds = timeInSeconds - (hours * 60*60*1000);
		minutes = timeInSeconds / (60*1000);
		String temp = "";
		if(days != 0){
			temp+=days + "天";
		}
		if(hours !=0){
			temp += hours + "小时 ";
		}
		if(minutes !=0){
			temp += minutes + "分钟";
		}	
		return temp ;

		}
}