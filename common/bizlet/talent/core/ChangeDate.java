package talent.core;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-11
 * @class_displayName ChangeDate2WeekDay
 */

public class ChangeDate {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_changeDate
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="日期"
	 * @bizlet_param passing="in_out" type="constant" value="/" name="" desc="类型week,month"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="变化值"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="开始日期"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="结束日期"
	 */
	public static int BL_changeDate(Document doc, BizContext param)
		throws Exception {
		String date = (String) param.getParaObjectAt(0);
		String type = (String) param.getParaObjectAt(1);
		String change = (String) param.getParaObjectAt(2);
		Node beginDate = (Node) param.getParaObjectAt(3);
		Node endDate = (Node) param.getParaObjectAt(4);
		String[] dates=ChangeDate.getDate(date,type,change);
		XmlUtil.setNodeValue(beginDate,dates[0]);
		XmlUtil.setNodeValue(endDate,dates[1]);
		return 1;
	}
  
	
  public static String[] getDate(String date,String type,String change){
	    Calendar calendar = Calendar.getInstance();
	    calendar.setFirstDayOfWeek(Calendar.MONDAY); 
	    SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
	    Date tempdate = new Date();
		try {
			tempdate = formater.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		calendar.setTime(tempdate);
		System.out.println(calendar.getFirstDayOfWeek());
		int diff = Integer.parseInt(change);
		String[] dateLS = new String[2];
		if("week".equalsIgnoreCase(type)){
			int curWeek = calendar.get(Calendar.WEEK_OF_YEAR);
			calendar.set(Calendar.WEEK_OF_YEAR,curWeek+diff);
			calendar.set(Calendar.DAY_OF_WEEK,2);
			dateLS[0] = formater.format(calendar.getTime());
			calendar.set(Calendar.DAY_OF_WEEK,1);
			dateLS[1] = formater.format(calendar.getTime());
		}
		if("month".equalsIgnoreCase(type)){
			int curMonth = calendar.get(Calendar.MONTH);
			calendar.set(Calendar.MONTH,curMonth+diff);
			calendar.set(Calendar.DAY_OF_MONTH,1);
			dateLS[0] = formater.format(calendar.getTime());
			int dayOfMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
			calendar.set(Calendar.DAY_OF_MONTH,dayOfMonth);
			dateLS[1] = formater.format(calendar.getTime());
		}		
    return dateLS;
  }
}