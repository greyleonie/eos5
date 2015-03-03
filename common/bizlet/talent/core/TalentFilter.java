package talent.core;
import org.w3c.dom.*;
import java.util.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.common.xml.*;
/**
 * @author Administrator
 * @version 1.0
 * @date 2006-5-26
 * @class_displayName TalentFilter
 */

public class TalentFilter {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_filter
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc=""
	 */
	public static int BL_filter(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		Node param2 = (Node) param.getParaObjectAt(2);
		Set set = new HashSet();
		Map map = new HashMap();
		
		NodeList nodelist = param0.getChildNodes();
		for(int i = 0; i < nodelist.getLength(); i++) {
			Element child = (Element) nodelist.item(i);
			String userId = child.getElementsByTagName("USERID").item(0).getFirstChild().getNodeValue();
			set.add(userId);
			map.put(userId,child);
		
		}
		Node count = ((Element) param1).getElementsByTagName("count").item(0);
		XmlUtil.setNodeValue(count,String.valueOf(set.size()));
		
		
		String temp[] = new String[set.size()];
		String[] userIds =(String[]) set.toArray(temp);
		
		
		//for(int i = 0; i < nodelist.getLength(); i++) {
			//param0.removeChild(nodelist.item(i));
		
		//}
		
		for(int i = 0; i < userIds.length; i++) {
			Element p = (Element) map.get(userIds[i]);
			param2.appendChild(p);
		
		}
		
		
		
		
	return 1;
	}

}