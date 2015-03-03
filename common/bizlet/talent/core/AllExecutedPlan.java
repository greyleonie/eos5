/*
 * �������� 2007-4-29
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
import java.util.*;


import javax.servlet.http.HttpServletRequest;

import base.util.DBconnection;

/**
 * @author tim
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class AllExecutedPlan {

	private static Connection con=null;
	private static Statement st=null;
	
   public  static void init(){
  
   	try{	 
     	DBconnection db = new DBconnection();
    	AllExecutedPlan.con=db.getEOSConnection();
    	AllExecutedPlan.st =AllExecutedPlan.con.createStatement();
	 	
   	}catch(Exception e){
   	 System.out.println("=========AllExecutedPlan============errors:"+e);	
   	}
   }
   
   public static void closeCon(){//�ر�����
     try{
     	if(AllExecutedPlan.con!=null)AllExecutedPlan.con.close();
     	if(AllExecutedPlan.st!=null)AllExecutedPlan.st.close();
     }catch(Exception e){
     	System.out.println("=========closeCon============errors:"+e);	
     }	
   }
   
   public static void queryTeacherName(HttpServletRequest req){//��ѯ��ʦ����
    ResultSet rs=null;
    String sql="select e.operatorID,e.operatorName from EOSOperator e where e.operatorType=0 ";
    ArrayList list=new ArrayList();
    
    try{
    	rs=AllExecutedPlan.st.executeQuery(sql);
    	long teacherId=0;
    	String teacherName="";
    	while(rs!=null&&rs.next()){
    		teacherId=rs.getLong("operatorID");
    		teacherName=rs.getString("operatorName");
    		TeacherVo t=new TeacherVo();
    		t.setTId(teacherId);
    		t.setUserName(teacherName);
    		
    		list.add(t);
    	}
    	req.setAttribute("teacherList",list);
    }catch(Exception e){
    	System.out.println("=========queryTeacherName============errors:"+e);
    }
   }
   
   public static HashMap getAllTeacher(HttpServletRequest req){
       HashMap hm=new HashMap();
       ResultSet rs=null;
       String sql="select e.operatorID,e.operatorName from EOSOperator e where e.operatorType=0 ";
       try{
           rs=AllExecutedPlan.st.executeQuery(sql);
            String teacherId="";
         	String teacherName="";
         	while(rs!=null&&rs.next()){
        		teacherId=rs.getString("operatorID");
        		teacherName=rs.getString("operatorName");
        	    hm.put(teacherId,teacherName);
        		
        	}
         	req.getSession().setAttribute("teacherHm",hm);
       }catch(Exception e){
           
       }
       return hm;
   }
   
   public static String changeId2Name(String ids,HttpServletRequest req){
   	  String names="";
   	  ArrayList list=new ArrayList();
  // 	System.out.println("=========changeId2Name============ids:"+ids);
   	  int       allTeacher=0;
   	  int       countId=0;
   	  String     teacherId="";
   	  String     sourceId="";
   	  String     teacherName="";
   	  list=(ArrayList)req.getAttribute("teacherList");
   	  if(list!=null)allTeacher=list.size();

 if(ids!=null&&!ids.equals("")){
   	  String    tId[]=ids.split(",");
      countId=tId.length;
   	  
   	  
        for(int i=0;i<countId;i++){
       	    sourceId=tId[i];
       	  	for(int k=0;k<allTeacher;k++){
       	  		TeacherVo t=new TeacherVo();
       	  		t=(TeacherVo)list.get(k);
       	    	teacherId=String.valueOf(t.getTId());
       	    	teacherName=t.getUserName();
       	    	if(teacherId.equals(tId[i])){
       	    	  	if(names.equals("")){
       	    	    	names=teacherName;
       	    	  	}else{
       	    	  	names+="��"+teacherName;
       	    	  	}
       	    	}
       	  	}//end for 2
       	  }//end for 1        
   	  }//end if
   	 
   	  
   	  return names;
   }
   
   public static String isExecutedTeachModel(){//��ѯ��ѧģʽ����Ҫ��ִ���ܱ���ʾ�ģ�
       String model="";
       ResultSet rs=null;
       String sql="select * from EducatingMode where isExecute=1";
       int count=0;
       
       try{
         	rs=AllExecutedPlan.st.executeQuery(sql);
         	String businID="";
         	String remark="";
         	
       	while(rs!=null&&rs.next()){
       		remark=rs.getString("IsExecute");
       		businID=rs.getString("EducatingModeID");
       		if(remark==null)remark="";    		
       		if(remark.equals("1")){
       		    if(model.equals("")){
       		    	model=" TeahchingModelID="+businID;	
       		    }else{
       		    	model+=" or TeahchingModelID="+businID;	
       		    }   	
       		}
       		count++;
       	}
       }catch(Exception e){
       	System.out.println("=====**====isExecutedTeachModel============errors:"+e);	
       }
   
       return model;
   }
   
   public static void saveAllPlan(HttpServletRequest req,String classCondition,String executedPlan,String beg,String end){//��ѯ�γ�
   	AllExecutedPlan.queryCourse(req,classCondition,executedPlan,beg,end);
   }
   
   public static  void saveSelectedClass(HttpServletRequest req,String isFirst,String ids){//��ѯ�༶
   	
	ResultSet classResult=null;
	String    className="";
	String    begTimeEndTime="";
	String    classId="";
	String    classCondition="";
	ArrayList classList=new ArrayList();
	String    sql="";
	try{
   		 sql="select top 5 c.classId,c.ClassName,c.BeginTime,c.EndTime,c.ClassroomID,r.roomName from teachingplan t " + //Ĭ�ϵİ༶
  				" right join Class c  on c.classid=t.classid left join room r on replace(c.classRoomId,',','')=r.roomId where t.state=6 "+
				"and c.Enable=1 order by c.classId desc";
				
//   		 sql="select  c.classId,c.ClassName,c.BeginTime,c.EndTime,c.ClassroomID,r.roomName from teachingplan t " + //Ĭ�ϵİ༶
//			" right join Class c  on c.classid=t.classid left join room r on replace(c.classRoomId,',','')=r.roomId where t.state=6 "+
//	"and c.Enable=1  and  c.classid=5 or c.classid=17 or c.classid=4 or c.classid=142 or c.classid=141 order by c.classId desc";
   		
   		//System.out.println("==============sql:"+sql);
   		//System.out.println("==============isFirst:"+isFirst+"============ids:"+ids);
   		if(isFirst.equals("1")&&ids!=null&&!ids.equals("")){ 
   			 String idArray[]=ids.split(",");
   			 for(int k=0;k<idArray.length;k++){
   			 	if(classId.equals("")){
   			 	classId="c.classId="+idArray[k];
   			 	}else{
   			 		classId+=" or c.classId="+idArray[k];
   			 	}
   			 }
   		sql="select c.classId,c.ClassName,c.BeginTime,c.EndTime,c.ClassroomID ,r.roomName " +
		" from  Class c  left join room r on replace(c.classRoomId,',','')=r.roomId where "+classId+" order by c.classId desc";//�����ѡ��༶��
   		}   		
   		
   		//System.out.println("=================sql:"+sql);
   		
		classResult=AllExecutedPlan.st.executeQuery(sql);
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
		
	if(classResult!=null)classResult.close();
	
	String begEndTime[]=BeginTimeEndTime.sortDate(begTimeEndTime);
	req.setAttribute("className",className);	       //ҳ����ʾ�İ༶����
	
	req.setAttribute("classCondition",classCondition); //��ѯ�γ�ʹ��	
	req.setAttribute("classList",classList);
	
	if(begEndTime!=null&&begEndTime.length>1){
		
		if(begEndTime!=null&&begEndTime[0].length()>10)begEndTime[0]=begEndTime[0];
		
		if(begEndTime!=null){
			
			req.setAttribute("begTime",begEndTime[0]);     //��ʼ����
		}else{
			
			req.setAttribute("begTime",""); 
		}
		
		if(begEndTime.length>0&&begEndTime[begEndTime.length-1].length()>10)
			begEndTime[begEndTime.length-1]=begEndTime[begEndTime.length-1];
		
		if(begEndTime.length>0){
			
		 req.setAttribute("endTime",begEndTime[begEndTime.length-1]);
		}else{
			req.setAttribute("endTime","");
		}
		
	}else{
		req.setAttribute("begTime","");
		req.setAttribute("endTime","");
	}
	
	}catch(Exception e){
   	   System.out.println("==AllExecutedPlan==saveSelectedClass======error:"+e);	
   	}
   }
   
   public static String teamIds(String classCondition){
   	 String ids="";
  	 ResultSet rs=null;
  	 String sql="select distinct c.classId,c.teamID from student c  where "+classCondition+" order by c.classid desc";
  	 String teamId="";
  	 
  	 try{
  	    if(!classCondition.equals(""))rs=AllExecutedPlan.st.executeQuery(sql);
  	    
  	    while(rs!=null&&rs.next()){
  	    	teamId=rs.getString("teamID");
  	    	if(teamId==null){
  	    		teamId="";	
  	    	}
  	    	if(!teamId.equals("")){
  	    	  	if(ids.equals("")){
  	    	  		ids=" t.teamId="+teamId;
  	    	  	}else{
  	    	  	    ids+=" or t.teamId="+teamId;	
  	    	  	}
  	    	}//end if
  	    }//end while
  	 }catch(Exception e){
  	  System.out.println("===================error:"+e); 
  	 }
   	 return ids;
   }
   
   
   public static void queryTeam(HttpServletRequest req,String classCondition){//��ѯ�༶������Ϣ  
   	ResultSet rs=null;
   	ArrayList teamList=new ArrayList();
   	ArrayList classList=new ArrayList();
   	int countClass=0;
    int countTeam=0;
  
   	try{
   		//String sql="select t.teamName,t.classId,roomName from class c join team t on c.classId=t.classid"+
		//           " join room r on t.roomId=r.roomId where "+classCondition+" order by c.classid desc";
   		String teamIds=AllExecutedPlan.teamIds(classCondition);
   		if(teamIds==null)teamIds="";
   		if(!teamIds.equals(""))teamIds=" where "+teamIds;
   		String sql="select t.classId,t.teamName,t.teamId,r.roomName from team t join room r on t.roomId=r.roomId "+teamIds
		           +" order by t.classid desc";
   //System.out.println("=================++==sql:"+sql); 
   		rs=AllExecutedPlan.st.executeQuery(sql);
   		int classId=0;
   		String teamName="";
   		String roomName="";
   		String teamInfo="";
   		while(rs!=null&&rs.next()){
   			 Team team=new Team();
   			 classId=rs.getInt("classId");
   		     teamName=rs.getString("teamName");
   		     roomName=rs.getString("roomName");
   		     
   		     team.setClassId(classId);
   		     team.setTeamName(teamName);
   		     team.setRoomName(roomName);
   		     
   		     teamList.add(team);
   		}
   		classList=(ArrayList)req.getAttribute("classList");
   	    if(classList!=null){
   	    	countClass=	classList.size();
   	    }
   	    if(teamList!=null)countTeam=teamList.size();
     	
     	 
   	    for(int i=0;i<countClass;i++){
   	        ClassEnt clazzEnt=new ClassEnt();
   	    	clazzEnt=(ClassEnt)classList.get(i);
   	    	clazzEnt.getClassId();
   	    	clazzEnt.setClassRoom("");
   	    for(int k=0;k<countTeam;k++){
   	    	Team team=new Team();
   	    	team=(Team)teamList.get(k);
   	    	if(team.getClassId()==clazzEnt.getClassId()){
   	    		teamInfo=team.getTeamName()+"��"+team.getRoomName();
   	    		if(clazzEnt.getClassName().equals("")){
   	    			clazzEnt.setClassRoom("��С�������ң�"+"\n"+teamInfo);
   	    			teamInfo="";
   	    		}else{
   	    			clazzEnt.setClassRoom(clazzEnt.getClassRoom()+"\n\n"+teamInfo);
   	    			teamInfo="";
   	    		}
   	    	}
   	    	}
   	    }
   	}catch(Exception e){
   		System.out.println("==AllExecutedPlan==queryTeam======error:"+e);	
   	}
   }
   
   public static void queryCourse(HttpServletRequest req,String classCondition,String executedModel,String beg,String end){//��ѯ�༶�Ŀγ�
 
	ResultSet courseResult=null;
	ArrayList allCourse=new ArrayList();
	ArrayList courses=new ArrayList();
	if(executedModel==null||executedModel.equals("")){
		executedModel="";
	}else{	
		executedModel=" and ("+executedModel+") ";	
	}
	
	if(!executedModel.equals("")){
	//	executedModel+=" and ("+executedModel+")";
	}
	
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
		String sql="select c.TeahchingModelID, c.CourseID,c.UnitID,c.SpecialID,c.classId,c.CourseTitle,c.ClassDate,c.ClassTime,c.ClassNoon,c.ClassRoomID,"+
                   " c.teachers,c.Tutors,c.Attenders,c.Outsider,c.Compere,c.Conventioneers,c.ClassModelID,e.operatorName "+
                   "from course c left join EOSOperator e on e.operatorID=c.teachers  where c.isAdopted=1 "+ timeCondition+" and  ("+classCondition+") "+executedModel+" order by c.classDate,c.classNoon,c.classId asc";
	//System.out.println("***************classCondition:"+classCondition+"===========sql:"+sql);
	

		courseResult=AllExecutedPlan.st.executeQuery(sql);
		int    courseId=-1;
		int    unitId=-1;
		int    specialId=-1;
		int    classId=-1;
		String title="";
		String classDate="";
		String classTime="";
		String classRoomId="";
		int    classNoon=-1;
		int    remarkCourseNoon=0;//��¼�γ���������ж��Ƿ��ۼ�
		String  classRoom="";
		int TeahchingModelID=0;
		String teachers="";
		String tutors="";
		String attenders="";
		String outSider="";
		String compere="";
		String conventioneers="";
		String shouKe="";
		int    ClassModelID=-1;
		int    count=0;
		String remarkClassDate="";
		int   remarkWeekIndex=-1;
		int   countWeek=0;//
		int   countNoon=0;//����һ���������		
		int   position=-1;  //ĳ���γ���list�е�����
		int   weekIndex=0;//�Զ������������0��1��2....
		
		HashMap hm=(HashMap)req.getSession().getAttribute("classRoomList");
		
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
			classRoomId=courseResult.getString("classRoomId");
			teachers=courseResult.getString("operatorName");
			shouKe=courseResult.getString("teachers");
			tutors=courseResult.getString("Tutors");
			attenders=courseResult.getString("Attenders");
			outSider=courseResult.getString("Outsider");
			compere=courseResult.getString("Compere");
			conventioneers=courseResult.getString("Conventioneers");
			ClassModelID=courseResult.getInt("ClassModelID");		
			TeahchingModelID=courseResult.getInt("TeahchingModelID");
		
			Course course=new Course(0);
			
			course.setCourseId(courseId);
			course.setUnitId(unitId);
			course.setSpecialId(specialId);
			course.setCourseTitle(title);
			course.setClassDate(classDate);
			course.setClassTime(classTime);
			course.setClassNoon(classNoon);
			course.setClassId(classId);
			course.setClassRoom((String)hm.get(classRoomId));
			course.setTeachingModelId(TeahchingModelID);
			
			course.setTeachers(teachers);
			course.setOutSider(outSider);
			course.setCompere(AllExecutedPlan.changeId2Name(compere,req));
			course.setConventioneers(conventioneers);
			course.setClassModelId(ClassModelID);
		    course.setWeekDate(getWeek(classDate));//���ڼ�
		    course.setNoonName(getNoonName(classNoon));//�������
		    course.setWeekIndex(weekIndex);
		  
		    course.setAttenders(AllExecutedPlan.changeId2Name(shouKe,req));
		    
		// System.out.println("======countNoon:"+countNoon+"=============curDate:"+classDate);
		    if(count==0){	
		    	remarkWeekIndex=getWeekIndex(classDate);//ͨ������ȡ����������
		    	remarkCourseNoon=classNoon;
		    	position=0;
		    	remarkClassDate=classDate;//�����һ������		    	
		 
		    
		      countNoon++;
		    }
		    
		    if(count>0){
		     if(classDate.trim().equals(remarkClassDate.trim())&&remarkCourseNoon!=classNoon){//��ǰ�����ϴμ�¼���һ��
		        countNoon++;	
		         remarkCourseNoon=classNoon;
		    }
		   }
		    
		  //  System.out.println("================remarkWeekIndex:"+remarkWeekIndex);
		   
		    if(getWeekIndex(classDate)<remarkWeekIndex){//��ǰ���ڵ����ں���һ��¼��������ȣ����С�ˣ�������һ����
		    //	   System.out.println("***************classDate:"+classDate+"*****************weekIndex:"+weekIndex);
		    	weekIndex++;	
		    	remarkWeekIndex=getWeekIndex(classDate);
		    	
	    	}
		 
		  
		    course.setWeekIndex(weekIndex);//�����ܵ�����
		    remarkWeekIndex=getWeekIndex(classDate);
		    
		 
		    if(count>0){
		          if(!classDate.equals(remarkClassDate)){//��2����¼��������ڲ�һ�����ټ�¼
		    		
		    		countWeek++;
		    	    remarkClassDate=classDate;//��ǰ���ڱ���¼
		    	   
		    	    
		    	     Course privCourse=new Course();
		    	     privCourse=(Course)allCourse.get(position);//����rowspan
		    	     privCourse.setRowSpan(countNoon);
		    //   System.out.println("=======position:"+position+"====================privDate:"+privCourse.getClassDate()+"=======classDate:"+classDate+"=======countNoon:"+countNoon); 
		     
		    	    
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
		boolean onlyOneDay=true;//�Ƿ�ֻ��һ��
		
	if(allCourse!=null){
			countCoruse=allCourse.size();
			courseNum=countCoruse;
		}
    
		Course newCourse=new Course();
	    String remarkDate="";
	
	if(countCoruse>0){
		
	 for(int k=0;countCoruse>k;countCoruse--){//����Ĵ�����ܽ���������һ������������⣬�����������һ���������
	 	
	 	newCourse=(Course)allCourse.get(countCoruse-1);
	 	
			newCourse.getClassNoon();
			courseDate=newCourse.getClassDate();
		if(courseNum==countCoruse){//��¼���γ̵�����
				remarkDate=newCourse.getClassDate();
				curNoon=newCourse.getClassNoon();
				noonNum=1;
			}
	   
		if(!courseDate.equals(remarkDate)){
			newCourse=(Course)allCourse.get(countCoruse);
			onlyOneDay=false;
			newCourse.setRowSpan(noonNum);
			break;
		}
	 if(firstNoon!=curNoon){
		  noonNum++;
		  firstNoon=curNoon;
		}
		}//end for
	}	 
	
	 
	 if(onlyOneDay&&allCourse!=null&&allCourse.size()>0){//����allCourse���ֻ��һ�������
	 //	System.out.println("=========onlyOneDay:"+onlyOneDay+"=========noonNum:"+noonNum);
	 
	 	newCourse=(Course)allCourse.get(0);
	 	newCourse.setRowSpan(noonNum);
	 	
	 }
	// System.out.println("==========44=======noon:"+((Course)allCourse.get(0)).getRowSpan()); 
		if(courseResult!=null)courseResult.close();
		courses=allCourse;
		
	//	System.out.println("==========weekIndex:"+weekIndex);   
		req.setAttribute("allCourse",allCourse);		
		req.setAttribute("courses",courses);
		req.setAttribute("countWeek",(new Integer(weekIndex+1)));//�ܵ�������
		
		for(int m=0;m<allCourse.size();m++){
			 Course course=(Course)allCourse.get(m);
		//	 System.out.println("=========time:"+course.getClassDate()+"======weekDate:"+course.getWeekDate()+"======noon:"+course.getClassNoon()+"=========rowSpan:"+course.getRowSpan()+"=====weekIndex:"+course.getWeekIndex());
		}
		
		
	}catch(Exception e){
		System.out.println("==AllExecutedPlan==queryCourse======error:"+e);	
	}
   }
   
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
		  Date date = AllExecutedPlan.strToDate(sdate);
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
		  Date date = AllExecutedPlan.strToDate(sdate);
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
    
    
  public static ArrayList  returnClassList(HttpServletRequest request){
  	ArrayList classList=new ArrayList();
    String sql="select c.classId,c.className,c.isHistoryClass,t.state from class c join teachingplan t on c.classid=t.classid " +
    		   "where c.enable=1 and t.state=6 order by c.classid desc";
	ResultSet courseResult=null;
	
    try{
    	courseResult=AllExecutedPlan.st.executeQuery(sql);
    	
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
    
  //��ѯ����
  public static HashMap getAllClassRoom(HttpServletRequest request){
      HashMap list=new HashMap();
      String sql="select roomId,roomName from room where roomtypeid=1";
      ResultSet result=null;
      try{
           result=AllExecutedPlan.st.executeQuery(sql);
           while(result!=null&&result.next()){              
               String roomId=result.getString("roomId");
               String roomName=result.getString("roomName");
              
               list.put(roomId,roomName);
               
               request.getSession().setAttribute("classRoomList",list);
           }
      }catch(Exception e){
        System.out.println("=======error:"+e);    
      }
      return list;
  }
  
   public static void main(String args[]){
   	
   }
}
