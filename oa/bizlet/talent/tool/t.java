package talent.tool;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
import com.primeton.tp.core.api.Unique;
import org.apache.struts.upload.DiskFile;
/**
 * @author Administrator
 * @version 1.0
 * @date 2005-7-6
 * @class_displayName t
 */

public class t {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName f
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc=""
	 */
	public static int f(Document doc, BizContext param) throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
param0.getFirstChild().getNodeValue();
		return 1;
	}

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_keyvalue
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc=""
	 */
	public static int BL_keyvalue(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		PersistenceBroker db = param.getDBBroker();
		int p1 = t.getMark(param0,db);
		int p2 = t.getMark(param1,db);
		System.out.print("^^^^^^^^^^^^^^^ p1"+ p1 + "^^^^p2" + p2 );
		return 1;
	}
	
	public static int getMark(Node node,PersistenceBroker db) throws Exception{
		int i = 0;
		String pkName = "";
		if(pkName == null || "".equals(pkName)) pkName = node.getNodeName();
		//int pk = Unique.nextInt(db.getAppID(), pkName);
		i = Unique.nextInt(db.getAppID(),pkName);
		return i;
	}
}