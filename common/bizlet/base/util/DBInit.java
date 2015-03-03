/*
 * 创建日期 2004-5-7
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package base.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import org.w3c.dom.*;

import com.primeton.tp.common.crypto.EOSCipherTool;
import com.primeton.tp.common.crypto.EOSDigestTool;
import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class DBInit {
	private static String driver="com.microsoft.jdbc.sqlserver.SQLServerDriver";
	private static String[] cleanTables = {"Class","ClassNotify","TextbookBuy","TextbookOrder","TextbookIssue","TextbookInventory","Textbook","WorkLoadCollect","TeachingCase","TeachingPlanUnit","Course","SpecialSubject","TeachingPlan","Subjects","VideoRegister","SocialSurvey","AssignMark","Advice","DistanceTeaching","CenterPlan","CenterTask","SignOfSpecialClass","Guest","OpeningDoorLogs","POI","RoomManager","Building","BusinessLogs","MonitorTask","BusinessLogsCollect","BusinessType","Card","ClassroomBusinessRec","UsingClassroomLogs","tblReceptionChangeRec","POS","DestroyCard","StudentlaterLogs","StudentkqData","Score","ClassSubject","Student","Team","Teacher","Thesis","HousingLogs","SYS_LOG","EOSOperator"};
	private static String cleanOaTables = "MOT CarMaint CAR_CARINFO BreakRule DriverInfo UseCarRequest CAR_OIL "//车辆管理
		                                  + "TOOL_Mail TOOL_MailDirectory TOOL_MAILSERVER TOOL_MailAttch InnerNote Schedule AddressListGroup AddressList "//个人办公 
										  + "TravelCostClaim TravelClaimDetail " //差旅费
										  + "CostClaim CostClaimDetail " //费用
										  + "BorrowRequest CheckRequest " //其它申请表
										  + "WorkArrange WorkArrangeReplay Notice ShareFolder " //公共事务
										  + "SendArchive PubLemma ReceiveArchive ArchivePrefix " //公文管理
										  + "MR_SUMMARY MR_APPLY MR_REGISTER MR_NOTICE " //会议管理
										  + "TelBook SendMsg " //手机短信
										  + "COMM_OfficeFund COMM_DRAWDETAIL COMM_PURCHASEDETAIL COMM_PURCHASE COMM_STOREOUTDETAIL COMM_STOREOUT COMM_CHECKDETAIL COMM_STOREINDETAIL COMM_DRAW COMM_UNIT COMM_TYPE COMM_CHECK COMM_STOREIN COMM_COMMODITYINFO " //用品管理
										  + "CAPT_APPLY CAPT_BORROW CAPT_BORROWDETAIL CAPT_CAPITALINFO CAPT_MAINTAIN CAPT_MAINTAINDETAIL CAPT_PROVIDER CAPT_PURCHASE CAPT_PURCHASEDETAIL CAPT_STOREIN CAPT_STOREINDETAIL CAPT_TYPE CAPT_UNIT CAPT_VINDICATOR CAPT_WRITEOFFDETAIL CAPT_WRITEOFF " //资产管理
		                                  + "FlowAttachment FlowData WFAgent WFInform WFWIParticipant WFTransCtrl WFTransition WFWorkItem WFActivityInst WFProcessInst";//工作流业务表
	private static String sourceIp;
	private static String sourceDBName;
	private static String sourceUserName;
	private static String sourcePsw;
	
	private static String targetIp;
	private static String targetDBName;
	private static String targetUserName;
	private static String targetPsw;
	
	private static String msg="";
	
	private static Connection SCon=null;
	private static Statement SSt=null;
	
	private static Connection TCon=null;
	private static Statement TSt=null;
	
	public static void initParameter(String sourceIp,String sourceDBName,String sourceUserName,String sourcePsw,
			       String targetIp,String targetDBName,String targetUserName,String targetPsw){
		
		DBInit.sourceIp=sourceIp;
		DBInit.sourceDBName=sourceDBName;
		DBInit.sourceUserName=sourceUserName;
		DBInit.sourcePsw=sourcePsw;
		
		DBInit.targetIp=targetIp;
		DBInit.targetDBName=targetDBName;
		DBInit.targetUserName=targetUserName;
		DBInit.targetPsw=targetPsw;
		
		try{
		DBInit.SCon=DBInit.getSourceConnection();
		DBInit.SSt=DBInit.SCon.createStatement();
  		
		DBInit.TCon=DBInit.getTargetConnection();
		DBInit.TSt=TCon.createStatement();
		}catch(Exception e){
			System.out.println("======初始化连接:"+e);
		}
	}
	
     public static Connection getSourceConnection(){
     	Connection con=null;     	
     	String sourceUrl="jdbc:microsoft:sqlserver://"+DBInit.sourceIp+";DatabaseName="+DBInit.sourceDBName+";selectmethod=cursor";
    
     	try{
			Class.forName(DBInit.driver);
			con = DriverManager.getConnection(sourceUrl,DBInit.sourceUserName,DBInit.sourcePsw);			
			
		}catch(Exception e){
			e.printStackTrace();
		}
     	return con;
     }
     
     public static Connection getTargetConnection(){
     	Connection con=null;     	
     	String targetUrl="jdbc:microsoft:sqlserver://"+DBInit.targetIp+";DatabaseName="+DBInit.targetDBName+";selectmethod=cursor";
     	try{
			Class.forName(DBInit.driver);
			
			con = DriverManager.getConnection(targetUrl,DBInit.targetUserName,DBInit.targetPsw);			
			
		}catch(Exception e){
			e.printStackTrace();
		}
     	return con;
     }
     
    public static String  importAllTab(){
    	try{
    		//这里加入各种导入数据的方法
    		DBInit.import_Class();
    		DBInit.import_TeachingPlan();
    		DBInit.import_Course();
    		DBInit.import_Subjects();
    		
    		DBInit.import_Textbook();
    		DBInit.import_Housinglogs();
    		DBInit.import_ClassroomBusinessRec();
    		DBInit.import_Usingclassroomlogs();
    		DBInit.import_VideoRegister();
    		DBInit.import_DistanceTeaching();
    		
    		DBInit.import_Card();
    		DBInit.import_Guest();
    		DBInit.import_POI();
    		DBInit.import_Building();
    		DBInit.import_RoomManager();
    		DBInit.import_BusinessLogs();
    		DBInit.import_BusinessLogsCollect();
    		DBInit.import_BusinessType();
    		DBInit.import_StudentlaterLogs();
    		DBInit.import_StudentkqData();
    		DBInit.import_Thesis();
    		DBInit.import_Team();
    		DBInit.import_POS();
    		DBInit.import_DestroyCard();
    		DBInit.import_MonitorTask();
    		
    		DBInit.import_Student();
    		DBInit.import_Teacher();
    		
    		DBInit.import_Users();
    		DBInit.import_Card();
    		
    		DBInit.import_StudentRev();
    		
    		DBInit.msg = "业务数据导入成功！";
    	}catch(Exception e){
    		System.out.println("=========importAllTab:"+e);
    	}finally{
    	try{
				if(DBInit.SSt!=null)DBInit.SSt.close();
				if(DBInit.TSt!=null) DBInit.TSt.close();
				if(DBInit.SCon!=null) DBInit.SCon.close();
				if(DBInit.TCon!=null) DBInit.TCon.close();
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
    	}
      	return DBInit.msg;
    }
    
    //导入教学计划和单元
    public static String import_TeachingPlan(){
    	ResultSet rs=null;
    	try{
          String selectUnit="select e.*,className,c.classTypeId from EducatingUnit e, class c " +
          		          " where e.classId=c.classId order by e.classId asc";
          String delUnitSql="delete from TeachingPlanUnit";
         String delPlanSql="delete from TeachingPlan";
        
          DBInit.TSt.execute(delUnitSql);
          DBInit.TSt.execute(delPlanSql);
        
          rs=DBInit.SSt.executeQuery(selectUnit);
          int countInsertPlanResult=0;
          int countInsertUnitResult=0;
          int countAll=0;
          int planId=0;
          String insertPlanSql="";
          String insertUnitSql="";
          int ClassID;
          int EducatingUnitID;         
          String Sequence="";
          String Title="";
          int EducatingDepartmentID;
          int PrincipalID;
          String BeginTime="";
          String EndTime="";
          int EducatingTypeID;
          String className="";
          String planTitle="";
          int remarkClassId=0;
          boolean executed=false;
          int state=6;
          
          while(rs!=null&&rs.next()){
          	ClassID=rs.getInt("ClassID");
          	EducatingUnitID=rs.getInt("EducatingUnitID");
          	Sequence=rs.getString("Sequence");
          	Title=rs.getString("Title");
          	EducatingDepartmentID=rs.getInt("EducatingDepartmentID");
          	PrincipalID=rs.getInt("PrincipalID");
          	BeginTime=rs.getString("BeginTime");
          	EndTime=rs.getString("EndTime");
          	className=rs.getString("className");
          	
          	planTitle=className+"教学计划";
          	
          	
          
          	
          
          	boolean insertPlanResult=false;
          	boolean insertUnitResult=false;
          
          	if(countAll==0){
          		remarkClassId=ClassID;
          		planId++;
          		insertPlanSql="insert into TeachingPlan(PlanID,PlanName,ClassID,StartTime,EndTime,state)values("+planId+
	              ",'"+planTitle+"',"+ClassID+",'"+BeginTime+"','"+EndTime+"',"+state+")";
          		insertPlanResult=DBInit.TSt.execute(insertPlanSql);
          	if(!insertPlanResult){
                	countInsertPlanResult++;    
           		    
           		}
          	}else{
          	   if(remarkClassId!=ClassID){
          	    remarkClassId=ClassID;
          	    planId++;
          	  insertPlanSql="insert into TeachingPlan(PlanID,PlanName,ClassID,StartTime,EndTime,state)values("+planId+
              ",'"+planTitle+"',"+ClassID+",'"+BeginTime+"','"+EndTime+"',"+state+")";
          	    insertPlanResult=DBInit.TSt.execute(insertPlanSql);
          	  if(!insertPlanResult){
          	    countInsertPlanResult++;
         	  }
         		remarkClassId=ClassID;
          	   }	
          	}
          	
        	insertUnitSql="insert into TeachingPlanUnit(UnitID,ClassID,PlanID,UnitName,UnitTitle,Department,Principal,BeginTime,EndTime)"+
			"values("+EducatingUnitID+","+ClassID+","+planId+",'"+Sequence+"','"+Title+"','"+EducatingDepartmentID+"','"+PrincipalID+"','"+BeginTime+"','"+EndTime+"')";
          	
            countAll++;
            insertUnitResult= DBInit.TSt.execute(insertUnitSql);  
            
           if(!insertUnitResult) countInsertUnitResult++; 
           
         }
          
          DBInit.msg+="\n导入-表TeachingPlan-"+countInsertPlanResult+"条";	
          DBInit.msg+="\n导入-表TeachingPlanUnit-"+countInsertUnitResult+"条";	
      //	System.out.println("---------------------------------------");
          System.out.println("=========msg:"+DBInit.msg);
        //  System.out.println("---------------------------------------");
          if(rs!=null)rs.close();
    	}catch(Exception e){
    		System.out.println("=========import_TeachingPlan:"+e);
    	}
    	return DBInit.msg;
    }
    
//  导入课程数据
    public static String import_Course(){
    	ResultSet rs=null;    	
    	int theCourseId=0;
    	try{
    		int CourseID;
    		int EducatingUnitID;
    		String CourseTitle="";
    		String ClassDateTime="";
    		int ClassWeek;
    		int ClassNoon;
    		int EducatingModeID;
    		String Compere="";
    		int TeacherID;
    		String TeacherString="";
    		String TeacherDiscuss="";
    		String Outsider="";
    		int ClassRoomID;
    		int UsingCourseware;
    		int LineateMicNum;
    		int WirelessMicNum;
    		int ShootTypeA;
    		int ShootTypeB;
    		int ShootTypeC;
    		int Isnew;
    		int RangeModeID;
    		int UsingPOT;
    		int IsLoadBook;
    		int WareMajorPer;
    		int WareAssPer;
    		int MicroPhoneMajorPer;
    		int MicroPhoneAssPer;
    		int NoteBookMajorPer;
    		int NoteBookAssPer;
    		int FeatureMajorPer;
    		int FeatureAssPer;
    		int DigitalPhotoMajorPer;
    		int DigitalPhotoAssPer;
    		int DVMajorPer;
    		int DVAssPer;
    		int CheckMajorPer;
    		int CheckAssPer;
    		String Remark=""; 
    		String TeacherDuty="";
    		String TeacherDepartMent="";
    		int Mtbf;
    		int MtbfMajorPer;
    		int MtbfAssPer;
    		int IsArranged;
    		int ClassID;
    		String classDate="";
    		String courseSql="select co.*,c.classId  from course co join  EducatingUnit e " +
    				        "on e.educatingUnitID=co.educatingUnitID join class c on c.classId=e.classid";
    	//----------------------------------------------------	
    		String delCourse="delete from course";
   		    DBInit.TSt.execute(delCourse);
    	//------------------------------------------------	
    		rs=DBInit.SSt.executeQuery(courseSql);
    		
    		int countSuccessful=0;
    		
    		while(rs!=null&&rs.next()){
    			CourseID=rs.getInt("CourseID");
    			EducatingUnitID=rs.getInt("EducatingUnitID");
    			CourseTitle=rs.getString("CourseTitle");
    			ClassDateTime=rs.getString("ClassDateTime");
    		    ClassWeek=rs.getInt("ClassWeek");
        	    ClassNoon=rs.getInt("ClassNoon");
        		EducatingModeID=rs.getInt("EducatingModeID");
        		Compere=rs.getString("Compere");
        		TeacherID=rs.getInt("TeacherID");
        		TeacherString=rs.getString("TeacherString");        		
        		TeacherDiscuss=rs.getString("TeacherDiscuss");
        		ClassRoomID=rs.getInt("ClassRoomID");
        		UsingCourseware=rs.getInt("UsingCourseware");
        		LineateMicNum=rs.getInt("LineateMicNum");
        		WirelessMicNum=rs.getInt("WirelessMicNum");
        		ShootTypeA=rs.getInt("ShootTypeA");//是否需要拍花絮，1是0否
        		ShootTypeB=rs.getInt("ShootTypeB");//是否需要数码摄像，1是，0否
        		ShootTypeC=rs.getInt("ShootTypeC");//是否需要全程摄像，1是0否
        		Isnew=rs.getInt("Isnew");         //是否为新课题，1表示新，0表示旧
        		RangeModeID=rs.getInt("RangeModeID");
        		UsingPOT=rs.getInt("UsingPOT");  //是否考勤，1表示是，0表示否
        		IsLoadBook=rs.getInt("IsLoadBook");//是否自带笔记本, 1表示带，0表示没带
        		WareMajorPer=rs.getInt("WareMajorPer");
        		WareAssPer=rs.getInt("WareAssPer");
        		MicroPhoneMajorPer=rs.getInt("MicroPhoneMajorPer");
        		MicroPhoneAssPer=rs.getInt("MicroPhoneAssPer");
        		NoteBookMajorPer=rs.getInt("NoteBookMajorPer");
        		NoteBookAssPer=rs.getInt("NoteBookAssPer");
        		FeatureMajorPer=rs.getInt("FeatureMajorPer");
        		FeatureAssPer=rs.getInt("FeatureAssPer");
        		DigitalPhotoMajorPer=rs.getInt("DigitalPhotoMajorPer");
        		DigitalPhotoAssPer=rs.getInt("DigitalPhotoAssPer");
        		DVMajorPer=rs.getInt("DVMajorPer");
        		DVAssPer=rs.getInt("DVAssPer");
        		CheckMajorPer=rs.getInt("CheckMajorPer");
        		CheckAssPer=rs.getInt("CheckAssPer");
        		Remark=rs.getString("Remark");
        		TeacherDuty=rs.getString("TeacherDuty");
        		TeacherDepartMent=rs.getString("TeacherDepartMent");
        		Mtbf=rs.getInt("Mtbf");
        		MtbfMajorPer=rs.getInt("MtbfMajorPer");
        		MtbfAssPer=rs.getInt("MtbfAssPer");
        		IsArranged=rs.getInt("IsArranged");
        		ClassID=rs.getInt("classId");
        		classDate=rs.getString("ClassDateTime");
        		if(classDate.length()>10)classDate=classDate.substring(0,10);
        		//数据转换
        		if(TeacherID==0){
        			if (TeacherString!=null && !"".equals(TeacherString)) {

        			if (!"班主任".equals(FormatS(TeacherString))  && !"校领导".equals(FormatS(TeacherString))) {
        				String tsql = "select UserID from Users where UserName like '%"+FormatS(TeacherString)+"%'";
        				Statement OST = DBInit.SCon.createStatement();
        				ResultSet teachers = OST.executeQuery(tsql);
        				if (teachers!=null && teachers.next()) {
        					TeacherID=teachers.getInt("UserID");
        				} else {
        					Outsider=TeacherString;
        	        		System.out.println("=================="+CourseID+"======"+tsql);
        				}
        			} }
        		}
        		if(TeacherDepartMent==null)TeacherDepartMent="";
        		if(TeacherDuty==null)TeacherDuty="";
        		if(EducatingModeID>10)EducatingModeID=EducatingModeID-1;
        		
        		RangeModeID=RangeModeID-1;
        		
        		if(Remark==null)Remark="";
        		
        		TeacherString="";//数据可能有问题，先不导入
        		Compere="";
        		TeacherDiscuss="";
        		theCourseId=CourseID;
        		String insertCourseSql="insert into course(CourseID,UnitID,ClassID,CourseTitle," +
        				                                  "ClassDate,ClassTime,ClassNoon,ClassRoomID," +
        				                                  "IsMeldClass,Teachers,Tutors,Attenders," +
        				                                  "Outsider,OutSideOrg,OutSidePost,Compere,Conventioneers," +
        				                                  "TeahchingModelID,ClassModelID,IsUseKQJ,IsUseCourseWare,IsUseNotebookPC," +
        				                                  "IsTakeFeature,IsUseCamera,IsUseVideo,IsUseMediaPlayer,RadioPhones," +
        				                                  "WiredPhones,PlatformSeats,StudentSeats,Cups,IsUseTea," +
        				                                  "IsUseFlower,DeskArrange,Remarks,Approval,Opinion," +
        				                                  "IsAdopted)values(" +
        				                                  CourseID+","+EducatingUnitID+","+ClassID+",'"+CourseTitle+"','"+
        				                                  classDate+"','"+ClassDateTime+"',"+ClassNoon+","+ClassRoomID+","+
														  0+","+TeacherID+",'','"+TeacherString+"','"+Outsider+"','"+TeacherDepartMent+"','"+TeacherDuty+"','"+Compere+"','"+TeacherDiscuss+"',"+
														  EducatingModeID+","+RangeModeID+","+UsingPOT+","+UsingCourseware+","+IsLoadBook+","+
														  ShootTypeA+","+ShootTypeB+","+ShootTypeC+","+Mtbf+","+WirelessMicNum+","+
														  LineateMicNum+","+0+","+0+","+0+","+0+","+
														  0+",'','"+Remark+"','','',"+
														  1+")";
        		//System.out.println("=========import_Course====sql:"+insertCourseSql);
        		boolean insertResult=DBInit.TSt.execute(insertCourseSql);
    		if(!insertResult)countSuccessful++;
    		}
    		System.out.println("=========import_Course====导入-表Course-"+countSuccessful+"条");
    		DBInit.msg+="\n导入-表Course-"+countSuccessful+"条";	
    		if(rs!=null)rs.close();
    	}catch(Exception e){
    		System.out.println("=========import_Course=======theCourseId:"+theCourseId+"===error:"+e);
    	}
    	return DBInit.msg;
    }
    
    private static String FormatS(String p_str)
    {
    p_str=p_str.replaceAll("Ａ","A");
    p_str=p_str.replaceAll("Ｂ","B");
    p_str=p_str.replaceAll("Ｃ","C");
    p_str=p_str.replaceAll("Ｄ","D");
    p_str=p_str.replaceAll("Ｅ","E");
    p_str=p_str.replaceAll("Ｆ","F");
    p_str=p_str.replaceAll("Ｇ","G");
    p_str=p_str.replaceAll("Ｈ","H");
    p_str=p_str.replaceAll("Ｉ","I");
    p_str=p_str.replaceAll("Ｊ","J");
    p_str=p_str.replaceAll("Ｋ","K");
    p_str=p_str.replaceAll("Ｌ","L");
    p_str=p_str.replaceAll("Ｍ","M");
    p_str=p_str.replaceAll("Ｎ","N");
    p_str=p_str.replaceAll("Ｏ","O");
    p_str=p_str.replaceAll("Ｐ","P");
    p_str=p_str.replaceAll("Ｑ","Q");
    p_str=p_str.replaceAll("Ｒ","R");
    p_str=p_str.replaceAll("Ｓ","S");
    p_str=p_str.replaceAll("Ｔ","T");
    p_str=p_str.replaceAll("Ｕ","U");
    p_str=p_str.replaceAll("Ｖ","V");
    p_str=p_str.replaceAll("Ｗ","W");
    p_str=p_str.replaceAll("Ｘ","X");
    p_str=p_str.replaceAll("Ｙ","Y");
    p_str=p_str.replaceAll("Ｚ","Z");
    
    p_str=p_str.replaceAll("ａ","a");
    p_str=p_str.replaceAll("ｂ","b");
    p_str=p_str.replaceAll("ｃ","c");
    p_str=p_str.replaceAll("ｄ","d");
    p_str=p_str.replaceAll("ｅ","e");
    p_str=p_str.replaceAll("ｆ","f");
    p_str=p_str.replaceAll("ｇ","g");
    p_str=p_str.replaceAll("ｈ","h");
    p_str=p_str.replaceAll("ｉ","i");
    p_str=p_str.replaceAll("ｊ","j");
    p_str=p_str.replaceAll("ｋ","k");
    p_str=p_str.replaceAll("ｌ","l");
    p_str=p_str.replaceAll("ｍ","m");
    p_str=p_str.replaceAll("ｎ","n");
    p_str=p_str.replaceAll("ｏ","o");
    p_str=p_str.replaceAll("ｐ","p");
    p_str=p_str.replaceAll("ｑ","q");
    p_str=p_str.replaceAll("ｒ","r");
    p_str=p_str.replaceAll("ｓ","s");
    p_str=p_str.replaceAll("ｔ","t");
    p_str=p_str.replaceAll("ｕ","u");
    p_str=p_str.replaceAll("ｖ","v");
    p_str=p_str.replaceAll("ｗ","w");
    p_str=p_str.replaceAll("ｘ","x");
    p_str=p_str.replaceAll("ｙ","y");
    p_str=p_str.replaceAll("ｚ","z");

    p_str=p_str.replaceAll("a","a");
    p_str=p_str.replaceAll("b","b");
    p_str=p_str.replaceAll("c","c");
    p_str=p_str.replaceAll("d","d");
    p_str=p_str.replaceAll("e","e");
    p_str=p_str.replaceAll("f","f");
    p_str=p_str.replaceAll("g","g");
    p_str=p_str.replaceAll("h","h");
    p_str=p_str.replaceAll("i","i");
    p_str=p_str.replaceAll("j","j");
    p_str=p_str.replaceAll("k","k");
    p_str=p_str.replaceAll("l","l");
    p_str=p_str.replaceAll("m","m");
    p_str=p_str.replaceAll("n","n");
    p_str=p_str.replaceAll("o","o");
    p_str=p_str.replaceAll("p","p");
    p_str=p_str.replaceAll("q","q");
    p_str=p_str.replaceAll("r","r");
    p_str=p_str.replaceAll("s","s");
    p_str=p_str.replaceAll("t","t");
    p_str=p_str.replaceAll("u","u");
    p_str=p_str.replaceAll("v","v");
    p_str=p_str.replaceAll("w","w");
    p_str=p_str.replaceAll("x","x");
    p_str=p_str.replaceAll("y","y");
    p_str=p_str.replaceAll("z","z");

    p_str=p_str.replaceAll("０","0");
    p_str=p_str.replaceAll("１","1");
    p_str=p_str.replaceAll("２","2");
    p_str=p_str.replaceAll("３","3");
    p_str=p_str.replaceAll("４","4");
    p_str=p_str.replaceAll("５","5");
    p_str=p_str.replaceAll("６","6");
    p_str=p_str.replaceAll("７","7");
    p_str=p_str.replaceAll("８","8");
    p_str=p_str.replaceAll("９","9");

    p_str = p_str.replaceAll("\\．", "."); //烂java, 还要转意。
    p_str = p_str.replaceAll("\\。", ".");
    p_str = p_str.replaceAll("\\.", ".");
    p_str = p_str.replaceAll("\\*", "*");
    p_str = p_str.replaceAll("\\\u30FB", "");
    p_str = p_str.replaceAll("\\-", "-");
    p_str = p_str.replaceAll("\\_", "_");
    p_str = p_str.replaceAll("\\－", "-");
    p_str=p_str.replaceAll("\\/","/");
    p_str=p_str.trim();
    p_str=p_str.replaceAll(" +", "");//去中间空格
    p_str=p_str.replaceAll("　+", "");//去全角中间空格
//     p_str=p_str.replaceAll("\\","");//烂java, 这个转不出来了。
    return p_str;
    }



    
     //导入班级数据
    public static String import_Class(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		//----------------------------------------------------	
//    		String delCourse="delete from class";
//    		DBInit.TSt.execute(delCourse);
    	//------------------------------------------------	
      		
      		int ClassID;
      		int ClassTypeID;
      		String ClassName="";
      		String ClassShortName="";
      		String Commission="";
      		int HeadTeacherID;
      		int RecruitNum;
      		String KaoChaStand="";
      		String XueZhi="";
      		int XueRi;
      		String BeginTime="";
      		String EndTime="";
      		int ClassroomID;
      		int BuildingID;
      		int RepastTypeID;
      		int Deposit;
      	    int IsArrangedDorm;
      	    String RepastStand="";
      	    String EducatStand="";
      	    String TeacherString="";
      	    String Remark="";
      	    int Enable;
      	    String ClassCode="";
      	    int isHistoryClass=1;//1历史0当前
      	    String endTime="";
      	    
      		String sql="select * from class";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		
      		
     		while(rs!=null&&rs.next()){
     			ClassID=rs.getInt("ClassID");
     			ClassTypeID=rs.getInt("ClassTypeID");
     			ClassName=rs.getString("ClassName");
     			ClassShortName=rs.getString("ClassShortName");
     			Commission=rs.getString("Commission");
     			HeadTeacherID=rs.getInt("HeadTeacherID");
     			RecruitNum=rs.getInt("RecruitNum");
     			KaoChaStand=rs.getString("KaoChaStand");
     			XueZhi=rs.getString("XueZhi");
     			XueRi=rs.getInt("XueRi");
     			BeginTime=rs.getString("BeginTime");
     			EndTime=rs.getString("EndTime");
     			ClassroomID=rs.getInt("ClassroomID");
     			BuildingID=rs.getInt("BuildingID");
     			RepastTypeID=rs.getInt("RepastTypeID");
     			Deposit=rs.getInt("Deposit");
     			IsArrangedDorm=rs.getInt("IsArrangedDorm");
     			RepastStand=rs.getString("RepastStand");
     			EducatStand=rs.getString("EducatStand");
     			TeacherString=rs.getString("TeacherString");
     			Remark=rs.getString("Remark");
     			Enable=rs.getInt("Enable");
     			ClassCode=rs.getString("ClassCode");
     		if(ClassCode==null){
     			ClassCode="";
     		}
     		if(EndTime.length()>4){
     			endTime=EndTime.substring(0,4);
     			System.out.println("=========================endTime:"+endTime);
     			if(endTime.equals("2007")){
     				isHistoryClass=0;
     			}     			
     		}
     		endTime="";
     			String insertSql="insert into class(ClassID,ClassTypeID,ClassName,ClassShortName,Commission,HeadTeacherID," +
     					        "RecruitNum,KaoChaStand,XueZhi,XueRi,BeginTime,EndTime,ClassroomID,BuildingID,RepastTypeID,Deposit," +
     					        "IsArrangedDorm,RepastStand,EducatStand,TeacherString,Remark,Enable,ClassCode,isHistoryClass,makeLinkBook,makeStuBook)values("+
     					         ClassID+","+ClassTypeID+",'"+ClassName+"','"+ClassShortName+"','"+Commission+"',"+HeadTeacherID+","+
  RecruitNum+",'"+KaoChaStand+"','"+XueZhi+"',"+XueRi+",'"+BeginTime+"','"+EndTime+"',"+ClassroomID+","+BuildingID+","+RepastTypeID+",'"+Deposit+"',"
             +IsArrangedDorm+",'"+RepastStand+"','"+EducatStand+"','"+TeacherString+"','"+Remark+"',"+Enable+",'"+ClassCode+"',"+isHistoryClass+",1,1)";
     			//System.out.println("======导入-insertSql:"+insertSql);  		    
     			boolean result=DBInit.TSt.execute(insertSql);	
     		    if(!result)count++;
      		}
     		DBInit.msg+="\n导入-表Class-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
      	}catch(Exception e){
      		System.out.println("======导入-表Class:"+e);
      	}
      
      	return DBInit.msg;
    } 
    
    //导入课题库数据
    public static String import_Subjects(){
    	ResultSet rs=null;
    	
    	try{
            String sql="select * from Coursestore";
            int CoursestoreID;
            int DepartmentID;
            String CoursestoreName="";
           	//----------------------------------------------------	
//    		String delCourse="delete from Subjects";
//    		DBInit.TSt.execute(delCourse);
    	//------------------------------------------------	
            rs=DBInit.SSt.executeQuery(sql);
            String insertSubjectsSql="";
            int countSuccess=0;
            
            while(rs!=null&&rs.next()){
            	CoursestoreID=rs.getInt("CoursestoreID");
            	DepartmentID=rs.getInt("DepartmentID");
            	CoursestoreName=rs.getString("CoursestoreName");
            	insertSubjectsSql="insert into Subjects(SubjectID,TeachingGroupID,SubjectName)values("+CoursestoreID+","+DepartmentID+",'"+CoursestoreName+"')";
               boolean result= DBInit.TSt.execute(insertSubjectsSql);
               if(!result){
               	countSuccess++;
               }
            }
            
            DBInit.msg+="\n导入-表Subjects-"+countSuccess+"条";	
     		System.out.println(DBInit.msg);
       	
       }catch(Exception e){
       	System.out.println("======导入-表Subjects:"+e);
       }
    	return DBInit.msg;
    }
     
//	导入书本
    public static String import_Textbook(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		int TextbookID;
      		String  Title="";
      		String Publisher="";
      		String Author="";
      		String PublishTime="";
      		double Price;
      		int State;
      		String TextbookType="";
      		int StockNum=0;
      	
      	    
      		String sql="select * from books";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		
      		
     		while(rs!=null&&rs.next()){
     			TextbookID=rs.getInt("bookID");
     			Title=rs.getString("name");
     			Publisher=rs.getString("author");
     			Author=rs.getString("publish");
     			PublishTime=rs.getString("publishTime");
     			String tempPrice = rs.getString("price");
     			if(tempPrice.endsWith("元")){
     				tempPrice =tempPrice.substring(0,tempPrice.length()-1);
     			}
     			Price=Double.parseDouble(tempPrice);
     			State =rs.getInt("enable");
     			TextbookType=rs.getString("type");
     			StockNum=rs.getInt("num");
     			
     		
     			String insertSql="insert into textbook (TextbookID,Title,Publisher,Author,PublishTime,Price," +
     					        "State,TextbookType,StockNum ) values ("+
     					       TextbookID+",'"+Title+"','"+Publisher+"','"+Author+"','"+PublishTime+"',"+Price+","+
     					      State+",'"+TextbookType+"',"+StockNum+")";
     			System.out.println("======导入-insertSql:"+insertSql);  		    
     			boolean result=DBInit.TSt.execute(insertSql);	
     		    count++;
      		}
     		DBInit.msg="\n导入-表Textbook-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
      	}catch(Exception e){
      		System.out.println("======导入-表Textbook:"+e);
      	}
      
      	return DBInit.msg;
    } 
    

    
    
//	导入住房记录
    public static String import_Housinglogs(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		int HousingLogsID;
      		int  HousingTypeID;
      		int UserID ;
      		int  RoomID ;
      		String BeginTime="";
      		String EndTime ="";
      		double PreCost;
      		double HousingCost;
      		double MeetingCost=0;
      		double TelecomCost=0;
      		double OtherCost=0;
      		double Worth=0;
      		double RealWorth=0;
      		int PayType=0;
      		String psbclassesid;
      		double IsCheckOut;
      		double Enable;
      		
      	
      	    
      		String sql="select * from Housinglogs";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		
      		
     		while(rs!=null&&rs.next()){
     			HousingLogsID=rs.getInt("HousingLogsID");
     			HousingTypeID=rs.getInt("HousingTypeID");
     			UserID=rs.getInt("UserID");
     			RoomID=rs.getInt("RoomID");
     			String tempBeginTime=rs.getString("BeginTime");
     			if(tempBeginTime == null){
     				tempBeginTime ="";
     			}
     			BeginTime = tempBeginTime;
     			String tempEndTime = rs.getString("EndTime");
     			if(tempEndTime == null){
     				tempEndTime ="";
     			}
     			EndTime = tempEndTime;
     			Worth=rs.getDouble("Worth");
     			psbclassesid =rs.getString("psbclassesid");
     			if(psbclassesid==null)psbclassesid="";
     			IsCheckOut=rs.getInt("IsCheckOut");
     			Enable=rs.getInt("Enable");
     			
     		
     			String insertSql="insert into Housinglogs (HousingLogsID,HousingTypeID,UserID,RoomID,BeginTime,EndTime," +
     					        "Worth,psbclassesid,IsCheckOut,Enable ) values (" +
     					        HousingLogsID+","+HousingTypeID+","+UserID+","+RoomID+",'"+BeginTime+"','"+EndTime+"',"+
     					        Worth+",'"+psbclassesid+"',"+IsCheckOut+","+Enable +")" ;
     			 		    
     			boolean result=DBInit.TSt.execute(insertSql);	
     		    count++;
      		}
     		DBInit.msg="\n导入-表Housinglogs-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
      	}catch(Exception e){
      		System.out.println("======导入-表Housinglogs:"+e);
      	}
      
      	return DBInit.msg;
    }
    
    
//	导入用户
    public static String import_Users(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		int UserID;
      		int  UserTypeID;
      		String  CardID  ="";
      		String   UserAccount ="" ;
      		String UserName="";
      		String Password ="888888";
      		int Enable=1;
      		
      	
      	    
      		String sql="select * from EOSOperator where operatorid  >15762";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		
      		
     		while(rs!=null&&rs.next()){
     			UserID=rs.getInt("operatorID");
     			UserName=rs.getString("operatorName");
     			if(UserName == null){
     				UserName = "";
     			}
     			Enable=rs.getInt("Status");
     			UserAccount = rs.getString("userID");
     			if(UserAccount == null){
     				UserAccount = "";
     			}
     			UserTypeID=rs.getInt("userTypeID");
     			CardID=rs.getString("CardID");
     			if(CardID == null){
     				CardID = "";
     			}
     			
     			
     			
     			String insertSql="insert into Users (UserID,UserTypeID,CardID,UserAccount,UserName," +
     					        "Password,Enable) values (" +
     					       UserID+","+UserTypeID+",'"+CardID+"','"+UserAccount+"','"+UserName+"','"+Password+"',"+
     					      Enable +")" ;
     			 		    
     			boolean result=DBInit.TSt.execute(insertSql);	
     		    count++;
      		}
     		DBInit.msg="\n导入-表Users-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
      	}catch(Exception e){
      		System.out.println("======导入-表Users:"+e);
      	}
      
      	return DBInit.msg;
    }
    
    
    
//	导入课室记录
    public static String import_Usingclassroomlogs(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		int UsingClassroomLogsID;
      		int  UsingTypeID;
      		int  RoomID ;
      		String UsingOrgan="" ;
      		String LinkMan="";
      		String LinkTel ="";
      		String Purpose="";
      		String UsingDate = "";
      		int UsingNoon;
      		double Worth;
      		double Refundment;
      		double PreWorth;
      		String CheckOutDate="";
      		int  Enable;
      		int UsingRecID;
      		int OtherUsingID;

      		
      	
      	    
      		String sql="select * from Usingclassroomlogs";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		
      		
     		while(rs!=null&&rs.next()){
     			UsingClassroomLogsID=rs.getInt("UsingClassroomLogsID");
     			UsingTypeID=rs.getInt("UsingTypeID");
     			RoomID=rs.getInt("RoomID");
     			UsingOrgan=rs.getString("UsingOrgan");
     			if(UsingOrgan==null){UsingOrgan="";}
     			LinkMan=rs.getString("LinkMan");
     			if(LinkMan==null){LinkMan="";}
     			LinkTel=rs.getString("LinkTel");
     			if(LinkTel==null){LinkTel="";}
     			Purpose = rs.getString("Purpose");
     			if(Purpose==null){Purpose="";}
     			UsingDate=rs.getString("UsingDate");
     			if(UsingDate==null){UsingDate="";}
     			UsingNoon =rs.getInt("UsingNoon");
     			Worth=rs.getDouble("Worth");
     			Refundment=rs.getDouble("Refundment");
     			PreWorth =rs.getDouble("PreWorth");
     			CheckOutDate =rs.getString("CheckOutDate");
     			if(CheckOutDate==null){CheckOutDate="";}
     			Enable =rs.getInt("Enable");
     			UsingRecID =rs.getInt("UsingRecID");
     			OtherUsingID =rs.getInt("OtherUsingID");
     		
     			
     		
     			String insertSql="insert into Usingclassroomlogs (UsingClassroomLogsID,UsingTypeID,RoomID,UsingOrgan,LinkMan,LinkTel," +
     					        "Purpose,UsingDate,UsingNoon,Worth,Refundment,PreWorth,CheckOutDate,"+
								"Enable,UsingRecID,OtherUsingID ) values ("+UsingClassroomLogsID+","+UsingTypeID+ "," +RoomID+",'"+UsingOrgan+"','"+LinkMan+"','"+LinkTel+"','"+
     					        Purpose+"','"+UsingDate+"',"+UsingNoon+","+Worth+","+Refundment+","+PreWorth+",'"+CheckOutDate+"',"+
								Enable+","+UsingRecID+","+OtherUsingID+" )" ;
     			System.out.println("======导入-insertSql:"+insertSql);  		    
     			boolean result=DBInit.TSt.execute(insertSql);	
     		    count++;
      		}
     		DBInit.msg="\n导入-表Usingclassroomlogs-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
      	}catch(Exception e){
      		System.out.println("======导入-表Usingclassroomlogs:"+e);
      	}
      
      	return DBInit.msg;
    }
    
//	导入课室出租交易记录
    public static String import_ClassroomBusinessRec(){      
    	  ResultSet rs=null;
      	int count=0;
      	
        	try{
        		int ID;
        		String  UsingOrgan="";
        		String  Purpose="" ;
        		String  LinkMan="" ;
        		String LinkTel="";
        		String PassPortName ="";
        		String PassPortNumber="";
        		double PreWorth;
        		double Worth;
        		int IsUsingAirConditioning;
        		String UsingDate="";
        		String CheckOutDate="";
        		String BookActionMan = "";
        		String CancelActionMan="";
        		double ReturnMoney=0;
        		String  CancelTime="";
        		String CheckOutMan="";
        		String SysBookTime="";
        		int Status;
        		double RealWorth;
        		double CutDownStd;
        		String AuthorizeMan = "";
        		
        	
        	    
        		String sql="select * from ClassroomBusinessRec";      		
        		rs=DBInit.SSt.executeQuery(sql);
        		
        		
       		while(rs!=null&&rs.next()){
       			ID=rs.getInt("ID");
       			UsingOrgan=rs.getString("UsingOrgan");
       			Purpose=rs.getString("Purpose");
       			if(Purpose==null){Purpose="";}
       			LinkMan=rs.getString("LinkMan");
       			if(LinkMan==null){LinkMan="";}
       			LinkTel=rs.getString("LinkTel");
       			if(LinkTel==null){LinkTel="";}
       			PassPortName=rs.getString("PassPortName");
       			if(PassPortName==null){PassPortName="";}
       			PassPortNumber = rs.getString("PassPortNumber");
       			if(PassPortNumber==null){PassPortNumber="";}
       			PreWorth=rs.getDouble("PreWorth");
       			Worth =rs.getDouble("Worth");
       			IsUsingAirConditioning=rs.getInt("IsUsingAirConditioning");
       			UsingDate=rs.getString("UsingDate");
       			if(UsingDate==null){UsingDate="";}
       			CheckOutDate =rs.getString("CheckOutDate");
       			if(CheckOutDate==null){CheckOutDate="";}
       			BookActionMan =rs.getString("BookActionMan");
       			if(BookActionMan==null){BookActionMan="";}
       			CancelActionMan =rs.getString("CancelActionMan");
       			if(CancelActionMan==null){CancelActionMan="";}
       			ReturnMoney =rs.getDouble("ReturnMoney");
       			CancelTime =rs.getString("CancelTime");
       			if(CancelTime==null){CancelTime="";}
       			CheckOutMan =rs.getString("CheckOutMan");
       			if(CheckOutMan==null){CheckOutMan="";}
       			SysBookTime =rs.getString("SysBookTime");
       			if(SysBookTime==null){SysBookTime="";}
       			Status =rs.getInt("Status");
       			RealWorth =rs.getDouble("RealWorth");
       			CutDownStd =rs.getDouble("CutDownStd");
       			AuthorizeMan =rs.getString("AuthorizeMan");
       			if(AuthorizeMan==null){AuthorizeMan="";}
       			
       		
       			String insertSql="insert into ClassroomBusinessRec(ID,UsingOrgan,Purpose,LinkMan,LinkTel,PassPortName," +
       					        "PassPortNumber,PreWorth,Worth,IsUsingAirConditioning,UsingDate,CheckOutDate,BookActionMan,"+
  								"CancelActionMan,ReturnMoney,CancelTime,CheckOutMan,SysBookTime,Status,RealWorth,CutDownStd,"+
  								"AuthorizeMan) values (" +
  								ID+",'"+UsingOrgan+"','"+Purpose+"','"+LinkMan+"','"+LinkTel+"','"+PassPortName+"','" +
  		     					        PassPortNumber+"',"+PreWorth+","+Worth+","+IsUsingAirConditioning+",'"+UsingDate+"','"+CheckOutDate+"','"+BookActionMan+"','"+
  										CancelActionMan+"',"+ReturnMoney+",'"+CancelTime+"','"+CheckOutMan+"','"+SysBookTime+"',"+Status+","+RealWorth+","+CutDownStd+",'"+
  										AuthorizeMan+"')" ;
       			System.out.println("======导入-insertSql:"+insertSql);  		    
       			boolean result=DBInit.TSt.execute(insertSql);	
       		    count++;
        		}
       		DBInit.msg="\n导入-表ClassroomBusinessRec-"+count+"条";	
       		System.out.println(DBInit.msg);
       		if(rs!=null)rs.close();
        	}catch(Exception e){
        		System.out.println("======导入-表ClassroomBusinessRec:"+e);
        	}
        
        	return DBInit.msg;
    }
    
//	导入录象资料登记表
    public static String import_VideoRegister(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		int RegisterID;
      		String  RecordTime = "";
      		String  Speaker = "" ;
      		String Title="" ;
      		String Org="";
      		String Post ="";
      		String Length ="";
      		String Recorder = "";
      		String DataType = "";
      		String DocumentNO = "";
      		int IsOk;
      		int PlanType;
      		int PlanID ;
      		String  Remarks = "";


      		
      	
      	    
      		String sql="select * from luxiang";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		
      		
     		while(rs!=null&&rs.next()){
     			RegisterID=rs.getInt("ID");
     			RecordTime=rs.getString("ClassDateTime");
     			if(RecordTime==null){RecordTime="";}
     			Speaker=rs.getString("TeacherString");
     			if(Speaker==null){Speaker="";}
     			Title=rs.getString("TelenetEduTitle");
     			if(Title==null){Title="";}
     			Org = rs.getString("TeacherDepartMent");
     			if(Org==null){Org="";}
     			Post=rs.getString("TeacherDuty");
     			if(Post==null){Post="";}
     			Length =rs.getString("DvTimeLong");
     			if(Length==null){Length="";}
     			Recorder =rs.getString("DutyMan");
     			if(Recorder==null){Recorder="";}
     			DataType =rs.getString("LuXiangType");
     			if(DataType==null){DataType="";}
     			DocumentNO =rs.getString("Archive");
     			if(DocumentNO==null){DocumentNO="";}
     			IsOk =rs.getInt("IsOK");
     			PlanType =1;
     			PlanID =rs.getInt("CourseID");
     			Remarks =rs.getString("Remark");
     			if(Remarks==null){Remarks="";}
     			
     		
     			String insertSql="insert into VideoRegister (RegisterID,RecordTime,Speaker,Title,Org,Post," +
     					        "Length,Recorder,DataType,DocumentNO,IsOk,PlanType,PlanID,"+
    							"Remarks ) values ("+RegisterID+",'"+RecordTime+ "','" +Speaker+"','"+Title+"','"+Org+"','"+Post+"','"+
    							Length+"','"+Recorder+"','"+DataType+"','"+DocumentNO+"',"+IsOk+","+PlanType+","+PlanID+",'"+
    							Remarks+"' )" ;
     			System.out.println("======导入-insertSql:"+insertSql);  		    
     			boolean result=DBInit.TSt.execute(insertSql);	
     		    count++;
      		}
     		DBInit.msg="\n导入-表VideoRegister-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
      	}catch(Exception e){
      		System.out.println("======导入-表VideoRegister:"+e);
      	}
      
      	return DBInit.msg;
    } 
    
    
//	导入远程教学
    public static String import_DistanceTeaching(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		int RecordID;
      		String  RecordDate = "";
      		String  RecordTime = "" ;
      		String RecordNoon ="" ;
      		String Channel ="";
      		String Class ="";
      		String CourseTitle ="";
      		String Teacher = "";
      		String TeacherOrg = "";
      		String TeacherPost = "";
      		String ClassRooms = "";
      		String Place = "";
      		int IsRecord ;
      		int IsLive ;
      		int IsPlay ;
      		String  Remarks = "";


      		
      	
      	    
      		String sql="select * from TelenetEdu";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		
      		
     		while(rs!=null&&rs.next()){
     			RecordID=rs.getInt("TelenetEduID");
     			String time =rs.getString("ClassDateTime");
     			if(time != null&& time !=""){
     				RecordDate  = time.substring(0,10);
     				RecordTime  = time.substring(11,16);
     				String tempTime = RecordTime.replace(':','.');
     				double tempNoon = Double.parseDouble(tempTime);
     				if(tempNoon<=8.30){
     					RecordNoon =1+"";
     				}else if (8.30<tempNoon && tempNoon<=19.30){
     					RecordNoon = 2 + "";
     				}else if( tempNoon>=19.30){
     					RecordNoon = 3 + "";
     				}
     				
     				}
     			

     			
     			Channel=rs.getString("TelenetEduType");
     			if(Channel==null){Channel="";}
     			Class = rs.getString("ClassName");
     			if(Class==null){Class="";}
     			CourseTitle=rs.getString("TelenetEduTitle");
     			if(CourseTitle==null){CourseTitle="";}
     			Teacher =rs.getString("TeacherString");
     			if(Teacher==null){Teacher="";}
     			TeacherOrg =rs.getString("TeacherDepartMent");
     			if(TeacherOrg==null){TeacherOrg="";}
     			TeacherPost =rs.getString("TeacherDuty");
     			if(TeacherPost==null){TeacherPost="";}
     			ClassRooms =rs.getString("site");
     			Place ="";
     			if(Place==null){Place="";}
     			IsRecord =rs.getInt("LuZi");
     			IsLive =rs.getInt("ZhiBo");
     			IsPlay =rs.getInt("FangYing");
     			Remarks =rs.getString("Remark");
     			if(Remarks==null){Remarks="";}
     			
     		
     			String insertSql="insert into distanceteaching (RecordID,RecordDate,RecordTime,RecordNoon,Channel,Class,CourseTitle," +
     					        "Teacher,TeacherOrg,TeacherPost,ClassRooms,Place,IsRecord,IsLive,"+
    							"IsPlay,Remarks ) values ("+RecordID+",'"+RecordDate+"','"+RecordTime+"','"+RecordNoon+"','"+Channel+"','"+Class+"','"+CourseTitle+"','"+
     					        Teacher+"','"+TeacherOrg+"','"+TeacherPost+"','"+ClassRooms+"','"+Place+"',"+IsRecord+","+IsLive+","+
    							IsPlay+",'"+Remarks +"')" ;
     			System.out.println("======导入-insertSql:"+insertSql);  		    
     			boolean result=DBInit.TSt.execute(insertSql);	
     		    count++;
      		}
     		DBInit.msg="\n导入-表distanceteaching-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
      	}catch(Exception e){
      		System.out.println("======导入-表distanceteaching:"+e);
      	}
      
      	return DBInit.msg;
    }  
    
    //导入卡库
    public static String import_Card(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select * from Card";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into Card (CardID,CardTypeID,InnerCardID,CardCoverNO,StateID,RegisterTime,CancelTime,Cost,TimeOfIssueCard,CardUsingTimes,CardLastSum,Remark)" +
      				"values(?,?,?,?,?,?,?,?,?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			/*
     			String insertSql="insert into Card (CardID,CardTypeID,InnerCardID,CardCoverNO,StateID,RegisterTime,CancelTime,Occupation,RegisteredPlace,ComingFromPlace,Certificate,CertificateNO)" +
  						"values("+rs.getInt("CardID")+","+rs.getInt("CardTypeID")+","+rs.getInt("InnerCardID")+",'"+rs.getString("CardCoverNO")+"',"+rs.getInt("StateID")+",'"+rs.getDate("RegisterTime")+"'," +
  						"'"+rs.getDate("CancelTime")+"',"+rs.getString("Occupation")+",'"+rs.getDate("RegisteredPlace")+"',"+rs.getString("ComingFromPlace")+","+rs.getObject("Certificate")+",'"+rs.getString("CertificateNO")+"')";
     			if(count==0)
     				System.out.println(insertSql);
     				System.out.println(rs.getBigDecimal("Occupation",2)+"    "+rs.getString("Occupation")+"    "+Float.valueOf(rs.getString("Occupation")));
     			*/
     		
     			pst.setInt(1,rs.getInt("CardID"));
     			pst.setInt(2,rs.getInt("CardTypeID"));
     			pst.setInt(3,rs.getInt("InnerCardID"));
     			pst.setString(4,rs.getString("CardCoverNO"));
     			pst.setInt(5,rs.getInt("StateID"));
     			pst.setTimestamp(6,rs.getTimestamp("RegisterTime"));
     			pst.setTimestamp(7,rs.getTimestamp("CancelTime"));
     			pst.setBigDecimal(8,rs.getBigDecimal("Cost"));
     			pst.setDate(9,rs.getDate("TimeOfIssueCard"));
     			pst.setString(10,rs.getString("CardUsingTimes"));
     			pst.setBigDecimal(11,rs.getBigDecimal("CardLastSum"));
     			pst.setString(12,rs.getString("Remark"));
     		
     			boolean result=pst.execute();	
     			
     			
     		    if(!result)count++;
      		}
     		DBInit.msg +="\n导入-表Card-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表Card:"+e);
      	}
      
      	return DBInit.msg;
    } 
    
