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

public class StatisWorkLoad {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_StatisWorkLoad
	 * @bizlet_param passing="in_out" type="EOSEntity" value="WorkLoadCollect" name="" desc="此Entity 包括TeacherID ,BeginDate,EndDate,这三个Field"
	 */
	public static int BL_StatisWorkLoad(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		NodeList fieldList =(NodeList)param0.getChildNodes();
		String teacherID = "";
		String beginDate = "";
		String endDate = "";
		for(int i=0;i<fieldList.getLength();i++){
			Node fieldNode =(Node)fieldList.item(i);
			String fieldNodeName=fieldNode.getNodeName();
			if("TeacherID".equalsIgnoreCase(fieldNodeName)){
				teacherID = XmlUtil.getNodeValue(fieldNode); //得到教师ID	
			}else if("BeginDate".equalsIgnoreCase(fieldNodeName)){
				beginDate =  XmlUtil.getNodeValue(fieldNode); //得到开始时间
			}else if("EndDate".equalsIgnoreCase(fieldNodeName)){
				endDate =  XmlUtil.getNodeValue(fieldNode);  //得到结束时间
			}
		}
		PersistenceBroker db = param.getDBBroker();  //得到数据库连接
		HashMap map = statisWorkLoad( db,teacherID,beginDate,endDate);
		
		
		Set s =map.keySet();
		Iterator it = s.iterator();
		while(it.hasNext()){
			String fName = (String) it.next();
			String fValue = (String) map.get(fName);
			Element fElement = doc.createElement(fName);
			XmlUtil.setNodeValue(fElement,fValue);
			param0.appendChild(fElement);
			
		}
		
		
		return 1;
	}
	
	/*====上课统计
	 * 工作量统计 有三个级别 局级 处级 其它  在字段classid =levelid =表classLevl
	 * 有三种参入类型 teachers   tutors  attenders
	 * 暂时分单班，合班,系统课，培训课，互动式教学
	 * 
	 * teachingmodeid  = 表educatingMode
	 * ismeldclass
	 * IsOutClass
	 * ====== 论文作业统计
	 *
	 * 
	 * 
	 */
	
