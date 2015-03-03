package common.assets;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-7-14
 * @class_displayName Tool
 */

public class Tool {

	/**
	 * ����һ�����ֵõ�һ��List
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName getListByNum
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc=""
	 */
	public static int getListByNum(Document doc, BizContext param)
		throws Exception {
		String param0 = (String) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		
		int len = Integer.parseInt(param0);
		
		for(int i = 0;i<len;i++){
			Element entity = doc.createElement("ENTITY");
			param1.appendChild(entity);
		}
		
		
		return 1;
	}

}