//  导入宾客
    public static String import_Guest(){      
        ResultSet rs=null;
        ResultSet eosRs=null;
        Statement eosSt = null;
    	int count=0;
    	int eosCount=0;
      	try{
      		eosSt = DBInit.SCon.createStatement();
      		
      		String sql="select * from Guest";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into Guest (GuestID,GuestTypeID,GuestName,Sex,Age,OriginalPlace,WorkingOrgan,Occupation,RegisteredPlace,ComingFromPlace,Certificate,CertificateNO,Linkman,LinkTel)" +
      				"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
      		String eossql="insert into EOSOperator (isLocal,operatorID,operatorName,password,status,userID,userTypeID,cardID,operatorType ) Values(?,?,?,?,?,?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		PreparedStatement eospst = DBInit.TCon.prepareStatement(eossql);
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("GuestID"));
     			pst.setInt(2,rs.getInt("GuestTypeID"));
     			pst.setString(3,rs.getString("GuestName"));
     			pst.setInt(4,rs.getInt("Sex"));
     			pst.setString(5,rs.getString("Age"));
     			pst.setString(6,rs.getString("OriginalPlace"));
     			pst.setString(7,rs.getString("WorkingOrgan"));
     			pst.setString(8,rs.getString("Occupation"));
     			pst.setString(9,rs.getString("RegisteredPlace"));
     			pst.setString(10,rs.getString("ComingFromPlace"));
     			pst.setString(11,rs.getString("Certificate"));
     			pst.setString(12,rs.getString("CertificateNO"));
     			pst.setString(13,rs.getString("Linkman"));
     			pst.setString(14,rs.getString("LinkTel"));
     		
     			boolean result=pst.execute();	
     		    if(!result)count++;
     		    eosRs = eosSt.executeQuery("select * from Users where userID =" +rs.getInt("GuestID"));
     		    while(eosRs!=null&&eosRs.next()){
     		    	eospst.setString(1,"Y");
         			eospst.setString(2,eosRs.getString("UserID"));
         			eospst.setString(3,eosRs.getString("UserName"));
         			EOSCipherTool eosclipher = new EOSCipherTool();
         			String psw = eosRs.getString("Password");
         			if(psw!=null){
         				psw = eosclipher.encrypt(psw);
         				EOSDigestTool eosTool = new EOSDigestTool();
         				psw = eosTool.digest(psw);//再加密
         			}
         			eospst.setString(4,psw);
         			eospst.setBoolean(5,eosRs.getBoolean("Enable"));
         			String ua = eosRs.getString("UserAccount");
         			if (ua == null) ua = "";
         			eospst.setString(6,ua);
         			eospst.setString(7,eosRs.getString("UserTypeID"));
         			eospst.setString(8,eosRs.getString("CardID"));
         			eospst.setInt(9,2);
         			
         			result=eospst.execute();
         			if(!result) eosCount++;
     		    }
     		   
      		}
     		DBInit.msg +="\n导入-表Guest-"+count+"条;导入-表EOSOperator-"+eosCount+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		if(eosRs!=null)eosRs.close();
     		if(pst!=null) pst.close();
     		if(eospst!=null) eospst.close();
     		if(eosSt!=null)eosSt.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表Guest:"+e);
      	}
      
      	return DBInit.msg;
    } 
    
