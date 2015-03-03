/*
 * �������� 2007-5-18
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
   
   public static void closeCon(){//�ر�����
     try{
     	if(ServiceTeach.con!=null)ServiceTeach.con.close();
     	if(ServiceTeach.st!=null)ServiceTeach.st.close();
     }catch(Exception e){
     	System.out.println("=========closeCon============errors:"+e);	
     }	
   }
   
   public static void saveAllPlan(HttpServletRequest req,String classCondition,String start,String end){//��ѯ�γ�
   	ServiceTeach.queryCourse(req,classCondition,start,end);
   }
   
   
   public static void queryCourse(HttpServletRequest req,String currentWeek,String start,String end){//��ѯ�༶�Ŀγ�

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
		if(currentWeek.equals("2")){//��һ�ܵĿγ�

		
		sql="select cl.className,c.*,r.roomId,r.roomName, convert(varchar(10),dateadd(day,7-datepart(weekday,getdate())+2,getdate()),120) as start,"+
"convert(varchar(10),dateadd(day,7-datepart(weekday,getdate())+8,getdate()),120) as en from class cl join course  c on cl.classId=c.classId join room r on c.classRoomId=r.roomId  where  c.isAdopted=1 and "+
           " (c.classDate between convert(varchar(10),dateadd(day,7-datepart(weekday,getdate())+2,getdate()),120) and "+
           " convert(varchar(10),dateadd(day,7-datepart(weekday,getdate())+8,getdate()),120)) order by c.classdate,c.classtime,c.classRoomId asc";
		} 
		if(currentWeek.equals("3")&&!start.equals("")&&!end.equals("")){//������ѯ
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
	    //int    isMeldClass=0;     //�Ƿ�ϰ��Ͽ�
		int    ClassModelID=-1;
		int    IsUseKQJ=0;        //�Ƿ���
		int    IsUseCourseWare=0; //�Ƿ�ʹ�ÿμ�
		int    IsUseNotebookPC=0; //�Ƿ�ʹ���������
		int    IsTakeFeature=0;   //�Ƿ��Ļ���
		int    IsUseCamera=0;     //�Ƿ�ʹ���������
		int    IsUseVideo=0;      //�Ƿ�ȫ������
		int    IsUseMediaPlayer=0;//�Ƿ�ʹ��ý�岥��
		int    RadioPhones=0;     //���߻�Ͳ����
		int    WiredPhones=0;     //���߻�Ͳ����
		
		int    count=0;
		String remarkClassTime="";
		String remarkClassDate="";
	
	    int    rowSpan=0;         //ĳ���γ̵�rowspan
		HashMap hm=new HashMap();
	    int    countTimeRowspan=0;
	    int    position=0;
		String remarkMeldClassTime="";   //��¼�ϰ��Ͽε�ʱ��
		int    remarkClassRoomId=-1;//��¼�ϰ��Ͽεĵص�
		boolean firstMeldClass=true;  //�Ƿ��һ���ϰ��ϿεĿγ�
		int    countTask=0;            //����ͬһ��ʱ���������ϰ��Ͽ�Ҫ��������
		String appendClassName="";     //�������ϰ�İ�����������
		boolean isRemoveCourse=false;//�Ƿ��޳��γ�
		boolean isAddCourse=true;    //�Ƿ�Ҫ�ѿγ���ӵ�����
		boolean hasMeldClass=false;
		String  remarks="";
		String  st="";//��ʼ����
		String  en="";//��������
		boolean onlyOneDay=true;//�Ƿ�ֻ��һ��
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
			
			if(currentWeek.endsWith("1")){//��ҳ����ʾ������
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
			  	
			}else if(currentWeek.equals("3")){//��ҳ����ʾ������
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
		    course.setWeekDate(getWeek(classDate));//���ڼ�
		    course.setNoonName(getNoonName(classNoon));//�������
		    course.setRemarks(remarks);
		  
		    if(IsUseKQJ==1)         {
		    	services.add("����");  
		    	rowSpan++;		    	
		    	}
		    if(IsUseCourseWare==1)  {
		    	services.add("ʹ�ÿμ�"); 
		    	rowSpan++;		    	
		    	}
		    if(IsUseNotebookPC==1)  {
		    	services.add("ʹ���������");
		    	rowSpan++;		    	
		    	}
		    if(IsTakeFeature==1)    {
		    	services.add("�Ļ���");  
		    	rowSpan++;		    	
		    	}
		    if(IsUseCamera==1)      {
		    	services.add("ʹ���������");
		    	rowSpan++;		    	
		    	}
		    if(IsUseVideo==1)       {
		    	services.add("ȫ������");  
		    	rowSpan++;		    	
		    	}
		    if(IsUseMediaPlayer==1) {
		    	services.add("ʹ��ý�岥��");
		    	rowSpan++;		    	
		    	}
		    
		    course.setRowSpan(rowSpan);//һ���γ���Ҫ���ķ�����Ŀ����
		    course.setServices(services);
		    hasTaskCourse.add(course);//��������Ŀγ̱�������	    
		    
     if(count==0){	
		    	remarkClassTime=classTime;//�����һ��ʱ��
		    	position=0;
		     	countTimeRowspan=rowSpan;
		    	remarkClassDate=classDate;
		    	remarkClassRoomId=classRoomId;
		    	
		    	appendClassName=className;
		    }
		    
	 if(count>0){//��2����¼��ʼִ�д˴�	
	   if(!classDate.equals(remarkClassDate)){//���ϴμ�¼�����ڲ�һ��
	    	remarkClassDate=classDate;
	    	countTask=0;
	    	hasMeldClass=false;
	    	
	    	
	   }
	   if(appendClassName.equals(""))appendClassName=course.getClassName();
	   
	  if(classTime.equals(remarkClassTime)){//���ϴμ�¼��ʱ��һ��		    	 	
		    	 	countTimeRowspan+=rowSpan;
		    	 	System.out.println("===classDate:"+course.getClassDate()+" "+classTime+"=====reDate:"+remarkClassDate+" "+remarkClassTime+" "+remarkClassRoomId+" "+classRoomId);
	
		    	 	if(remarkClassRoomId==classRoomId){//�����ͬһʱ������ͬ�ص��пΣ����ж�Ϊ�ϰ�Ŀγ�
		    	 		countTask+=rowSpan;
		    	 	    isAddCourse=false;//����Ҫ�ӵ������
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
		    	 
		    	 
		    	 
		    if(!classTime.equals(remarkClassTime)){//��2����¼�����ʱ�䲻һ�����ټ�¼
	        	    onlyOneDay=false;
	        	    remarkClassTime=classTime;//��ǰʱ�䱻��¼		    	  
		            Course prevCourse=new Course();
		            isAddCourse=true;//�µ�ʱ��Ŀγ���Ҫ���
		            remarkClassRoomId=classRoomId;//��¼�µ�
		       
		      if(countTimeRowspan>0){
		    	if(isAddCourse&&hasMeldClass){
		      	           countTimeRowspan=countTimeRowspan-countTask;//����Щ�ϰ������ȥ��
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
	
	 for(int k=0;countCoruse>k;countCoruse--){//����Ĵ�����ܽ���������һ������������⣬�����������һ���������
	 	    newCourse=(Course)allCourse.get(countCoruse-1);
			courseDate=newCourse.getClassDate();
			courseTime=newCourse.getClassTime();
		    rowSpan=newCourse.getRowSpan();    
		    
		    if(courseNum==countCoruse){//��¼���γ̵�����
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

	 if(onlyOneDay&&allCourse!=null&&countCoruse>0){//����allCourse���ֻ��һ�����ֻ��һ��ʱ���пγ̵�����	
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
      	 noonName="����";
      }else if(noon==1){
      	 noonName="����";
      }else if(noon==2){
     	 noonName="����";
      }else if(noon==3){
     	 noonName="ȫ��";
      }
      return noonName;
   }
   
	public static String getWeek(String sdate) { // ��ת��Ϊʱ��		 
		  Date date = ServiceTeach.strToDate(sdate);
		  Calendar c = Calendar.getInstance();
		  c.setTime(date);
		  // int hour=c.get(Calendar.DAY_OF_WEEK);
		  // hour�д�ľ������ڼ��ˣ��䷶Χ 1~7
		  // 1=������ 7=����������������
		
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
    public static int getWeekIndex(String sdate){//ȡ���ڵ�����
  	 
  	      int index=0;
		  Date date = ServiceTeach.strToDate(sdate);
		  Calendar c = Calendar.getInstance();
		  c.setTime(date);
		  String fullName=new SimpleDateFormat("EEEE").format(c.getTime());
		  if(fullName.equals("������")){
		  	index=0;
		  }else if(fullName.equals("����һ")){
			index=1;
		  }
		  else if(fullName.equals("���ڶ�")){
		  	index=2;
		  }
		  else if(fullName.equals("������")){
		  	index=3;
		  }
		  else if(fullName.equals("������")){
		  	index=4;
		  }
		  else if(fullName.equals("������")){
		  	index=5;
		  }
		  else if(fullName.equals("������")){
		  	index=6;
		  }
		 
		  return index;
		
  }
    
    public static String getWeek(String sdate, String num) {
    	  // ��ת��Ϊʱ��
    	  Date dd = ServiceTeach.strToDate(sdate);
    	  Calendar c = Calendar.getInstance();
    	  c.setTime(dd);
    	  if (num.equals("1")) // ��������һ���ڵ�����
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
    	  else if (num.equals("2")) // �������ڶ����ڵ�����
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);
    	  else if (num.equals("3")) // �������������ڵ�����
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);
    	  else if (num.equals("4")) // �������������ڵ�����
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);
    	  else if (num.equals("5")) // �������������ڵ�����
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
    	  else if (num.equals("6")) // �������������ڵ�����
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
    	  else if (num.equals("0")) // �������������ڵ�����
    	   c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
    	  return new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
    	 }
  
    
   public static void main(String args[]){
   	
   }
}
