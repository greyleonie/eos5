package tools.util;
import org.w3c.dom.*;






import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author zhoden
 * @version 1.0
 * @date 2005-7-11
 * @class_displayName CalendarTools
 */

public class CalendarTools {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName getDataList
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="list" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="calendarYear" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="calendarMonth" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="calendarWeek" name="" desc=""
	 */
	public static int getDataList(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);//年;
		String param2 = (String)param.getParaObjectAt(2);//月;
		String param3 = (String)param.getParaObjectAt(3);//周;
		Calendar  ca = Calendar.getInstance();
		if(param1!=null&&param2!=null&&!"".equalsIgnoreCase(param1)&&"".equalsIgnoreCase(param2))
		ca.set(Integer.parseInt(param1),Integer.parseInt(param2)-1,1);//通到条件得到年、月从第一天开始;
		else
		ca.set(ca.get(Calendar.YEAR),ca.get(Calendar.MONTH),1);//当前月
		
		//Element   TOOLS_CALENDARARRANGE = doc.createElement("TOOLS_CALENDARARRANGE");
		int maxdays = ca.getActualMaximum(Calendar.DAY_OF_MONTH);//得到当前月的最大天数;
		System.out.println(maxdays);
		System.out.println(ca.get(4));
		for (int i=0;i< maxdays;i++ ) {	
			   Date weekdate = new Date(ca.getTime().getTime()); 
		       Element CALENDAR = doc.createElement("CALENDAR");
			    XmlUtil.setNodeValue(CALENDAR,weekdate.toString());
			   // TOOLS_CALENDARARRANGE.appendChild(CALENDAR);
			    ca.add(Calendar.DAY_OF_MONTH, 1);
			   //param0.appendChild(TOOLS_CALENDARARRANGE) ;
			    param0.appendChild(CALENDAR) ;
			   
			}

	        
		return 1;
	}

	/**
	 * 查询年月日程安排，如果为空为目前年月日程安排.
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName getMonthList
	 * @canExport true
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="monthList" name="" desc="存储本月每天的日程安排."
	 * @bizlet_param passing="in_out" type="variable" value="USERACCOUNT" name="" desc="用户财号"
	 * @bizlet_param passing="in_out" type="variable" value="ARRANGE" name="" desc="安排人"
	 * @bizlet_param passing="in_out" type="variable" value="year" name="" desc="年"
	 * @bizlet_param passing="in_out" type="variable" value="month" name="" desc="月"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="TOOLS_ARRANGER" name="" desc="所有当前登录用户所有安排人。"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="TOOLS_VIEWRIGHT" name="" desc="查询当前用户所有的浏览权限人"
	 */
	public static int getMonthList(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);//存储本月每天的日程安排
		String param1 = (String)param.getParaObjectAt(1);//用户财号指安排谁的日程;
		String param2 = (String)param.getParaObjectAt(2);//日程安排人指登录人;
		String param3 = (String)param.getParaObjectAt(3);//年

		String param4 = (String)param.getParaObjectAt(4);//月

		Node param5 = (Node)param.getParaObjectAt(5);//所有当前登录用户所有安排人
		Node param6 = (Node)param.getParaObjectAt(6);//查询当前用户所有的浏览权限人
		Calendar  ca = Calendar.getInstance();
		PersistenceBroker db = param.getDBBroker();//得到数据库查询工具;
		if(param3!=null&&param4!=null&&!"".equalsIgnoreCase(param3)&&!"".equalsIgnoreCase(param4)&&!"null".equalsIgnoreCase(param3)&&!"null".equalsIgnoreCase(param4))
			ca.set(Integer.parseInt(param3),Integer.parseInt(param4)-1,1);//通到条件得到年、月从第一天开始;
		else{
			ca.set(ca.get(Calendar.YEAR),ca.get(Calendar.MONTH),1);//当前月

		}
		if("".equalsIgnoreCase(param1)||"null".equalsIgnoreCase(param1))//假如日程安排人为空默认为当前登录用户;
		param1=param2;
			

		int maxdays = ca.getActualMaximum(Calendar.DAY_OF_MONTH);//得到当前月的最大天数;
		System.out.println(maxdays);
		System.out.println(ca.get(4));//得到当前周数;
		for (int i=0;i< maxdays;i++ ) {	
				   Date weekdate = new Date(ca.getTime().getTime()); 
			   Element day = doc.createElement("day");
				   	
				   	
				   setTOOLS_CALENDARARRANGE(db,param1,weekdate.toString(),param0,doc,day);//查询安排的日程;
                 
				   
				 	param0.appendChild(day);
				    ca.add(Calendar.DAY_OF_MONTH, 1);
				   
				}
		setArrangerMan(db,param2,param5,doc);//取所有日程安排权限的人;
		setViewMan(db,param2,param6,doc);//取所有浏览权限的人;
		return 1;
		
	}
	//查询别人为我安排的所有日程;
	public static String setOtherMan(PersistenceBroker db,String param1) throws Exception{
	      String sqlstr="select USERACCOUNT,ARRANGE from TOOLS_ARRANGER where USERACCOUNT='"+param1+"'";
			System.out.println(sqlstr);
			Connection con = null;
			Statement st = null;
			ResultSet rs = null;
			try{
			 	con = db.getConnection();
			 	st = con.createStatement();
			 	rs = st.executeQuery(sqlstr);
			 	while(rs.next()){

                   return rs.getString("ARRANGE");
			 		      
			 	   
			 	    
			 	   
			 		
			 	}//while
			
			 	
			 }catch(Exception ex){
			 	ex.printStackTrace();
			 }finally{
			 	if(rs!=null) rs.close();
			 	if(st!=null) st.close();
			 	if(con!=null) con.close();
			 
			 }
			 return "";
	}
	public static void setTOOLS_CALENDARARRANGE(PersistenceBroker db,String param1,String calendar,Node param0,Document doc,Node day) throws Exception{
		List dayList = new ArrayList();
		String sqlstr = "select SERIALNUM,to_char(CALENDAR,'yyyy-mm-dd') ca,USERACCOUNT,BEGINTIME begin,ENDTIME end,TASKSUM" +
				",TASKCONTENT,REMINDFLAG,AWOKETIME  awoke,ARRANGE from TOOLS_CALENDARARRANGE  where USERACCOUNT='"+param1+"' and CALENDAR=to_date('"+calendar+"','yyyy-mm-dd') order by begin ";
		//System.out.println(sqlstr);
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try{
		 	con = db.getConnection();
		 	st = con.createStatement();
		 	rs = st.executeQuery(sqlstr);

		 	while(rs.next()){
		 		Element   TOOLS_CALENDARARRANGE = doc.createElement("TOOLS_CALENDARARRANGE");
		 		Element SERIALNUM = doc.createElement("SERIALNUM");
		 		XmlUtil.setNodeValue(SERIALNUM,rs.getString("SERIALNUM"));//序号;
		 		Element CALENDAR = doc.createElement("CALENDAR");
		 		XmlUtil.setNodeValue(CALENDAR,rs.getString("ca"));//日期;
		 		Element USERACCOUNT = doc.createElement("USERACCOUNT");
		 		XmlUtil.setNodeValue(USERACCOUNT,rs.getString("USERACCOUNT"));//用户财号;
		 		Element BEGINTIME = doc.createElement("BEGINTIME");
		 		XmlUtil.setNodeValue(BEGINTIME,rs.getString("begin"));//开始时间;
		 		Element ENDTIME = doc.createElement("ENDTIME");
		 		XmlUtil.setNodeValue(ENDTIME,rs.getString("end"));//结束时间;
		 		Element TASKSUM = doc.createElement("TASKSUM");
		 		XmlUtil.setNodeValue(TASKSUM,rs.getString("TASKSUM"));//内容摘要;
		 		Element TASKCONTENT = doc.createElement("TASKCONTENT");
		 		XmlUtil.setNodeValue(TASKCONTENT,rs.getString("TASKCONTENT"));//内容;
		 		Element AWOKETIME = doc.createElement("AWOKETIME");
		 		XmlUtil.setNodeValue(AWOKETIME,rs.getString("awoke"));//提醒时间;
		 		Element ARRANGE = doc.createElement("ARRANGE");
		 		XmlUtil.setNodeValue(ARRANGE,rs.getString("ARRANGE"));//日程安排人;
		 		TOOLS_CALENDARARRANGE.appendChild(SERIALNUM);
		 		TOOLS_CALENDARARRANGE.appendChild(CALENDAR);
		 		TOOLS_CALENDARARRANGE.appendChild(USERACCOUNT);
		 		TOOLS_CALENDARARRANGE.appendChild(BEGINTIME);
		 		TOOLS_CALENDARARRANGE.appendChild(ENDTIME);
		 		TOOLS_CALENDARARRANGE.appendChild(TASKSUM);
		 		TOOLS_CALENDARARRANGE.appendChild(TASKCONTENT);
		 		TOOLS_CALENDARARRANGE.appendChild(AWOKETIME);
		 		TOOLS_CALENDARARRANGE.appendChild(ARRANGE);
		 		day.appendChild(TOOLS_CALENDARARRANGE);
		 		
		 	}//while
		 	
		 	

		 	
		 	

		 	
		 }catch(Exception ex){
		 	ex.printStackTrace();
		 }finally{
			 	if(rs!=null) rs.close();
		 	if(st!=null) st.close();
		 	if(con!=null) con.close();
		 
		 }
		
	}
	public static void setArrangerMan(PersistenceBroker db,String userID,Node param5,Document doc)throws Exception{

        String sqlstr="select USERACCOUNT,ARRANGE from TOOLS_ARRANGER";
		System.out.println(sqlstr);
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try{
		 	con = db.getConnection();
		 	st = con.createStatement();
		 	rs = st.executeQuery(sqlstr);
		 	while(rs.next()){
		 		String temp = rs.getString("ARRANGE");
		 	    String temp1[]=temp.split(",");
		 	    for(int  i = 0 ;i<temp1.length ;i++){
		 		      if(temp1[i].equalsIgnoreCase(userID)){
		 		      Element   ArrangerMan = doc.createElement("ArrangerMan");//建实体;
                      Element USERACCOUNT = doc.createElement("USERACCOUNT");
                      String id = rs.getString("USERACCOUNT");
		 		      XmlUtil.setNodeValue(USERACCOUNT,id);//用户财号;
                      Element OPERATORNAME = doc.createElement("OPERATORNAME");
		 		      XmlUtil.setNodeValue(OPERATORNAME,getUserName(db,id));//用户财号;
     	 		      ArrangerMan.appendChild(USERACCOUNT);
     	 		      ArrangerMan.appendChild(OPERATORNAME);
     	 		      param5.appendChild(ArrangerMan);
		 		      break;
		 		   }
		 		      
		 	    }
		 	    
		 	   
		 		
		 	}//while
		
		 	
		 }catch(Exception ex){
		 	ex.printStackTrace();
		 }finally{
		 	if(rs!=null) rs.close();
		 	if(st!=null) st.close();
		 	if(con!=null) con.close();
		 
		 }
	}
	//查询所有浏览权限的用户;
  public static void setViewMan(PersistenceBroker db,String userID,Node param6,Document doc) throws Exception{
    String sqlstr="select USERACCOUNT,MEMBER from TOOLS_VIEWRIGHT";
    //int i = 0;
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	try{
	 	con = db.getConnection();
	 	st = con.createStatement();
	 	rs = st.executeQuery(sqlstr);
	 	while(rs.next()){
	 		
	 		String temp = rs.getString("MEMBER");
	 	    String temp1[]=temp.split(",");
	 	    for(int  i = 0 ;i<temp1.length ;i++){
	 		      if(temp1[i].equalsIgnoreCase(userID)){
	 		      Element   ViewMan = doc.createElement("ViewMan");//建实体;
                  Element USERACCOUNT = doc.createElement("USERACCOUNT");
                  String id = rs.getString("USERACCOUNT");
	 		      XmlUtil.setNodeValue(USERACCOUNT,id);//用户财号;
                  Element OPERATORNAME = doc.createElement("OPERATORNAME");
	 		      XmlUtil.setNodeValue(OPERATORNAME,getUserName(db,id));//用户财号;
	 		      ViewMan.appendChild(USERACCOUNT);
	 		      ViewMan.appendChild(OPERATORNAME);
 	 		      param6.appendChild(ViewMan);
	 		      break;
	 		   }
	 		      
	 	    }
	 	    
	 	   
	 		
	 	}//while
	
	 	
	 }catch(Exception ex){
	 	ex.printStackTrace();
	 }finally{
	 	if(rs!=null) rs.close();
	 	if(st!=null) st.close();
	 	if(con!=null) con.close();
	 
	 }
  	
  }
  public static String getUserName(PersistenceBroker db,String userID)throws Exception{
    String sqlstr="select OPERATORNAME from EOSOPERATOR where USERID='"+userID+"'";

	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	String name = "";
	try{
	 	
	 	con = db.getConnection();
	 	st = con.createStatement();
	 	rs = st.executeQuery(sqlstr);

	 	while(rs.next()){
	 	    
	 	   name = rs.getString("OPERATORNAME" );
	 		
	 	}//while
	 
	 	
	 }catch(Exception ex){
	 	ex.printStackTrace();
	 }finally{
	 	if(rs!=null) rs.close();
	 	if(st!=null) st.close();


	 }
  	return name;
  
  }
	
}