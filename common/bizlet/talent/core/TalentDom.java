package talent.core;
import org.w3c.dom.*;

import com.primeton.eos.util.XML;
import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-23
 * @class_displayName TalentDom
 */

public class TalentDom {

	/**
	 * 根据判断节点把EntityList2中的实体插入到EntityList1相应实体中，不初始化空值。
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_uniteTwoEntityList
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="目标list"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="合并源list"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="判断节点之目标list"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="判断节点之合并源list"
	 */
	public static int BL_uniteTwoEntityList(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		String targetName = (String) param.getParaObjectAt(2);
		String soureName = (String) param.getParaObjectAt(3);
		String param4 = (String) param.getParaObjectAt(4);
		
		NodeList targetList=param0.getChildNodes();
		NodeList soureList=param1.getChildNodes();
		for(int i=0;i<soureList.getLength();i++){
			try{
			Element soure=(Element) soureList.item(i);
			String  soureVaule = soure.getElementsByTagName(soureName).item(0).getFirstChild().getNodeValue();
			for(int j=0;j<targetList.getLength();j++){
				Element target=(Element) targetList.item(j);
				String  targetVaule = target.getElementsByTagName(targetName).item(0).getFirstChild().getNodeValue();
				if(targetVaule.equals(soureVaule)){
					target.appendChild(soure);
					i=i-1;
					break;
				}
			}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		

		return 1;
	}

	/**
	 * 合并两个节点(将节点B的子节点拷贝到节点A中,如发现有子节点名称一样,则覆盖).
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_uniteTwoEntity
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="目标Entity"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="源Entity"
	 */
	public static int BL_uniteTwoEntity(Document doc, BizContext param) throws Exception{
		Node target = (Node)param.getParaObjectAt(0);
		Node soure = (Node)param.getParaObjectAt(1);
		NodeList targetList=target.getChildNodes();
		NodeList soureList=soure.getChildNodes();
		for(int i=0;i<soureList.getLength();i++){
			Element soureChild=(Element) soureList.item(i);
			String soureChildName=soureChild.getNodeName();
			String soureChildValue=XmlUtil.getNodeValue(soureChild);
			System.out.println(soureChildName +" : " + soureChildValue);
			int flag=0;
			for(int j=0;j<targetList.getLength();j++){
				Element targetChild=(Element) targetList.item(j);
				String targetChildName=targetChild.getNodeName();
				if(targetChildName.equals(soureChildName)){
					XmlUtil.setNodeValue(targetChild,soureChildValue);
					System.out.println("----"+XmlUtil.getNodeValue(targetChild));
					flag=1;
					break;
				}
			}
			if(flag==0){
				Element temp=doc.createElement(soureChildName);
				XmlUtil.setNodeValue(temp,soureChildValue);
				target.appendChild(temp);
			}
		}
		return 1;
	}
}