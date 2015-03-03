package ICCard;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import java.util.Iterator;
import java.util.Map;
import java.util.List;
import java.util.Hashtable;


import org.w3c.dom.*;

import base.util.DBconnection;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;

/**
 * @author 金刚
 * @version 1.0
 * @date 2007-3-9
 * @class_displayName FieldManage
 */

public class FieldManage {

	/**
	 * 输入两个List 将日志加到第一个List中
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_AddClassRoomUsingLogsDay
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入List"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入UsingLogs"
	 */
	public static int BL_AddClassRoomUsingLogsDay(Document doc, BizContext param)
		throws Exception {
		Node roomList = (Node) param.getParaObjectAt(0);
		Node roomUsingLogsList = (Node) param.getParaObjectAt(1);
		//取出所有的课室使用日志放到HashTable中
		NodeList entityList2 =roomUsingLogsList.getChildNodes();
		int elLength2 = entityList2.getLength();
		Hashtable hashtable = new Hashtable();
		for(int i=0;i<elLength2;i++){
		Node entityNode =(Node)entityList2.item(i);
		NodeList fieldList = (NodeList)entityNode.getChildNodes();
		int flLength = fieldList.getLength();
			Map inMap = new HashMap();
			String roomid ="";
			for(int j=0;j<flLength;j++){
				Node fieldNode = (Node)fieldList.item(j);
				String fieldName = fieldNode.getNodeName();
				String fieldValue = XmlUtil.getNodeValue(fieldNode);
				if(fieldValue==null){
					fieldValue = "";
				}
				if("RoomID".equalsIgnoreCase(fieldName)){
					roomid = fieldValue;
				}
				
				inMap.put(fieldName,fieldValue);
			}
			
			List logsOfDay = (List) hashtable.get(roomid);
			if (logsOfDay == null) {
				logsOfDay = new java.util.ArrayList();
				hashtable.put(roomid, logsOfDay); // 以日期为标识将其加入到Hashtable中.
			}
		   logsOfDay.add(inMap);
		   hashtable.put(roomid,logsOfDay);		
		}
		
		
		//取出所有的课室进行比较
		NodeList entityList1 =roomList.getChildNodes();
		int elLength1 = entityList1.getLength();
		ArrayList list1 = new ArrayList();
		for(int i=0;i<elLength1;i++){
		Node entityNode =(Node)entityList1.item(i);
		NodeList fieldList = (NodeList)entityNode.getChildNodes();
		String LogsID = "";
		String morning ="空闲";
		String afternoon ="空闲";
		String night ="空闲";
		String morningType ="1";
		String afternoonType ="1";
		String nightType ="1";
		String morningLogsID ="";
		String afternoonLogsID ="";
		String nightLogsID ="";
		int flLength = fieldList.getLength();
			for(int j=0;j<flLength;j++){
				Node fieldNode = (Node)fieldList.item(j);
				String fieldName = fieldNode.getNodeName();
				String fieldValue = XmlUtil.getNodeValue(fieldNode);
				if("RoomID".equalsIgnoreCase(fieldName)){
					List logsOfDay = (List)hashtable.get(fieldValue);
					if(logsOfDay != null){
						Iterator it = logsOfDay.iterator();
						while(it.hasNext()){
						HashMap inMap = (HashMap)it.next();
						int noonType = Integer.parseInt(((String)inMap.get("UsingNoon")));
						LogsID = (String) inMap.get("LogsID");
						String linkMan = (String) inMap.get("LinkMan");
						String linkTel = (String) inMap.get("LinkTel");
						String className = (String) inMap.get("UsingOrgan");
						String PurPose = (String) inMap.get("PurPose");
						String usingType = (String) inMap.get("UsingTypeID");
						switch (noonType){
						case 0:
							//上午
						
								if("2".equals(usingType)){
									morning = "授课人："+linkMan+"\n联系电话："+linkTel+"\n班级:"+className+"\n";	
								}else if ("3".equals(usingType)){
									morning = "联系人："+linkMan+"\n联系电话："+linkTel+"\n使用单位:"+className+"\n用途:"+PurPose+"\n";
								}
								morningType = usingType;
								morningLogsID = LogsID;
								break;
						case 1:
							//下午			
							if("2".equals(usingType)){
								afternoon = "授课人："+linkMan+"\n联系电话："+linkTel+"\n班级:"+className+"\n";	
							}else if ("3".equals(usingType)){
								afternoon = "联系人："+linkMan+"\n联系电话："+linkTel+"\n使用单位:"+className+"\n用途:"+PurPose+"\n";
							}
								afternoonType = usingType;
								afternoonLogsID = LogsID;
								break;
						case 2:
							//晚上
							if("2".equals(usingType)){
								night = "授课人："+linkMan+"\n联系电话："+linkTel+"\n班级:"+className+"\n";	
							}else if ("3".equals(usingType)){
								night = "联系人："+linkMan+"\n联系电话："+linkTel+"\n使用单位:"+className+"\n用途:"+PurPose+"\n";
							}
								nightType = usingType;
								nightLogsID = LogsID;
								break;
						default:
						}
						}
					
					}
					
				}
			}
			
			//修改课室List节点
			Element morningElement = doc.createElement("Morning");
			XmlUtil.setNodeValue(morningElement,morning);
			entityNode.appendChild(morningElement);
			
			Element morningTypeElement = doc.createElement("MorningType");
			XmlUtil.setNodeValue(morningTypeElement,morningType);
			entityNode.appendChild(morningTypeElement);
			
			Element morningLogsIDElement = doc.createElement("MorningLogsID");
			XmlUtil.setNodeValue(morningLogsIDElement,morningLogsID);
			entityNode.appendChild(morningLogsIDElement);
			
			
			
			Element afternoonElement = doc.createElement("Afternoon");
			XmlUtil.setNodeValue(afternoonElement,afternoon);
			entityNode.appendChild(afternoonElement);
			
			Element afternoonTypeElement = doc.createElement("AfternoonType");
			XmlUtil.setNodeValue(afternoonTypeElement,afternoonType);
			entityNode.appendChild(afternoonTypeElement);
			
			Element afternoonLogsIDElement = doc.createElement("AfternoonLogsID");
			XmlUtil.setNodeValue(afternoonLogsIDElement,afternoonLogsID);
			entityNode.appendChild(afternoonLogsIDElement);
			
			
			Element nightElement = doc.createElement("Night");
			XmlUtil.setNodeValue(nightElement,night);
			entityNode.appendChild(nightElement);
			
			Element nightTypeElement = doc.createElement("NightType");
			XmlUtil.setNodeValue(nightTypeElement,nightType);
			entityNode.appendChild(nightTypeElement);
			
			Element nightLogsIDElement = doc.createElement("NightLogsID");
			XmlUtil.setNodeValue(nightLogsIDElement,nightLogsID);
			entityNode.appendChild(nightLogsIDElement);
			


				
		}
		
		
		return 1;
	}
	