//  导入发卡机
    public static String import_POI(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select * from POI";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into POI (POIID,POIName,IP,ChargeDepartmentID)" +
      				"values(?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("POIID"));
     			pst.setString(2,rs.getString("POIName"));
     			pst.setString(3,rs.getString("IP"));
     			pst.setString(4,rs.getString("ChargeDepartmentID"));
     			
     		
     			boolean result=pst.execute();	
     		    if(!result)count++;
      		}
     		DBInit.msg +="\n导入-表POI-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表POI:"+e);
      	}
      
      	return DBInit.msg;
    } 
  
//  导入建筑
    public static String import_Building(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select * from Building";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into Building (BuildingID,BuildingName,LayerNum,RoomNum)" +
      				"values(?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("BuildingID"));
     			pst.setString(2,rs.getString("BuildingName"));
     			pst.setString(3,rs.getString("LayerNum"));
     			pst.setString(4,rs.getString("RoomNum"));
     			
     		
     			boolean result=pst.execute();	
     		    if(!result)count++;
      		}
     		DBInit.msg +="\n导入-表Building-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表Building:"+e);
      	}
      
      	return DBInit.msg;
    } 
    
//  导入房间管理
    public static String import_RoomManager(){      
    	ResultSet rs=null;
        ResultSet eosRs=null;
        Statement eosSt = null;
    	int count=0;
    	int eosCount=0;
      	try{
      		eosSt = DBInit.SCon.createStatement();
      		
      		String sql="select * from RoomManager";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into RoomManager (RoomManagerID,BuildingID,LayerNO,Cardholder,EndTime)" +
      				"values(?,?,?,?,?)";
      		String eossql="insert into EOSOperator (isLocal,operatorID,operatorName,password,status,userID,userTypeID,cardID,operatorType ) Values(?,?,?,?,?,?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		PreparedStatement eospst = DBInit.TCon.prepareStatement(eossql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("RoomManagerID"));
     			pst.setString(2,rs.getString("BuildingID"));
     			pst.setString(3,rs.getString("LayerNO"));
     			pst.setString(4,rs.getString("Cardholder"));
     			pst.setTimestamp(5,rs.getTimestamp("EndTime"));
     		
     			boolean result=pst.execute();	
     		    if(!result)count++;
     		    
     		   eosRs = eosSt.executeQuery("select * from Users where userID =" +rs.getInt("RoomManagerID"));
    		    while(eosRs!=null&&eosRs.next()){
    		    	eospst.setString(1,"Y");
        			eospst.setString(2,eosRs.getString("UserID"));
        			eospst.setString(3,eosRs.getString("UserName"));
        			EOSCipherTool eosclipher = new EOSCipherTool();
        			String psw = eosRs.getString("Password");
        			if(psw!=null){
        				psw = eosclipher.encrypt(psw);
        				EOSDigestTool eosTool = new EOSDigestTool();
        				psw = eosTool.digest(psw);//再加密
        			}
        			eospst.setString(4,psw);
        			eospst.setBoolean(5,eosRs.getBoolean("Enable"));
        			String ua = eosRs.getString("UserAccount");
        			if (ua == null) ua = "";
        			eospst.setString(6,ua);
        			eospst.setString(7,eosRs.getString("UserTypeID"));
        			eospst.setString(8,eosRs.getString("CardID"));
        			eospst.setInt(9,3);
        			
        			result=eospst.execute();
        			if(!result) eosCount++;
    		    }
      		}
     		DBInit.msg +="\n导入-表Guest-"+count+"条;导入-表EOSOperator-"+eosCount+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		if(eosRs!=null)eosRs.close();
     		if(pst!=null) pst.close();
     		if(eospst!=null) eospst.close();
     		if(eosSt!=null)eosSt.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表RoomManager:"+e);
      	}
      
      	return DBInit.msg;
    } 
    
