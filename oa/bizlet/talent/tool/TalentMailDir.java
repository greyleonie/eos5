package talent.tool;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.common.xml.*;
/**
 * @author Administrator
 * @version 1.0
 * @date 2005-7-19
 * @class_displayName TalentMailDir
 */

public class TalentMailDir {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_newDir
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc=""
	 */
	public static int BL_newDir(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		Node param2 = (Node) param.getParaObjectAt(2);
		Node param3 = (Node) param.getParaObjectAt(3);
		String tfilename = param0.getFirstChild().getNodeValue();
		String userAccount = param1.getFirstChild().getNodeValue();
		int pos = tfilename.lastIndexOf("\\");
		String prePath = tfilename.substring(0,pos);
		String filename = tfilename.substring(pos+1,tfilename.length());
		String truePath = prePath + "\\" +userAccount;
		XmlUtil.setNodeValue(param2,truePath);
		XmlUtil.setNodeValue(param3,truePath+"\\"+filename);

		return 1;
	}

}