	/**
	 * 输入两个List 将日志加到第一个List中
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_AddClassRoomUsingLogsMonth
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入List"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入UsingLogs"
	 */
	public static int BL_AddClassRoomUsingLogsMonth(Document doc, BizContext param)
		throws Exception {
		Node roomList = (Node) param.getParaObjectAt(0);
		Node roomUsingLogsList = (Node) param.getParaObjectAt(1);
		//取出所有的课室使用日志放到HashTable中
		NodeList entityList2 =roomUsingLogsList.getChildNodes();
		int elLength2 = entityList2.getLength();
		Hashtable hashtable = new Hashtable();
		for(int i=0;i<elLength2;i++){
		Node entityNode =(Node)entityList2.item(i);
		NodeList fieldList = (NodeList)entityNode.getChildNodes();
		int flLength = fieldList.getLength();
			Map inMap = new HashMap();
			String usingDate ="";
			for(int j=0;j<flLength;j++){
				Node fieldNode = (Node)fieldList.item(j);
				String fieldName = fieldNode.getNodeName();
				String fieldValue = XmlUtil.getNodeValue(fieldNode);
				if(fieldValue==null){
					fieldValue = "";
				}
				if("UsingDate".equalsIgnoreCase(fieldName)){
					usingDate = fieldValue;
				}
				inMap.put(fieldName,fieldValue);
			}
			List logsOfDay = (List) hashtable.get(usingDate);
			if (logsOfDay == null) {
				logsOfDay = new java.util.ArrayList();
				hashtable.put(usingDate, logsOfDay); // 以日期为标识将其加入到Hashtable中.
			}
		   logsOfDay.add(inMap);
		   hashtable.put(usingDate,logsOfDay);		
		}
		
		
		//取出所有的课室进行比较
		NodeList entityList1 =roomList.getChildNodes();
		int elLength1 = entityList1.getLength();
		ArrayList list1 = new ArrayList();
		for(int i=0;i<elLength1;i++){
		Node entityNode =(Node)entityList1.item(i);
		NodeList fieldList = (NodeList)entityNode.getChildNodes();
		String LogsID = "";
		String morning ="空闲";
		String afternoon ="空闲";
		String night ="空闲";
		String morningType ="1";
		String afternoonType ="1";
		String nightType ="1";
		String morningLogsID ="";
		String afternoonLogsID ="";
		String nightLogsID ="";
		int flLength = fieldList.getLength();
			for(int j=0;j<flLength;j++){
				Node fieldNode = (Node)fieldList.item(j);
				String fieldName = fieldNode.getNodeName();
				String fieldValue = XmlUtil.getNodeValue(fieldNode);
				if("Date".equalsIgnoreCase(fieldName)){
					List logsOfDay = (List)hashtable.get(fieldValue);
					if(logsOfDay != null){
						Iterator it = logsOfDay.iterator();
						while(it.hasNext()){
						HashMap inMap = (HashMap)it.next();
						int noonType = Integer.parseInt(((String)inMap.get("UsingNoon")));
						LogsID = (String) inMap.get("LogsID");
						String linkMan = (String) inMap.get("LinkMan");
						String linkTel = (String) inMap.get("LinkTel");
						String className = (String) inMap.get("UsingOrgan");
						String PurPose = (String) inMap.get("PurPose");
						String usingType = (String) inMap.get("UsingTypeID");
						switch (noonType){
						case 0:
							//上午
						
								if("2".equals(usingType)){
									morning = "授课人："+linkMan+"\n联系电话："+linkTel+"\n班级:"+className+"\n";	
								}else if ("3".equals(usingType)){
									morning = "联系人："+linkMan+"\n联系电话："+linkTel+"\n使用单位:"+className+"\n用途:"+PurPose+"\n";
								}
								morningType = usingType;
								morningLogsID = LogsID;
								break;
						case 1:
							//下午			
							if("2".equals(usingType)){
								afternoon = "授课人："+linkMan+"\n联系电话："+linkTel+"\n班级:"+className+"\n";	
							}else if ("3".equals(usingType)){
								afternoon = "联系人："+linkMan+"\n联系电话："+linkTel+"\n使用单位:"+className+"\n用途:"+PurPose+"\n";
							}
								afternoonType = usingType;
								afternoonLogsID = LogsID;
								break;
						case 2:
							//晚上
							if("2".equals(usingType)){
								night = "授课人："+linkMan+"\n联系电话："+linkTel+"\n班级:"+className+"\n";	
							}else if ("3".equals(usingType)){
								night = "联系人："+linkMan+"\n联系电话："+linkTel+"\n使用单位:"+className+"\n用途:"+PurPose+"\n";
							}
								nightType = usingType;
								nightLogsID = LogsID;
								break;
						default:
						}
					}
					
					}
					
				}
			}
			
//			修改课室List节点
			Element morningElement = doc.createElement("Morning");
			XmlUtil.setNodeValue(morningElement,morning);
			entityNode.appendChild(morningElement);
			
			Element morningTypeElement = doc.createElement("MorningType");
			XmlUtil.setNodeValue(morningTypeElement,morningType);
			entityNode.appendChild(morningTypeElement);
			
			Element morningLogsIDElement = doc.createElement("MorningLogsID");
			XmlUtil.setNodeValue(morningLogsIDElement,morningLogsID);
			entityNode.appendChild(morningLogsIDElement);
			
			
			
			Element afternoonElement = doc.createElement("Afternoon");
			XmlUtil.setNodeValue(afternoonElement,afternoon);
			entityNode.appendChild(afternoonElement);
			
			Element afternoonTypeElement = doc.createElement("AfternoonType");
			XmlUtil.setNodeValue(afternoonTypeElement,afternoonType);
			entityNode.appendChild(afternoonTypeElement);
			
			Element afternoonLogsIDElement = doc.createElement("AfternoonLogsID");
			XmlUtil.setNodeValue(afternoonLogsIDElement,afternoonLogsID);
			entityNode.appendChild(afternoonLogsIDElement);
			
			
			Element nightElement = doc.createElement("Night");
			XmlUtil.setNodeValue(nightElement,night);
			entityNode.appendChild(nightElement);
			
			Element nightTypeElement = doc.createElement("NightType");
			XmlUtil.setNodeValue(nightTypeElement,nightType);
			entityNode.appendChild(nightTypeElement);
			
			Element nightLogsIDElement = doc.createElement("NightLogsID");
			XmlUtil.setNodeValue(nightLogsIDElement,nightLogsID);
			entityNode.appendChild(nightLogsIDElement);
				
		}
		
		
		return 1;
	}
	/**
	 * 输入两个List 将日志加到第一个List中
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_AddGuestRoomUsingLogsDay
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入List"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入UsingLogs"
	 */
	public static int BL_AddGuestRoomUsingLogsDay(Document doc, BizContext param)
		throws Exception {
		Node roomList = (Node) param.getParaObjectAt(0);
		Node roomUsingLogsList = (Node) param.getParaObjectAt(1);
		//取出所有的客房使用日志放到HashTable中
		NodeList entityList2 =roomUsingLogsList.getChildNodes();
		int elLength2 = entityList2.getLength();
		Hashtable hashtable = new Hashtable();
		for(int i=0;i<elLength2;i++){
		Node entityNode =(Node)entityList2.item(i);
		NodeList fieldList = (NodeList)entityNode.getChildNodes();
		int flLength = fieldList.getLength();
			Map inMap = new HashMap();
			String roomid ="";
			for(int j=0;j<flLength;j++){
				Node fieldNode = (Node)fieldList.item(j);
				String fieldName = fieldNode.getNodeName();
				String fieldValue = XmlUtil.getNodeValue(fieldNode);
				if("RoomID".equalsIgnoreCase(fieldName)){
					roomid = fieldValue;
				}
				
				inMap.put(fieldName,fieldValue);
			}
			
			List logsOfDay = (List) hashtable.get(roomid);
			if (logsOfDay == null) {
				logsOfDay = new java.util.ArrayList();
				hashtable.put(roomid, logsOfDay); // 以Roomid为标识将其加入到Hashtable中.
			}
		   logsOfDay.add(inMap);
		   hashtable.put(roomid,logsOfDay);		
		}
		
		
		//取出所有的课房进行比较
		NodeList entityList1 =roomList.getChildNodes();
		int elLength1 = entityList1.getLength();
		ArrayList list1 = new ArrayList();
		for(int i=0;i<elLength1;i++){
		Node entityNode =(Node)entityList1.item(i);
		NodeList fieldList = (NodeList)entityNode.getChildNodes();
		String usingLogs ="空闲";
		String usingType ="1";
		String HousingLogsID ="";
		int flLength = fieldList.getLength();
			for(int j=0;j<flLength;j++){
				Node fieldNode = (Node)fieldList.item(j);
				String fieldName = fieldNode.getNodeName();
				String fieldValue = XmlUtil.getNodeValue(fieldNode);
				if("RoomID".equalsIgnoreCase(fieldName)){
					List logsOfDay = (List)hashtable.get(fieldValue);
					if(logsOfDay != null){
						Iterator it = logsOfDay.iterator();
						while(it.hasNext()){
						HashMap inMap = (HashMap)it.next();
						String linkMan = (String) inMap.get("UserID");
						String usingTypeID = (String) inMap.get("HousingTypeID");
						if (usingLogs.indexOf("住宿人")<0) {
							usingLogs = "";
						    usingLogs += "住宿人："+getGuestName(linkMan);
						} else {
							usingLogs += ";"+getGuestName(linkMan);
						}
						usingType = usingTypeID;
						HousingLogsID = (String) inMap.get("HousingLogsID");
						}
					}
					
				}
			}
			
			//修改客房List节点
			Element usingLogsElement = doc.createElement("UsingLogs");
			XmlUtil.setNodeValue(usingLogsElement,usingLogs);
			entityNode.appendChild(usingLogsElement);
			
			Element usingTypeElement = doc.createElement("UsingType");
			XmlUtil.setNodeValue(usingTypeElement,usingType);
			entityNode.appendChild(usingTypeElement);
		
			Element HousingLogsIDElement = doc.createElement("HousingLogsID");
			XmlUtil.setNodeValue(HousingLogsIDElement,HousingLogsID);
			entityNode.appendChild(HousingLogsIDElement);

				
		}
		
		
		return 1;
	}
	/**
	 * 输入两个List 将日志加到第一个List中
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_AddGuestRoomUsingLogsDay
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入List"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入UsingLogs"
	 */
	public static int BL_AddGuestRoomUsingLogsMonth(Document doc, BizContext param)
		throws Exception {
	
		Node roomList = (Node) param.getParaObjectAt(0);
		Node roomUsingLogsList = (Node) param.getParaObjectAt(1);
		//取出所有的客房使用日志放到HashTable中
		NodeList entityList2 =roomUsingLogsList.getChildNodes();
		int elLength2 = entityList2.getLength();
		Hashtable hashtable = new Hashtable();
		for(int i=0;i<elLength2;i++){
		Node entityNode =(Node)entityList2.item(i);
		NodeList fieldList = (NodeList)entityNode.getChildNodes();
		int flLength = fieldList.getLength();
			Map inMap = new HashMap();
			String beginTime = "";
			String endTime = "";
			String usingDate ="";
			for(int j=0;j<flLength;j++){
				Node fieldNode = (Node)fieldList.item(j);
				String fieldName = fieldNode.getNodeName();
				String fieldValue = XmlUtil.getNodeValue(fieldNode);
				if("BeginTime".equalsIgnoreCase(fieldName)){
					beginTime = fieldValue;
				}
				if("EndTime".equalsIgnoreCase(fieldName)){
					endTime = fieldValue;
				}
				inMap.put(fieldName,fieldValue);
			}

			//得到BeginTime 与 EndTime 之间的日期
			List usingDateList =getDateLSOfMonth(beginTime,endTime);
			Iterator it  = usingDateList.iterator();
			while(it.hasNext()){
				usingDate = (String) it.next();
				List logsOfDay = (List) hashtable.get(usingDate);
				if (logsOfDay == null) {
					logsOfDay = new java.util.ArrayList();
					hashtable.put(usingDate, logsOfDay); // 以日期为标识将其加入到Hashtable中.
				}
			   logsOfDay.add(inMap);
			   hashtable.put(usingDate,logsOfDay);	
				
				}
				
		}
		
		
	
		
		
		//取出所有的客房进行比较
		NodeList entityList1 =roomList.getChildNodes();
		int elLength1 = entityList1.getLength();
		ArrayList list1 = new ArrayList();
		for(int i=0;i<elLength1;i++){
		Node entityNode =(Node)entityList1.item(i);
		NodeList fieldList = (NodeList)entityNode.getChildNodes();
		String usingLogs ="空闲";
		String usingType ="1";
		int flLength = fieldList.getLength();
			for(int j=0;j<flLength;j++){
				Node fieldNode = (Node)fieldList.item(j);
				String fieldName = fieldNode.getNodeName();
				String fieldValue = XmlUtil.getNodeValue(fieldNode);
				if("Date".equalsIgnoreCase(fieldName)){
					List logsOfDay = (List)hashtable.get(fieldValue);
					if(logsOfDay != null){
						Iterator it = logsOfDay.iterator();
						while(it.hasNext()){
						HashMap inMap = (HashMap)it.next();
					
						String linkMan = (String) inMap.get("LinkMan");
						String usingTypeID = (String) inMap.get("HousingTypeID");
						usingLogs = "联系人："+linkMan+"\n";
						usingType = usingTypeID;
					
					}
					
					}
					
				}
			}
			
			//修改客房List节点
			Element usingLogsElement = doc.createElement("UsingLogs");
			XmlUtil.setNodeValue(usingLogsElement,usingLogs);
			entityNode.appendChild(usingLogsElement);
			
			Element usingTypeElement = doc.createElement("UsingType");
			XmlUtil.setNodeValue(usingTypeElement,usingType);
			entityNode.appendChild(usingTypeElement);
			
		

				
		}
		
		
		
		return 1;
	}
	
	
	/**
	* 得到两个日期之间的日期
	*/
	
