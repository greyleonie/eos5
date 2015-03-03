package talent.core;
import  java.util.*;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-11
 */

public class StatisClass {

	/**
	 * 传入List和分组的字段得到一个新的List和RowSpan
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getListWithRowSpan

	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入List"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="返回班级类型List"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="返回总班数与人数"
	 */
	public static int BL_statisClassByClassType(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);	
		Node param2 = (Node) param.getParaObjectAt(2);	


       //list取值 返回inList
		
		NodeList entityList =param0.getChildNodes();
		int elLength = entityList.getLength();
		ArrayList inList = new ArrayList();
		for(int i=0;i<elLength;i++){
		Node entityNode =(Node)entityList.item(i);
		NodeList fieldList = (NodeList)entityNode.getChildNodes();
		int flLength = fieldList.getLength();
			HashMap inMap = new HashMap();
			for(int j=0;j<flLength;j++){
				Node fieldNode = (Node)fieldList.item(j);
				String fieldName = fieldNode.getNodeName();
				if("ClassID".equals(fieldName)){
					String fieldValue = XmlUtil.getNodeValue(fieldNode);
					inMap.put(fieldName,fieldValue);
				}
				if("ClassTypeID".equals(fieldName)){
					String fieldValue = XmlUtil.getNodeValue(fieldNode);
					inMap.put(fieldName,fieldValue);
				}
				if("RecruitNum".equals(fieldName)){
					String fieldValue = XmlUtil.getNodeValue(fieldNode);
					inMap.put(fieldName,fieldValue);
				}
				
				
				
		 }
		 inList.add(inMap);		
		}
		
//计算班级数  与 人数
	    ArrayList outList = new ArrayList();
    	int ClassNum = 0;
    	int StudentNum = 0;
    	HashMap tempMap = new HashMap();
    	if(inList.size()>0){
    		tempMap = (HashMap)inList.get(0);
    		String RecruitNum = (String) tempMap.get("RecruitNum");
	    	int tempStudentNum = 0;
	    	if(RecruitNum != null && !"".equalsIgnoreCase( RecruitNum)){
	    		tempStudentNum = Integer.parseInt( RecruitNum);
	    	}
    	  
    	}
        Iterator it = inList.iterator();
	    while(it.hasNext()){	
	    	String tempClassTypeID = (String) tempMap.get("ClassTypeID");
	    	HashMap map = (HashMap)it.next();
	    	String ClassTypeID = (String) map.get("ClassTypeID");
	    	String RecruitNum = (String) map.get("RecruitNum");
	    	int tempStudentNum = 0;
	    	if(RecruitNum != null && !"".equalsIgnoreCase( RecruitNum)){
	    		tempStudentNum = Integer.parseInt( RecruitNum);
	    	}
	    	if(tempClassTypeID.equals(ClassTypeID)){
	    		ClassNum++;
	    		StudentNum+=tempStudentNum;
	    		continue;
	    	}
	    	
	    	Map newMap = new HashMap();
	    	newMap.put("ClassTypeID",tempClassTypeID+"");
	    	newMap.put("ClassNum",ClassNum+"");
	    	newMap.put("StudentNum",StudentNum+"");
	    	outList.add(newMap);
	    	tempMap = map ;
	        ClassNum = 1;
	    	StudentNum = tempStudentNum;
	    	
	    }
	    String tempClassTypeID = (String) tempMap.get("ClassTypeID");
    	Map newMap = new HashMap();
    	newMap.put("ClassTypeID",tempClassTypeID+"");
    	newMap.put("ClassNum",ClassNum+"");
    	newMap.put("StudentNum",StudentNum+"");
    	outList.add(newMap);
		
//		生成list		
		NamedNodeMap map= (NamedNodeMap)param1.getAttributes();
		Node typeNode = map.getNamedItem("type");
		String type = typeNode.getNodeValue();
		int totalClassNum = 0 ;
		int totalStudentNum = 0;
		Iterator it3 = outList.iterator();
		while(it3.hasNext()){
			Map map3 = (Map)it3.next();
			Element entityElement = doc.createElement(type);
			Element ClassTypeIDElement = doc.createElement("ClassTypeID");
			String ClassTypeID= (String)map3.get("ClassTypeID");
			XmlUtil.setNodeValue(ClassTypeIDElement,ClassTypeID);
			entityElement.appendChild(ClassTypeIDElement);
			Element ClassNumElement = doc.createElement("ClassNum");
			String ClassNum1= (String)map3.get("ClassNum");
			XmlUtil.setNodeValue(ClassNumElement,ClassNum1);
			entityElement.appendChild(ClassNumElement);
			Element StudentNumElement = doc.createElement("StudentNum");
			String StudentNum1= (String)map3.get("StudentNum");
			XmlUtil.setNodeValue(StudentNumElement,StudentNum1);
			entityElement.appendChild(StudentNumElement);
			param1.appendChild(entityElement);
			
			//统计总的班级数， 人数
			int ClassNum2 = Integer.parseInt(ClassNum1);
			int StudentNum2 = Integer.parseInt(StudentNum1);
			
			totalClassNum+=ClassNum2;
			totalStudentNum+=StudentNum2;
			
		}
		
		Element ClassNumElement = doc.createElement("ClassNum");
		XmlUtil.setNodeValue(ClassNumElement,totalClassNum+"");
		param2.appendChild(ClassNumElement);
		
		Element StudentNumElement = doc.createElement("StudentNum");
		XmlUtil.setNodeValue(StudentNumElement,totalStudentNum+"");
		param2.appendChild(StudentNumElement);
		return 1;
	}

}