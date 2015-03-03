package talent.core;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-15
 * @class_displayName DeleteCourses
 */

public class DeleteCourses {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_deleteCourses
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入单元id"
	 */
	public static int BL_deleteCourses(Document doc, BizContext param)
		throws Exception {
		String unitId = (String) param.getParaObjectAt(0);
		PersistenceBroker db = param.getDBBroker();
		DeleteCourses.deleteCourse(db,unitId);
		return 1;
	}

	public static void deleteCourse(PersistenceBroker db,String unitId){	
		    Connection cn = null;
			Statement st = null;
			ResultSet rs = null;
		try{
			   
				String begin="";
				String end="";
				int classId=-1;
			cn = db.getConnection();
			st = cn.createStatement();
			String selectTimeSql="select BeginTime,EndTime,classId from TeachingPlanUnit where UnitID="+unitId;			
			
			rs=st.executeQuery(selectTimeSql);
			
			while(rs.next()){
				begin=rs.getString("BeginTime");
				end=rs.getString("EndTime");
				classId=rs.getInt("classId");
			}
		 String deCourseSql="delete from Course where classId="+classId+" and ClassDate between '"+begin+"' and '"+end+"'";
		// System.out.println("--------删除课程：deCourseSql:"+deCourseSql);	
		 st.execute(deCourseSql);
		 cn.close();
		}catch(Exception e){
		  System.out.println("--------删除课程："+e);	
		  
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
}