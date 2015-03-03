package talent.core;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

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

public class StatisSubject {
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName  BL_StatisSubject
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入课题List"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入班级List"
     * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="返回带统计数据的教研部List"
     * @bizlet_param passing="int_out" type="EOSEntity" value="/" name="" desc="返回总统计课题"
	 */
	public static int BL_StatisSubject(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		Node param2 = (Node)param.getParaObjectAt(2);
		Node param3 = (Node)param.getParaObjectAt(3);
		//得到课题List
		ArrayList subjectList = new ArrayList();
		NodeList eList0 = param0.getChildNodes();
		for(int i=0;i<eList0.getLength();i++){
			HashMap inMap = new HashMap();
			Node eNode = eList0.item(i);
			NodeList fList = eNode.getChildNodes();
			for(int j=0; j<fList.getLength();j++){
				Node fNode = fList.item(j);
				String fNodeName = fNode.getNodeName();
				String fNodeValue = XmlUtil.getNodeValue(fNode);
				inMap.put(fNodeName,fNodeValue);

			}
			subjectList.add(i,inMap);
		}
		//得到班级List
		ArrayList classList = new ArrayList();
		NodeList eList1 = param1.getChildNodes();
		for(int i=0;i<eList1.getLength();i++){
			HashMap inMap = new HashMap();
			Node eNode = eList1.item(i);
			NodeList fList = eNode.getChildNodes();
			for(int j=0; j<fList.getLength();j++){
				Node fNode = fList.item(j);
				String fNodeName = fNode.getNodeName();
				String fNodeValue = XmlUtil.getNodeValue(fNode);
				inMap.put(fNodeName,fNodeValue);

			}
			classList.add(i,inMap);
		}
		//得到教研部List
		ArrayList orgList = new ArrayList();
		NodeList eList2 = param2.getChildNodes();
		for(int i=0;i<eList2.getLength();i++){
			HashMap inMap = new HashMap();
			Node eNode = eList2.item(i);
			NodeList fList = eNode.getChildNodes();
			for(int j=0; j<fList.getLength();j++){
				Node fNode = fList.item(j);
				String fNodeName = fNode.getNodeName();
				String fNodeValue = XmlUtil.getNodeValue(fNode);
				inMap.put(fNodeName,fNodeValue);

			}
			orgList.add(i,inMap);
		}
		
		
		
	//返回课题List
	ArrayList newSubjectList = addClass(subjectList,classList);
	NodeList eList4= param0.getChildNodes();
	for(int i=0;i<eList4.getLength();i++){
		HashMap inMap = new HashMap();
		Node eNode = eList4.item(i);
		HashMap map= (HashMap)newSubjectList.get(i);
		String ClassID = (String)map.get("ClassID");
		
		Element newSubjectsElement = doc.createElement("ClassID");
		XmlUtil.setNodeValue(newSubjectsElement,ClassID);
		eNode.appendChild(newSubjectsElement);
	}
	
	//返回教研部List
	ArrayList newOrgList = addSubject(orgList,subjectList);
	NodeList eList5= param2.getChildNodes();
	for(int i=0;i<eList5.getLength();i++){
		HashMap inMap = new HashMap();
		Node eNode = eList5.item(i);
		HashMap map= (HashMap)newOrgList.get(i);
		String NewSubjects = (String)map.get("NewSubjects");
		String OldSubjects = (String)map.get("OldSubjects");
		String TotalSubjects = (String)map.get("TotalSubjects");
		

		
		Element NewSubjectsElement = doc.createElement("NewSubjects");
		XmlUtil.setNodeValue(NewSubjectsElement,NewSubjects);
		eNode.appendChild(NewSubjectsElement);
		
		Element OldSubjectsElement = doc.createElement("OldSubjects");
		XmlUtil.setNodeValue(OldSubjectsElement,OldSubjects);
		eNode.appendChild(OldSubjectsElement);
		
		Element TotalSubjectsElement = doc.createElement("TotalSubjects");
		XmlUtil.setNodeValue(TotalSubjectsElement,TotalSubjects);
		eNode.appendChild(TotalSubjectsElement);
	}
	
	
//	返回总的课题
	HashMap subMap = sumSubject(newOrgList);
	

	String NewSubjects = (String)subMap.get("NewSubjects");
	String OldSubjects = (String)subMap.get("OldSubjects");
	String TotalSubjects = (String)subMap.get("TotalSubjects");
	String NewPercent = (String)subMap.get("NewPercent");
	String OldPercent = (String)subMap.get("OldPercent");
	
	Element NewSubjectsElement = doc.createElement("NewSubjects");
	XmlUtil.setNodeValue(NewSubjectsElement,NewSubjects);
	param3.appendChild(NewSubjectsElement);
	
	Element OldSubjectsElement = doc.createElement("OldSubjects");
	XmlUtil.setNodeValue(OldSubjectsElement,OldSubjects);
	param3.appendChild(OldSubjectsElement);
	
	Element TotalSubjectsElement = doc.createElement("TotalSubjects");
	XmlUtil.setNodeValue(TotalSubjectsElement,TotalSubjects);
	param3.appendChild(TotalSubjectsElement);
	
	Element NewPercentElement = doc.createElement("NewPercent");
	XmlUtil.setNodeValue(NewPercentElement,NewPercent);
	param3.appendChild(NewPercentElement);
	
	
	Element OldPercentElement = doc.createElement("OldPercent");
	XmlUtil.setNodeValue(OldPercentElement,OldPercent);
	param3.appendChild(OldPercentElement);
		

		
		return 1;
	}
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName  BL_StatisSubjectByTeachGroup
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="统计的开始时间"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="统计的结束时间"
     * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="教研部门"
	 */
	public static int BL_StatisSubjectByTeachGroup(Document doc, BizContext param)
		throws Exception {
		String beginDate = (String)param.getParaObjectAt(0);
		String endDate = (String)param.getParaObjectAt(1);
		Node org = (Node)param.getParaObjectAt(2);
		PersistenceBroker db = param.getDBBroker();  //得到数据库连接
		ArrayList list = statisSubjectByTeachGroup( db,beginDate,endDate); //得到按教研部划分的课题列表
		//在教研部DOM中增加三个统计字段 NewSubjects ,OldSubjects,TotalSubjects
		NodeList eList = org.getChildNodes();
		for(int i=0;i<eList.getLength();i++){
			Node eNode = eList.item(i);
			String orgID = "";  //取得orgID 的值
			
			NodeList fList = eNode.getChildNodes();
			for(int j=0; j<fList.getLength();j++){
				Node fNode = eList.item(j);
				String fNodeName = fNode.getNodeName();
				if("orgID".equalsIgnoreCase(fNodeName)){
					 orgID = XmlUtil.getNodeValue(fNode);
				}
			}
			int total = 0;
			int newRowSpan = 0;
			int oldRowSpan = 0;
			Iterator it = list.iterator();
			while(it.hasNext()){
				HashMap map = (HashMap)it.next();
				String orgID2 = (String)map.get("orgID");
				
				if(orgID2.equalsIgnoreCase(orgID)){
					String isNew = (String) map.get("IsNew");
					if("1".equals(isNew)){
						String rowSpan = (String) map.get("RowSpan");
						newRowSpan = Integer.parseInt(rowSpan);
						total += newRowSpan;
					
						
					}else if("0".equals(isNew)){
						String rowSpan = (String) map.get("RowSpan");
						oldRowSpan = Integer.parseInt(rowSpan);
						total += oldRowSpan;
						
					}
				}
			}

			
			Element newSubjectsElement = doc.createElement("NewSubjects");
			XmlUtil.setNodeValue(newSubjectsElement,newRowSpan+"");
			eNode.appendChild(newSubjectsElement);
			
			
			Element oldSubjectsElement = doc.createElement("OldSubjects");
			XmlUtil.setNodeValue(oldSubjectsElement,oldRowSpan+"");
			eNode.appendChild(oldSubjectsElement);
		
			
			Element totalElement = doc.createElement("TotalSubjects");
			XmlUtil.setNodeValue(totalElement,total+"");
			eNode.appendChild( totalElement);
			
			
			Element rowSpanElement = doc.createElement("RowSpan");
			XmlUtil.setNodeValue(rowSpanElement,total+"");
			eNode.appendChild( rowSpanElement);
		}
		
		
		
		
		return 1;
	}
	
