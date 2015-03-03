/*
 * 创建日期 2007-6-15
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import base.util.DBconnection;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class CourseLib {
	private static Connection con=null;
	private static Statement st=null;
	
	public static ArrayList queryCourse(){
		ArrayList list=new ArrayList();
		ResultSet rs=null;
		ResultSet rsSubject=null;
		
		try{	 
	     	DBconnection db = new DBconnection();
	     	CourseLib.con=db.getEOSConnection();
	     	CourseLib.st =CourseLib.con.createStatement();
	     	String sql="select c.CourseID,c.courseTitle,c.teachingGroupId,d.operatorName,e.orgName  from course c" +
 			          " left join EOSORG_T_Organization e on e.orgId=c.teachingGroupId"+
                      " left join EOSOperator d on d.operatorID =c.teachers"+
                      " where c.isAdopted=1 and c.courseId=(select top 1 courseId from course d where d.courseTitle=c.courseTitle)"+ 
                      " order by c.ClassDate desc";
	    
	     	String sqlSubject="SELECT c1.SubjectName, c1.TeachingGroupID, d.operatorName, e.orgName FROM Subjects c1 LEFT OUTER JOIN"+
                              " EOSORG_T_Organization e ON e.orgID = c1.TeachingGroupID LEFT OUTER JOIN"+
                              " EOSOperator d ON d.operatorID = c1.Teacher WHERE (c1.SubjectID =(SELECT TOP 1 c2.subjectId FROM subjects c2"+
                              " WHERE c1.subjectName = c2.subjectName)) order by SubjectID desc";
		 	rs=CourseLib.st.executeQuery(sql);
		 	CourseLib.st =CourseLib.con.createStatement();
		 	rsSubject=CourseLib.st.executeQuery(sqlSubject);
		 	
		 	
		 	String title="";
		 	int orgId=-1;
		 	String orgName="";
		 	String operatorName="";
		 	
	     	while(rs!=null&&rs.next()){
	     		Course c=new Course();
	     		title=rs.getString("courseTitle");
	     		orgId=rs.getInt("teachingGroupId");
	     		orgName=rs.getString("orgName");
	     		if(orgName==null||orgName.equals("null"))orgName="";
	     		if(operatorName==null||operatorName.equals("null")) operatorName="";
	     		c.setCourseTitle(title);
	     		c.setClassId(orgId);
	     		c.setRemarks(orgName);
	     		c.setOperatorname(operatorName);
	     		
	     		list.add(c);
	     	}
	     	
	     	while(rsSubject!=null&&rsSubject.next()){
	     		Course c=new Course();
	     		title=rsSubject.getString("subjectName");
	     		orgId=rsSubject.getInt("teachingGroupId");
	     		orgName=rsSubject.getString("orgName");
	     		if(orgName==null||orgName.equals("null"))orgName="";
	     		if(operatorName==null||operatorName.equals("null")) operatorName="";
	     		c.setCourseTitle(title);
	     		c.setClassId(orgId);
	     		c.setRemarks(orgName);
	     		c.setOperatorname(operatorName);
	     		list.add(c);
	     	}
	     	
	   	}catch(Exception e){
	   	 System.out.println("=========CourseLib============errors:"+e);	
	   	}finally{
	   	 try{
	   		if(CourseLib.con!=null)CourseLib.con.close();
	     	if(CourseLib.st!=null)CourseLib.st.close();	
	 	}catch(Exception e){
		   	 System.out.println("=========CourseLib============errors:"+e);	
	 	}
	   	}
	 
		
		return list;
	}
}