//  导入交易记录
    public static String import_BusinessLogs(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select  * from BusinessLogs order by BusinessLogsID asc";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into BusinessLogs (BusinessLogsID,BusinessTypeID,HappeningTime,UserID,CardUsingTimes,BusinessMoney,Balance,POSID,OperatorIP,OperatorName,IsCheckOut,Invoiced,Enable,BackupData,CardCost)" +
      				"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("BusinessLogsID"));
     			pst.setString(2,rs.getString("BusinessTypeID"));
     			pst.setTimestamp(3,rs.getTimestamp("HappeningTime"));
     			pst.setString(4,rs.getString("UserID"));
     			pst.setString(5,rs.getString("CardUsingTimes"));
     			//System.out.println(rs.getFloat("BusinessMoney"));
     			//System.out.println(Float.valueOf("104.6").floatValue());
     			pst.setObject(6,rs.getObject("BusinessMoney"),java.sql.Types.DOUBLE,2);
     			//pst.setString(6,"104.6");
     			pst.setBigDecimal(7,rs.getBigDecimal("Balance",2));
     			pst.setString(8,rs.getString("POSID"));
     			pst.setString(9,rs.getString("OperatorIP"));
     			pst.setString(10,rs.getString("OperatorName"));
     			pst.setString(11,rs.getString("IsCheckOut"));
     			pst.setString(12,rs.getString("Invoiced"));
     			pst.setString(13,rs.getString("Enable"));
     			pst.setString(14,rs.getString("BackupData"));
     			pst.setString(15,rs.getString("CardCost"));
     		
     			boolean result=pst.execute();	
     		    if(!result)count++;
      		}
     		DBInit.msg +="\n导入-表BusinessLogs-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表BusinessLogs:"+e);
      	}
      
      	return DBInit.msg;
    } 
    
