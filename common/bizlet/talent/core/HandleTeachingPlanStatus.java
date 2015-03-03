package talent.core;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.w3c.dom.*;

import base.util.DBconnection;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-6-28
 * @class_displayName HandleTeachingPlanStatus
 */

public class HandleTeachingPlanStatus {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_handlePlanStatus
	 * @bizlet_param passing="in_out" type="variable" value="planId" name="" desc=""
	 * @bizlet_param passing="in_out" type="variable" value="planType" name="" desc=""
	 */
	
	private static Connection con=null;
	private static Statement st=null;
	
	   public  static void init(){
	    
	     	try{	 
	       	DBconnection db = new DBconnection();
	       	HandleTeachingPlanStatus.con=db.getEOSConnection();
	       	HandleTeachingPlanStatus.st =HandleTeachingPlanStatus.con.createStatement();
	  	 	
	     	}catch(Exception e){
	     	 System.out.println("=========AllExecutedPlan============errors:"+e);	
	     	}
	     }
	     
	    public static void closeCon(){//关闭连接
	       try{
	       	if(HandleTeachingPlanStatus.con!=null)HandleTeachingPlanStatus.con.close();
	       	if(HandleTeachingPlanStatus.st!=null)HandleTeachingPlanStatus.st.close();
	       }catch(Exception e){
	       	System.out.println("=========closeCon============errors:"+e);	
	       }	
	     }
	     
	public static void handlePlanCourse(String planId,String planType){
		ResultSet rs=null;
		String querySql="";
		String updateSql="update TeachingPlan set state=6 where planId="+planId+";";
		String ids="";
		String id="";
		if(planType==null)planType="";
		if(planId==null)planId="";
		
		try{
		if(planType.equals("2")){//自选短班
			querySql="select specialId from SpecialSubject where planId="+planId;
			if(!planId.equals(""))rs=HandleTeachingPlanStatus.st.executeQuery(querySql);
			while(rs!=null&&rs.next()){
				 id=rs.getString("specialId");
				if(ids.equals("")){
				 	ids=" specialId="+id;
				 }else{
				 	ids+=" or specialId="+id;
				 }
			}			
			
		}else if(!planType.equals("")){
			querySql="select UnitID from TeachingPlanUnit where planId="+planId;
			if(!planId.equals(""))rs=HandleTeachingPlanStatus.st.executeQuery(querySql);
			while(rs!=null&&rs.next()){
				id=rs.getString("UnitID");
				if(ids.equals("")){
				 	ids=" UnitID="+id;
				 }else{
				 	ids+=" or UnitID="+id;
				 }
			}
		}
		updateSql+=" update course set IsAdopted=1 where "+ids;
		if(!ids.equals(""))HandleTeachingPlanStatus.st.execute(updateSql);
		}catch(Exception e){
		   System.out.println("==========errors:"+e);	
		}
	}
	     
	public static int BL_handlePlanStatus(Document doc, BizContext param)
		throws Exception {
		String planId = (String) param.getParaObjectAt(0);
		String planType = (String) param.getParaObjectAt(1);
		init();
		System.out.println("==========planId:"+planId+"===========planType:"+planType);	
		handlePlanCourse(planId,planType);
		closeCon();
		return 1;
	}

}