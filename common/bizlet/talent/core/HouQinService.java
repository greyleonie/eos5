/*
 * 创建日期 2007-5-23
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
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import base.util.DBconnection;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class HouQinService {

	private static Connection con=null;
	private static Statement st=null;
	
   public  static void init(){
  
   	try{	
     	DBconnection db = new DBconnection();
    	HouQinService.con=db.getEOSConnection();
    	HouQinService.st =HouQinService.con.createStatement();
    	
   	}catch(Exception e){
   	 System.out.println("=========HouQinService============errors:"+e);	
   	}
   }
   
   public static void closeCon(){//关闭连接
     try{
     	if(HouQinService.con!=null)HouQinService.con.close();
     	if(HouQinService.st!=null)HouQinService.st.close();
     }catch(Exception e){
     	System.out.println("=========closeCon============errors:"+e);	
     }	
   }
   
   public static void saveAllPlan(HttpServletRequest req,String classCondition,String start,String end){//查询课程
   	HouQinService.queryCourse(req,classCondition,start,end);
   }
   
   
   public static void queryCourse(HttpServletRequest req,String currentWeek,String start,String end){//查询班级的课程

	ResultSet courseResult=null;
	ArrayList allCourse=new ArrayList();
	ArrayList courses=new ArrayList();
	ArrayList singleDate=new ArrayList();
	String sql="";
	
	try{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date today=new Date();
		String date="";
		date=sdf.format(today);
		String monday=HouQinService.getWeek(date,"1");
		
	
//		sql="select c.*,r.roomName from course  c join room r on c.classRoomId=r.roomId where c.isAdopted=1 and    "+
//	    "(c.classDate between DATEADD(wk, DATEDIFF(wk,0,(getdate())), 0) and DATEADD(wk, DATEDIFF(wk,0,(getdate())),7))"+
//	     " order by c.classdate,c.classtime asc";
		System.out.println("==============currentWeek:"+currentWeek);
		sql="select c.*,r.roomName,DATEADD(wk, DATEDIFF(wk,0,('2007-05-28')),6) as en from course  c join room r on c.classRoomId=r.roomId where c.isAdopted=1 and    "+
	    "(c.classDate between '"+monday+"' and DATEADD(wk, DATEDIFF(wk,0,('"+monday+"')),6))"+
	     " order by c.classdate,c.classtime asc";
		
		if(currentWeek.equals("1")){
			req.setAttribute("start",monday);
			
		}
		//System.out.println("==========++====start:"+getMondayOfThisWeek());
		//System.out.println("==========++====end:"+getSundayOfThisWeek());
		
		
		if(currentWeek.equals("2")){//下一周的课程
//	    sql="select c.*,r.roomName from course  c join room r on c.classRoomId=r.roomId  where  c.isAdopted=1 and " +
//	   "   (c.classDate between  DATEADD(wk, DATEDIFF(wk,0,(DATEADD(wk, DATEDIFF(wk,0,(getdate())),0))),9) and  "+
//	   "DATEADD(wk, DATEDIFF(wk,0,(DATEADD(wk, DATEDIFF(wk,0,(getdate())),0))),13))"+
//	   " order by c.classdate,c.classtime asc";
		
		sql="select c.*,r.roomName from course  c join room r on c.classRoomId=r.roomId  where  c.isAdopted=1 and "+
           " (c.classDate between convert(varchar(10),dateadd(day,7-datepart(weekday,getdate())+2,getdate()),120) and "+
           " convert(varchar(10),dateadd(day,7-datepart(weekday,getdate())+8,getdate()),120)) order by c.classdate,c.classtime asc";
		
		req.setAttribute("start",HouQinService.getMondayOfNextWeek());
		req.setAttribute("en",HouQinService.getSundayOfNextWeek());
		} 
		if(currentWeek.equals("3")&&!start.equals("")&&!end.equals("")){//单独查询
			sql="select c.*,r.roomName from course  c join room r on c.classRoomId=r.roomId  where " +
					" c.isAdopted=1 and c.classDate between '"+start+"' and '"+end+"' order by c.classdate,c.classtime asc";
			req.setAttribute("start",start);
			req.setAttribute("en",end);
		}//System.out.println("===============sql:"+sql);
		
		
		courseResult=HouQinService.st.executeQuery(sql);
	
		int    courseId=-1;
		int    unitId=-1;
		int    specialId=-1;
		int    classId=-1;
		String title="";
		String classDate="";
		String classTime="";
		int    classNoon=-1;
		String  classRoom="";
		String teachers="";
		String tutors="";
		String attenders="";
		String outSider="";
		String compere="";
		String conventioneers="";
		int    ClassModelID=-1;
	
		int    platFormSeats=0;     //主席台座位数
		int    studentSeat=0;      //学员座位数
		int    cups=0;             //茶杯
		int    isUseTea=0;         //是否倒水
		int    isUseFlower=0;      //是否摆花
		int    count=0;
		String remarkClassTime="";
		String remarkClassDate="";	 
	    int    rowSpan=0;    //某个课程的rowspan
		HashMap hm=new HashMap();
	    int    countTimeRowspan=0;
	    int    position=0;
		
	    String  DeskArrange="";
		String  remarks="";
		String  st="";
		String  en="";
		
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
			
			if(classTime!=null&&classTime.length()>16){
				classTime=classTime.substring(11,16).trim();
			}
			
			DeskArrange=courseResult.getString("DeskArrange");
			classNoon=courseResult.getInt("ClassNoon");
			classRoom=courseResult.getString("roomName");
			remarks=courseResult.getString("remarks");
			if(remarks==null)remarks="";
			if(classRoom==null)classRoom="";
			if(DeskArrange==null)DeskArrange="";
			
			
			tutors=courseResult.getString("Tutors");
			attenders=courseResult.getString("Attenders");
			outSider=courseResult.getString("Outsider");
			compere=courseResult.getString("Compere");
			conventioneers=courseResult.getString("Conventioneers");
			ClassModelID=courseResult.getInt("ClassModelID");			
			
			platFormSeats=courseResult.getInt("PlatformSeats");		
			studentSeat=courseResult.getInt("StudentSeats");		
			cups=courseResult.getInt("Cups");	
			isUseTea=courseResult.getInt("IsUseTea");	
			isUseFlower=courseResult.getInt("IsUseFlower");	
			
			if(currentWeek.equals("1")){
			   en=courseResult.getString("en");	
			   req.setAttribute("en",getSundayOfThisWeek());
			   if(en!=null&&en.length()>9){
			  	  en=en.substring(0,10);	
			  	 // req.setAttribute("en",en);
			  	}
			}
			
			Course course=new Course(0);
			ArrayList services=new ArrayList();
			
			course.setCourseId(courseId);
			course.setUnitId(unitId);
			course.setSpecialId(specialId);
			course.setCourseTitle(title);
			course.setClassDate(classDate);
			course.setClassTime(classTime);
			course.setClassNoon(classNoon);
			course.setClassId(classId);
			course.setClassRoom(classRoom);
			course.setTeachers(teachers);
			course.setOutSider(outSider);
			course.setCompere(compere);
			course.setConventioneers(conventioneers);
			course.setClassModelId(ClassModelID);
		    course.setWeekDate(getWeek(classDate));//星期几
		    course.setNoonName(getNoonName(classNoon));//午别名称
		    course.setRemarks(remarks);
		    course.setDeskArrange(DeskArrange);
		    
		    if(platFormSeats>0)         {
		    	services.add("主席台座位"+platFormSeats+"个");  
		    	rowSpan++;		    	
		    	}
		    if(studentSeat>0)  {
		    	services.add("学员座位"+studentSeat+"个"); 
		    	rowSpan++;		    	
		    	}
		    if(cups>0)  {
		    	services.add("茶杯"+cups+"个");
		    	rowSpan++;		    	
		    	}
		    if(isUseTea>0)    {
		    	services.add("倒茶");  
		    	rowSpan++;		    	
		    	}
		    if(isUseFlower>0)      {
		    	services.add("摆花");
		    	rowSpan++;		    	
		    	}
		    
		   
		    
		    course.setRowSpan(rowSpan);//一个课程需要做的服务项目总数
		    course.setServices(services);
		    
		    
		   
		    
		
		    if(count==0){	
		    	remarkClassTime=classTime;//保存第一个时间
		    	position=0;
		     	countTimeRowspan=rowSpan;
		    	remarkClassDate=classDate;
		    }
		    
		    if(count>0){
		    	 if(classTime.equals(remarkClassTime)){		    	 	
		    	 	countTimeRowspan=countTimeRowspan+rowSpan;
		    	 }
		    	//  System.out.println("===classTime:"+classTime+"=====rowSpan:"+rowSpan+"==remarkClassTime:"+remarkClassTime+"=======countTimeRowspan:"+countTimeRowspan);
		          if(!classTime.equals(remarkClassTime)){//第2条记录后如果日期不一样了再记录
		          	remarkClassTime=classTime;//当前时间被记录		    	  
		          
		    	    Course prevCourse=new Course();
		    	  if(countTimeRowspan>0){
		    	    prevCourse=(Course)allCourse.get(position);
		    	  
		    	    prevCourse.setTimeRowSpan(countTimeRowspan);
		    	    position=count;
		    	  }
		    	    countTimeRowspan=rowSpan;
		          }
		     
		          
		        
		    }
		 	   
		   if(rowSpan>0){
		   	allCourse.add(course);	
		    count++;
		   }
		   
		    rowSpan=0;
		}//end while
		String courseDate="";
		String courseTime="";
		
		int    countCoruse=0;
		int    courseNum=0;
		
		boolean onlyOneDay=true;//是否只有一天
		String remarkTime="";
		String remarkDate="";
		
	if(allCourse!=null){
			countCoruse=allCourse.size();
			courseNum=countCoruse;
		}
	
		Course newCourse=new Course();
	  
	
	 for(int k=0;countCoruse>k;countCoruse--){//上面的代码可能解决不了最后一天午别计算的问题，以下是做最后一天午别计算的
			newCourse=(Course)allCourse.get(countCoruse-1);
			courseDate=newCourse.getClassDate();
			courseTime=newCourse.getClassTime();
		    rowSpan=newCourse.getRowSpan();    
	  if(courseNum==countCoruse){//记录最后课程的日期
			    remarkTime=newCourse.getClassTime();
			    remarkDate=newCourse.getClassDate();
			  
				
			}
	 if(remarkDate.equals(courseDate)&&courseTime.equals(remarkTime)){ 
	 	  countTimeRowspan+=rowSpan;
	 	}	
	 
		if(!courseTime.equals(remarkTime)&&remarkDate.equals(courseDate)){
			newCourse=(Course)allCourse.get(countCoruse);
			newCourse.setTimeRowSpan(countTimeRowspan);
			onlyOneDay=false;
			break;
		}
	
		}//end for
	 
	 if(onlyOneDay&&countCoruse>0){//整个allCourse解决只有一天的问题	
	 	newCourse=(Course)allCourse.get(0);
	 	newCourse.setTimeRowSpan(countTimeRowspan);
	 }
		
		if(courseResult!=null)courseResult.close();
		courses=allCourse;
		
		
		req.setAttribute("allCourse",allCourse);		
		req.setAttribute("courses",courses);
		
		
//		for(int m=0;m<allCourse.size();m++){
//			 Course course=(Course)allCourse.get(m);
//			 System.out.println("====data:"+course.getClassDate()+"=====time:"+course.getClassTime()+"======weekDate:"+course.getWeekDate()+"======noon:"+course.getClassNoon()+"==========timeRowSpan:"+course.getTimeRowSpan()+"====rowSpan:"+course.getRowSpan());
//		}
		
		
	}catch(Exception e){
		System.out.println("==HouQinService==queryCourse======error:"+e);	
		
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
		  Date date = HouQinService.strToDate(sdate);
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
		  Date date = HouQinService.strToDate(sdate);
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
    
    public static String getWeek(String sdate, String num) {
    	  // 再转换为时间
    	  Date dd = HouQinService.strToDate(sdate);
    	  Calendar c = Calendar.getInstance();
    	  c.setTime(dd);
    	  if (num.equals("1")) // 返回星期一所在的日期
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
    	  else if (num.equals("2")) // 返回星期二所在的日期
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);
    	  else if (num.equals("3")) // 返回星期三所在的日期
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);
    	  else if (num.equals("4")) // 返回星期四所在的日期
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);
    	  else if (num.equals("5")) // 返回星期五所在的日期
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
    	  else if (num.equals("6")) // 返回星期六所在的日期
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
    	  else if (num.equals("0")) // 返回星期日所在的日期
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
    	  return new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
    	 }
  
    
    public   static   String   getMondayOfThisWeek()   {   
        String   strTemp   =   "";   
        Calendar   c   =   Calendar.getInstance();   
        int   dayofweek   =   c.get(Calendar.DAY_OF_WEEK)   -   1;   
        if   (dayofweek   ==   0)   
                dayofweek   =   7;   
        c.add(Calendar.DATE,   -dayofweek   +   1);   
        strTemp   =   c.get(1)   +   "-";   
        if   (c.get(2)   +   1   <   10)   
                strTemp   +=   "0";   
        strTemp   =   strTemp   +   (c.get(2)   +   1)   +   "-";   
        if   (c.get(5)   <   10)   
                strTemp   +=   "0";   
        strTemp   +=   c.get(5);   
        return   strTemp;   
}
    
    public   static   String   getSundayOfThisWeek()   {   
        String   strTemp   =   "";   
        Calendar   c   =   Calendar.getInstance();   
        int   dayofweek   =   c.get(Calendar.DAY_OF_WEEK)   -   1;   
        if   (dayofweek   ==   0)   
                dayofweek   =   7;   
        c.add(Calendar.DATE,   -dayofweek   +   7);   
        strTemp   =   c.get(1)   +   "-";   
        if   (c.get(2)   +   1   <   10)   
                strTemp   +=   "0";   
        strTemp   =   strTemp   +   (c.get(2)   +   1)   +   "-";   
        if   (c.get(5)   <   10)   
                strTemp   +=   "0";   
        strTemp   +=   c.get(5);   
        return   strTemp;   
}
    
    public   static   String   getMondayOfNextWeek()   {   
        String   strTemp   =   "";   
        Calendar   c   =   Calendar.getInstance();   
        int   dayofweek   =   c.get(Calendar.DAY_OF_WEEK)   -   1;   
        if   (dayofweek   ==   0)   
                dayofweek   =   7;   
        c.add(Calendar.DATE,   -dayofweek   +   8);   
        strTemp   =   c.get(1)   +   "-";   
        if   (c.get(2)   +   1   <   10)   
                strTemp   +=   "0";   
        strTemp   =   strTemp   +   (c.get(2)   +   1)   +   "-";   
        if   (c.get(5)   <   10)   
                strTemp   +=   "0";   
        strTemp   +=   c.get(5);   
        return   strTemp;   
}   

/**   
  *   Get   the   date   of   sunday   in   this   week   
  *     
  *   @return   yyyy-MM-dd   
  */   
public   static   String   getSundayOfNextWeek()   {   
        String   strTemp   =   "";   
        Calendar   c   =   Calendar.getInstance();   
        int   dayofweek   =   c.get(Calendar.DAY_OF_WEEK)   -   1;   
        if   (dayofweek   ==   0)   
                dayofweek   =   7;   
        c.add(Calendar.DATE,   -dayofweek   +   14);   
        strTemp   =   c.get(1)   +   "-";   
        if   (c.get(2)   +   1   <   10)   
                strTemp   +=   "0";   
        strTemp   =   strTemp   +   (c.get(2)   +   1)   +   "-";   
        if   (c.get(5)   <   10)   
                strTemp   +=   "0";   
        strTemp   +=   c.get(5);   
        return   strTemp;   
}
}
