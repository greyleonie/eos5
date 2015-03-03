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

public class getDatePerMonth {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getDatePerMonth
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="返回当月所有日期"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="日期"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="当月第一天与最后一天"
	 */
	public static int BL_getDatePerMonth(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node)param.getParaObjectAt(0);
		String date = (String)param.getParaObjectAt(1);

		
		
		String[] dates=getDatePerMonth.getDateLSOfMonth(date);
		int length = dates.length;
		XmlUtil.setAttribute( param0,"list[@type='Date']","rowNum",length+"");
		for(int i = 0; i < dates.length; i++) {
			Element entity = doc.createElement("ENTITY");
			XmlUtil.setAttribute(entity,"RowNum",i+"");
			Element day = doc.createElement("Date");
			XmlUtil.setNodeValue(day,dates[i]);
			param0.appendChild(entity);
			entity.appendChild(day);
		}
		
		if(param.getLength()>2){
			Node param2 = (Node)param.getParaObjectAt(2);
			
			Element BeginDate = doc.createElement("BeginDate");
			XmlUtil.setNodeValue(BeginDate,dates[0]);
			param2.appendChild(BeginDate);
			
			Element EndDate = doc.createElement("EndDate");
			XmlUtil.setNodeValue(EndDate,dates[length-1]);
			param2.appendChild(EndDate);
		
		}
		return 1;
	}
  
	
	/**
	* 传入一个日期参数,取出该日期所在月的所有日期字符串
	*/
	
	public static String[] getDateLSOfMonth(String date){
            Calendar calendar = Calendar.getInstance();
            java.text.SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
            Date tempdate = new Date();
			try {
				tempdate = formater.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			calendar.setTime(tempdate);
            String[] dateLS = new String[calendar.getActualMaximum(Calendar.DAY_OF_MONTH)];

            calendar.set(Calendar.DAY_OF_MONTH,1);
            int curMonth = calendar.get(Calendar.MONTH);
            int tempMonth = curMonth;
            int i = 0;
            while(curMonth==tempMonth){
		dateLS[i] = formater.format(calendar.getTime());
		i++;
		calendar.add(Calendar.DAY_OF_MONTH,1);
		tempMonth = calendar.get(Calendar.MONTH);
            }
            return dateLS;
	}



}