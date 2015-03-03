package student.score;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;


import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-11
 * @class_displayName StudentScoreInit
 */

public class StudentScoreManage {

	/**
	 * ��ʼ���༶�ɼ�
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName initScore
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����classID"
	 */
	public static int initScore(Document doc, BizContext param)
		throws Exception {
		String ClassID = (String) param.getParaObjectAt(0);
		PersistenceBroker db = param.getDBBroker();
		Connection cn = null;
		Statement st = null;
		
		
		String delStr="delete score  where studentID in (select studentID from student where classID="+ClassID+")";
		String insertStr="INSERT INTO Score  (StudentID, subjectid,score) "+
				"SELECT s.StudentID, c.subjectID,c.defaultScore " +
				"FROM Student s ,ClassSubject c where  s.classID=c.classID and s.classID="+ClassID;
		String updateStr="update Score  set Score.score=" +
				"(select t.score from Thesis t,ClassSubject c where  Score.studentid=t.studentid and c.subjectID=Score.subjectID and c.subjecttype=4)" +
				"where  exists ( select 1 from ClassSubject c where   c.subjectID=Score.subjectID and c.subjecttype=4)" +
				"and Score.studentID in (select studentID from student where classID="+ClassID+")";
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			st.executeUpdate(delStr);  //��ɾ��ԭ������
			st.executeUpdate(insertStr); //��ʼ������
			st.executeUpdate(updateStr); //�����ı��еó��ɼ����³ɼ���
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			try{
				
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
		}
		return 1;
	}