//  导入交易结算记录
    public static String import_BusinessLogsCollect(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select * from BusinessLogsCollect order by BusinessLogsCollectID asc";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into BusinessLogsCollect (BusinessLogsCollectID,ChargeDepartmentID,ClassID,BusinessTypeID,HappeningDate,BusinessMoney,CardCost,Operator,POSTypeID,Accountant,Cashier,IsCheckOut,CheckOutTime,Enable)" +
      				"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("BusinessLogsCollectID"));
     			pst.setString(2,rs.getString("ChargeDepartmentID"));
     			pst.setString(3,rs.getString("ClassID"));
     			pst.setString(4,rs.getString("BusinessTypeID"));
     			pst.setTimestamp(5,rs.getTimestamp("HappeningDate"));
     			pst.setFloat(6,rs.getFloat("BusinessMoney"));
     			pst.setString(7,rs.getString("CardCost"));
     			pst.setString(8,rs.getString("Operator"));
     			pst.setString(9,rs.getString("POSTypeID"));
     			pst.setString(10,rs.getString("Accountant"));
     			pst.setString(11,rs.getString("Cashier"));
     			pst.setString(12,rs.getString("IsCheckOut"));
     			pst.setTimestamp(13,rs.getTimestamp("CheckOutTime"));
     			pst.setString(14,rs.getString("Enable"));
     		
     			boolean result=pst.execute();	
     		    if(!result)count++;
      		}
     		DBInit.msg +="\n导入-表BusinessLogsCollect-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表BusinessLogsCollect:"+e);
      	}
      
      	return DBInit.msg;
    } 
    