	/*
	 * 按教研部来统计课题
	 * 
	 * 
	 */
	
	public static ArrayList statisSubjectByTeachGroup(PersistenceBroker db,String beginDate,String endDate){
		

		String timeSql = " WHERE  (classdate between '"+beginDate +"' and '"+endDate +"') ";  //时间Sql
		ArrayList subjectList = new ArrayList(); //课题
		
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{	
			
			cn = db.getConnection();
			st = cn.createStatement();
	       String sql1 = "SELECT c.TeachingGroupID as orgID,c.IsNew as IsNew ,count(*) as RowSpan  FROM Course c"+
		                 timeSql+" GROUP BY c.TeachingGroupID ,c.IsNew";  //按教研部得到课题
			System.out.println("----------------sql:"+sql1);
			rs = st.executeQuery(sql1);
			while(rs !=null && rs.next()){
				HashMap subjectMap = new HashMap();
				subjectMap.put("orgID",rs.getInt(1)+"");
				subjectMap.put("IsNew",rs.getInt(2)+"");
				subjectMap.put("RowSpan",rs.getInt(3)+"");
				subjectList.add(subjectMap);
				
				System.out.println("orgID:"+rs.getInt(1)+"IsNew:"+rs.getInt(2)+"RowSpan:"+rs.getInt(3));
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
		
	
		
		
		return subjectList;
	}
	
	
	/*
	 * 给课题加上班级
	 */
	
	public static ArrayList addClass(ArrayList subjectList,ArrayList classList){
		ArrayList newSubjectList = new ArrayList();
		Iterator it1 = subjectList.iterator();
		while(it1.hasNext()){
			HashMap map1 = (HashMap)it1.next();
			String TeachingGroupID1 = (String)map1.get("TeachingGroupID");
			String CourseTitle1 = (String)map1.get("CourseTitle");
			String Teachers1 = (String)map1.get("Teachers");
			String ClassID1 = "";
			Iterator it2 = classList.iterator();
			while(it2.hasNext()){
				HashMap map2 = (HashMap)it2.next();
				String TeachingGroupID2 = (String)map2.get("TeachingGroupID");
				String CourseTitle2 = (String)map2.get("CourseTitle");
				String Teachers2 = (String)map2.get("Teachers");
				String ClassID2 = (String)map2.get("ClassID");
				
				if(ClassID2 != null && ClassID2 != ""){
					if(TeachingGroupID1.equals(TeachingGroupID2) && 
							CourseTitle1.equals(CourseTitle2) && Teachers1.equals(Teachers2) ){
						if(ClassID1 == ""){
							ClassID1 = ClassID2;
						}else{
							ClassID1+=","+ClassID2;
						}
					}
				}

			}
			map1.put("ClassID",ClassID1);
			
			newSubjectList.add(map1);
		}

		return newSubjectList;
	}
	
	
	/*
	 * 给教研部加上课题
	 */
	
	public static ArrayList addSubject(ArrayList orgList,ArrayList subjectList){
		ArrayList newOrgList = new ArrayList();
		Iterator it1 = orgList.iterator();
		while(it1.hasNext()){
			HashMap map1 = (HashMap)it1.next();
			String orgID = (String)map1.get("orgID");
			int NewSubjects = 0;
			int OldSubjects = 0;
			int TotalSubjects = 0;
			Iterator it2 = subjectList.iterator();
			while(it2.hasNext()){
				HashMap map2 = (HashMap)it2.next();
				String TeachingGroupID = (String)map2.get("TeachingGroupID");
				String IsNew = (String)map2.get("IsNew");
				
				if(orgID != null && orgID.equals(TeachingGroupID)){
					
						if("1".equals(IsNew)){
							NewSubjects ++;
						}else{
							OldSubjects++;
						}
						TotalSubjects++;
					
				}

			}
			map1.put("NewSubjects",NewSubjects+"");
			map1.put("OldSubjects",OldSubjects+"");
			map1.put("TotalSubjects",TotalSubjects+"");
			newOrgList.add(map1);
		}
		return newOrgList;
	}
	
	
	/*
	 * 统计总的课题
	 */
	
	public static HashMap sumSubject(ArrayList orgList){
		HashMap newMap = new HashMap();
		int newSub =0;
		int oldSub =0;
		int totalSub =0;
		
		Iterator it1 = orgList.iterator();
		while(it1.hasNext()){
			HashMap map1 = (HashMap)it1.next();
			String NewSubjects = (String)map1.get("NewSubjects");
			String OldSubjects = (String)map1.get("OldSubjects");
			String TotalSubjects = (String)map1.get("TotalSubjects");
			
			int newsubi = Integer.parseInt(NewSubjects);
			int oldsubi = Integer.parseInt(OldSubjects);
			int totalsubi = Integer.parseInt(TotalSubjects);
			
			newSub+=newsubi;
			oldSub+=oldsubi;
			totalSub+=totalsubi;
			
			
			
		
			
		}
		
		double newPercent = 0;
		double oldPercent = 0;
		
		if(totalSub != 0){
			  newPercent=newSub/totalSub*100;   
			  BigDecimal   big=new   BigDecimal(newPercent);   
			  BigDecimal   temp=big.setScale(1,BigDecimal.ROUND_HALF_UP);   
			  newPercent = Double.parseDouble(temp+"");
			  oldPercent =100-newPercent;
		}
		
		
		
		newMap.put("NewSubjects",newSub+"");
		newMap.put("OldSubjects",oldSub+"");
		newMap.put("TotalSubjects",totalSub+"");
		newMap.put("NewPercent",newPercent+"");
		newMap.put("OldPercent",oldPercent+"");
		return newMap;
	}


}
	
	
	
	
	

	