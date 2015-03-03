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
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName getDataList
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="list" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="calendarYear" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="calendarMonth" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="calendarWeek" name="" desc=""
	 */
	public static int getDataList(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);//��;
		String param2 = (String)param.getParaObjectAt(2);//��;
		String param3 = (String)param.getParaObjectAt(3);//��;
		Calendar  ca = Calendar.getInstance();
		if(param1!=null&&param2!=null&&!"".equalsIgnoreCase(param1)&&"".equalsIgnoreCase(param2))
		ca.set(Integer.parseInt(param1),Integer.parseInt(param2)-1,1);//ͨ�������õ��ꡢ�´ӵ�һ�쿪ʼ;
		else
		ca.set(ca.get(Calendar.YEAR),ca.get(Calendar.MONTH),1);//��ǰ��
		
		//Element   TOOLS_CALENDARARRANGE = doc.createElement("TOOLS_CALENDARARRANGE");
		int maxdays = ca.getActualMaximum(Calendar.DAY_OF_MONTH);//�õ���ǰ�µ��������;
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
	 * ��ѯ�����ճ̰��ţ����Ϊ��ΪĿǰ�����ճ̰���.
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName getMonthList
	 * @canExport true
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="monthList" name="" desc="�洢����ÿ����ճ̰���."
	 * @bizlet_param passing="in_out" type="variable" value="USERACCOUNT" name="" desc="�û��ƺ�"
	 * @bizlet_param passing="in_out" type="variable" value="ARRANGE" name="" desc="������"
	 * @bizlet_param passing="in_out" type="variable" value="year" name="" desc="��"
	 * @bizlet_param passing="in_out" type="variable" value="month" name="" desc="��"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="TOOLS_ARRANGER" name="" desc="���е�ǰ��¼�û����а����ˡ�"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="TOOLS_VIEWRIGHT" name="" desc="��ѯ��ǰ�û����е����Ȩ����"
	 */
	public static int getMonthList(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);//�洢����ÿ����ճ̰���
		String param1 = (String)param.getParaObjectAt(1);//�û��ƺ�ָ����˭���ճ�;
		String param2 = (String)param.getParaObjectAt(2);//�ճ̰�����ָ��¼��;
		String param3 = (String)param.getParaObjectAt(3);//��

		String param4 = (String)param.getParaObjectAt(4);//��

		Node param5 = (Node)param.getParaObjectAt(5);//���е�ǰ��¼�û����а�����
		Node param6 = (Node)param.getParaObjectAt(6);//��ѯ��ǰ�û����е����Ȩ����
		Calendar  ca = Calendar.getInstance();
		PersistenceBroker db = param.getDBBroker();//�õ����ݿ��ѯ����;
		if(param3!=null&&param4!=null&&!"".equalsIgnoreCase(param3)&&!"".equalsIgnoreCase(param4)&&!"null".equalsIgnoreCase(param3)&&!"null".equalsIgnoreCase(param4))
			ca.set(Integer.parseInt(param3),Integer.parseInt(param4)-1,1);//ͨ�������õ��ꡢ�´ӵ�һ�쿪ʼ;
		else{
			ca.set(ca.get(Calendar.YEAR),ca.get(Calendar.MONTH),1);//��ǰ��

		}
		if("".equalsIgnoreCase(param1)||"null".equalsIgnoreCase(param1))//�����ճ̰�����Ϊ��Ĭ��Ϊ��ǰ��¼�û�;
		param1=param2;
			

		int maxdays = ca.getActualMaximum(Calendar.DAY_OF_MONTH);//�õ���ǰ�µ��������;
		System.out.println(maxdays);
		System.out.println(ca.get(4));//�õ���ǰ����;
		for (int i=0;i< maxdays;i++ ) {	
				   Date weekdate = new Date(ca.getTime().getTime()); 
			   Element day = doc.createElement("day");
				   	
				   	
				   setTOOLS_CALENDARARRANGE(db,param1,weekdate.toString(),param0,doc,day);//��ѯ���ŵ��ճ�;
                 
				   
				 	param0.appendChild(day);
				    ca.add(Calendar.DAY_OF_MONTH, 1);
				   
				}
		setArrangerMan(db,param2,param5,doc);//ȡ�����ճ̰���Ȩ�޵���;
		setViewMan(db,param2,param6,doc);//ȡ�������Ȩ�޵���;
		return 1;
		
	}
	//��ѯ����Ϊ�Ұ��ŵ������ճ�;
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
		 		XmlUtil.setNodeValue(SERIALNUM,rs.getString("SERIALNUM"));//���;
		 		Element CALENDAR = doc.createElement("CALENDAR");
		 		XmlUtil.setNodeValue(CALENDAR,rs.getString("ca"));//����;
		 		Element USERACCOUNT = doc.createElement("USERACCOUNT");
		 		XmlUtil.setNodeValue(USERACCOUNT,rs.getString("USERACCOUNT"));//�û��ƺ�;
		 		Element BEGINTIME = doc.createElement("BEGINTIME");
		 		XmlUtil.setNodeValue(BEGINTIME,rs.getString("begin"));//��ʼʱ��;
		 		Element ENDTIME = doc.createElement("ENDTIME");
		 		XmlUtil.setNodeValue(ENDTIME,rs.getString("end"));//����ʱ��;
		 		Element TASKSUM = doc.createElement("TASKSUM");
		 		XmlUtil.setNodeValue(TASKSUM,rs.getString("TASKSUM"));//����ժҪ;
		 		Element TASKCONTENT = doc.createElement("TASKCONTENT");
		 		XmlUtil.setNodeValue(TASKCONTENT,rs.getString("TASKCONTENT"));//����;
		 		Element AWOKETIME = doc.createElement("AWOKETIME");
		 		XmlUtil.setNodeValue(AWOKETIME,rs.getString("awoke"));//����ʱ��;
		 		Element ARRANGE = doc.createElement("ARRANGE");
		 		XmlUtil.setNodeValue(ARRANGE,rs.getString("ARRANGE"));//�ճ̰�����;
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
		 		      Element   ArrangerMan = doc.createElement("ArrangerMan");//��ʵ��;
                      Element USERACCOUNT = doc.createElement("USERACCOUNT");
                      String id = rs.getString("USERACCOUNT");
		 		      XmlUtil.setNodeValue(USERACCOUNT,id);//�û��ƺ�;
                      Element OPERATORNAME = doc.createElement("OPERATORNAME");
		 		      XmlUtil.setNodeValue(OPERATORNAME,getUserName(db,id));//�û��ƺ�;
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
	//��ѯ�������Ȩ�޵��û�;
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
	 		      Element   ViewMan = doc.createElement("ViewMan");//��ʵ��;
                  Element USERACCOUNT = doc.createElement("USERACCOUNT");
                  String id = rs.getString("USERACCOUNT");
	 		      XmlUtil.setNodeValue(USERACCOUNT,id);//�û��ƺ�;
                  Element OPERATORNAME = doc.createElement("OPERATORNAME");
	 		      XmlUtil.setNodeValue(OPERATORNAME,getUserName(db,id));//�û��ƺ�;
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