//  导入发卡机
    public static String import_BusinessType(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select * from BusinessType";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into BusinessType (BusinessTypeID,BusinessType,IsCashBusiness)" +
      				"values(?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("BusinessTypeID"));
     			pst.setString(2,rs.getString("BusinessType"));
     			pst.setString(3,rs.getString("IsCashBusiness"));
     			
     			boolean result=pst.execute();	
     		    if(!result)count++;
      		}
     		DBInit.msg +="\n导入-表BusinessType-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表BusinessType:"+e);
      	}
      
      	return DBInit.msg;
    } 
//  导入学员考勤采集数据
    public static String import_StudentlaterLogs(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select * from StudentlaterLogs order by StudentlaterLogsId asc";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into StudentlaterLogs (StudentlaterLogsId,StudentId,checkTime,state,wubie,singleTime,CreatTime)" +
      				"values(?,?,?,?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("StudentlaterLogsId"));
     			pst.setInt(2,rs.getInt("StudentId"));
     			pst.setTimestamp(3,rs.getTimestamp("checkTime"));
     			pst.setInt(4,rs.getInt("state"));
     			pst.setInt(5,rs.getInt("wubie"));
     			pst.setInt(6,rs.getInt("singleTime"));
     			pst.setTimestamp(7,rs.getTimestamp("CreatTime"));
     			
     		
     			boolean result=pst.execute();	
     		    if(!result)count++;
      		}
     		DBInit.TSt.executeUpdate("update StudentlaterLogs set state=0 where state=1");
     		DBInit.TSt.executeUpdate("update StudentlaterLogs set state=1 where state=2");
     		DBInit.TSt.executeUpdate("update StudentlaterLogs set state=2 where state=3");
     		DBInit.TSt.executeUpdate("update StudentlaterLogs set wubie=3 where wubie=0");
     		DBInit.TSt.executeUpdate("update StudentlaterLogs set wubie=0 where wubie=1");
     		DBInit.TSt.executeUpdate("update StudentlaterLogs set wubie=1 where wubie=2");

     		
     		DBInit.msg +="\n导入-表BusinessLogsCollect-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表BusinessLogsCollect:"+e);
      	}
      
      	return DBInit.msg;
    } 
    
//  导入学员考勤刷卡记录
    public static String import_StudentkqData(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select * from StudentkqData";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into StudentkqData (studentkqDataid,realid,studentcount,studentidcol)" +
      				"values(?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("studentkqDataid"));
     			pst.setString(2,rs.getString("realid"));
     			pst.setString(3,rs.getString("studentcount"));
     			pst.setString(4,rs.getString("studentidcol"));
     			
     		
     			boolean result=pst.execute();	
     		    if(!result)count++;
      		}
     		DBInit.msg +="\n导入-表StudentkqData-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表StudentkqData:"+e);
      	}
      
      	return DBInit.msg;
    } 
    
//  导入文章
    public static String import_Thesis(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select t.*,u.UserID as TeacherID from Thesis t left join Users u on t.TeacherName = u.UserName ";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into Thesis (ThesisID,StudentID,ThesisTitle,ThesisContent,CommitTime,Score,TeacherName,GradeDate,Remark,ContentType,TeachingGroupID,Opinion,isGood,Summary,TeacherID)" +
      				"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("ThesisID"));
     			pst.setString(2,rs.getString("StudentID"));
     			pst.setString(3,rs.getString("ThesisTitle"));
     			pst.setBytes(4,rs.getBytes("ThesisContent"));
     			pst.setTimestamp(5,rs.getTimestamp("CommitTime"));
     			pst.setString(6,rs.getString("Score"));
     			pst.setString(7,rs.getString("TeacherName"));
     			pst.setTimestamp(8,rs.getTimestamp("GradeDate"));
     			pst.setString(9,rs.getString("Remark"));
     			pst.setString(10,rs.getString("ContentType"));
     			pst.setString(11,rs.getString("EducatingUnitID"));
     			pst.setString(12,rs.getString("Opinion"));
     			pst.setString(13,rs.getString("Good"));
     			pst.setString(14,rs.getString("Summary"));
     			pst.setString(15,rs.getString("TeacherID"));
     			boolean result=pst.execute();	
     		    if(!result)count++;
      		}
     		DBInit.msg +="\n导入-表Thesis-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表Thesis:"+e);
      		e.printStackTrace();
      	}
      
      	return DBInit.msg;
    } 
    
//  导入班组
    public static String import_Team(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select * from Team";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into Team (TeamID,TeamName,ClassID,RoomID)" +
      				"values(?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("TeamID"));
     			pst.setString(2,rs.getString("TeamName"));
     			pst.setString(3,rs.getString("ClassID"));
     			pst.setString(4,rs.getString("RoomID"));
     			
     		
     			boolean result=pst.execute();	
     		    if(!result)count++;
      		}
     		DBInit.msg +="\n导入-表Team-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表Team:"+e);
      	}
      
      	return DBInit.msg;
    } 
    