	public static HashMap statisWorkLoad(PersistenceBroker db,String teacherID,String beginDate,String endDate){
		System.out.println(teacherID +"|"+beginDate+"|"+endDate);
		
		HashMap map = new HashMap();
		String teacherSql =" ((teachers like '%,"+teacherID+",%') or (teachers like '"+teacherID+"') or  (teachers like '"+teacherID+",%') or (teachers like '%,"+teacherID+"'))";
		String tutorsSql =" ((tutors like '%,"+teacherID+",%') or (tutors like '"+teacherID+"') or  (tutors like '"+teacherID+",%') or (tutors like '%,"+teacherID+"'))";
		String attendersSql ="  ((attenders like '%,"+teacherID+",%') or (attenders like '"+teacherID+"') or  (attenders like '"+teacherID+",%') or (attenders like '%,"+teacherID+"'))";
		
		String timeSql = " AND (classdate between '"+beginDate +"' and '"+endDate +"')";  //时间Sql
		String sql = "select count(*) as Num from CourseClass  where "+teacherSql+timeSql;  //公用的Sql
		String teachMode[] = new String[6]; //教学模式
		
		teachMode[0] = " AND (EducatingMode =11 OR EducatingMode =13) AND IsMeldClass = 1";  //专题课合班
		teachMode[1] = " AND (EducatingMode =11 OR EducatingMode =13) AND IsMeldClass = 0";  //专题课单班
		
		teachMode[2] = " AND EducatingMode =15 ";  //系统课
		teachMode[3] = " AND EducatingMode =15 ";  //培训课
		
		teachMode[4] = " AND EducatingMode =15 AND IsOutClass = 0";  //互动课 全部本校
		teachMode[5] = " AND EducatingMode =15 AND IsOutClass = 1";  //互动课 含外请
		
		String classLevl[] = new String[3]; //课室级别
		classLevl[0] = " AND ClassLevl = 0"; //局级班
		classLevl[1] = " AND ClassLevl = 1"; //处级班
		classLevl[2] = " AND (ClassLevl != 0 AND ClassLevl != 1)"; //其它班
		
		
		int num[][] = new int[3][6];
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{	
			
			cn = db.getConnection();
			st = cn.createStatement();
			for(int i = 0;i<classLevl.length;i++){
				for(int j=0;j<teachMode.length;j++){
					String eachSql = sql + teachMode[j] +classLevl[i];
					System.out.println("----------------sql:"+eachSql);
					rs = st.executeQuery(eachSql);
					
					while(rs !=null && rs.next()){
						num[i][j] = rs.getInt(1);
					}
				    
					System.out.println("--------------num:"+num[i][j]);
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
		
		System.out.println("--------------num.length:"+num.length);
		HashMap convertMap =    getWorkLoadConvert(db);
		double convert[] = new double[6];
		convert[1] = Double.parseDouble((String)convertMap.get("1"));
		convert[0] = Double.parseDouble((String)convertMap.get("2"));
		convert[2] = Double.parseDouble((String)convertMap.get("5"));
		convert[3] = Double.parseDouble((String)convertMap.get("6"));
		convert[4] = Double.parseDouble((String)convertMap.get("3"));
		convert[5] = Double.parseDouble((String)convertMap.get("4"));

		double total = 0; 
		for(int i=0; i<num.length;i++){
			int jb = 0;
			double jbNum = 0;
			String jbName = "jb"+i;
			for(int j = 0;j<num[i].length;j++){
				jb+=num[i][j];
				jbNum+=convert[j]*num[i][j];
				total +=convert[j]*num[i][j];
			}
			map.put(jbName,jb+"");
			map.put(jbName+"Num",jbNum+"");
			
		}
		for(int j=0; j<num[0].length;j++){
			int model = 0;
			double modelNum = 0;
			String modelName = "model"+j;
			for(int i = 0;i<num.length;i++){
				model+=num[i][j];
				modelNum +=num[i][j]*convert[j];
			}
			map.put(modelName,model+"");
			map.put(modelName+"Num",modelNum+"");
		}
		
		map.put("total",total+"");
		return map;
	}
	
	public static HashMap getWorkLoadConvert(PersistenceBroker db){
		
			
			HashMap map = new HashMap();
			String sql = "select * from workloadconvert  where isAdopted=1";  
		
			
			
			int num[][] = new int[3][6];
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
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_StatisWorkLoadByTeacher
	 * @bizlet_param passing="in_out" type="Variable" value="WorkLoadCollect" name="" desc="年度"
	 * @bizlet_param passing="in_out" type="Variable" value="WorkLoadCollect" name="" desc="时期"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="WorkLoadCollect" name="" desc="教师List"
	 */
	public static int BL_StatisWorkLoadByTeacher(Document doc, BizContext param)
		throws Exception {
		String yearth = (String) param.getParaObjectAt(0);
		String period = (String) param.getParaObjectAt(1);
		Node param2 = (Node) param.getParaObjectAt(2);
		
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
		PersistenceBroker db = param.getDBBroker();  //得到数据库连接
		HashMap map = statisWorkLoadByTeacher( db,yearth,period,list);
		
		
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
		
		return 1;
	}
	
	/*
	 * 返回以教师ID 为key 统计值构成ArrayList 的HashMap
	 */
	
	
	public static HashMap statisWorkLoadByTeacher(PersistenceBroker db,String yearth,String period,ArrayList teacherList){
			HashMap map = new HashMap();
			String sql = "select LessonsJB1,LessonsJB2,LessonsJB3,ClassSum  from workloadcollect  where yearth=? and period=? and teacherid=?";  
			
			int flag = Integer.parseInt(period);
			Iterator it = teacherList.iterator();
			switch (flag){
			case 1:  //上半年
			while(it.hasNext()){
				HashMap teacherMap = (HashMap) it.next();
				String teacherID = (String)teacherMap.get("TeacherID");
				ArrayList list = new ArrayList();
				Connection cn = null;
				PreparedStatement st = null;
				ResultSet rs = null;
				try{
					cn = db.getConnection();
					st = cn.prepareStatement(sql);
				    st.setInt(1,Integer.parseInt(yearth));
				    st.setInt(2,Integer.parseInt(period));
				    st.setInt(3,Integer.parseInt(teacherID));
				    rs = st.executeQuery();
				    double LessonsJB1=0;
				    double LessonsJB2=0;
				    double LessonsJB3=0;
				    double ClassSum =0;
					while(rs !=null && rs.next()){
								LessonsJB1 = (double)rs.getDouble(1);
								LessonsJB2 = (double)rs.getDouble(2);
								LessonsJB3 = (double)rs.getDouble(3);
								ClassSum = (double)rs.getDouble(4);
					}
					list.add(LessonsJB1+"");
					list.add("");
					list.add(LessonsJB2+"");
					list.add("");
					list.add(LessonsJB3+"");
					list.add("");
					list.add(ClassSum-LessonsJB1-LessonsJB2-LessonsJB3+"");
					list.add("");
					list.add("");
					list.add("");
					list.add("");
					list.add("");
					list.add(ClassSum+"");
					map.put(teacherID,list);
					
	
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
			}
			break;
			
			
			case 2:  //下半年
				while(it.hasNext()){
					HashMap teacherMap = (HashMap) it.next();
					String teacherID = (String)teacherMap.get("TeacherID");
					ArrayList list = new ArrayList();
					Connection cn = null;
					PreparedStatement st = null;
					ResultSet rs = null;
					try{
						cn = db.getConnection();
						st = cn.prepareStatement(sql);
					    st.setInt(1,Integer.parseInt(yearth));
					    st.setInt(2,Integer.parseInt(period));
					    st.setInt(3,Integer.parseInt(teacherID));
					    rs = st.executeQuery();
					    double LessonsJB1=0;
					    double LessonsJB2=0;
					    double LessonsJB3=0;
					    double ClassSum =0;
						while(rs !=null && rs.next()){
									LessonsJB1 = (double)rs.getDouble(1);
									LessonsJB2 = (double)rs.getDouble(2);
									LessonsJB3 = (double)rs.getDouble(3);
									ClassSum = (double)rs.getDouble(4);
						}
						list.add("");
						list.add(LessonsJB1+"");
						list.add("");
						list.add(LessonsJB2+"");
						list.add("");
						list.add(LessonsJB3+"");
						list.add("");
						list.add(ClassSum-LessonsJB1-LessonsJB2-LessonsJB3+"");
						list.add("");
						list.add("");
						list.add("");
						list.add("");
						list.add(ClassSum+"");
						map.put(teacherID,list);
						
		
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
				}
				break;
			case 3:
				while(it.hasNext()){
					HashMap teacherMap = (HashMap) it.next();
					String teacherID = (String)teacherMap.get("TeacherID");
					ArrayList list = new ArrayList();
					Connection cn = null;
					PreparedStatement st = null;
					PreparedStatement st2 = null;
					ResultSet rs = null;
					ResultSet rs2 = null;
					try{
						cn = db.getConnection();
						st = cn.prepareStatement(sql);
					    st.setInt(1,Integer.parseInt(yearth));
					    st.setInt(2,1);
					    st.setInt(3,Integer.parseInt(teacherID));
					    rs = st.executeQuery();
					    double LessonsJB1=0;
					    double LessonsJB2=0;
					    double LessonsJB3=0;
					    double ClassSum =0;
					    double LessonsJB12=0;
					    double LessonsJB22=0;
					    double LessonsJB32=0;
					    double ClassSum2 =0;
						while(rs !=null && rs.next()){
									LessonsJB1 = (double)rs.getDouble(1);
								    LessonsJB2 = (double)rs.getDouble(2);
									LessonsJB3 = (double)rs.getDouble(3);
								    ClassSum = (double)rs.getDouble(4);	
						}
						st2 = cn.prepareStatement(sql);
					    st2.setInt(1,Integer.parseInt(yearth));
					    st2.setInt(2,2);
					    st2.setInt(3,Integer.parseInt(teacherID));
					    rs2 = st.executeQuery();
						while(rs2 !=null && rs2.next()){
									LessonsJB12 = (double)rs2.getDouble(1);
									LessonsJB22 = (double)rs2.getDouble(2);
									LessonsJB32 = (double)rs2.getDouble(3);
									ClassSum2 = (double)rs2.getDouble(4);	
						}
						
						list.add(LessonsJB1+"");
						list.add(LessonsJB12+"");
						list.add(LessonsJB2+"");
						list.add(LessonsJB22+"");
						list.add(LessonsJB3+"");
						list.add(LessonsJB32+"");
						list.add(ClassSum-LessonsJB1-LessonsJB2-LessonsJB3+"");
						list.add(ClassSum2-LessonsJB12-LessonsJB22-LessonsJB32+"");
						list.add("");
						list.add("");
						list.add("");
						list.add("");
						list.add(ClassSum+ClassSum2+"");
						map.put(teacherID,list);
						
		
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
				}
				break;
			}
			return map;
	}

}
	
	
	
	
	

	