	public static List getDateLSOfMonth(String fromDate,String toDate){
            Calendar calendar = Calendar.getInstance();
            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat formater2 = new SimpleDateFormat("yyyyMMdd");
            Date from = new Date();
            Date to = new Date();
			try {
				from = formater.parse(fromDate);
				to = formater.parse(toDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			calendar.setTime(from);
			int length = to.compareTo(from);		
            ArrayList dateLS = new ArrayList();
            while(from.compareTo(to)<0){
            	String tempDate = formater.format(calendar.getTime());
				dateLS.add(tempDate);
				calendar.add(Calendar.DATE,1);
				try {
					from = formater.parse(tempDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
            }
            return dateLS;
	}
	
	/**
	 * 查询散客租户名称
	 * @author 范志竞
	 *
	 * TODO 要更改此生成的类型注释的模板，请转至
	 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
	 */
	public static String getGuestName(String userId) {
		String sql = "";
		String guestName = "";
		Statement st = null;
		ResultSet rs = null;
		Connection intercon = null;
		
		try {
		   intercon = new DBconnection().getEOSConnection();
		   st = intercon.createStatement();
		   sql = "select top 1 * from (select operatorName username from eosoperator where operatorID="+userId
               + " union select guestName username from guest where guestID="+userId+") t";
		   rs = st.executeQuery(sql);
		   if (rs != null && rs.next()) {
			  guestName = rs.getString("username");
			  if (guestName == null) guestName = "没录入";
		   } else
			  guestName = "没录入";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return guestName;
	}
}