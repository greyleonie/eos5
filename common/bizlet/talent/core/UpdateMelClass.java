package talent.core;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2008-3-11
 * @class_displayName UpdateMelClass
 */

public class UpdateMelClass {

    /**
     * 
     * @param doc type: Document, DOM;
     * @param param type: BizContext;
     * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
     * @throws Exception 
     * <p>
     * ** bizlet 的显示名称 **
     * @bizlet_displayName UpdateMelClass
     * @bizlet_param passing="in" type="variable" value="classDate" name="" desc=""
     * @bizlet_param passing="in" type="variable" value="classTime" name="" desc=""
     * @bizlet_param passing="in" type="variable" value="classNoon" name="" desc=""  
     * @bizlet_param passing="in" type="variable" value="classId" name="" desc=""
     * @bizlet_param passing="in" type="variable" value="newDate" name="" desc=""
     * @bizlet_param passing="in" type="variable" value="newTime" name="" desc=""
     * @bizlet_param passing="in" type="variable" value="newClassNoon" name="" desc=""
     */
    public static int UpdateMelClass(Document doc, BizContext param)
        throws Exception {
        String classDate = (String) param.getParaObjectAt(0);
        String classTime = (String) param.getParaObjectAt(1);
        String classNoon = (String) param.getParaObjectAt(2);
        String  classId= (String) param.getParaObjectAt(3);
       
        String   newDate= (String) param.getParaObjectAt(4);
        String  newTime= (String) param.getParaObjectAt(5);
        String  newClassNoon= (String) param.getParaObjectAt(6);
      
        System.out.println("============classDate:"+classDate+
                "====classTime:"+classTime+"====classNoon:"+classNoon+
                "===classId:"+classId+"===newClassNoon:"+newClassNoon+"===newDate:"+newDate+"====newTime:"+newTime);
        
        PersistenceBroker db = param.getDBBroker();
        String classRoomId=queryCourse(db,classDate,classTime,classNoon,classId);//查那个课程的classRoomId
        if(!classRoomId.equals("")){
            String sourceId=queryCoureId(db,classDate,classTime,classNoon,classRoomId);//需要调整的课程
            String targetId=queryCoureId(db,newDate,newTime,newClassNoon,classRoomId);//调整到哪里
            System.out.println("============classRoomId:"+classRoomId);
            System.out.println("============sourceId:"+sourceId);
            System.out.println("============targetId:"+targetId);
            updateCourse(db,newDate,newTime,classDate,classTime,sourceId,targetId);//更新
            
        }
        return 1;  
       
    }
    public static String queryCourse(PersistenceBroker db,String classDate,String classTime,
            String classNoon,String classId){

           Connection cn = null;
		   Statement st = null;
		   ResultSet rs = null;
		   String classRoomId="";	
		  
        try{   
                
            String sql="select  classRoomId from course where isAdopted=1 and classDate='"+classDate+
                          "' and  classTime='"+classTime+"' and  classNoon='"+classNoon+
                          "'  and classId="+classId;
        System.out.println("============sql:"+sql);
               cn=db.getConnection();
		   	   st=cn.createStatement();
		   	      rs=st.executeQuery(sql);
		   	 
		   	   int count=0;
		   	   while(rs.next()){
		   	    classRoomId=rs.getString("classRoomId");		   	      
		   	   }
		   if(classRoomId==null)classRoomId="";	   
		   	  
        }catch(Exception e){
             System.out.println("============error:"+e);
        }finally{
		   	try{
			   	if(rs!=null)rs.close();
			 	if(st!=null)st.close();
			 	if(cn!=null)cn.close();
			   	
			   }catch(Exception e){
			    e.printStackTrace();	
			   }
			   }
        return classRoomId;
    } 
    
    public static void updateCourse(PersistenceBroker db,String newDate,String newTime,
                            String oldDate,String oldTime,String sourseIds,String targetIds){
           Connection cn = null;
		   Statement st = null;
		   ResultSet rs = null;
        try{  
            String sql0="update course set classDate='"+newDate+"',classTime='"+newTime+"' "+sourseIds;
            String sql1=";update  course set classDate='"+oldDate+"',classTime='"+oldTime+"' "+targetIds;
            try{  
                cn=db.getConnection();
 		   	    st=cn.createStatement();
 		   	    st.executeUpdate(sql0+sql1);
 		   	   System.out.println("============updateSql:"+sql0+sql1);
             }catch(Exception e){
                System.out.println("============error:"+e);
            }finally{
    		   	try{
    			   	if(rs!=null)rs.close();
    			 	if(st!=null)st.close();
    			 	if(cn!=null)cn.close();
    			   	
    			   }catch(Exception e){
    			    e.printStackTrace();	
    			   }
    			   }
        }catch(Exception e){
            System.out.println("============error:"+e);
        }
    }
    
    
    //查询(yyyy-MM-dd HH:mm 午别 教室) 的课程
    public static String queryCoureId(PersistenceBroker db,String classDate,
                  String classTime,String classNoon,String classRoomId){
      
        String arrar="";
        Connection cn = null;
		   Statement st = null;
		   ResultSet rs = null;
     try{  
         String sql="select courseId from course where classDate='"+classDate+
         "' and classTime='"+classTime+"' and classNoon='"+classNoon+"' and classRoomId="+classRoomId;
         System.out.println("=========sql:"+sql);
         int count=0;
            cn=db.getConnection();
	   	    st=cn.createStatement();
	   	    st.executeUpdate(sql);
	   	   while(rs.next()){
	   	    String id=rs.getString("courseId");	
	   	    if(count==0){
	   	     arrar=" where courseId="+id; 	   	   
	   	    }else{
	   	     arrar+=" or courseId="+id;  	   	   
	   	    }
	   	   }
         
     }catch(Exception e){
         System.out.println("============error:"+e);
     }finally{
		   	try{
			   	if(rs!=null)rs.close();
			 	if(st!=null)st.close();
			 	if(cn!=null)cn.close();
			   	
			   }catch(Exception e){
			    e.printStackTrace();	
			   }
			   }
        return arrar;
    }
}