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
 * @class_displayName CheckTeacherDraft
 */

public class CheckTeacherDraft {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_checkTeacherDraft
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="ʱ��"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="���"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ڿ���ʦid"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="��ǰ�γ�id"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="���صĿγ�id"
	 */
	
	static String courseIds="";
	
	public static int BL_checkTeacherDraft(Document doc, BizContext param)
		throws Exception {
		String classDate = (String) param.getParaObjectAt(0);
		String classNoon=(String) param.getParaObjectAt(1);
		String teacherId = (String) param.getParaObjectAt(2);
		String currentCourseId = (String) param.getParaObjectAt(3);
		Node courseId = (Node) param.getParaObjectAt(4);
		PersistenceBroker db = param.getDBBroker();
		CheckTeacherDraft.courseIds="";
		CheckTeacherDraft.checkTeacherDraft(db,classDate,classNoon,teacherId,currentCourseId);
		//System.out.println("===============courseIds:"+CheckTeacherDraft.courseIds);
		XmlUtil.setNodeValue(courseId,CheckTeacherDraft.courseIds);
		return 1;
	}

	 public  static void checkTeacherDraft(PersistenceBroker db,String classDate,String currentNoon,String teacherId,String currentCourseID){
	 	String courseId="";
	 	Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		
		String sql="select courseId,classNoon from course where classDate='"+classDate+"' and Teachers="+teacherId;
		if(!currentCourseID.equals("")){
			sql+=" and courseId!="+currentCourseID;
		}
		try{
			cn=db.getConnection();
			st=cn.createStatement();
			rs=st.executeQuery(sql);
			//System.out.println("===============sql:"+sql);
			int courseID=-1;
			int classNoon=-1;
			
			String strCourseId="";
			String strNoon="";
			
			while(rs.next()){
			   courseID=rs.getInt("courseId");
			   classNoon=rs.getInt("ClassNoon");
			   
			   if(classNoon>-1){
			   	strNoon=new Integer(classNoon).toString();	
			   }//end if
			  
			   if(courseID>-1){
			   	strCourseId=new Integer(courseID).toString();
			   }
			 //  System.out.println("--------courseID:"+courseID+"-------classNoon:"+classNoon+"------currentNoon:"+currentNoon);
			   getCourseIds(currentNoon,strNoon,strCourseId);
				
			  
		  }//end while
		}catch(Exception e){
			System.out.println("===============errors:"+e);
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
	 
	public static void getCourseIds(String currentNoon,String strNoon,String strCourseId ){
		 if(currentNoon.equals(strNoon)){		//���һ��
		    if(CheckTeacherDraft.courseIds.equals("")){
		      	CheckTeacherDraft.courseIds=strCourseId;
		          }else{
		            	CheckTeacherDraft.courseIds+=","+strCourseId;
		      }//end else			
		 }else if(currentNoon.equals("3")&&!strNoon.equals("2")){//��ǰ��ȫ�죬���Ǵ������������
		 	if(CheckTeacherDraft.courseIds.equals("")){
			  	CheckTeacherDraft.courseIds=strCourseId;
			   }else{
			   	CheckTeacherDraft.courseIds+=","+strCourseId;
			    }//end else	
		 }//end else if
	 else if(strNoon.equals("3")&&!currentNoon.equals("2")){//��ǰ����������磬���Ǵ�����ȫ���
	 	if(CheckTeacherDraft.courseIds.equals("")){
		  	CheckTeacherDraft.courseIds=strCourseId;
		   }else{
		   	CheckTeacherDraft.courseIds+=","+strCourseId;
		    }//end else		 
	 }//end else if
	} 
	
}