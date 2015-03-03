package talent.core;
import java.sql.*;



import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-16
 * @class_displayName TeachOrClassRoomHasTask
 */

public class TeachOrClassRoomHasTask {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_teachOrClassRoomHasTask	
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ֶ���"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ֶ���ֵ"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="��ǰҪ�����Ƚϵ���ֵ"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="���������"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="�����Ƿ�ɲ����ı��"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�γ�pk"
	 */
	public static int BL_teachOrClassRoomHasTask(Document doc, BizContext param)
		throws Exception {	
		String tabField = (String) param.getParaObjectAt(0);
		String fieldValue = (String) param.getParaObjectAt(1);
		String currentValue = (String) param.getParaObjectAt(2);
		String classDate = (String) param.getParaObjectAt(3);
		Node canDo = (Node) param.getParaObjectAt(4);
		String courseId=(String) param.getParaObjectAt(5);
		PersistenceBroker db = param.getDBBroker();
		
		String flag=TeachOrClassRoomHasTask.judgeCanDo(db,classDate,tabField,fieldValue,currentValue,courseId);
		XmlUtil.setNodeValue(canDo,flag);
		return 1;
	}
	public static String judgeCanDo(PersistenceBroker db,String calssDate,String tableField,String fieldValue,String currentValue,String courseId){
		    String canDo="0";
		    Connection cn = null;
			Statement st = null;
			ResultSet rs = null;
			String sql="select CourseID,classNoon from course where classDate='"+calssDate+"' and "+tableField+"='"+ fieldValue+"' and courseId !='"+courseId+"'";
			//System.out.print("====================sql:"+sql);
			String classNoon="";
			int courseID=-1;
			String strCourseID="";
			
		   try{		   	
		   	   cn=db.getConnection();
		   	   st=cn.createStatement();
		   	   rs=st.executeQuery(sql);
		   	   while(rs.next()){
		     	 classNoon=rs.getString("ClassNoon");
		     	 courseID=rs.getInt("CourseID");
		         strCourseID=(new Integer(courseID)).toString();
		     	//System.out.print("======currentValue:"+currentValue+"==============classNoon:"+classNoon);
		     	 if(currentValue.equals(classNoon)){//��������һ�µ�
		     	 	canDo="-1";
		     	 	break;
		     	 }else if(classNoon.equals("3")&&!currentValue.equals("2")){//���������ȫ��Ŀγ�
		     	 	canDo="-1";
		     	 	break;
		     	 }else if(currentValue.equals("3")&&!classNoon.equals("2")){//�����ǰ��ȫ��Ŀγ�
		     	 	canDo="-1";
		     	 	break;
		     	 }
		   	   }
		  // 	 System.out.print("====================canDo:"+canDo);   
		    
		   }catch(Exception e){
		    System.out.print("=====================�жϽ�ʦ������Ѿ��а���:"+e);
		   }finally{
		   	try{
		   	if(rs!=null)rs.close();
		 	if(st!=null)st.close();
		 	if(cn!=null)cn.close();
		   	
		   }catch(Exception e){
		    e.printStackTrace();	
		   }
		   }
		   return canDo;
			
		}
}