//  导入收费机
    public static String import_POS(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select * from POS ";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into POS (POSID,POSTypeID,IP,ChargeDepartmentID,LastUpdatingTime,LastCollectingTime,ShortName,Remark,FirstBeginTime,FirstEndTime,SecondBeginTime,SecondEndTime,ThirdBeginTime,ThirdEndTime," +
      				"FourthBeginTime,FourthEndTime,FifthBeginTime,FifthEndTime,ConsumeType,OneTimeConsumeMaxSum,AllowCardType,AllowSpecialCardType,FirstFixedSum,SecondFixedSum,ThirdFixedSum,FourthFixedSum,FifthFixedSum,OneDayConsumeMaxTimes1," +
      				"OneDayConsumeMaxSum1,Discount1,OneDayConsumeMaxTimes2,OneDayConsumeMaxSum2,Discount2,OneDayConsumeMaxTimes3,OneDayConsumeMaxSum3,Discount3,OneDayConsumeMaxTimes4,OneDayConsumeMaxSum4,Discount4,OneDayConsumeMaxTimes5," +
      				"OneDayConsumeMaxSum5,Discount5,OneDayConsumeMaxTimes6,OneDayConsumeMaxSum6,Discount6,OneDayConsumeMaxTimes7,OneDayConsumeMaxSum7,Discount7,Enable)" +
      				"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("POSID"));
     			pst.setString(2,rs.getString("POSTypeID"));
     			pst.setString(3,rs.getString("IP"));
     			pst.setString(4,rs.getString("ChargeDepartmentID"));
     			pst.setTimestamp(5,rs.getTimestamp("LastUpdatingTime"));
     			pst.setTimestamp(6,rs.getTimestamp("LastCollectingTime"));
     			pst.setString(7,rs.getString("ShortName"));
     			pst.setString(8,rs.getString("Remark"));
     			pst.setString(9,rs.getString("FirstBeginTime"));
     			pst.setString(10,rs.getString("FirstEndTime"));
     			pst.setString(11,rs.getString("SecondBeginTime"));
     			pst.setString(12,rs.getString("SecondEndTime"));
     			pst.setString(13,rs.getString("ThirdBeginTime"));
     			pst.setString(14,rs.getString("ThirdEndTime"));
     			pst.setString(15,rs.getString("FourthBeginTime"));
     			pst.setString(16,rs.getString("FourthEndTime"));
     			pst.setString(17,rs.getString("FifthBeginTime"));
     			pst.setString(18,rs.getString("FifthEndTime"));
     			pst.setString(19,rs.getString("ConsumeType"));
     			pst.setString(20,rs.getString("OneTimeConsumeMaxSum"));
     			pst.setString(21,rs.getString("AllowCardType"));
     			pst.setString(22,rs.getString("AllowSpecialCardType"));
     			pst.setString(23,rs.getString("FirstFixedSum"));
     			pst.setString(24,rs.getString("SecondFixedSum"));
     			pst.setString(25,rs.getString("ThirdFixedSum"));
     			pst.setString(26,rs.getString("FourthFixedSum"));
     			pst.setString(27,rs.getString("FifthFixedSum"));
     			pst.setString(28,rs.getString("OneDayConsumeMaxTimes1"));
     			pst.setString(29,rs.getString("OneDayConsumeMaxSum1"));
     			pst.setString(30,rs.getString("Discount1"));
     			pst.setString(31,rs.getString("OneDayConsumeMaxTimes2"));
     			pst.setString(32,rs.getString("OneDayConsumeMaxSum2"));
     			pst.setString(33,rs.getString("Discount2"));
     			pst.setString(34,rs.getString("OneDayConsumeMaxTimes3"));
     			pst.setString(35,rs.getString("OneDayConsumeMaxSum3"));
     			pst.setString(36,rs.getString("Discount3"));
     			pst.setString(37,rs.getString("OneDayConsumeMaxTimes4"));
     			pst.setString(38,rs.getString("OneDayConsumeMaxSum4"));
     			pst.setString(39,rs.getString("Discount4"));
     			pst.setString(40,rs.getString("OneDayConsumeMaxTimes5"));
     			pst.setString(41,rs.getString("OneDayConsumeMaxSum5"));
     			pst.setString(42,rs.getString("Discount5"));
     			pst.setString(43,rs.getString("OneDayConsumeMaxTimes6"));
     			pst.setString(44,rs.getString("OneDayConsumeMaxSum6"));
     			pst.setString(45,rs.getString("Discount6"));
     			pst.setString(46,rs.getString("OneDayConsumeMaxTimes7"));
     			pst.setString(47,rs.getString("OneDayConsumeMaxSum7"));
     			pst.setString(48,rs.getString("Discount7"));
     			pst.setString(49,rs.getString("Enable"));
     			
     			
     		
     			boolean result=pst.execute();	
     		    if(!result)count++;
      		}
     		DBInit.msg +="\n导入-表POS-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表POS:"+e);
      	}
      
      	return DBInit.msg;
    } 
    
//  导入销卡
    public static String import_DestroyCard(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select * from DestroyCard";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into DestroyCard (DestroyCardID,UserID,CardID,DestroyTime,ReasonID,CardLastSumCache,CardUsingTimesCache,IsReIssue,OperatorIP,OperatorName)" +
      				"values(?,?,?,?,?,?,?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("DestroyCardID"));
     			pst.setString(2,rs.getString("UserID"));
     			pst.setString(3,rs.getString("CardID"));
     			pst.setTimestamp(4,rs.getTimestamp("DestroyTime"));
     			pst.setString(5,rs.getString("ReasonID"));
     			pst.setBigDecimal(6,rs.getBigDecimal("CardLastSumCache",2));
     			pst.setString(7,rs.getString("CardUsingTimesCache"));
     			pst.setString(8,rs.getString("IsReIssue"));
     			pst.setString(9,rs.getString("OperatorIP"));
     			pst.setString(10,rs.getString("OperatorName"));
     			
     		
     			boolean result=pst.execute();	
     		    if(!result)count++;
      		}
     		DBInit.msg +="\n导入-表DestroyCard-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表DestroyCard:"+e);
      	}
      
      	return DBInit.msg;
    } 
//  导入监控器任务
    public static String import_MonitorTask(){      
        ResultSet rs=null;
    	int count=0;
    	
      	try{
      		
      		String sql="select * from MonitorTask order by MonitorTaskID asc";      		
      		rs=DBInit.SSt.executeQuery(sql);
      		String insertSql="insert into MonitorTask (MonitorTaskID,CreatedTime,OperatorIP,OperatorName,ExecuteTime,TaskTypeID,DeviceTypeID,DeviceID,Instant,RetryTimes,Finished,Result)" +
      				"values(?,?,?,?,?,?,?,?,?,?,?,?)";
      		PreparedStatement pst = DBInit.TCon.prepareStatement(insertSql);
      		
     		while(rs!=null&&rs.next()){
     			
     			pst.setInt(1,rs.getInt("MonitorTaskID"));
     			pst.setTimestamp(2,rs.getTimestamp("CreatedTime"));
     			pst.setString(3,rs.getString("OperatorIP"));
     			pst.setString(4,rs.getString("OperatorName"));
     			pst.setTimestamp(5,rs.getTimestamp("ExecuteTime"));
     			pst.setString(6,rs.getString("TaskTypeID"));
     			pst.setString(7,rs.getString("DeviceTypeID"));
     			pst.setString(8,rs.getString("DeviceID"));
     			pst.setString(9,rs.getString("Instant"));
     			pst.setString(10,rs.getString("RetryTimes"));
     			pst.setString(11,rs.getString("Finished"));
     			pst.setString(12,rs.getString("Result"));

     		
     			boolean result=pst.execute();	
     		    if(!result)count++;
      		}
     		DBInit.msg +="\n导入-表MonitorTask-"+count+"条";	
     		System.out.println(DBInit.msg);
     		if(rs!=null)rs.close();
     		
      	}catch(Exception e){
      		System.out.println("======导入-表MonitorTask:"+e);
      	}
      
      	return DBInit.msg;
    } 
       

//  导入学员数据
      public static String import_Student(){
      	PreparedStatement ps = null;
      	PreparedStatement pst = null;
          ResultSet rs=null;
      	int count=0;
      	int amount=0;
      	
        	try{
        		String sql="select a.StudentID,a.ClassID,a.TeamID,a.SeatNo,a.FolkID,a.DegreeID,a.StartWorkingTime,a.JoinPartyTime,a.WorkingOrgan,a.Duty," + 
  			           "a.OrganTel,a.HomeTel,a.MobileTel,a.DiplomaNO,a.RoomID,a.AbsenceTimes,a.AbsenceHowLong,a.TruantTimes,a.Photo,a.Photoid,a.Email,a.Remark,a.isCheck," + 
  					   "a.dutylevel,a.zhuanye,a.isleader,a.orderno,b.Sex,b.Birthdate,b.Firstchar,a.StudentBarbecue from Student a inner join Users b on b.UserID=a.StudentID where a.StudentID!=14582";
        		String insertsql="insert into Student (StudentID,ClassID,TeamID,SeatNo,FolkID,DegreeID,StartWorkingTime,JoinPartyTime," + 
  			                 "WorkingOrgan,Duty,OrganTel,HomeTel,MobileTel,DiplomaNO,RoomID,AbsenceTimes,AbsenceHowLong,TruantTimes,Photo," + 
  							 "Photoid,Email,Remark,isCheck,dutylevel,Major,isleader,orderno,Sex,Birthdate,Firstchar,Barcode) " +
  							 "Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        		String eossql="insert into EOSOperator Values(?,?,?,?,?,?,?,?,?)";
        		rs=DBInit.SSt.executeQuery(sql);
        		ps=DBInit.TCon.prepareStatement(insertsql);
        		pst=DBInit.TCon.prepareStatement(eossql);
        		
        		
       		while(rs!=null&&rs.next()){
       		    int sid = rs.getInt("StudentID");
       			ps.setInt(1,sid);
       			ps.setInt(2,rs.getInt("ClassID"));
       			ps.setInt(3,rs.getInt("TeamID"));
       			ps.setString(4,rs.getString("SeatNo"));
       			ps.setInt(5,rs.getInt("FolkID"));
       			ps.setInt(6,rs.getInt("DegreeID"));
       			ps.setString(7,rs.getString("StartWorkingTime"));
       			ps.setString(8,rs.getString("JoinPartyTime"));
       			ps.setString(9,rs.getString("WorkingOrgan"));
       			ps.setString(10,rs.getString("Duty"));
       			ps.setString(11,rs.getString("OrganTel"));
       			ps.setString(12,rs.getString("HomeTel"));
       			ps.setString(13,rs.getString("MobileTel"));
       			ps.setString(14,rs.getString("DiplomaNO"));
       			ps.setString(15,rs.getString("RoomID"));
       			ps.setInt(16,rs.getInt("AbsenceTimes"));
       			ps.setInt(17,rs.getInt("AbsenceHowLong"));
       			ps.setInt(18,rs.getInt("TruantTimes"));
       			ps.setBytes(19,rs.getBytes("Photo"));
        			ps.setString(20,rs.getString("Photoid"));
         			ps.setString(21,rs.getString("Email"));
       			ps.setString(22,rs.getString("Remark"));
       			ps.setString(23,rs.getString("isCheck"));
       			ps.setString(24,rs.getString("dutylevel"));
          		ps.setString(25,rs.getString("zhuanye"));
       			ps.setInt(26,rs.getInt("isleader"));
       			ps.setInt(27,rs.getInt("orderno"));
       			ps.setBoolean(28,rs.getBoolean("Sex"));
       			ps.setString(29,rs.getString("Birthdate"));
       			ps.setString(30,rs.getString("Firstchar"));
       			ps.setString(31,rs.getString("StudentBarbecue"));
       			int result=ps.executeUpdate();
       		    if(result>0)count++;
       		    
       		    Statement ost = DBInit.SCon.createStatement();
      		    String usersql="select UserID,UserName,Password,Enable,UserAccount,UserTypeID,CardID from Users where UserID=" + sid;
           		ResultSet users = ost.executeQuery(usersql);
           		while (users!=null&&users.next()) {
           			pst.setString(1,"Y");
           			String uid = users.getString("UserID");
           			String un = users.getString("UserName");
           			pst.setString(2,uid);
           			pst.setString(3,un);
           			EOSCipherTool eosclipher = new EOSCipherTool();
           			String temp = eosclipher.encrypt(users.getString("Password"));
           			EOSDigestTool eosTool = new EOSDigestTool();
           			String psw = eosTool.digest(temp);//再加密
           			pst.setString(4,psw);
           			pst.setBoolean(5,users.getBoolean("Enable"));
           			String ua = users.getString("UserAccount");
           			if (ua == null) ua = "";
           			pst.setString(6,ua);
           			pst.setString(7,users.getString("UserTypeID"));
           			pst.setString(8,users.getString("CardID"));
           			pst.setInt(9,1);
           			//String eosuser = "select * from EOSOperator where operatorName='"+un+"'";
           			//ResultSet eosrs = DBInit.TSt.executeQuery(eosuser);
           			//if (eosrs==null || !eosrs.next())
           			result=pst.executeUpdate();
           			if(result>0) {
           				amount++;
           				System.out.println("UserID-------------------" + ua + "---------------------------");
           			}
           			//if(eosrs!=null)eosrs.close();
           		}
           		if(users!=null)users.close();
        		}
       		DBInit.msg="\n导入-表Student-"+count+"条";	
       		System.out.println(DBInit.msg);
       		if(rs!=null)rs.close();
        	}catch(Exception e){
        		System.out.println("======导入-表Class:"+e);
        	}
        
        	return DBInit.msg;
      }
      
