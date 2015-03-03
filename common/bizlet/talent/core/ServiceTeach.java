/*
 * 创建日期 2007-5-18
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
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import base.util.DBconnection;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class ServiceTeach {

	private static Connection con=null;
	private static Statement st=null;
	
   public  static void init(){
  
   	try{	
     	DBconnection db = new DBconnection();
    	ServiceTeach.con=db.getEOSConnection();
    	ServiceTeach.st =ServiceTeach.con.createStatement();
    	
   	}catch(Exception e){
   	 System.out.println("=========ServiceTeach============errors:"+e);	
   	}
   }
   
   public static void closeCon(){//关闭连接
     try{
     	if(ServiceTeach.con!=null)ServiceTeach.con.close();
     	if(ServiceTeach.st!=null)ServiceTeach.st.close();
     }catch(Exception e){
     	System.out.println("=========closeCon============errors:"+e);	
     }	
   }
   
   public static void saveAllPlan(HttpServletRequest req,String classCondition,String start,String end){//查询课程
   	ServiceTeach.queryCourse(req,classCondition,start,end);
   }
   
   
   public static void queryCourse(HttpServletRequest req,String currentWeek,String start,String end){//查询班级的课程

	ResultSet courseResult=null;
	ArrayList allCourse=new ArrayList();
	ArrayList courses=new ArrayList();
	ArrayList singleDate=new ArrayList();
	ArrayList hasTaskCourse=new ArrayList();
	String sql="";
	
	try{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date today=new Date();
		String date="";
		date=sdf.format(today);
		String monday=ServiceTeach.getWeek(date,"1");
		
	
	  
		sql="select cl.className,c.*,r.roomId,r.roomName,DATEADD(wk, DATEDIFF(wk,0,('"+monday+"')),6) as en from class cl join course  c on cl.classId=c.classId join room r on c.classRoomId=r.roomId where c.isAdopted=1 and    "+
	    "(c.classDate between '"+monday+"' and DATEADD(wk, DATEDIFF(wk,0,('"+monday+"')),6))"+
	     " order by c.classdate,c.classtime,c.classRoomId asc";
		
		if(currentWeek.equals("1")){
			req.setAttribute("start",monday);
		}
		if(currentWeek.equals("2")){//下一周的课程

		
		sql="select cl.className,c.*,r.roomId,r.roomName, convert(varchar(10),dateadd(day,7-datepart(weekday,getdate())+2,getdate()),120) as start,"+
"convert(varchar(10),dateadd(day,7-datepart(weekday,getdate())+8,getdate()),120) as en from class cl join course  c on cl.classId=c.classId join room r on c.classRoomId=r.roomId  where  c.isAdopted=1 and "+
           " (c.classDate between convert(varchar(10),dateadd(day,7-datepart(weekday,getdate())+2,getdate()),120) and "+
           " convert(varchar(10),dateadd(day,7-datepart(weekday,getdate())+8,getdate()),120)) order by c.classdate,c.classtime,c.classRoomId asc";
		} 
		if(currentWeek.equals("3")&&!start.equals("")&&!end.equals("")){//单独查询
			sql="select cl.className,c.*,r.roomId,r.roomName from class cl join course  c on cl.classId=c.classId join room r on c.classRoomId=r.roomId  where " +
					" c.isAdopted=1 and c.classDate between '"+start+"' and '"+end+"' order by c.classdate,c.classtime, c.classRoomId asc";
		}System.out.println("===============sql:"+sql);
		
		
		courseResult=ServiceTeach.st.executeQuery(sql);
	
		int    courseId=-1;
		int    unitId=-1;
		int    specialId=-1;
		int    classId=-1;
		String className="";
		String title="";
		String classDate="";
		String classTime="";
		int    classNoon=-1;
		int    classRoomId=-1;
		String  classRoom="";
		String teachers="";
		String tutors="";
		String attenders="";
		String outSider="";
		String compere="";
		String conventioneers="";
	    //int    isMeldClass=0;     //是否合班上课
		int    ClassModelID=-1;
		int    IsUseKQJ=0;        //是否考勤
		int    IsUseCourseWare=0; //是否使用课件
		int    IsUseNotebookPC=0; //是否使用手提电脑
		int    IsTakeFeature=0;   //是否拍花絮
		int    IsUseCamera=0;     //是否使用数码相机
		int    IsUseVideo=0;      //是否全程摄像
		int    IsUseMediaPlayer=0;//是否使用媒体播放
		int    RadioPhones=0;     //无线话筒个数
		int    WiredPhones=0;     //有线话筒个数
		
		int    count=0;
		String remarkClassTime="";
		String remarkClassDate="";
	
	    int    rowSpan=0;         //某个课程的rowspan
		HashMap hm=new HashMap();
	    int    countTimeRowspan=0;
	    int    position=0;
		String remarkMeldClassTime="";   //记录合班上课的时间
		int    remarkClassRoomId=-1;//记录合班上课的地点
		boolean firstMeldClass=true;  //是否第一个合班上课的课程
		int    countTask=0;            //计算同一个时间内其他合班上课要做的任务
		String appendClassName="";     //把其他合班的班名连接起来
		boolean isRemoveCourse=false;//是否剔除课程
		boolean isAddCourse=true;    //是否要把课程添加到集合
		boolean hasMeldClass=false;
		String  remarks="";
		String  st="";//开始日期
		String  en="";//结束日期
		boolean onlyOneDay=true;//是否只有一天
		String key="";
		
		while(courseResult!=null&&courseResult.next()){			
			courseId=courseResult.getInt("CourseID");
			unitId=courseResult.getInt("UnitID");			
			specialId=courseResult.getInt("SpecialID");
			classId=courseResult.getInt("classId");
			className=courseResult.getString("className");
			title=courseResult.getString("CourseTitle");
			classDate=courseResult.getString("ClassDate");
			classDate=classDate.substring(0,10).trim();
			
			if(classDate!=null)classDate=classDate.trim();
			if(title==null)title="";
			classTime=courseResult.getString("ClassTime");
			
			if(classTime!=null&&classTime.length()>16){
				classTime=classTime.substring(11,16).trim();
			}
			
			if(className==null)className="";
			
			classNoon=courseResult.getInt("ClassNoon");
			classRoomId=courseResult.getInt("roomId");
			classRoom=courseResult.getString("roomName");
			remarks=courseResult.getString("remarks");
			if(remarks==null)remarks="";
			if(classRoom==null)classRoom="";
			
			tutors=courseResult.getString("Tutors");
			attenders=courseResult.getString("Attenders");
			outSider=courseResult.getString("Outsider");
			compere=courseResult.getString("Compere");
			conventioneers=courseResult.getString("Conventioneers");
			ClassModelID=courseResult.getInt("ClassModelID");			
			
			IsUseKQJ=courseResult.getInt("IsUseKQJ");
			IsUseCourseWare=courseResult.getInt("IsUseCourseWare");
			IsUseNotebookPC=courseResult.getInt("IsUseNotebookPC");
			IsTakeFeature=courseResult.getInt("IsTakeFeature");
			IsUseCamera=courseResult.getInt("IsUseCamera");
			IsUseVideo=courseResult.getInt("IsUseVideo");
			IsUseMediaPlayer=courseResult.getInt("IsUseMediaPlayer");
			
			if(currentWeek.endsWith("1")){//在页面显示的日期
				  if(count==0){					  
				  	en=courseResult.getString("en");	
				  	
				  	if(en!=null&&en.length()>9){
				  	  en=en.substring(0,10);	
				  	}
				  
				  	req.setAttribute("en",en);
				  }
			}else if(currentWeek.endsWith("2")){
				  if(count==0){			
				     st=courseResult.getString("start");
				    
			  	     en=courseResult.getString("en");
				  }
			  if(st!=null&&st.length()>9){
				  	  st=st.substring(0,10);	
				  	}
			  	
			  if(en!=null&&en.length()>9){
				  	  en=en.substring(0,10);	
				  	}
			 
			  	req.setAttribute("start",st);
			  	req.setAttribute("en",en);
			  	
			}else if(currentWeek.equals("3")){//在页面显示的日期
				req.setAttribute("start",start);
			  	req.setAttribute("en",end);
			}
			
			Course course=new Course(0);
			ArrayList services=new ArrayList();
			
			course.setClassRoomId(classRoomId);
			course.setCourseId(courseId);
			course.setUnitId(unitId);
			course.setSpecialId(specialId);
			course.setCourseTitle(title);
			course.setClassDate(classDate);
			course.setClassTime(classTime);
			course.setClassNoon(classNoon);
			course.setClassId(classId);
			course.setClassName(className);
			course.setClassRoom(classRoom);
			course.setTeachers(teachers);
			course.setOutSider(outSider);
			course.setCompere(compere);
			course.setConventioneers(conventioneers);
			course.setClassModelId(ClassModelID);
		    course.setWeekDate(getWeek(classDate));//星期几
		    course.setNoonName(getNoonName(classNoon));//午别名称
		    course.setRemarks(remarks);
		  
		    if(IsUseKQJ==1)         {
		    	services.add("考勤");  
		    	rowSpan++;		    	
		    	}
		    if(IsUseCourseWare==1)  {
		    	services.add("使用课件"); 
		    	rowSpan++;		    	
		    	}
		    if(IsUseNotebookPC==1)  {
		    	services.add("使用手提电脑");
		    	rowSpan++;		    	
		    	}
		    if(IsTakeFeature==1)    {
		    	services.add("拍花絮");  
		    	rowSpan++;		    	
		    	}
		    if(IsUseCamera==1)      {
		    	services.add("使用数码相机");
		    	rowSpan++;		    	
		    	}
		    if(IsUseVideo==1)       {
		    	services.add("全程摄像");  
		    	rowSpan++;		    	
		    	}
		    if(IsUseMediaPlayer==1) {
		    	services.add("使用媒体播放");
		    	rowSpan++;		    	
		    	}
		    
		    course.setRowSpan(rowSpan);//一个课程需要做的服务项目总数
		    course.setServices(services);
		    hasTaskCourse.add(course);//把有任务的课程保存下来	    
		    
     if(count==0){	
		    	remarkClassTime=classTime;//保存第一个时间
		    	position=0;
		     	countTimeRowspan=rowSpan;
		    	remarkClassDate=classDate;
		    	remarkClassRoomId=classRoomId;
		    	
		    	appendClassName=className;
		    }
		    
	 if(count>0){//第2条记录开始执行此处	
	   if(!classDate.equals(remarkClassDate)){//与上次记录的日期不一样
	    	remarkClassDate=classDate;
	    	countTask=0;
	    	hasMeldClass=false;
	    	
	    	
	   }
	   if(appendClassName.equals(""))appendClassName=course.getClassName();
	   
	  if(classTime.equals(remarkClassTime)){//与上次记录的时间一样		    	 	
		    	 	countTimeRowspan+=rowSpan;
		    	 	System.out.println("===classDate:"+course.getClassDate()+" "+classTime+"=====reDate:"+remarkClassDate+" "+remarkClassTime+" "+remarkClassRoomId+" "+classRoomId);
	
		    	 	if(remarkClassRoomId==classRoomId){//如果在同一时间在相同地点有课，则判断为合班的课程
		    	 		countTask+=rowSpan;
		    	 	    isAddCourse=false;//不需要加到结果集
		    	 	    hasMeldClass=true;
		    		
		    			String keyValue="";
		    			key=classDate+classTime+classRoomId;
		    	  
		    	 	   appendClassName+="<br>"+className;
		    	 	  
		    	 	   
		    	 	   
		    	  if(rowSpan>0){
	    				hm.put(key,className);
	    				
	    			}else{
	    			//	keyValue=(String)hm.get(key);
	    		//		keyValue=appendClassName;
	    		//		hm.put(key,appendClassName);	    				
	    			}
		    	 	   
		    	 	}else{
		    		     remarkClassRoomId=classRoomId;
		    	 		 hasMeldClass=false;
		    	 		isAddCourse=true;
		    	 		if(classDate.equals(remarkClassDate))hasMeldClass=true;
		    	 	}
		     }//end if(remarkClassRoomId==classRoomId)
		    	 
		    	 
		    	 
		    if(!classTime.equals(remarkClassTime)){//第2条记录后如果时间不一样了再记录
	        	    onlyOneDay=false;
	        	    remarkClassTime=classTime;//当前时间被记录		    	  
		            Course prevCourse=new Course();
		            isAddCourse=true;//新的时间的课程需要添加
		            remarkClassRoomId=classRoomId;//记录新的
		       
		      if(countTimeRowspan>0){
		    	if(isAddCourse&&hasMeldClass){
		      	           countTimeRowspan=countTimeRowspan-countTask;//把那些合班的任务去掉
		          	       countTask=0;
		          	       hasMeldClass=false;
		          	       Course firstMeldCourse=new Course();
		          	    if(count>=2){
		          	     firstMeldCourse=(Course)allCourse.get(count-2);
		          	    }
		          	   setClassName(hasTaskCourse,firstMeldCourse);
		          	    
		          	    }
		        
		    	    prevCourse=(Course)allCourse.get(position);
		            prevCourse.setTimeRowSpan(countTimeRowspan);
		            prevCourse.setClassName(appendClassName);
		              appendClassName="";
		    	        position=count;		    	        
		    	   }
		    	    countTimeRowspan=rowSpan;
		       }//end  if(!classTime.equals(remarkClassTime))
		   }//end count>0
		 	   
		
			
	 if(rowSpan>0&&isAddCourse){
		   	allCourse.add(course);			   
		    count++;
		   }		   
		    rowSpan=0;
		}//end while
		
	
	
		String courseDate="";
		String courseTime="";		
		int    countCoruse=0;
		int    courseNum=0;		
		String remarkTime="";
		String remarkDate="";
		
	if(allCourse!=null){
			countCoruse=allCourse.size();
			courseNum=countCoruse;
		}
	
		Course newCourse=new Course();
	
	if(countCoruse>0){
	
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
			 
		if(!courseTime.equals(remarkTime)&&remarkDate.equals(courseDate)&&allCourse!=null){
			newCourse=(Course)allCourse.get(countCoruse);	
			newCourse.setTimeRowSpan(countTimeRowspan);
			onlyOneDay=false;
			break;
		}	
		}//end for
	}//end if(countCoruse!=0)

	 if(onlyOneDay&&allCourse!=null&&countCoruse>0){//整个allCourse解决只有一天而且只有一个时间有课程的问题	
	 	newCourse=(Course)allCourse.get(0);
	 	newCourse.setTimeRowSpan(countTimeRowspan);
	 }
		
		if(courseResult!=null)courseResult.close();
		
		courses=allCourse;
		
		
		req.setAttribute("allCourse",allCourse);		
		req.setAttribute("courses",courses);
		
		if(allCourse!=null){
	//	for(int m=0;m<allCourse.size();m++){
		//	 Course course=(Course)allCourse.get(m);
	//	 System.out.println("====data:"+course.getClassDate()+" "+course.getClassTime()+"==========timeRowSpan:"+course.getTimeRowSpan()+"====rowSpan:"+course.getRowSpan());
	//	}
		}
		
	}catch(Exception e){
		System.out.println("==ServiceTeach==queryCourse======error:"+e);	
		
	}
   }
   
   public static void setClassName(ArrayList array,Course course){
   	int count=0;
   	int num=0;
   	String className="";
   	String key="";
   	Iterator it=null;
   	String classDate="";
   	String classTime="";
   	int classRoomId=0;
   	String date="";
   	String time="";
   	int    roomId=0;
   	if(array!=null)count=array.size();
   	
   if(course!=null){
   	classDate=course.getClassDate();
   	classTime=course.getClassTime();
   	classRoomId=course.getClassRoomId();
   	key=classDate+classTime+classRoomId;
   }
   
   for(int i=0;i<count;i++){
      	    Course c=new Course();
   			c=(Course)array.get(i);
   			date=c.getClassDate();
   			time=c.getClassTime();
   			roomId=c.getClassRoomId();
   	if(key.equals(date+time+roomId)){
   	//	System.out.println("=============key:"+key+"========obj:"+date+time+roomId+"========"+c.getClassName());
   	   if(className.equals("")){
   	   	  className=c.getClassName();
   	   }else{
   	  className+="<br>"+c.getClassName();
   	   }	
   	}
   		}
   		
   	course.setClassName(className);
   }
   
 //---------------------------------------------------------------------------------------------------------------  
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
		  Date date = ServiceTeach.strToDate(sdate);
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
		  Date date = ServiceTeach.strToDate(sdate);
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
    	  Date dd = ServiceTeach.strToDate(sdate);
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
  
    
   public static void main(String args[]){
   	
   }
}
