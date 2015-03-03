package talent.core;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-9
 * @class_displayName InitScore
 */

public class InitScore {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName initScoreByClassID
	 * @bizlet_param passing="in_out" type="variable" value="ClassID" name="" desc=""
	 */
	public static int initScoreByClassID(Document doc, BizContext param)
		throws Exception {
		String param0 = (String) param.getParaObjectAt(0);
		System.out.println("-------"+param0);
		return 1;
	}

}