	/**
	 * �ɼ��޸ı���
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName saveScore
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="���� listfcc"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="���� QueryClassSubject   (�༶��Ŀ)"
	 */
	public static int saveScore(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		PersistenceBroker db = param.getDBBroker();
		NodeList fcclist=param0.getChildNodes();
		Element subject=(Element) param1;
		Connection cn = null;
		Statement st = null;
		ResultSet rs=null;
		try{
			cn = db.getConnection();
			st = cn.createStatement();
			
			int startRow=Integer.parseInt(subject.getElementsByTagName("startRow").item(0).getFirstChild().getNodeValue());
			int endRow=Integer.parseInt(subject.getElementsByTagName("endRow").item(0).getFirstChild().getNodeValue());
			for(int i=0;i<fcclist.getLength();i++){
				Element result=(Element)fcclist.item(i);
				int studentID=Integer.parseInt(result.getElementsByTagName("field0").item(0).getFirstChild().getNodeValue());
				rs=st.executeQuery("select * from Score where StudentID="+studentID);//�ó�ĳһѧ�����гɼ�
				HashMap tempMap=new HashMap();
				while(rs.next()) {
					String SubjectID=rs.getString("SubjectID");
					String Score=rs.getString("Score");
					if (Score==null)
						Score="";
					if(SubjectID!=null)
						tempMap.put(SubjectID,Score);
				}
				
				for(int j=startRow;j<endRow;j++){
					try{
						String SubjectID=subject.getElementsByTagName("SubjectID"+j).item(0).getFirstChild().getNodeValue();
						Object score=tempMap.get(SubjectID); //ԭ���ĳɼ�
						String reScore=result.getElementsByTagName("field"+j).item(0).getFirstChild().getNodeValue();//�޸ĺ�ɼ���ֵ
						if (reScore==null)
							reScore="";
						else
							reScore=reScore.trim();
						if(score==null){ //���û�гɼ���������
							String insertSql="insert into Score (StudentID,SubjectID,Score) values ("+studentID+","+SubjectID+",'"+reScore+"')";
							st.executeUpdate(insertSql);
						}
						else{
							if(!score.toString().equals(reScore)){ //���ԭ�ɼ����޸ĺ�ɼ�����ȣ����޸�
								String updateSql="update Score set Score='"+reScore+"' where StudentID=" + studentID + " and SubjectID=" + SubjectID;
								st.executeUpdate(updateSql);
							}
						}
					}
					catch(Exception ex){
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
		}
		return 1;
	}
	/**
	 * ��ʼ���༶��Ŀ
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName initSubject
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����ClassID"
	 */
	public static int initSubject(Document doc, BizContext param) throws Exception{
		String ClassID = (String) param.getParaObjectAt(0);
		PersistenceBroker db = param.getDBBroker();
		Connection cn = null;
		Statement st = null;
		Statement st2 = null;
		ResultSet rs=null;
		ResultSet rs2=null;
		String subjectSql = "select SubjectID,Subject from ClassSubject where SubjectType!=3  and classID="+ClassID;
//		String delStr="delete ClassSubject  where SubjectType!=3  and classID="+ClassID;
		String planSql="select * from TeachingPlanUnit where (ScoringMethod='1' or ScoringMethod='3' ) and  classID="+ClassID;
		String courseSql="select * from Course where (ScoringMethod='1' or ScoringMethod='3' ) and  classID="+ClassID;
		List list = new ArrayList();
		int i = 0;
		boolean flag = false;
		try{
			cn = db.getConnection();
			
			st2 = cn.createStatement();
			st = cn.createStatement();
			rs=st.executeQuery(subjectSql); //��ѯ���������Ľ�ѧ��Ԫ
			while(rs.next()){
				
				int SubjectID = rs.getInt("SubjectID");
				String Subject = rs.getString("Subject");
				String delStr = "delete ClassSubject  where SubjectID =" + SubjectID;
				try{
					st2.executeUpdate(delStr);
				}
				catch(Exception e){
					list.add(i,Subject);
					e.printStackTrace();
				}
				i++;
			}
			st2.close();
			
//			st2 = cn.createStatement();
//			
//			try{
//				st2.executeUpdate(delStr);  //��ɾ��ԭ������
//			}
//			catch(Exception e){
//				
//			}
//			st2.close();
			st2 = cn.createStatement();
			st = cn.createStatement();
			rs=st.executeQuery(planSql); //��ѯ���������Ľ�ѧ��Ԫ
			int order=1;
			while(rs.next()){
				String UnitTitle=rs.getString("UnitTitle");
				for(i=0;i<list.size();i++){
					String Subject = (String)list.get(i);
					if(UnitTitle.equals(Subject)) {
						flag = true;
						break;
					}
				}
				
				String ScoringMethod=rs.getString("ScoringMethod");
				int ClassHour=rs.getInt("ClassHour");
				String defaultScore="����";
				if(ScoringMethod!=null&&ScoringMethod.equals("3")){
					ScoringMethod="2"; //�ٷ���
					defaultScore="60";
				}
				if(!flag){
				String insertStr="insert into ClassSubject(ClassID,Subject,SubjectNO,SubjectType,ScoreMethod,ClassHours,DefaultScore) " +
						" values ("+ClassID+",'"+UnitTitle+"',"+order+",1,"+ScoringMethod+","+ClassHour+",'"+defaultScore+"')";	
				st2.executeUpdate(insertStr);
				order=order+1;
				}
				flag = false;
			}
			st.close();
			st = cn.createStatement();
			rs2=st.executeQuery(courseSql); //��ѯ���������Ŀγ�
			while(rs2.next()){
				String CourseTitle=rs2.getString("CourseTitle");
				for(i=0;i<list.size();i++){
					String Subject = (String)list.get(i);
					if(CourseTitle.equals(Subject)) {
						flag = true;
						break;
					}
				}
				String ScoringMethod=rs2.getString("ScoringMethod");
				int ClassHour=rs2.getInt("ClassHour");
				String defaultScore="����";
				if(ScoringMethod!=null&&ScoringMethod.equals("3")){
					ScoringMethod="2"; //�ٷ���
					defaultScore="60";
				}
				if(!flag){
				String insertStr="insert into ClassSubject(ClassID,Subject,SubjectNO,SubjectType,ScoreMethod,ClassHours,DefaultScore) " +
						" values ("+ClassID+",'"+CourseTitle+"',"+order+",2,"+ScoringMethod+","+ClassHour+",'"+defaultScore+"')";	
				st2.executeUpdate(insertStr);
				order=order+1;
				}
				flag = false;
			}
			st.close();
			
			String subSql = "select SubjectID from ClassSubject where classID=" + ClassID + " order by SubjectType ";
			st = cn.createStatement();
			rs=st.executeQuery(subSql); 
			int k= 0;
			while(rs.next()){
				k++;
				int SubjectID = rs.getInt("SubjectID");
				String updatesql = "update ClassSubject set SubjectNO = "+ k +" where SubjectID = " + SubjectID;
				try{
					st2.executeUpdate(updatesql);
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
//			String insertLW="insert into ClassSubject(ClassID,Subject,SubjectNO,SubjectType,ScoreMethod,DefaultScore) " +
//			" values ("+ClassID+",'����',"+order+",4,2,'����')";	
//			st.close();
//			st = cn.createStatement();
//			st.executeUpdate(insertLW);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(rs2!=null) rs2.close();
				if(st!=null) st.close();
				if(st2!=null) st2.close();
				if(cn!=null) cn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			
		}
		return 1;
	}
}