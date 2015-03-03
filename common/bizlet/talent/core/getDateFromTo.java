package talent.core;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import  java.util.*;
import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-11
 */

public class getDateFromTo {

	/**
	 * �õ���������֮�������
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_getDateFromTo
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="��ʼ����"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="��������"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="������������"
	 
	 */
	public static int BL_getDateFromTo(Document doc, BizContext param)
		throws Exception {
		
		String fromDate = (String)param.getParaObjectAt(0);
		String toDate = (String)param.getParaObjectAt(1);
		Node param0 = (Node)param.getParaObjectAt(2);
		List dates=getDateFromTo.getDateLSOfMonth(fromDate,toDate);
		Iterator it = dates.iterator();
		while(it.hasNext()){
			String date = (String)it.next();
			Element entity = doc.createElement("ENTITY");
			Element day = doc.createElement("Date");
			XmlUtil.setNodeValue(day,date);
			param0.appendChild(entity);
			entity.appendChild(day);
		
		}
		return 1;
	}
  
	
	/**
	* �õ���������֮�������
	*/
	
	public static List getDateLSOfMonth(String fromDate,String toDate){
            Calendar calendar = Calendar.getInstance();
            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat formater2 = new SimpleDateFormat("yyyyMMdd");
            Date from = new Date();
            Date to = new Date();
			try {
				from = formater.parse(fromDate);
				to = formater.parse(toDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			calendar.setTime(from);
			int length = to.compareTo(from);		
            ArrayList dateLS = new ArrayList();
            while(from.compareTo(to)<0){
            	String tempDate = formater2.format(calendar.getTime());
				dateLS.add(tempDate);
				calendar.add(Calendar.DATE,1);
				try {
					from = formater2.parse(tempDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
            }
            return dateLS;
	}



}