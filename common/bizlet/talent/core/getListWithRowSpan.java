package talent.core;
import  java.util.*;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-11
 */

public class getListWithRowSpan {

	/**
	 * ����List�ͷ�����ֶεõ�һ���µ�List��RowSpan
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getListWithRowSpan
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="����List"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="����List"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="����1"
	 */
	public static int BL_getListWithRowSpan(Document doc, BizContext param)
		throws Exception {
		
		int plength = param.getLength();
		if(plength < 3) throw new Exception("param num is wrong");
		
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);	
		String args[] = new String[plength-2];
		for(int i = 0; i < args.length; i++) {
			args[i] = (String) param.getParaObjectAt(i+2);
			}

//listȡֵ ����inList
		
		NodeList entityList =param1.getChildNodes();
		int elLength = entityList.getLength();
		ArrayList inList = new ArrayList();
		for(int i=0;i<elLength;i++){
		Node entityNode =(Node)entityList.item(i);
		NodeList fieldList = (NodeList)entityNode.getChildNodes();
		int flLength = fieldList.getLength();
			HashMap inMap = new HashMap();
			for(int j=0;j<flLength;j++){
				Node fieldNode = (Node)fieldList.item(j);
				String fieldName = fieldNode.getNodeName();
				for(int k=0;k<args.length;k++){
					if(args[k].equals(fieldName)){
						String fieldValue = XmlUtil.getNodeValue(fieldNode);
						inMap.put(fieldName,fieldValue);
					}
				}
				
				
		 }
		 inList.add(inMap);		
		}
		
//����RowSpan
	    ArrayList outList = new ArrayList();
    	int rowSpan = 0;
    	HashMap tempMap = new HashMap();
    	if(inList.size()>0){
    		tempMap = (HashMap)inList.get(0);
    	}
        Iterator it = inList.iterator();
	    while(it.hasNext()){
	        boolean flag = true;
	    	HashMap map = (HashMap)it.next();
	    	
	    	for(int k=0;k<args.length;k++){
	    	    if ("Class".equals(args[k])) {
	    	        String tmp1 = (String)map.get(args[k]);
	    	        String tmp2 = (String)tempMap.get(args[k]);
	    	        if (tmp1.indexOf(tmp2)<0 && tmp2.indexOf(tmp1)<0) {
	    	            flag = false;
	    	            break;
	    	        }
	    	    } else {
	    	        String tmp1 = (String)map.get(args[k]);
	    	        String tmp2 = (String)tempMap.get(args[k]);
	    	       
	    	        if ((tmp1!=null||tmp2!=null)&&!tmp1.equals(tmp2)) {
	    	            flag = false;
	    	            break;
	    	        }
	    	    }
	    	}
	    	if(flag){
	    		rowSpan++;
	    		continue;
	    	}else{
		    	Map newMap = new HashMap(tempMap);
		    	newMap.put("RowSpan",rowSpan+"");
		    	outList.add(newMap);
		    	tempMap = map ;
		    	rowSpan = 1;
	    	}
	    }
	//    if(rowSpan!=1){
		    Map newMap = new HashMap(tempMap);
	    	newMap.put("RowSpan",rowSpan+"");
	    	outList.add(newMap);
	  //  }

		
//		����list		
		NamedNodeMap map= (NamedNodeMap)param0.getAttributes();
		Node typeNode = map.getNamedItem("type");
		String type = typeNode.getNodeValue();
		Iterator it3 = outList.iterator();
		while(it3.hasNext()){
			Map map3 = (Map)it3.next();
			Element entityElement = doc.createElement(type);
			Element rowspanElement = doc.createElement("RowSpan");
			String row= (String)map3.get("RowSpan");
			XmlUtil.setNodeValue(rowspanElement,row);
			entityElement.appendChild(rowspanElement);
			for(int k=0;k<args.length;k++){
				Element fieldElement = doc.createElement(args[k]);
				String fieldValue = (String)map3.get(args[k]);
				XmlUtil.setNodeValue(fieldElement,fieldValue);
				entityElement.appendChild(fieldElement);
			}
			param0.appendChild(entityElement);
		}
		return 1;
	}

}