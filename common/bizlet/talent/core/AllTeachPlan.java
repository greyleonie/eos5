/*
 * 创建日期 2007-4-29
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;





import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.*;


import javax.servlet.http.HttpServletRequest;

import base.util.DBconnection;

/**
 * @author tim
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class AllTeachPlan {

	private static Connection con=null;
	private static Statement st=null;
	
   public  static void init(){
  
   	try{	 
     	DBconnection db = new DBconnection();
    	AllTeachPlan.con=db.getEOSConnection();
    	AllTeachPlan.st =AllTeachPlan.con.createStatement();
	 	
   	}catch(Exception e){
   	 System.out.println("=========AllTeachPlan============errors:"+e);	
   	}
   }
   
   public static void closeCon(){//关闭连接
     try{
     	if(AllTeachPlan.con!=null)AllTeachPlan.con.close();
     	if(AllTeachPlan.st!=null)AllTeachPlan.st.close();
     }catch(Exception e){
     	System.out.println("=========closeCon============errors:"+e);	
     }	
   }
   
   public static ArrayList queryTeacherByOrgIds(String ids){
     	ArrayList list=new ArrayList();
     	ResultSet rs=null;
     	String sql="select o.orgname,e.operatorName,e.operatorID from EOSORG_T_Organization o "+
                   "join Teacher t on o.orgid=t.departmentID join EOSOperator e on t.teacherID=e.operatorID " +
                   "where t.IsRetire=0 and "+ids+" order by o.orgId";
     	String orgName="";
     	String teacherName="";
     	String operatorId="";
     	try{
     		rs=AllTeachPlan.st.executeQuery(sql);
     		while(rs!=null&&rs.next()){
     			orgName=rs.getString("orgname");
     			teacherName=rs.getString("operatorName");
     			operatorId=rs.getString("operatorID");
     			
     			TeacherVo teacher=new TeacherVo();
     			teacher.setUserId(operatorId);
     			teacher.setUserName(teacherName);
     			teacher.setFirstChar(orgName);
     			
     			list.add(teacher);
     		}
     	}catch(Exception e){
     		System.out.println("=========queryTeacherByOrgIds============errors:"+e);		
     	}
     	return list;
   }
   
   public static void saveAllPlan(HttpServletRequest req,String classCondition,String beg,String end){//查询课程
   	AllTeachPlan.queryCourse(req,classCondition,beg,end);
   }
   
   public static  void saveSelectedClass(HttpServletRequest req,String isFirst,String ids){//查询班级
   
	ResultSet classResult=null;
	String    className="";
	String    begTimeEndTime="";
	String    classId="";
	String    classCondition="";
	ArrayList classList=new ArrayList();
	ArrayList arangeClass=new ArrayList();
	String    sql="";
	String idArray[]=ids.split(",");
	
	try{
   		 sql="select top 5 c.classId,c.ClassName,c.BeginTime,c.EndTime,c.ClassroomID,r.roomName from teachingplan t " + //默认的班级
  				" right join Class c  on c.classid=t.classid left join room r on replace(c.classRoomId,',','')=r.roomId where t.state=6 "+
				"and c.Enable=1 order by c.classId desc";
				
//   		 sql="select  c.classId,c.ClassName,c.BeginTime,c.EndTime,c.ClassroomID,r.roomName from teachingplan t " + //默认的班级
//			" right join Class c  on c.classid=t.classid left join room r on replace(c.classRoomId,',','')=r.roomId where t.state=6 "+
//	"and c.Enable=1  and  c.classid=5 or c.classid=17 or c.classid=4 or c.classid=142 or c.classid=141 order by c.classId desc";
   		
   	//	System.out.println("==============sql:"+sql);
   		//System.out.println("==============isFirst:"+isFirst+"============ids:"+ids);
   		if(isFirst.equals("1")&&ids!=null&&!ids.equals("")){
   			
   			 for(int k=0;k<idArray.length;k++){
   			 	if(classId.equals("")){
   			 	classId="c.classId="+idArray[k];
   			 	}else{
   			 		classId+=" or c.classId="+idArray[k];
   			 	}
   			 }
   		sql="select c.classId,c.ClassName,c.BeginTime,c.EndTime,c.ClassroomID ,r.roomName " +
		" from  Class c  left join room r on replace(c.classRoomId,',','')=r.roomId where "+classId+" ";//如果是选择班级后
   		//System.out.println("==============classId:"+classId);
   		}   		
   		
		classResult=AllTeachPlan.st.executeQuery(sql);
		String name="";
		String beg="";
		String end="";
		String id="";
		String roomName="";
	
		while(classResult!=null&&classResult.next()){
			id=(new Integer(classResult.getInt("classId"))).toString();
			name=classResult.getString("ClassName");
			beg=classResult.getString("BeginTime");
			end=classResult.getString("EndTime");
			ClassEnt clazz=new ClassEnt();
			clazz.setClassId(classResult.getInt("classId"));
			clazz.setClassName(name);
			roomName=classResult.getString("roomName");
			if(roomName==null)roomName="";
			clazz.setClassRoom(roomName);
			
			classList.add(clazz);
		
			if(beg==null){
				beg="";
			}
			if(end==null){
				end="";
			}
			
			if(classCondition.equals("")){
				classCondition="c.classId="+id;
			}else{
				classCondition+=" or c.classId="+id;	
			}
			
			if(className.equals("")){
				className=name;
			}else{
				className+=","+name;	
			}
			
			if(begTimeEndTime.equals("")){
				begTimeEndTime=beg+","+end;
			}else{
				begTimeEndTime+=","+beg+","+end;
			}
		}
		
if(isFirst.equals("1")&&ids!=null&&!ids.equals("")){//重新选择班级后，要排序
    	int theClassId=-1;
       for(int k=0;k<idArray.length;k++){
   
       
        if(idArray[k]==null){
        	idArray[k]="";
        	
        	}
        if(!idArray[k].equals("")){
        	theClassId=(new Integer(idArray[k])).intValue();
        }
         for(int p=0;p<classList.size();p++){
        	ClassEnt clazz=new ClassEnt();
        	clazz=(ClassEnt)classList.get(p);
    //   System.out.println("==========theClassId:"+theClassId+"==========id:"+clazz.getClassId());
        	if(clazz.getClassId()==theClassId){
        		arangeClass.add(clazz);
        	}
         	
        	}//end for 2
       }//end for 1
       classList=arangeClass;
    }//end if
    
    
   
    
	if(classResult!=null)classResult.close();
	
	String begEndTime[]=BeginTimeEndTime.sortDate(begTimeEndTime);
	req.setAttribute("className",className);	       //页面显示的班级名称
	
	req.setAttribute("classCondition",classCondition); //查询课程使用	
	req.setAttribute("classList",classList);
   
	if(begEndTime!=null){
		if(begEndTime[0].length()>10)begEndTime[0]=begEndTime[0].substring(0,10);
		req.setAttribute("begTime",begEndTime[0]);     //开始日期
		if(begEndTime[begEndTime.length-1].length()>10)
			begEndTime[begEndTime.length-1]=begEndTime[begEndTime.length-1].substring(0,10);
		
		req.setAttribute("endTime",begEndTime[begEndTime.length-1]);
		
	}else{
		req.setAttribute("begTime","");
		req.setAttribute("endTime","");
	}
	
	}catch(Exception e){
   	   System.out.println("==AllTeachPlan==saveSelectedClass======error:"+e);	
   	}
   }
   
   public static void queryCourse(HttpServletRequest req,String classCondition,String beg,String end){//查询班级的课程

	ResultSet courseResult=null;
	ArrayList allCourse=new ArrayList();
	ArrayList courses=new ArrayList();
	String timeCondition="";
	if(beg==null)beg="";
	if(end==null)end="";
	if(!beg.equals("")&&!end.equals("")){
		timeCondition=" and (c.classDate between '"+beg+"' and '"+end+"')";
	}
	if(!beg.equals("")&&end.equals("")){
		timeCondition=" and (c.classDate >'"+beg+"')";
	}
	if(beg.equals("")&&!end.equals("")){
		timeCondition=" and (c.classDate <'"+end+"')";
	}
	try{
		String sql="select c.CourseID,c.UnitID,c.SpecialID,c.classId,c.CourseTitle,c.ClassDate,c.ClassTime,c.ClassNoon,c.ClassRoomID,"+
                   "c.Tutors,c.Attenders,c.Outsider,c.Compere,c.Conventioneers,c.ClassModelID,e.operatorName "+
                   "from course c left join EOSOperator e on e.operatorID=c.teachers  where c.isAdopted=1 and  ("+classCondition+") "+timeCondition+" order by c.classDate,c.classNoon asc";
	//System.out.println("================sql:"+sql);
	

		courseResult=AllTeachPlan.st.executeQuery(sql);
		int    courseId=-1;
		int    unitId=-1;
		int    specialId=-1;
		int    classId=-1;
		String title="";
		String classDate="";
		String classTime="";
		int    classNoon=-1;
		int    remarkCourseNoon=0;//记录课程午别，用来判断是否累加
		String  classRoom="";
		String teachers="";
		String tutors="";
		String attenders="";
		String outSider="";
		String compere="";
		String conventioneers="";
		int    ClassModelID=-1;
		int    count=0;
		String remarkClassDate="";
		int   remarkWeekIndex=-1;
		int   countWeek=0;//
		int   countNoon=0;//计算一天午别数量		
		int   position=-1;  //某个课程在list中的索引
		int   weekIndex=0;//自定义的周索引，0，1，2....
		
		
		
		while(courseResult!=null&&courseResult.next()){
			courseId=courseResult.getInt("CourseID");
			unitId=courseResult.getInt("UnitID");
			specialId=courseResult.getInt("SpecialID");
			classId=courseResult.getInt("classId");
			title=courseResult.getString("CourseTitle");
			classDate=courseResult.getString("ClassDate");
			classDate=classDate.substring(0,10).trim();
			if(classDate!=null)classDate=classDate.trim();
			if(title==null)title="";
			classTime=courseResult.getString("ClassTime");
			classNoon=courseResult.getInt("ClassNoon");
			
			teachers=courseResult.getString("operatorName");
			tutors=courseResult.getString("Tutors");
			attenders=courseResult.getString("Attenders");
			outSider=courseResult.getString("Outsider");
			compere=courseResult.getString("Compere");
			conventioneers=courseResult.getString("Conventioneers");
			ClassModelID=courseResult.getInt("ClassModelID");			
			Course course=new Course(0);
			
			course.setCourseId(courseId);
			course.setUnitId(unitId);
			course.setSpecialId(specialId);
			course.setCourseTitle(title);
			course.setClassDate(classDate);
			course.setClassTime(classTime);
			course.setClassNoon(classNoon);
			course.setClassId(classId);
			
			course.setTeachers(teachers);
			course.setOutSider(outSider);
			course.setCompere(compere);
			course.setConventioneers(conventioneers);
			course.setClassModelId(ClassModelID);
		    course.setWeekDate(getWeek(classDate));//星期几
		    course.setNoonName(getNoonName(classNoon));//午别名称
		    course.setWeekIndex(weekIndex);
		  
		    
		 //  System.out.println("======countNoon:"+countNoon+"=============curDate:"+classDate);
		    if(count==0){	
		    	remarkWeekIndex=getWeekIndex(classDate);//通过日期取得星期索引
		    	remarkCourseNoon=classNoon;
		    	position=0;
		    	remarkClassDate=classDate;//保存第一个日期		    	
		 
		    
		      countNoon++;
		    }
		    
		    if(count>0){
		     if(classDate.trim().equals(remarkClassDate.trim())&&remarkCourseNoon!=classNoon){//当前午别和上次记录午别不一样
		        countNoon++;	
		         remarkCourseNoon=classNoon;
		        
		          	
		     }
		   
		 
		    }
		    
		    
		
		    if(getWeekIndex(classDate)<remarkWeekIndex){//当前日期的星期和上一记录的星期相比，如果小了，则是下一周了
	    		weekIndex++;	    		
	    	}
		    course.setWeekIndex(weekIndex);//设置周的索引
		    remarkWeekIndex=getWeekIndex(classDate);
		    
		 
		    if(count>0){
		          if(!classDate.equals(remarkClassDate)){//第2条记录后如果日期不一样了再记录
		    		
		    		countWeek++;
		    	    remarkClassDate=classDate;//当前日期被记录
		    	   
		    	    
		    	     Course privCourse=new Course();
		    	     privCourse=(Course)allCourse.get(position);//更新rowspan
		    	     privCourse.setRowSpan(countNoon);
		     //   System.out.println("========privDate:"+privCourse.getClassDate()+"=======classDate:"+classDate+"=======countNoon:"+countNoon); 
		    		 countNoon=1;
		    		 remarkCourseNoon=classNoon;
		    		 position=count;		    	
		    		
		    	}
		    }
		 	   
		   
			allCourse.add(course);	
		    count++;
		}//end while
		
		String courseDate="";
		int    noonNum=0;
		int    courseNum=0;
		int    countCoruse=0;
		int    firstNoon=0;
		int    curNoon=0;
		boolean onlyOneDay=true;//是否只有一天
		
		
	if(allCourse!=null){
			countCoruse=allCourse.size();
			courseNum=countCoruse;
		}
	
		Course newCourse=new Course();
	    String remarkDate="";
	
	 for(int k=0;countCoruse>k;countCoruse--){//上面的代码可能解决不了最后一天午别计算的问题，以下是做最后一天午别计算的
			newCourse=(Course)allCourse.get(countCoruse-1);
			newCourse.getClassNoon();
			courseDate=newCourse.getClassDate();
		if(courseNum==countCoruse){//记录最后课程的日期
				remarkDate=newCourse.getClassDate();
				curNoon=newCourse.getClassNoon();
				noonNum=1;
			}
		
		if(!courseDate.equals(remarkDate)){
			newCourse=(Course)allCourse.get(countCoruse);
			newCourse.setRowSpan(noonNum);
			onlyOneDay=false;
			break;
		}
	 if(firstNoon!=curNoon){
		  noonNum++;
		  firstNoon=curNoon;
		 }
		}//end for
	 
	 if(onlyOneDay){//整个allCourse解决只有一天的问题
	 //	System.out.println("=========onlyOneDay:"+onlyOneDay+"=========noonNum:"+noonNum);
	 	newCourse=(Course)allCourse.get(0);
	 	newCourse.setRowSpan(noonNum);
	 }
		
		if(courseResult!=null)courseResult.close();
		courses=allCourse;
		
		
		req.setAttribute("allCourse",allCourse);		
		req.setAttribute("courses",courses);
		req.setAttribute("countWeek",(new Integer(weekIndex+1)));//总的周数量
		
//		for(int m=0;m<allCourse.size();m++){
//			 Course course=(Course)allCourse.get(m);
//			 System.out.println("=========time:"+course.getClassDate()+"======weekDate:"+course.getWeekDate()+"======noon:"+course.getClassNoon()+"=========rowSpan:"+course.getRowSpan()+"=====weekIndex:"+course.getWeekIndex());
//		}
		
		
	}catch(Exception e){
		System.out.println("==AllTeachPlan==queryCourse======error:"+e);	
	}
   }
   
   public static String getNoonName(int noon){
      String noonName="";
      if(noon==0){
      	 noonName="上午";
      }else if(noon==1){
      	 noonName="下午";
      }else if(noon==2){
     	 noonName="晚上";
      }else if(noon==3){
     	 noonName="全天";
      }
      return noonName;
   }
   
	public static String getWeek(String sdate) { // 再转换为时间		 
		  Date date = AllTeachPlan.strToDate(sdate);
		  Calendar c = Calendar.getInstance();
		  c.setTime(date);
		  // int hour=c.get(Calendar.DAY_OF_WEEK);
		  // hour中存的就是星期几了，其范围 1~7
		  // 1=星期日 7=星期六，其他类推
		
		 String fullName=new SimpleDateFormat("EEEE").format(c.getTime());
		 fullName=fullName.substring(2,3);
		  return fullName;
		 }
	
	public static Date strToDate(String strDate) {
	 	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	 	  ParsePosition pos = new ParsePosition(0);
	 	  Date strtodate = formatter.parse(strDate, pos);
	 	  return strtodate;
	 	 }
    public static int getWeekIndex(String sdate){//取星期的索引
  	 
  	      int index=0;
		  Date date = AllTeachPlan.strToDate(sdate);
		  Calendar c = Calendar.getInstance();
		  c.setTime(date);
		  String fullName=new SimpleDateFormat("EEEE").format(c.getTime());
		  if(fullName.equals("星期日")){
		  	index=0;
		  }else if(fullName.equals("星期一")){
			index=1;
		  }
		  else if(fullName.equals("星期二")){
		  	index=2;
		  }
		  else if(fullName.equals("星期三")){
		  	index=3;
		  }
		  else if(fullName.equals("星期四")){
		  	index=4;
		  }
		  else if(fullName.equals("星期五")){
		  	index=5;
		  }
		  else if(fullName.equals("星期六")){
		  	index=6;
		  }
		 
		  return index;
		
  }
    
    
  public static ArrayList  returnClassList(HttpServletRequest request){
  	ArrayList classList=new ArrayList();
    String sql="select c.classId,c.className,c.isHistoryClass,t.state from class c join teachingplan t on c.classid=t.classid " +
    		   "where c.enable=1 and t.state=6 order by c.classid desc";
	ResultSet courseResult=null;
	
    try{
    	courseResult=AllTeachPlan.st.executeQuery(sql);
    	
    while(courseResult!=null&&courseResult.next()){
    	ClassEnt clzz=new ClassEnt();
    	clzz.setClassId(courseResult.getInt("classId"));
    	clzz.setClassName(courseResult.getString("className"));
    	clzz.setState(courseResult.getString("state"));
    	clzz.setIsHistoryClass(courseResult.getInt("isHistoryClass"));
    	classList.add(clzz);
    	}
    request.setAttribute("classList",classList);
    }catch(Exception e){
      System.out.println("======returnClassList=============errors:"+e);	
    }
    
   return classList; 
   
  }  
    
   public static void main(String args[]){
   	
   }
}