//    导入学员数据
      public static String import_StudentRev(){
      	 ResultSet rs=null;
     	int count=0;
     	
       	try{
       		int StudentID;
       		int  ClassID;
       		int  TeamID ;
       		int FolkID;
       		int DegreeID;
       		int RoomID;
       		int AbsenceTimes;
       		int TruantTimes;
       		
       		
       		
       	
       	    
       		String sql="select * from student where studentid  >15762";      		
       		rs=DBInit.SSt.executeQuery(sql);
       		
       		
      		while(rs!=null&&rs.next()){
      			StudentID=rs.getInt("StudentID");
      			ClassID=rs.getInt("ClassID");
      			TeamID=rs.getInt("TeamID");
      			FolkID=rs.getInt("FolkID");
      			DegreeID=rs.getInt("DegreeID");
      			RoomID=rs.getInt("RoomID");
      			AbsenceTimes=rs.getInt("AbsenceTimes");
      			TruantTimes=rs.getInt("TruantTimes");
      		
      			
      			
      			
      			String insertSql="insert into student (StudentID,ClassID,TeamID,FolkID,DegreeID," +
      					        "RoomID,AbsenceTimes,TruantTimes) values (" +
      					      StudentID+","+ClassID+","+TeamID+","+FolkID+","+DegreeID+","+RoomID+","+
      					    AbsenceTimes +","+TruantTimes+")" ;
      		//	 System.out.println("===="+insertSql);		    
      			boolean result=DBInit.TSt.execute(insertSql);	
      		    count++;
       		}
      		DBInit.msg="\n导入-表Student-"+count+"条";	
      		System.out.println(DBInit.msg);
      		if(rs!=null)rs.close();
       	}catch(Exception e){
       		System.out.println("======导入-表Student:"+e);
       	}
       
       	return DBInit.msg;
      }
      
      
//    导入班级数据
      public static String import_ClassRev(){
      	 ResultSet rs=null;
     	int count=0;
     	
       	try{
       		int StudentID;
       		int  ClassID;
       		int  TeamID ;
       		int FolkID;
       		int DegreeID;
       		int RoomID;
       		int AbsenceTimes;
       		int TruantTimes;
       		
       		
       		
       	
       	    
       		String sql="select * from student where studentid  >15762";      		
       		rs=DBInit.SSt.executeQuery(sql);
       		
       		
      		while(rs!=null&&rs.next()){
      			StudentID=rs.getInt("StudentID");
      			ClassID=rs.getInt("ClassID");
      			TeamID=rs.getInt("TeamID");
      			FolkID=rs.getInt("FolkID");
      			DegreeID=rs.getInt("DegreeID");
      			RoomID=rs.getInt("RoomID");
      			AbsenceTimes=rs.getInt("AbsenceTimes");
      			TruantTimes=rs.getInt("TruantTimes");
      		
      			
      			
      			
      			String insertSql="insert into Users (StudentID,ClassID,TeamID,FolkID,DegreeID," +
      					        "RoomID,AbsenceTimes,TruantTimes) values (" +
      					      StudentID+","+ClassID+","+TeamID+","+FolkID+","+DegreeID+","+RoomID+","+
      					    AbsenceTimes +","+TruantTimes+")" ;
      			 		    
      			boolean result=DBInit.TSt.execute(insertSql);	
      		    count++;
       		}
      		DBInit.msg="\n导入-表Student-"+count+"条";	
      		System.out.println(DBInit.msg);
      		if(rs!=null)rs.close();
       	}catch(Exception e){
       		System.out.println("======导入-表Student:"+e);
       	}
       
       	return DBInit.msg;
      }
      
      
//    导入教师数据
      public static String import_Teacher(){
      	PreparedStatement ps = null;
      	PreparedStatement pst = null;
          ResultSet rs=null;
          ResultSet idrs=null;
      	int count=0;
      	int amount=0;
      	
        	try{
        		String sql="select a.*,b.CardID,b.FirstChar,b.Sex,b.Birthdate,b.MobileTel from Teacher a left join Users b on a.TeacherID=b.UserID";
        		String insertsql="insert into Teacher (TeacherID,DepartmentID,TeacherTypeID,DutyTechnicalPost,IsRetire,Money,code,persition," + 
  			                 "Sex,Birthdate,Firstchar,MobileTel) Values(?,?,?,?,?,?,?,?,?,?,?,?)";
        		String eossql="insert into EOSOperator Values(?,?,?,?,?,?,?,?,?)";
        		rs=DBInit.SSt.executeQuery(sql);
        		ps=DBInit.TCon.prepareStatement(insertsql);
        		pst=DBInit.TCon.prepareStatement(eossql);
        		
       		while(rs!=null&&rs.next()){
       			int tid = rs.getInt("TeacherID");
       			ps.setInt(1,tid);
       			ps.setInt(2,rs.getInt("DepartmentID"));
       			ps.setInt(3,rs.getInt("TeacherTypeID"));
       			ps.setString(4,rs.getString("DutyTechnicalPost"));
       			ps.setString(5,rs.getString("IsRetire"));
       			System.out.println("money-----------" + Float.toString(rs.getFloat("Money")) + "------------------------");
       			ps.setBigDecimal(6,rs.getBigDecimal("Money",2));
       			ps.setString(7,rs.getString("code"));
       			ps.setString(8,rs.getString("persition"));
       			ps.setString(9,rs.getString("Sex"));
       			ps.setString(10,rs.getString("Birthdate"));
       			ps.setString(11,rs.getString("Firstchar"));
       			ps.setString(12,rs.getString("MobileTel"));
       			int result=ps.executeUpdate();
       		    if(result>0)count++;
       		    

       	    	Statement ost = DBInit.SCon.createStatement();
       		    String usersql="select UserID,UserName,Password,Enable,UserAccount,UserTypeID,CardID from Users where UserID=" + tid;
            		ResultSet users = ost.executeQuery(usersql);
            		while (users!=null&&users.next()) {
            			pst.setString(1,"Y");
            			String uid = users.getString("UserID");
            			String un = users.getString("UserName");
            			pst.setString(2,uid);
            			pst.setString(3,un);
            			EOSCipherTool eosclipher = new EOSCipherTool();
            			String temp = eosclipher.encrypt(users.getString("Password"));
            			EOSDigestTool eosTool = new EOSDigestTool();
            			String psw = eosTool.digest(temp);//再加密
            			pst.setString(4,psw);
            			pst.setBoolean(5,users.getBoolean("Enable"));
            			pst.setString(6,users.getString("UserAccount"));
            			pst.setString(7,users.getString("UserTypeID"));
            			pst.setString(8,users.getString("CardID"));
            			pst.setInt(9,0);
            			//String eosuser = "select * from EOSOperator where operatorName='"+un+"'";
            			//ResultSet eosrs = DBInit.TSt.executeQuery(eosuser);
            			//if (eosrs==null || !eosrs.next())
            			result=pst.executeUpdate();
            			if(result>0)amount++;
            			//if(eosrs!=null)eosrs.close();
            		}
            		if(users!=null)users.close();
        		}
       		DBInit.msg="\n导入-表Teacher-"+count+"条";
       		DBInit.msg="\n导入-表EOSOperator-"+amount+"条";
       		System.out.println(DBInit.msg);
       		if(rs!=null)rs.close();
       		if(ps!=null)ps.close();
        	}catch(Exception e){
        		System.out.println("======导入-表Teacher:"+e);
        	}
        
        	return DBInit.msg;
      }
    
    
    /**
     * 清除业务系统表数据
     * @return
     */
    public static String clearOpTable(){    	
    	String msgs = "";
    	int[] results;
    	
    	try{
    	for (int i=0;i<cleanTables.length;i++) {
        	String clearSql="delete from " + cleanTables[i];
        	TSt.addBatch(clearSql);
    	}
    	results = TSt.executeBatch();
    	
    	for (int i=0;i<results.length;i++) {
    		msgs = cleanTables[i] + "表清空了" + results[i] + "条记录。";
    		DBInit.msg = DBInit.msg + msgs;
    	    System.out.println(msgs);
    	}
    	
    	}catch(Exception e){
    		
    		System.out.println("===================clearTable:"+e);
    		
    	}
    	return DBInit.msg;
    }
    
    /**
     * 清除办公系统表数据
     * @return
     */
    public static String clearOaTable(){    	
    	String msgs = "";
    	int[] results;
    	String[] cleanOaTable = cleanOaTables.split(" ");
    	
    	try{
    	for (int i=0;i<cleanOaTable.length;i++) {
        	String clearSql="delete from " + cleanOaTable[i];
        	TSt.addBatch(clearSql);
    	}
    	results = TSt.executeBatch();
    	
    	for (int i=0;i<results.length;i++) {
    		msgs = cleanOaTable[i] + "表清空了" + results[i] + "条记录。\n";
    		DBInit.msg = DBInit.msg + msgs;
    	    System.out.println(msgs);
    	}
    	
    	}catch(Exception e){
    		
    		System.out.println("===================clearTable:"+e);
    		
    	}
    	return DBInit.msg;
    }
    
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName DBInit
	 * @bizlet_param passing="in_out" type="variable" value="sourceIp" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="sourceDBName" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="sourceUserName" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="sourceDBPsw" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="targetIp" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="targetDBName" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="targetUserName" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="targetDBPsw" name="" desc=""
	 * @bizlet_param passing="in_out" type="field" value="msg" name="" desc=""
	 */
	public static int BL_DBInit(Document doc, BizContext param) throws Exception{
		String tmp = "";
		String sourceIp = (String)param.getParaObjectAt(0);
		String sourceDBName = (String)param.getParaObjectAt(1);
		String sourceUserName = (String)param.getParaObjectAt(2);
		String sourceDBPsw = (String)param.getParaObjectAt(3);
		
		String targetIp = (String)param.getParaObjectAt(4);
		String targetDBName = (String)param.getParaObjectAt(5);
		String targetUserName = (String)param.getParaObjectAt(6);
		String targetDBPsw = (String)param.getParaObjectAt(7);
		String type = (String)param.getParaObjectAt(8);
		Node msg = (Node)param.getParaObjectAt(9);
		
		DBInit.initParameter(sourceIp,sourceDBName,sourceUserName,sourceDBPsw,targetIp,targetDBName,targetUserName,targetDBPsw);
		if ("clearOpTable".equals(type)) {
			//tmp = clearOpTable();
			if ("".equals(tmp)) tmp = "清除业务表数据成功！";
			XmlUtil.setNodeValue(msg,tmp);
		} else if ("clearOaTable".equals(type)) {
			tmp = clearOaTable();
			if ("".equals(tmp)) tmp = "清除办公系统表数据成功！";
			XmlUtil.setNodeValue(msg,tmp);
		} else if ("importAll".equals(type)) {
			//tmp = importAllTab();//导入所有数据
			if ("".equals(tmp)) tmp = "导入业务数据成功";
			XmlUtil.setNodeValue(msg,tmp);
		}
		//--- 杨帮添
		//import_Class();
		//import_TeachingPlan();
		//import_Course();
		//import_Subjects();
		//----金刚
		//import_Textbook();
		//import_Housinglogs();
		//import_ClassroomBusinessRec();
		//import_Usingclassroomlogs();
		//import_VideoRegister();
		//import_DistanceTeaching();
		//---- 陈绍栋
		//import_Card();
		//import_Guest();
		//import_POI();
		//import_Building();
		//import_RoomManager();
		//import_BusinessLogs();
		//import_BusinessLogsCollect();
		//import_BusinessType();
		//import_StudentlaterLogs();
		//import_StudentkqData();
		//import_Thesis();
		//import_Team();
		//import_POS();
		//import_DestroyCard();
		//import_MonitorTask();
		//--- 范志竞
		//import_Student();
		//import_Teacher();
		//System.out.println(DBInit.FormatS("ＡＢ ｅ   "));
		
		//import_Users();
		//import_Card();
		
		
		//import_StudentRev();
		return 1;
	}
}
