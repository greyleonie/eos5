package talent.core;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-23
 * @class_displayName CheckDraft
 */

public class CheckDraft {
	static String message="";
	static StringBuffer msgSB=new StringBuffer();
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_checkDraft
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="��ѧ�ƻ���ʼ����"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="��ѧ�ƻ���������"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�༶id"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="��������Ƿ��ͻ��Ϣ"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="��������Ƿ��ͻ��Ϣ"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="�����ʦ�Ƿ��ͻ��Ϣ"
	 */
	public static int BL_checkDraft(Document doc, BizContext param)
		throws Exception {
		String beg = (String) param.getParaObjectAt(0);
		String end = (String) param.getParaObjectAt(1);
		String classId = (String) param.getParaObjectAt(2);
		Node draftAtMe = (Node) param.getParaObjectAt(3);//�����Ƿ��ͻ
		Node draftAtClassRoom = (Node) param.getParaObjectAt(4);//�����Ƿ��ͻ
		Node draftAtTeacher = (Node) param.getParaObjectAt(5);//��ʦ�Ƿ��ͻ
		PersistenceBroker db = param.getDBBroker();
		String draftArray[]=CheckDraft.iterateCourse(db,classId,beg,end);
		//System.out.println("====draftArray[0]:"+draftArray[0]+"=====draftArray[1]:"+draftArray[1]+"=====draftArray[2]:"+draftArray[2]);
	
		XmlUtil.setNodeValue(draftAtMe,draftArray[0]);
		XmlUtil.setNodeValue(draftAtClassRoom,draftArray[1]);
		XmlUtil.setNodeValue(draftAtTeacher,draftArray[2]);
	
		return 1;
	}
	
	
	
	
	public static String[]  iterateCourse(PersistenceBroker db,String classId,String beg,String end){
	   
	    Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");		
		String sqls[]=new String [3];
		String drafts[]=new String[3];
		String appendSql=" and ( c1.classid="+classId+" or c2.classid="+classId+")";//������ӵ�
		
		for(int i=0;i<3;i++){
			 drafts[i]="";
		}
		
		//����γ��Ƿ��ͻ
		sqls[0]="select   c1.CourseID from course c1,course c2 "+
                " where  c1.courseid!=c2.courseid and c1.classdate=c2.classdate and c1.classid=c2.classid "+
                " and c1.classdate between '"+beg+"' and '"+end+"' "+
                " and c1.classid="+classId+"  and c1.isAdopted='1' and c2.isAdopted=1"+
                " and ((c1.classNoon=c2.classNoon ) or (c1.classnoon='3' and c2.classnoon<2) or (c2.classnoon='3' and c1.classnoon<2))";


		//�����Ƿ��ͻ
		sqls[1]="select c1.CourseID from course c1,course c2  where c1.courseid!=c2.courseid "+
                " and c1.classdate=c2.classdate  and c1.classroomid=c2.classroomid "+           
                " and c1.classdate between '"+beg+"' and '"+end+"' and (c1.isAdopted=1 or c2.isAdopted=1 )"+
                " and ((c1.classNoon=c2.classNoon ) or (c1.classnoon='3' and c2.classnoon<2) or (c2.classnoon='3' and c1.classnoon<2))"+appendSql;
		//��ʦ�Ƿ��ͻ
		sqls[2]="select  c1.CourseID from course c1,course c2  where c1.courseid!=c2.courseid "+
		        " and c1.classdate between '"+beg+"' and '"+end+"' "+
                " and c1.classdate=c2.classdate  and c1.teachers=c2.teachers and (c1.isAdopted=1 or c2.isAdopted=1)"+
                " and ((c1.classnoon=c2.classnoon) or (c1.classnoon='3' or c2.classnoon='3')) "+
                " and ((c1.classNoon=c2.classNoon ) or (c1.classnoon='3' and c2.classnoon<2) or (c2.classnoon='3' and c1.classnoon<2))"+appendSql;
		
	
		try{
			    cn=db.getConnection();
		        st=cn.createStatement();
		        int courseId=-1;
		        String strCourseId="";
			   for(int i=0;i<3;i++){
			   	   if(i==2)
			    	//System.out.println("===============iterateCourse:"+sqls[i]);
			   	  rs=st.executeQuery(sqls[i]);
			   	  while(rs.next()){
			     	 courseId=rs.getInt("CourseID");
			     	 if(courseId>0){
			     	 	strCourseId=(new Integer(courseId)).toString();
			     	 }
			     	 if(drafts[i].equals("")){
			     	 	if(strCourseId!=null&&!strCourseId.equals(""))drafts[i]=strCourseId;
			     	 }else{
			     	 	if(strCourseId!=null&&!strCourseId.equals(""))drafts[i]+=","+strCourseId;
			     	 }
			   	  }//end while
			   	  
			   	  if(drafts[i].equals("")){
			   	    drafts[i]="-1";
			   	  }
			   	 
			   }//end for
			   	
			 
		}catch(Exception e){
			System.out.println("=======iterateCourse======errors:"+e);   
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception ep){
				System.out.println("==================checkDraft Exception:"+ep);
				
			}
		}
		
		return drafts;
	}

	// public static 
	
}