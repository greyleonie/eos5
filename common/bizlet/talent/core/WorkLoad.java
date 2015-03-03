package talent.core;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-5-10
 * @class_displayName StatisWorkLoad
 */

public class WorkLoad {
	/*====�Ͽ�ͳ��
	 * ������ͳ�� ���������� �ּ� ���� ����  ���ֶ�classid =levelid =��classLevl
	 * �����ֲ������� teachers   tutors  attenders
	 * ��ʱ�ֵ��࣬�ϰ�,ϵͳ�Σ���ѵ�Σ�����ʽ��ѧ
	 * 
	 * teachingmodeid  = ��educatingMode
	 * ismeldclass
	 * IsOutClass
	 *
	 * 
	 * 
	 */
	
	public static double countLesson(PersistenceBroker db,String id,int jb,String beginDate,String endDate,String type){
		double total = 0; 
		String orgSql = " AND TeachingGroupID ="+id;
		String teacherSql =" AND ((teachers like '%,"+id+",%') or (teachers like '"+id+"') or  (teachers like '"+id+",%') or (teachers like '%,"+id+"'))";
		String tutorsSql =" AND ((tutors like '%,"+id+",%') or (tutors like '"+id+"') or  (tutors like '"+id+",%') or (tutors like '%,"+id+"'))";
		String attendersSql =" AND  ((attenders like '%,"+id+",%') or (attenders like '"+id+"') or  (attenders like '"+id+",%') or (attenders like '%,"+id+"'))";
		
		String timeSql = " AND (classdate between '"+beginDate +"' and '"+endDate +"')";  //ʱ��Sql
		
		String teachMode[] = new String[6]; //��ѧģʽ
		
		teachMode[0] = " AND (EducatingMode =11 OR EducatingMode =13) AND IsMeldClass = 1";  //ר��κϰ�
		teachMode[1] = " AND (EducatingMode =11 OR EducatingMode =13) AND IsMeldClass = 0";  //ר��ε���
		
		teachMode[2] = " AND EducatingMode =7 ";  //ϵͳ��
		teachMode[3] = " AND EducatingMode is null ";  //��ѵ��
		
		teachMode[4] = " AND EducatingMode =15 AND IsOutClass = 0";  //������ ȫ����У
		teachMode[5] = " AND EducatingMode =15 AND IsOutClass = 1";  //������ ������
		
		
		String classLevl[] = new String[3]; //���Ҽ���
		classLevl[0] = " AND ClassLevl = 1"; //�ּ���
		classLevl[1] = " AND ClassLevl = 2"; //������
		classLevl[2] = " AND ((ClassLevl != 1 AND ClassLevl != 2) or ClassLevl is null)"; //������
		String sql = "";
		if("Teacher".equalsIgnoreCase(type)){
			sql = "select count(*) as Num from CourseClass  where 1=1 "+teacherSql+timeSql+classLevl[jb];  //���õ�Sql
		}else{
			sql = "select count(*) as Num from CourseClass  where 1=1 "+orgSql+timeSql+classLevl[jb];  //���õ�Sql
		}

		int num[] = new int[6];
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{	
			
			cn = db.getConnection();
			st = cn.createStatement();
				for(int i=0;i<teachMode.length;i++){
					String eachSql = sql + teachMode[i];
					System.out.println("--------------eachSql:"+eachSql);
					rs = st.executeQuery(eachSql);
					
					if(rs !=null && rs.next()){
						num[i] = rs.getInt(1);
					}
				}
			
		}catch(Exception e){
			System.out.println("--------------error:"+e);
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		
		HashMap convertMap =    getWorkLoadConvert(db);
		double convert[] = new double[6];
		convert[0] = Double.parseDouble((String)convertMap.get("2"));//ר��κϰ�
		convert[1] = Double.parseDouble((String)convertMap.get("1"));//ר��ε���
		convert[2] = Double.parseDouble((String)convertMap.get("6"));//ϵͳ��
		convert[3] = Double.parseDouble((String)convertMap.get("5"));//��ѵ��
		convert[4] = Double.parseDouble((String)convertMap.get("3"));//������ ȫ����У
		convert[5] = Double.parseDouble((String)convertMap.get("4"));//������ ������

		for(int i=0; i<num.length;i++){
				total +=convert[i]*num[i];
		}
		return total;
	}
	
	
	public static int countPerson(PersistenceBroker db,String id,String beginDate,String endDate){
		
		int  total = 0; 
		String timeSql = " AND (classdate between '"+beginDate +"' and '"+endDate +"')";  //ʱ��Sql
		String sql = " select  count(*) as Num from CourseClass  where 1=1 "+timeSql+" AND TeachingGroupID ="+id;
		
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{	
			
			cn = db.getConnection();
			st = cn.createStatement();
		    rs = st.executeQuery(sql);
		    if(rs !=null && rs.next()){
				total = rs.getInt(1);
			}
			
		}catch(Exception e){
			System.out.println("--------------error:"+e);
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		return total;
	}
	
	
	
	/*
	 * �õ�������ͳ�Ʊ�׼
	 */
	
	
	public static HashMap getWorkLoadConvert(PersistenceBroker db){
		
			
			HashMap map = new HashMap();
			String sql = "select * from workloadconvert  where isAdopted=1";  
			
			Connection cn = null;
			Statement st = null;
			ResultSet rs = null;
			try{	
				
				cn = db.getConnection();
				st = cn.createStatement();
			    rs = st.executeQuery(sql);
				while(rs !=null && rs.next()){
							int convertID =(int) rs.getInt(1);
							double classNum = (double)rs.getDouble(4);
							map.put(convertID+"",classNum+"");
				}

			}catch(Exception e){
				System.out.println("--------------error:"+e);
				
			}finally{
				try{
					if(rs!=null) rs.close();
					if(st!=null) st.close();
					if(cn!=null) cn.close();
					
				}catch(Exception ep){
					ep.printStackTrace();
					
				}
			}
			
			return map;


	}

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_StatisWorkLoadByDept
	 * @bizlet_param passing="in_out" type="Variable" value="" name="" desc="���"
	 * @bizlet_param passing="in_out" type="Variable" value="" name="" desc="ʱ��"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="" name="" desc="����List"
	 * @bizlet_param passing="in_out" type="Variable" value="" name="" desc="��ʼʱ��"
	 * @bizlet_param passing="in_out" type="Variable" value="" name="" desc="����ʱ��"
	 * @bizlet_param passing="in_out" type="Variable" value="" name="" desc="��ʼʱ��2"
	 * @bizlet_param passing="in_out" type="Variable" value="" name="" desc="����ʱ��2"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="" name="" desc="����Total"
	 */
	public static int BL_StatisWorkLoadByDept(Document doc, BizContext param)
		throws Exception {
		String yearth = (String) param.getParaObjectAt(0);
		String period = (String) param.getParaObjectAt(1);
		Node param2 = (Node) param.getParaObjectAt(2);
		String beginDate = (String) param.getParaObjectAt(3);
		String endDate = (String) param.getParaObjectAt(4);
		String beginDate2 = (String) param.getParaObjectAt(5);
		String endDate2 = (String) param.getParaObjectAt(6);
		Node param7 = (Node) param.getParaObjectAt(7);
		
		ArrayList list = new ArrayList();
		NodeList eList = param2.getChildNodes();
		for(int i=0;i<eList.getLength();i++){
			HashMap inMap = new HashMap();
			Node eNode = eList.item(i);
			NodeList fList = eNode.getChildNodes();
			for(int j=0; j<fList.getLength();j++){
				Node fNode = fList.item(j);
				String fNodeName = fNode.getNodeName();
				String fNodeValue = XmlUtil.getNodeValue(fNode);
				inMap.put(fNodeName,fNodeValue);
			}
			list.add(i,inMap);
		}
		PersistenceBroker db = param.getDBBroker();  //�õ����ݿ�����
		HashMap map = statisWorkLoadByDept( db,yearth,period,list,beginDate,endDate,beginDate2,endDate2);
		
		
		NodeList eList1 = param2.getChildNodes();
		for(int i=0;i<eList1.getLength();i++){
			String key = "";
			ArrayList newList = new ArrayList();
			Node eNode = eList.item(i);
			NodeList fList = eNode.getChildNodes();
			for(int j=0; j<fList.getLength();j++){
				Node fNode = fList.item(j);
				String fNodeName = fNode.getNodeName();
				String fNodeValue = XmlUtil.getNodeValue(fNode);
				if("orgID".equals(fNodeName)){
					key = fNodeValue;
				}
			}
			newList = (ArrayList)map.get(key); //�õ�����List
			Iterator it = newList.iterator();
			int k =0;
			while(it.hasNext()){
				k++;
				String value = (String)it.next();
				Element fieldElement = doc.createElement("a"+k);
				XmlUtil.setNodeValue(fieldElement,value);
				eNode.appendChild(fieldElement);
				
			}
		}
		ArrayList newList = (ArrayList)map.get("Total"); //�õ��ϼ�List
		Iterator it = newList.iterator();
		int k =0;
		while(it.hasNext()){
			k++;
			String value = (String)it.next();
			Element fieldElement = doc.createElement("a"+k);
			XmlUtil.setNodeValue(fieldElement,value);
			param7.appendChild(fieldElement);
			
		}
		
		return 1;
	}
	
	/*
	 * �����Բ���ID Ϊkey ͳ��ֵ����ArrayList ��HashMap
	 * ���л������key ΪTotal
	 */
	
	
	public static HashMap statisWorkLoadByDept(PersistenceBroker db,String yearth,String period,ArrayList orgList,String beginDate,String endDate,String beginDate2,String endDate2){
			HashMap map = new HashMap();
			ArrayList totalList = new ArrayList();	 //�ϼ�
			int PersonT = 0;
			int Person2T = 0;
			double LessonsJB1T = 0;
			double LessonsJB2T = 0;
			double LessonsJB3T = 0;
			
			double LessonsJB12T = 0;
			double LessonsJB22T = 0;
			double LessonsJB32T = 0;
			double ClassSumT = 0;
			

			Iterator it = orgList.iterator();
			
		
				while(it.hasNext()){
					HashMap orgMap = (HashMap) it.next();
					String orgID = (String)orgMap.get("orgID");
					ArrayList list = new ArrayList();
					int Person = countPerson(db,orgID,beginDate,endDate);
					int Person2 = countPerson(db,orgID,beginDate2,endDate2);
					double LessonsJB1 = countLesson(db,orgID,0,beginDate,endDate,"Org"); 
					double LessonsJB2 = countLesson(db,orgID,1,beginDate,endDate,"Org");
					double LessonsJB3 = countLesson(db,orgID,2,beginDate,endDate,"Org");
					
					double LessonsJB12 = countLesson(db,orgID,0,beginDate2,endDate2,"Org"); 
					double LessonsJB22 = countLesson(db,orgID,1,beginDate2,endDate2,"Org");
					double LessonsJB32 = countLesson(db,orgID,2,beginDate2,endDate2,"Org");
					
					double ClassSum = LessonsJB1 + LessonsJB2 + LessonsJB3+LessonsJB12 + LessonsJB22+ LessonsJB32;
					
					PersonT+=Person;
					Person2T+=Person2;
					
					LessonsJB1T+=LessonsJB1;
					LessonsJB2T+=LessonsJB2;
					LessonsJB3T+=LessonsJB3;
					
					LessonsJB12T+=LessonsJB12;
					LessonsJB22T+=LessonsJB22;
					LessonsJB32T+=LessonsJB32;
					
					ClassSumT = LessonsJB1T + LessonsJB2T + LessonsJB3T + LessonsJB12T + LessonsJB22T + LessonsJB32T;
					
					

						list.add(numToStr(Person));
						list.add("");
						list.add(numToStr(Person2));
						list.add("");
						
						list.add(numToStr(LessonsJB1));
						list.add(numToStr(LessonsJB12));
						list.add(numToStr(LessonsJB2));
						list.add(numToStr(LessonsJB22));
						list.add(numToStr(LessonsJB3));
						list.add(numToStr(LessonsJB32));
						
						list.add("");
						list.add("");
						
						list.add("");
						list.add("");
						list.add("");
						list.add("");
						
						list.add(numToStr(ClassSum));
						map.put(orgID,list);
					}
				
			totalList.add(numToStr(PersonT));
			totalList.add("");
			totalList.add(numToStr(Person2T));
			totalList.add("");
			totalList.add(numToStr(LessonsJB1T));
			totalList.add(numToStr(LessonsJB12T));
			totalList.add(numToStr(LessonsJB2T));
			totalList.add(numToStr(LessonsJB22T));
			totalList.add(numToStr(LessonsJB3T));
			totalList.add(numToStr(LessonsJB32T));
			
			totalList.add("");
			totalList.add("");
			
			totalList.add("");
			totalList.add("");
			totalList.add("");
			totalList.add("");
			
			totalList.add(numToStr(ClassSumT));
			map.put("Total",totalList);
		
			return map;
	}
	
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_StatisWorkLoadByTeacher
		 * @bizlet_displayName BL_StatisWorkLoadByTeacher
	 * @bizlet_param passing="in_out" type="Variable" value="" name="" desc="���"
	 * @bizlet_param passing="in_out" type="Variable" value="" name="" desc="ʱ��"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="" name="" desc="��ʦList"
	 * @bizlet_param passing="in_out" type="Variable" value="" name="" desc="��ʼʱ��"
	 * @bizlet_param passing="in_out" type="Variable" value="" name="" desc="����ʱ��"
	 * @bizlet_param passing="in_out" type="Variable" value="" name="" desc="��ʼʱ��2"
	 * @bizlet_param passing="in_out" type="Variable" value="" name="" desc="����ʱ��2"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="" name="" desc="����Total"
	 */
	public static int BL_StatisWorkLoadByTeacher(Document doc, BizContext param)
		throws Exception {
		String yearth = (String) param.getParaObjectAt(0);
		String period = (String) param.getParaObjectAt(1);
		Node param2 = (Node) param.getParaObjectAt(2);
		String beginDate = (String) param.getParaObjectAt(3);
		String endDate = (String) param.getParaObjectAt(4);
		String beginDate2 = (String) param.getParaObjectAt(5);
		String endDate2 = (String) param.getParaObjectAt(6);
		Node param7 = (Node) param.getParaObjectAt(7);
		
		ArrayList list = new ArrayList();
		NodeList eList = param2.getChildNodes();
		for(int i=0;i<eList.getLength();i++){
			HashMap inMap = new HashMap();
			Node eNode = eList.item(i);
			NodeList fList = eNode.getChildNodes();
			for(int j=0; j<fList.getLength();j++){
				Node fNode = fList.item(j);
				String fNodeName = fNode.getNodeName();
				String fNodeValue = XmlUtil.getNodeValue(fNode);
				inMap.put(fNodeName,fNodeValue);
			}
			list.add(i,inMap);
		}
		PersistenceBroker db = param.getDBBroker();  //�õ����ݿ�����
		HashMap map = statisWorkLoadByTeacher( db,yearth,period,list,beginDate,endDate,beginDate2,endDate2);
		
		
		NodeList eList1 = param2.getChildNodes();
		for(int i=0;i<eList1.getLength();i++){
			String key = "";
			ArrayList newList = new ArrayList();
			Node eNode = eList.item(i);
			NodeList fList = eNode.getChildNodes();
			for(int j=0; j<fList.getLength();j++){
				Node fNode = fList.item(j);
				String fNodeName = fNode.getNodeName();
				String fNodeValue = XmlUtil.getNodeValue(fNode);
				if("TeacherID".equals(fNodeName)){
					key = fNodeValue;
				}
			}
			newList = (ArrayList)map.get(key);
			Iterator it = newList.iterator();
			int k =0;
			while(it.hasNext()){
				k++;
				String value = (String)it.next();
				Element fieldElement = doc.createElement("a"+k);
				XmlUtil.setNodeValue(fieldElement,value);
				eNode.appendChild(fieldElement);
				
			}
		}
		ArrayList totalList = (ArrayList)map.get("Total");
		Iterator it = totalList.iterator();
		int k =0;
		while(it.hasNext()){
			k++;
			String value = (String)it.next();
			Element fieldElement = doc.createElement("a"+k);
			XmlUtil.setNodeValue(fieldElement,value);
			param7.appendChild(fieldElement);
			
		}
		return 1;
	}
	
	/*
	 * �����Խ�ʦID Ϊkey ͳ��ֵ����ArrayList ��HashMap
	 */
	
	
	public static HashMap statisWorkLoadByTeacher(PersistenceBroker db,String yearth,String period,ArrayList teacherList,String beginDate,String endDate,String beginDate2,String endDate2){
			HashMap map = new HashMap();
			
			ArrayList totalList = new ArrayList();	//�ϼ�
			double LessonsJB1T = 0;
			double LessonsJB2T = 0;
			double LessonsJB3T = 0;
			
			double LessonsJB12T = 0;
			double LessonsJB22T = 0;
			double LessonsJB32T = 0;
			
			double ClassSumT = 0;
			
			Iterator it = teacherList.iterator();
				while(it.hasNext()){
					HashMap teacherMap = (HashMap) it.next();
					String teacherID = (String)teacherMap.get("TeacherID");
					ArrayList list = new ArrayList();

					double LessonsJB1 = countLesson(db,teacherID,0,beginDate,endDate,"Teacher"); 
					double LessonsJB2 = countLesson(db,teacherID,1,beginDate,endDate,"Teacher");
					double LessonsJB3 = countLesson(db,teacherID,2,beginDate,endDate,"Teacher");
					
					
					
					double LessonsJB12 = countLesson(db,teacherID,0,beginDate2,endDate2,"Teacher"); ;
					double LessonsJB22 = countLesson(db,teacherID,1,beginDate2,endDate2,"Teacher"); ;
					double LessonsJB32 = countLesson(db,teacherID,2,beginDate2,endDate2,"Teacher"); ;
					double ClassSum =  LessonsJB1+ LessonsJB2+ LessonsJB3+LessonsJB12+ LessonsJB22+ LessonsJB32;
					LessonsJB1T +=LessonsJB1;
					LessonsJB2T +=LessonsJB2;
					LessonsJB3T +=LessonsJB3;
					LessonsJB12T +=LessonsJB12;
					LessonsJB22T +=LessonsJB22;
					LessonsJB32T +=LessonsJB32;
					ClassSumT +=ClassSum;
						list.add(numToStr(LessonsJB1));
						list.add(numToStr(LessonsJB12));
						list.add(numToStr(LessonsJB2));
						list.add(numToStr(LessonsJB22));
						list.add(numToStr(LessonsJB3));
						list.add(numToStr(LessonsJB32));
						list.add("");
						list.add("");
						list.add("");
						list.add("");
						list.add("");
						list.add("");
						list.add(numToStr(ClassSum));
						map.put(teacherID,list);
			 }
			totalList.add(numToStr(LessonsJB1T));
			totalList.add(numToStr(LessonsJB12T));
			totalList.add(numToStr(LessonsJB2T));
			totalList.add(numToStr(LessonsJB22T));
			totalList.add(numToStr(LessonsJB3T));
			totalList.add(numToStr(LessonsJB32T));
			totalList.add("");
			totalList.add("");
			totalList.add("");
			totalList.add("");
			totalList.add("");
			totalList.add("");
			totalList.add(numToStr(ClassSumT));
			map.put("Total",totalList);
		
			
		
			return map;
	}
	
	
	
	public static String  numToStr(double num){
		String retStr ="";
		if(num != 0){
			retStr = num +"";
		}
		return retStr;
	}

	public static String  numToStr(int num){
		String retStr ="";
		if(num != 0){
			retStr = num +"";
		}
		return retStr;
	}
}
	
	
	
	
	

	