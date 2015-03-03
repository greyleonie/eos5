package talent.core;
import java.sql.Connection;
import java.sql.Statement;

import org.w3c.dom.*;

import base.util.DBconnection;

import com.primeton.tp.core.api.BizContext;

/**
 * @author Administrator
 * @version 1.0
 * @date 2007-6-14
 * @class_displayName UpdateClass
 */

public class UpdateClass {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_updateClass
	 * @bizlet_param passing="in_out" type="variable" value="classId" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="regTime" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="reachTime" name="" desc=""
	 */
	private static Connection con=null;
	private static Statement st=null;
	
	   public  static void init(){
	    
	     	try{	 
	       	DBconnection db = new DBconnection();
	       	UpdateClass.con=db.getEOSConnection();
	       	UpdateClass.st =UpdateClass.con.createStatement();
	  	 	
	     	}catch(Exception e){
	     	 System.out.println("=========AllExecutedPlan============errors:"+e);	
	     	}
	     }
	   
	   public static void closeCon(){//关闭连接
	     try{
	     	if(UpdateClass.con!=null)UpdateClass.con.close();
	     	if(UpdateClass.st!=null)UpdateClass.st.close();
	     }catch(Exception e){
	     	System.out.println("=========closeCon============errors:"+e);	
	     }	
	   }
	
	public static void updateTime(String classId,String regTime, String reachTime){
	
		try{
					
			String sql="update class set regTime='"+regTime+"',reachTime='"+reachTime+"' where classId="+classId;
		
			UpdateClass.st.execute(sql);
		}
	    catch (Exception pe) {
		      System.out.println(pe.getMessage());
		    }
	}
	
	
	public static int BL_updateClass(Document doc, BizContext param)
		throws Exception {
		String classId =(String) param.getParaObjectAt(0);
		String regTime  = (String) param.getParaObjectAt(1);
		String reachTime = (String) param.getParaObjectAt(2);
		init();
		updateTime(classId,regTime,reachTime);
		 closeCon();
		return 1;
	}

}