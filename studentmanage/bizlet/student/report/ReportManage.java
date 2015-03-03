package student.report;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import org.w3c.dom.*;

import talent.core.TalentAware;
import talent.core.TalentFunctions;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-2-12
 * @class_displayName ReportManage
 */

public class ReportManage {

	/**
	 * 班级学员统计数据处理
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_studentStatData
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输出节点"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入学员list"
	 */
	public static int BL_studentStatData(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		NodeList list=param1.getChildNodes();
		int total=list.getLength(); //总人数
		int manCount=0;//男性人数
		double manScale=0; //男性比例
		int womenCount=0; //女性...
		double womenScale=0;
		int maxAge=0; //最大年龄
		int minAge=100;
		int totalAge=0;
		int aveAge=0;
		int ageCount2=0; //20-29年龄段人数
		double ageScale2=0; //...比例
		int ageCount3=0; 
		double ageScale3=0; 
		int ageCount4=0; 
		double ageScale4=0; 
		int ageCount5=0; 
		double ageScale5=0; 
		
		for(int i=0;i<total;i++){
			Element student=(Element)  list.item(i);
			int age=TalentFunctions.getInt(student.getElementsByTagName("Age").item(0).getFirstChild().getNodeValue(),0);
			String sex=student.getElementsByTagName("Sex").item(0).getFirstChild().getNodeValue();
			if(age>maxAge)
				maxAge=age;
			if(age<minAge)
				minAge=age;
			if(age>=20&&age<=29)
				ageCount2++;
			else if (age>=30&&age<=39)
				ageCount3++;
			else if (age>=40&&age<=49)
				ageCount4++;
			else if (age>=50&&age<=59)
				ageCount5++;
			totalAge+=age;
			if(sex.equals("1"))
				manCount++;
			else if(sex.equals("0"))
				womenCount++;
		}
		if(total==0)
			minAge=0;
		else{
			manScale=getScale(manCount,total);
			womenScale=getScale(womenCount,total);
			ageScale2=getScale(ageCount2,total);
			ageScale3=getScale(ageCount3,total);
			ageScale4=getScale(ageCount4,total);
			ageScale5=getScale(ageCount5,total);
			aveAge=totalAge/total;
		}
		
		Element totalElement=doc.createElement("total");
		XmlUtil.setNodeValue(totalElement,String.valueOf(total));
		param0.appendChild(totalElement);
		
		Element manCountElement=doc.createElement("manCount");
		XmlUtil.setNodeValue(manCountElement,String.valueOf(manCount));
		param0.appendChild(manCountElement);
		
		Element manScaleElement=doc.createElement("manScale");
		XmlUtil.setNodeValue(manScaleElement,String.valueOf(manScale));
		param0.appendChild(manScaleElement);
		
		Element womenCountElement=doc.createElement("womenCount");
		XmlUtil.setNodeValue(womenCountElement,String.valueOf(womenCount));
		param0.appendChild(womenCountElement);
		
		Element womenScaleElement=doc.createElement("womenScale");
		XmlUtil.setNodeValue(womenScaleElement,String.valueOf(womenScale));
		param0.appendChild(womenScaleElement);
		
		Element maxAgeElement=doc.createElement("maxAge");
		XmlUtil.setNodeValue(maxAgeElement,String.valueOf(maxAge));
		param0.appendChild(maxAgeElement);
		
		Element minAgeElement=doc.createElement("minAge");
		XmlUtil.setNodeValue(minAgeElement,String.valueOf(minAge));
		param0.appendChild(minAgeElement);
		
		Element aveAgeElement=doc.createElement("aveAge");
		XmlUtil.setNodeValue(aveAgeElement,String.valueOf(aveAge));
		param0.appendChild(aveAgeElement);
		
		Element ageCount2Element=doc.createElement("ageCount2");
		XmlUtil.setNodeValue(ageCount2Element,String.valueOf(ageCount2));
		param0.appendChild(ageCount2Element);
		
		Element ageScale2Element=doc.createElement("ageScale2");
		XmlUtil.setNodeValue(ageScale2Element,String.valueOf(ageScale2));
		param0.appendChild(ageScale2Element);
		
		Element ageCount3Element=doc.createElement("ageCount3");
		XmlUtil.setNodeValue(ageCount3Element,String.valueOf(ageCount3));
		param0.appendChild(ageCount3Element);
		
		Element ageScale3Element=doc.createElement("ageScale3");
		XmlUtil.setNodeValue(ageScale3Element,String.valueOf(ageScale3));
		param0.appendChild(ageScale3Element);
		
		Element ageCount4Element=doc.createElement("ageCount4");
		XmlUtil.setNodeValue(ageCount4Element,String.valueOf(ageCount4));
		param0.appendChild(ageCount4Element);
		
		Element ageScale4Element=doc.createElement("ageScale4");
		XmlUtil.setNodeValue(ageScale4Element,String.valueOf(ageScale4));
		param0.appendChild(ageScale4Element);
		
		Element ageCount5Element=doc.createElement("ageCount5");
		XmlUtil.setNodeValue(ageCount5Element,String.valueOf(ageCount5));
		param0.appendChild(ageCount5Element);
		
		Element ageScale5Element=doc.createElement("ageScale5");
		XmlUtil.setNodeValue(ageScale5Element,String.valueOf(ageScale5));
		param0.appendChild(ageScale5Element);
		
		return 1;
	}

