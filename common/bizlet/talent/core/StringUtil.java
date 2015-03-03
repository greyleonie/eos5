package talent.core;
import org.w3c.dom.*;

import java.util.regex.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-6-25
 * @class_displayName StringUtil
 */

public class StringUtil {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_UnionSearchText
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�ؼ���"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="Ҫ��ѯ���ֶ� �ԣ��ָ�"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="���ص� SQL"
	 */
	public static int BL_UnionSearchText(Document doc, BizContext param)
		throws Exception {
		String param0 = (String) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);
		Node param2 = (Node) param.getParaObjectAt(2);
		
		String s = XmlUtil.getNodeValue(param2);
		Pattern pattern = Pattern.compile("[\\s*,��\\s*]+"); //�ԣ��� �ո� �ָ�
		String searchText[] = pattern.split(param0);
		String searchField[] = pattern.split(param1);
		if(searchText.length > 0){
		for(int i=0;i<searchText.length;i++){
			if(!"".equals(searchText[i])){
				s += " and ( "+searchField[0] +" like '%"+searchText[i]+"%'";
				for(int j=1;j<searchField.length;j++){
					s += " or "+searchField[j] +" like '%"+searchText[i]+"%'";
					
				}
				s +=")";
			
			}
		}
		}
		
		System.out.println("searchSql:"+s);
		XmlUtil.setNodeValue(param2,s);
	
		
		
		return 1;
	}

}