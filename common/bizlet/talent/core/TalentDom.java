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
	 * �����жϽڵ��EntityList2�е�ʵ����뵽EntityList1��Ӧʵ���У�����ʼ����ֵ��
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_uniteTwoEntityList
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="Ŀ��list"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="�ϲ�Դlist"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="�жϽڵ�֮Ŀ��list"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="�жϽڵ�֮�ϲ�Դlist"
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
	 * �ϲ������ڵ�(���ڵ�B���ӽڵ㿽�����ڵ�A��,�緢�����ӽڵ�����һ��,�򸲸�).
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_uniteTwoEntity
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="Ŀ��Entity"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="ԴEntity"
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