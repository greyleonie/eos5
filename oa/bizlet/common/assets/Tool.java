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
	 * 传入一个数字得到一个List
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
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