	//获得比例
	public static double getScale(int num,int total){
		double d=0;
		if(total!=0){
			d= ((double)Math.round(num*10000.0/total))/100;
		}
		return d;
	}
	/**
	 * 处理班级学员统计学历构成数据
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_studentStatDegree
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入输出学历数据list"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入班级总人数"
	 */
	public static int BL_studentStatDegree(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = (String)param.getParaObjectAt(1);
		NodeList list=param0.getChildNodes();
		int total=TalentFunctions.getInt(param1,0);
		for(int i=0;i<list.getLength();i++){
			Element el=(Element)list.item(i);
			int counts=TalentFunctions.getInt(el.getElementsByTagName("counts").item(0).getFirstChild().getNodeValue(),0);
			double scale=getScale(counts,total);
			Element scaleElement=doc.createElement("scale");
			XmlUtil.setNodeValue(scaleElement,String.valueOf(scale));
			el.appendChild(scaleElement);
			
		}
		return 1;
	}
	/**
	 * 处理班级课程任课教师的ID，并将其连接成查询字符串
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_dealCourseTeacherID
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入TeacherID的list"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输出结果路径"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="输入连接字符串的字段名"
	 */
	public static int BL_dealCourseTeacherID(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		String name = (String)param.getParaObjectAt(2);
		NodeList list=param0.getChildNodes();
		HashMap map=new HashMap();
		for(int i=0;i<list.getLength();i++){
			Element el=(Element) list.item(i);
			String Teachers=el.getElementsByTagName("Teachers").item(0).getFirstChild().getNodeValue();
			String Tutors=el.getElementsByTagName("Tutors").item(0).getFirstChild().getNodeValue();
			if(Teachers!=null&&(!Teachers.equals(""))){
				String[] temp=Teachers.split(",");
				for(int j=0;j<temp.length;j++){
					if(temp[j]!=null&&(!temp[j].equals(""))){
						map.put(temp[j],temp[j]);
					}
				}
			}
			if(Tutors!=null&&(!Tutors.equals(""))){
				String[] temp=Tutors.split(",");
				for(int j=0;j<temp.length;j++){
					if(temp[j]!=null&&(!temp[j].equals(""))){
						map.put(temp[j],temp[j]);
					}
				}
			}
		}
		Set set=map.keySet();
		if(set!=null){
			Iterator ite=set.iterator();
			int k=0;
			String str="";
			while(ite.hasNext()){
				if(k==0)
					str=str+" "+name+" = " + ite.next().toString();
				else{
					str=str+" or "+name+" = " + ite.next().toString();
				}
				k++;
			}
			if(str.equals(""))
				str=name+" = -1 ";
			XmlUtil.setNodeValue(param1,str);
			
		}
		
		return 1;
	}
	/**
	 * 合并班级老师和课程
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_uniteTeacherCourse
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入输出教师列表"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入课程列表"
	 */
	public static int BL_uniteTeacherCourse(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		NodeList teacherList = param0.getChildNodes();
		NodeList courseList = param1.getChildNodes();
		HashMap courseMap = new HashMap();
		for (int i = 0 ; i<courseList.getLength() ;i++){
			Element course = (Element) courseList.item(i);
			String Teachers =TalentFunctions.getNodeValueByTagName(course,"Teachers");
			String Tutors =TalentFunctions.getNodeValueByTagName(course,"Tutors");
			String CourseTitle =TalentFunctions.getNodeValueByTagName(course,"CourseTitle");
			if((!Teachers.equals("")&&(!Teachers.equals("0")))){
				String temp[] = Teachers.split(",");
				for (int j= 0 ;j<temp.length;j++){
					if(courseMap.get(temp[j])!=null)
						courseMap.put(temp[j],(courseMap.get(temp[j]).toString()+","+CourseTitle));
					else
						courseMap.put(temp[j],CourseTitle);
					
				}
			}
			if((!Tutors.equals("")&&!Tutors.equals("0"))){
				String temp[] = Tutors.split(",");
				for (int j= 0 ;j<temp.length;j++){
					if(courseMap.get(temp[j])!=null)
						courseMap.put(temp[j],(courseMap.get(temp[j]).toString()+";"+CourseTitle));
					else
						courseMap.put(temp[j],CourseTitle);
				}
			}
			
		}
		
		for( int i=0 ; i<teacherList.getLength();i++ ){
			Element Teacher = (Element) teacherList.item(i);
			String TeacherID =TalentFunctions.getNodeValueByTagName(Teacher,"TeacherID");
			Object course = courseMap.get(TeacherID);
			if(course!=null){
				Element CourseName = doc.createElement("CourseName");
				XmlUtil.setNodeValue(CourseName,String.valueOf(course));
				Teacher.appendChild(CourseName);
				
			}
		}
		return 1;
	}
	/**
	 * 将Student分组加到Team List 中
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_uniteTeamStudent
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入输出TeamList"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入Student List"
	 */
	public static int BL_uniteTeamStudent(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		NodeList TeamList = param0.getChildNodes();
		NodeList StudentList = param1.getChildNodes();
		
		for(int i = 0 ; i<TeamList.getLength(); i++){
			Element Team = (Element) TeamList.item(i);
			String TeamID = TalentFunctions.getNodeValueByTagName(Team,"TeamID");
			Element QueryStudentList=doc.createElement("QueryStudentList");
			Team.appendChild(QueryStudentList);
			int count = 0;
			for(int j=0;j<StudentList.getLength();j++){
				Element Student = (Element) StudentList.item(j);
				String StudentTeamID = TalentFunctions.getNodeValueByTagName(Student,"TeamID");
				if(TeamID.equals(StudentTeamID)){
					count++;
					QueryStudentList.appendChild(Student);
					j--;
				}
			}
			if(count==0){
				XmlUtil.removeChildNode(param0,(Node)Team);
				i=i-1;
			}
			else {
				Element countEl = doc.createElement("count");
				XmlUtil.setNodeValue(countEl,String.valueOf(count));
				Team.appendChild(countEl);
			}
		}
		
		
		return 1;
	}
}