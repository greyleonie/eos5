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
	 * ���һ���������ʱ��
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getWubieTime
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="�洢����ڵ�"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����һ��"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�������"
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
	 * ���ݿ���״̬���ƻ�ÿ���״̬
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getState
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="���·��"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="���뿼��״̬����"
	 */
	public static int BL_getState(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String param1 = ((String)param.getParaObjectAt(1)).trim();
		String state=null;
		if(param1.equals("����"))
			state="0";
		else if(param1.equals("�ٵ�"))
			state="1";
		else if(param1.equals("ȱ��"))
			state="2";
		else if(param1.equals("����"))
			state="3";
		else if(param1.equals("�¼�/����"))
			state="4";
		if(state!=null)
			com.primeton.tp.common.xml.XmlUtil.setNodeValue(param0,state);
		return 1;
	}
	/**
	 * ����ѧԱ���ڻ�������
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_uniteData
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="�������ѧԱʵ��"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="���뿼�ڻ���LIST"
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