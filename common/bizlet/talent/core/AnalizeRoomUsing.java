package talent.core;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-25
 * @class_displayName AnalizeRoomUsing
 */

public class AnalizeRoomUsing {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_ClassRoomUsing
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="日期"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="当前午别"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="当前课程id"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="保存在使用教室的id"
	 */
	
	static String roomIds;
	
	public static int BL_ClassRoomUsing(Document doc, BizContext param) throws Exception{
		String date = (String)param.getParaObjectAt(0);
		String noon = (String)param.getParaObjectAt(1);
		String courseId = (String)param.getParaObjectAt(2);
		Node roomIds = (Node)param.getParaObjectAt(3);
		PersistenceBroker db = param.getDBBroker();
		AnalizeRoomUsing.roomIds="";
		AnalizeRoomUsing.getRoomIds(db,date,noon,courseId);
		XmlUtil.setNodeValue(roomIds,AnalizeRoomUsing.roomIds);
		return 1;
	}
	
	public static  void getRoomIds(PersistenceBroker db,String date,String noon,String currentCourseId){
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		String sql="select CourseID,ClassRoomID,classNoon from course where classDate='"+date+"'";
		if(!currentCourseId.equals("")){
			sql+=" and courseId!="+currentCourseId;
		}
		System.out.println("--------------------sql:"+sql);
		try{
			cn=db.getConnection();
			st=cn.createStatement();
			rs=st.executeQuery(sql);
			String strClassNoon="";
			String strCourseId="";
			String strRoomId="";
			int roomId;
			int classNoon;
			int courseId;
		
			while(rs.next()){
				classNoon=rs.getInt("classNoon");
				courseId=rs.getInt("CourseID");
				roomId=rs.getInt("ClassRoomID");
			
				if(classNoon>-1){
					strClassNoon=new Integer(classNoon).toString();
				}
				if(courseId>-1){
					strCourseId=new Integer(courseId).toString();
				}
				if(roomId>-1){
					strRoomId=new Integer(roomId).toString();
				}
				if(strClassNoon.equals(noon)){//一致时
					if(AnalizeRoomUsing.roomIds.equals(""))AnalizeRoomUsing.roomIds=strRoomId;
					else AnalizeRoomUsing.roomIds+=","+strRoomId;
				}else if(strClassNoon.equals("3")&&!noon.equals("2")){//存在全天的，当前是上午或下午
					if(AnalizeRoomUsing.roomIds.equals(""))AnalizeRoomUsing.roomIds=strRoomId;
					else AnalizeRoomUsing.roomIds+=","+strRoomId;
				}else if(noon.equals("3")&&!strClassNoon.equals("2")){//存在上午或下午，当前是全天的
					if(AnalizeRoomUsing.roomIds.equals(""))AnalizeRoomUsing.roomIds=strRoomId;
					else AnalizeRoomUsing.roomIds+=","+strRoomId;
				}
			}//end while
			System.out.println("==========roomIds:"+AnalizeRoomUsing.roomIds);
		}catch(Exception e){
			System.out.println("==========errors:"+e);
		}finally{
			try{
			   	if(rs!=null)rs.close();
			 	if(st!=null)st.close();
			 	if(cn!=null)cn.close();
			   	
			   }catch(Exception e){
			    e.printStackTrace();	
			   }
		}
	}
}