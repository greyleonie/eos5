package talent.core;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.w3c.dom.*;

import base.util.DBconnection;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-6-22
 * @class_displayName CreatePlanVersion
 */

public class CreatePlanVersion {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_createPlanVersion
	 * @bizlet_param passing="in_out" type="variable" value="classId" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="userId" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="des" name="" desc=""
	 */
	public static int BL_createPlanVersion(Document doc, BizContext param)
		throws Exception {
		String classId = (String) param.getParaObjectAt(0);
		String userId = (String) param.getParaObjectAt(1);
		String des = (String) param.getParaObjectAt(2);
		init();
		createPlanVersion(classId,userId,des);
		closeCon();
		return 1;
	}
	
	
	private static Connection con=null;
	//private static Statement st=null;
	
   public  static void init(){
  
   	try{	 
     	DBconnection db = new DBconnection();
     	CreatePlanVersion.con=db.getEOSConnection();
     //	CreatePlanVersion.st =CreatePlanVersion.con.createStatement();
     
	 	
   	}catch(Exception e){
   	 System.out.println("=========createPlanVersion============errors:"+e);	
   	}
   }
   
   
   public static void closeCon(){//关闭连接
    try{
    	if(CreatePlanVersion.con!=null)CreatePlanVersion.con.close();
    	//if(CreatePlanVersion.st!=null)CreatePlanVersion.st.close();
    }catch(Exception e){
    	System.out.println("=========closeCon============errors:"+e);	
    }	
  }
	
	public static void createPlanVersion(String classId,String userId,String des){
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
     	Date today=new Date();
     	String currentDate="";
     	currentDate=sdf.format(today);
     	String version="v";
     	double parent=1.0;
     	String sqlCount="select count(classId) as num from TeachingPlanBu where classId="+classId;
     	ResultSet rs=null;
     	try{
     		Statement st1=CreatePlanVersion.con.createStatement();
     		rs=st1.executeQuery(sqlCount);
     		while(rs!=null&&rs.next()){
     		//	System.out.println("=========================================num:"+rs.getInt("num"));
     			parent+=rs.getInt("num");
     		}
     		if(st1!=null)st1.close();
     		version+=parent;
     		//System.out.println("=========================================version:"+version);
	 	String insertPlanSql="insert into TeachingPlanBu(planId,PlanName,ClassID,PlanType,StartTime,EndTime,Purpose,Arrange,Method,Implement,"+
                                " State,LeaderID,LeaderID2,Opinion,Approval,DateLine,ck,remark,isNews,creator,creatTime,version,descripte)"+
                                " (select  * ,'"+userId+"','"+currentDate+"','"+version+"','"+des+"' from TeachingPlan where classid="+classId+");";
      
	 	String insertUnitSql="insert into TeachingPlanUnitBu(UnitID,ClassID,PlanID,UnitName,UnitTitle,ScoringMethod,Department,"+
                             "Principal,BeginTime,EndTime,Demand,ClassHour,Credit,org,isNews,version)"+
                             " (select  * ,'"+version+"' from TeachingPlanUnit where classid="+classId+");";
     
        String insertCourseSql="insert into CourseBu(CourseID,UnitID,SpecialID,ClassID,CourseTitle,ClassDate,"+
                              "ClassTime,ClassNoon,ClassRoomID,ScoringMethod,IsOutClass,IsNew,IsMeldClass,"+
                              "Teachers,Tutors,Attenders,Outsider,OutSideOrg,OutSidePost,Compere,Conventioneers,"+
                              "TeahchingModelID,ClassModelID,IsUseKQJ,IsUseCourseWare,IsUseNotebookPC,IsTakeFeature,"+
                              "IsUseCamera,IsUseVideo,IsUseMediaPlayer,RadioPhones,WiredPhones,PlatformSeats,"+
                              "StudentSeats,Cups,IsUseTea,IsUseFlower,DeskArrange,Remarks,Approval,Opinion,"+
                              "IsSendNotice,Credit,ClassHour,IsAdopted,orgView,TeachingGroupID,isNews,version)"+
                              "(select  * ,'"+version+"' from Course where classid="+classId+");";
        //System.out.println("===============sql:"+insertPlanSql+insertUnitSql+insertCourseSql);
        Statement st2=CreatePlanVersion.con.createStatement();
        st2.execute(insertPlanSql+insertUnitSql+insertCourseSql);
        if(st2!=null)st2.close();
     	}catch(Exception e){
	  System.out.println("====createPlanVersion==========error:"+e);	
	}
	}

}