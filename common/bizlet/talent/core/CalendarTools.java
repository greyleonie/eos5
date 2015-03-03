package talent.core;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

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
		String param2 = (String)param.getParaObjectAt(1);//�ճ̰�����ָ��¼��;
		String param3 = (String)param.getParaObjectAt(2);//��

		String param4 = (String)param.getParaObjectAt(3);//��

		//Node param5 = (Node)param.getParaObjectAt(5);//���е�ǰ��¼�û����а�����
		//Node param6 = (Node)param.getParaObjectAt(6);//��ѯ��ǰ�û����е����Ȩ����
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

		for (int i=0;i< maxdays;i++ ) {	
				   Date weekdate = new Date(ca.getTime().getTime()); 
			   Element day = doc.createElement("day");
				   	
				   	
				   setTOOLS_CALENDARARRANGE(db,param1,weekdate.toString(),param0,doc,day);//��ѯ���ŵ��ճ�;
                 
				   
				 	param0.appendChild(day);
				    ca.add(Calendar.DAY_OF_MONTH, 1);
				   
				}
		//setArrangerMan(db,param2,param5,doc);//ȡ�����ճ̰���Ȩ�޵���;
		//setViewMan(db,param2,param6,doc);//ȡ�������Ȩ�޵���;
		return 1;
		
	}
	
	//��ѯ����Ϊ�Ұ��ŵ������ճ�;
	public static String setOtherMan(PersistenceBroker db,String param1) throws Exception{
	      String sqlstr="select USERID,TASKCONTENT from Schedule where USERID="+param1;
			System.out.println(sqlstr);
			Connection con = null;
			Statement st = null;
			ResultSet rs = null;
			try{
			 	con = db.getConnection();
			 	st = con.createStatement();
			 	rs = st.executeQuery(sqlstr);
			 	while(rs.next()){

                   return rs.getString("TASKCONTENT");
			 		      
			 	   
			 	    
			 	   
			 		
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
		String sqlstr = "select ScheduleID,convert(varchar(10),CALENDAR,102) ca,USERID,TASKSUM" +
				",TASKCONTENT,ISREMIND,convert(varchar(16),AWOKETIME,120)  awoke,type,begintime from Schedule  where USERID="+param1+" and datediff(dd,CALENDAR,'"+calendar+"')=0 order by ScheduleID desc ";
		System.out.println(sqlstr);
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try{
		 	con = db.getConnection();
		 	st = con.createStatement();
		 	rs = st.executeQuery(sqlstr);

		 	while(rs.next()){
		 		Element   TOOLS_CALENDARARRANGE = doc.createElement("TOOLS_CALENDARARRANGE");
		 		Element ScheduleID = doc.createElement("ScheduleID");
		 		XmlUtil.setNodeValue(ScheduleID,rs.getString("ScheduleID"));//���;
		 		Element CALENDAR = doc.createElement("CALENDAR");
		 		XmlUtil.setNodeValue(CALENDAR,rs.getString("ca"));//����;
		 		Element USERID = doc.createElement("USERID");
		 		XmlUtil.setNodeValue(USERID,rs.getString("USERID"));//�û��ƺ�;
		 		Element TASKSUM = doc.createElement("TASKSUM");
		 		XmlUtil.setNodeValue(TASKSUM,rs.getString("TASKSUM"));//����ժҪ;
		 		Element TASKCONTENT = doc.createElement("TASKCONTENT");
		 		XmlUtil.setNodeValue(TASKCONTENT,rs.getString("TASKCONTENT"));//����;
		 		Element AWOKETIME = doc.createElement("AWOKETIME");
		 		XmlUtil.setNodeValue(AWOKETIME,rs.getString("awoke"));//����ʱ��;
		 		Element beginTime = doc.createElement("beginTime");
		 		XmlUtil.setNodeValue(beginTime,rs.getString("begintime"));//����
		 		Element type = doc.createElement("type");
		 		XmlUtil.setNodeValue(type,rs.getString("type"));//����
		 		TOOLS_CALENDARARRANGE.appendChild(ScheduleID);
		 		TOOLS_CALENDARARRANGE.appendChild(CALENDAR);
		 		TOOLS_CALENDARARRANGE.appendChild(USERID);
		 		TOOLS_CALENDARARRANGE.appendChild(TASKSUM);
		 		TOOLS_CALENDARARRANGE.appendChild(TASKCONTENT);
		 		TOOLS_CALENDARARRANGE.appendChild(AWOKETIME);
		 		TOOLS_CALENDARARRANGE.appendChild(beginTime);
		 		TOOLS_CALENDARARRANGE.appendChild(type);
		 		day.appendChild(TOOLS_CALENDARARRANGE);
		 		
		 	}//while
		 	
		 	
		 	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 	String now=sdf.format(Calendar.getInstance().getTime());
		 	if(calendar.equals(now)){
		 		String sql="select tl.planID ScheduleID,convert(varchar(10),tl.taskDate,102) ca,"+param1+" USERID,'��������' TASKSUM,'<br>�༶:'+class+'<br>�γ�:'+course+'<br>����:'+classRoom+'<br>����:'+tl.task TASKCONTENT,0 ISREMIND,getdate() awoke,0 type,'1970-01-01 '+tl.taskTime+'.000' begintime from (select TaskID,PlanType,PlanID,TaskDate,TaskTime,TaskNoon,ClassRoom,Class,Course,Explain,TaskName,Task,Director,Assistant,Remarks from (select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'����' as TaskName,'����' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like '����' right join class cla on cla.classid = c.classid where c.isadopted=1 and c.isusekqj=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'���ص���ͶӰ' as TaskName,'���ص���ͶӰ' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like '���ص���ͶӰ'right join class cla on cla.classid = c.classid where c.isadopted=1 and c.IsUseCourseWare=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'ʹ������' as TaskName,'ʹ������' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like 'ʹ������'right join class cla on cla.classid = c.classid where c.isadopted=1 and c.IsUseNotebookPC=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'�Ļ���' as TaskName,'�Ļ���' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like '�Ļ���'right join class cla on cla.classid = c.classid where c.isadopted=1 and c.IsTakeFeature=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'ʹ������' as TaskName,'ʹ������' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like 'ʹ������'right join class cla on cla.classid = c.classid where c.isadopted=1 and c.IsUseCamera=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'ȫ������' as TaskName,'ȫ������' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like 'ȫ������'right join class cla on cla.classid = c.classid where c.isadopted=1 and c.IsUseVideo=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'ʹ��ú��' as TaskName,'ʹ��ú��' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like 'ʹ��ú��'right join class cla on cla.classid = c.classid where c.isadopted=1 and c.IsUseMediaPlayer=1 union all select t.TaskID as TaskID,'1'as PlanType,c.CourseID as PlanID,c.ClassDate as TaskDate,CONVERT (varchar(10), c.ClassTime , 108) as TaskTime,c.ClassNoon as TaskNoon,r.RoomName as ClassRoom,cla.ClassName as Class,c.CourseTitle as Course,c.Remarks as Explain,'��������,�ṩ��Ͳ' as TaskName,'�ṩ'+CONVERT(nvarchar, c.RadioPhones )+'��������˷�,'+CONVERT(nvarchar, c.WiredPhones )+'��������˷�' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from course c  left join room r on c.classroomid=r.roomid left join centertask t on t.plantype=1 and t.planid=c.courseid and t.task like '%��˷�'right join class cla on cla.classid = c.classid where c.isadopted=1 and ((c.RadioPhones is not null and c.RadioPhones!=0) or ( c.WiredPhones is not null and c.WiredPhones!=0)) union all select t.TaskID as TaskID,'2'as PlanType,d.RecordID as PlanID,d.RecordDate as TaskDate,CONVERT (varchar(10), d.RecordTime  , 108) as TaskTime,d.RecordNoon as TaskNoon,d.ClassRooms as ClassRoom,d.Class as Class,d.CourseTitle as Course,d.Remarks as Explain,'���ص���ͶӰ' as TaskName,'¼��' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from distanceteaching d  left join centertask t on t.plantype=2 and t.planid=d.RecordID and t.task like '¼��' where d.isrecord=1 union all select t.TaskID as TaskID,'2'as PlanType,d.RecordID as PlanID,d.RecordDate as TaskDate,CONVERT (varchar(10), d.RecordTime  , 108)  as TaskTime,d.RecordNoon as TaskNoon,d.ClassRooms as ClassRoom,d.Class as Class,d.CourseTitle as Course,d.Remarks as Explain,'ý�岥��' as TaskName,'����' as Task,t.Director as Director,t.Assistant as Assistant,t.Remarks as Remarks from distanceteaching d  left join centertask t on t.plantype=2 and t.planid=d.RecordID and t.task like '����' where d.isplay=1 or d.islive=1 union all select t.TaskID as TaskID,'3'as PlanType,c.PlanID as PlanID,c.PlanDate as TaskDate,CONVERT (varchar(10), c.PlanTime  , 108)  as TaskTime,c.PlanNoon as TaskNoon,c.ClassRoom as ClassRoom,c.Class as Class,c.Task as Course,c.Remarks as Explain,'��У����' as TaskName,(SELECT businName FROM BNDICT_T_Dictionary WHERE businTypeID = 'dx_workType' and businid=c.WorkType) as Task,(select operatorname from eosoperator where operatorid=c.Director) as Director,(select operatorname from eosoperator where operatorid like SUBSTRING ( c.Assistant, 2, len(c.Assistant)-2 )) as Assistant,t.Remarks as Remarks from centerplan c  left join centertask t on t.plantype=1 and t.planid=c.PlanID and t.task like c.worktype) as task where TaskDate = '"
					+ now
					+ "') tl left join (select * from TaskType where isUse = 1) tt on tl.taskName=tt.taskName where (tl.director=(select top 1 operatorName from eosoperator where operatorID="
					+ param1
					+ ") or tl.assistant=(select top 1 operatorName from eosoperator where operatorID="
					+ param1
					+ ") or tt.director=(select top 1 operatorName from eosoperator where operatorID="
					+ param1
					+ ") or tt.assistant=(select top 1 operatorName from eosoperator where operatorID="
					+ param1 + ")) and tl.course is not null and tt.taskName <>'����' order by tl.taskTime";
		 		rs = st.executeQuery(sql);
			 	while(rs.next()){
			 		Element   TOOLS_CALENDARARRANGE = doc.createElement("TOOLS_CALENDARARRANGE");
			 		Element ScheduleID = doc.createElement("ScheduleID");
			 		XmlUtil.setNodeValue(ScheduleID,rs.getString("ScheduleID"));//���;
			 		Element CALENDAR = doc.createElement("CALENDAR");
			 		XmlUtil.setNodeValue(CALENDAR,rs.getString("ca"));//����;
			 		Element USERID = doc.createElement("USERID");
			 		XmlUtil.setNodeValue(USERID,rs.getString("USERID"));//�û��ƺ�;
			 		Element TASKSUM = doc.createElement("TASKSUM");
			 		XmlUtil.setNodeValue(TASKSUM,rs.getString("TASKSUM"));//����ժҪ;
			 		Element TASKCONTENT = doc.createElement("TASKCONTENT");
			 		XmlUtil.setNodeValue(TASKCONTENT,rs.getString("TASKCONTENT"));//����;
			 		Element AWOKETIME = doc.createElement("AWOKETIME");
			 		XmlUtil.setNodeValue(AWOKETIME,rs.getString("awoke"));//����ʱ��;
			 		Element beginTime = doc.createElement("beginTime");
			 		XmlUtil.setNodeValue(beginTime,rs.getString("begintime"));//����
			 		Element type = doc.createElement("type");
			 		XmlUtil.setNodeValue(type,rs.getString("type"));//����
			 		TOOLS_CALENDARARRANGE.appendChild(ScheduleID);
			 		TOOLS_CALENDARARRANGE.appendChild(CALENDAR);
			 		TOOLS_CALENDARARRANGE.appendChild(USERID);
			 		TOOLS_CALENDARARRANGE.appendChild(TASKSUM);
			 		TOOLS_CALENDARARRANGE.appendChild(TASKCONTENT);
			 		TOOLS_CALENDARARRANGE.appendChild(AWOKETIME);
			 		TOOLS_CALENDARARRANGE.appendChild(beginTime);
			 		TOOLS_CALENDARARRANGE.appendChild(type);
			 		day.appendChild(TOOLS_CALENDARARRANGE);
			 		
			 	}//while
		 	}
		 	
		 	

		 	
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