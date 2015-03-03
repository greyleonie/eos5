package talent.tool;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.common.xml.*;
/**
 * @author Administrator
 * @version 1.0
 * @date 2005-7-17
 * @class_displayName TalentMailSize
 */

public class TalentMailSize {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_mailsize
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc=""
	 */
	public static int BL_mailsize(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		Node param2 = (Node) param.getParaObjectAt(2);
		Element el = (Element)param0;
		Node content = el.getElementsByTagName("CONTENT").item(0);
		String contentStr = content.getFirstChild().getNodeValue();
		byte[] tempbyte = contentStr.getBytes();
		int contentsize = tempbyte.length;
		
		NodeList list =param1.getChildNodes();
		int nodelength = list.getLength();
		int totalsize = 0;
		if(nodelength>0){
			for(int i=0;i<nodelength;i++){
				Node uploadFile = list.item(i);
				Node filesize = ((Element)uploadFile).getElementsByTagName("size").item(0);
				String size = filesize.getFirstChild().getNodeValue();
				totalsize+=Integer.parseInt(size);
			}
		}//if
		int mailsize = contentsize+totalsize;
		
		XmlUtil.setNodeValue(param2,String.valueOf(mailsize));
		

		return 1;
	}

}