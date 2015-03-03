package student.kaoqin;
import org.w3c.dom.*;


import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-2-8
 * @class_displayName KaoqinManage
 */

public class KaoqinManage {

	/**
	 * 获得一天午别的最后时间
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getWubieTime
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="存储结果节点"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入一天"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入类别"
	 */
	public static int BL_getWubieTime(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);
		String param2 = (String) param.getParaObjectAt(2);
		
		String result=param1+" ";
		if(param2.equals("0"))
			result+="8:30:00";
		else if(param2.equals("1"))
			result+="14:15:00";
		else if(param2.equals("2"))
			result+="18:45:00";
		com.primeton.tp.common.xml.XmlUtil.setNodeValue(param0,result);
		return 1;
	}

	/**
	 * 根据考勤状态名称获得考勤状态
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getState
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="结果路径"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入考勤状态名称"
	 */
	public static int BL_getState(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = ((String)param.getParaObjectAt(1)).trim();
		String state=null;
		if(param1.equals("正常"))
			state="0";
		else if(param1.equals("迟到"))
			state="1";
		else if(param1.equals("缺课"))
			state="2";
		else if(param1.equals("公假"))
			state="3";
		else if(param1.equals("事假/病假"))
			state="4";
		if(state!=null)
			com.primeton.tp.common.xml.XmlUtil.setNodeValue(param0,state);
		return 1;
	}
	/**
	 * 联合学员考勤汇总数据
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_uniteData
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输入输出学员实体"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入考勤汇总LIST"
	 */
	public static int BL_uniteData(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		NodeList countList=param1.getChildNodes();
		for(int i=0;i<countList.getLength();i++){
			Element count=(Element) countList.item(i);
			String  state=count.getElementsByTagName("state").item(0).getFirstChild().getNodeValue();
			String  counts=count.getElementsByTagName("counts").item(0).getFirstChild().getNodeValue();
			String name="count"+state;
			Element newElement=doc.createElement(name);
			XmlUtil.setNodeValue(newElement,counts);
			param0.appendChild(newElement);
		}
		return 1;
	}
}