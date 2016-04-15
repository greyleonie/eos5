package talent.core;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.Timestamp;

import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-10
 * @class_displayName CreateUnitFrame
 */




public class CreateUnitFrame {
	
	public static boolean existCourse(PersistenceBroker db,String classId,String condition){
	  boolean exist=false;
	  Connection cn = null;
      Statement st = null;
	  ResultSet rs = null;
	  String sql="select * from course where ClassID="+classId+" and "+condition;
	//  System.out.println("===exist course sql:"+sql);	
	try{
		cn = db.getConnection();	
	    st = cn.createStatement();
	    rs=st.executeQuery(sql);
	    while(rs.next()){
	    	exist=true;
	    }
	  
	}catch(Exception e){
	  System.out.println("-------exist course:"+e);	
	}
	  return exist;
	}
	
	public static String queryClassRoomId(PersistenceBroker db,String classId){
	   String classRoomId="";
	   Connection cn = null;
	      Statement st = null;
		  ResultSet rs = null;
		  String sql="select classroomId from class where classid="+classId;
		  try{
			cn = db.getConnection();	
		    st = cn.createStatement();
		    rs=st.executeQuery(sql);
		    while(rs!=null&&rs.next()){
		    	classRoomId=rs.getString("classroomId");
		    }
		  if(classRoomId==null&&classRoomId.equals(""))classRoomId="0";
		}catch(Exception e){
		  System.out.println("-------exist course:"+e);	
		}
	   return classRoomId;
	} 

	public static void createUnitFrame(PersistenceBroker db,String classID,String beginTime,String endTime,String unitId,String classRoomId){

		Date startDate = null;
	    Date endDate = null;
	    Date newDate = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		String insetSql="";
		String maxIdSql="select max(courseid) as id from course";
	    String existCondition="";
	   
	    try {
	    	cn = db.getConnection();
			st = cn.createStatement();	
	        startDate = sdf.parse(beginTime);
	        endDate = sdf.parse(endTime);
	      long nextTime = 0;
	      long days = (endDate.getTime() - startDate.getTime())/(24 * 60 * 60 * 1000);
	    

	      startDate.setTime( ( (startDate.getTime() / 1000) - 60 * 60 * 24) * 1000);
	     
	      String weekIndex="";
	      String strOfNewDate="";
	      boolean exist=false;
	      
	      for (int i = 0; i <= days; i++) {
	        nextTime = (startDate.getTime() / 1000) + 60 * 60 * 24;
	        nextTime = nextTime * 1000;
	        newDate.setTime(nextTime);
	        Timestamp date=new Timestamp(nextTime);
	      
	        
	      //  System.out.println("========d:"+date);
	        strOfNewDate=newDate.toString();
	        sdf.format(newDate);
	   
	        String classTime[]=new String[2];
	        String finalClassTime[]=new String[2];
	        classTime[0]="9:00";
	        classTime[1]="14:30";
	        finalClassTime[0]="11:15";
	        finalClassTime[1]="16:45";
	        String timeType[]=new String[2];
	        timeType[0]="";
	        timeType[1]="";
	      if(strOfNewDate.length()>3)  
	        weekIndex=strOfNewDate.substring(0,3);	
	       if(!weekIndex.equals("Sat")&&!weekIndex.equals("Sun")){//周末的不做处理
	          for(int j=0;j<2;j++){	      
	         	existCondition="ClassDate='"+date.toString()+"' and ClassNoon="+j+" and classTime='"+classTime[j]+"'";
	          	exist=CreateUnitFrame.existCourse(db,classID,existCondition);
	        	
	          	if(exist==false){//不存在该课程的时候
	        	rs=st.executeQuery(maxIdSql);//查询最大id
	        	int courseId=0;
	        	while(rs.next()){
	        		courseId=rs.getInt("id");
	        	  
	        	}//end while	
	        	
	        	    ++courseId;		
	        	    
	       	insetSql="insert into course(courseid,UnitID,classId,classRoomID,classDate,classTime,finalClassTime,classNoon,IsUseKQJ," +
	       			                    "IsUseNotebookPC,IsUseVideo,IsUseMediaPlayer,IsUseTea,IsUseFlower," +
	       			                    "IsSendNotice,IsAdopted,IsMeldClass,IsUseCourseWare,IsTakeFeature,IsUseCamera) " +
	       			            "values("+courseId+","+unitId+","+classID+","+classRoomId+",'"+date+"','"+classTime[j]+"','"+finalClassTime[j]+"',"+"'"+j+"',1," +
	       			            		"0,0,0,0,0," +
	       			            		"0,0,0,0,0,0)";
	        st.execute(insetSql);
	          	}
	       //	System.out.println("===insetSql:" + insetSql );
	        }//end for
	       }//end if
	        
	        startDate = newDate;
	      }
     
	    }
	    catch (Exception pe) {
	      System.out.println(pe.getMessage());
	    }finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
	}
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_createUnitFrame
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="classId"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="beg"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="end"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="unitId"
	 */
	public static int BL_createUnitFrame(Document doc, BizContext param) throws Exception{
		String classID = (String)param.getParaObjectAt(0);
		String startTime = (String)param.getParaObjectAt(1);
		String endTime = (String)param.getParaObjectAt(2);
		String unitId = (String)param.getParaObjectAt(3);
		PersistenceBroker db = param.getDBBroker();
		String classRoomId=queryClassRoomId(db,classID);
		CreateUnitFrame.createUnitFrame(db,classID,startTime,endTime,unitId,classRoomId);
	
		return 1;
	}
}