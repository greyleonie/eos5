package talent.core;
import java.text.SimpleDateFormat;
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

public class ChangeDate2WeekDay {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_changeDate2WeekDay
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="日期"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="星期"
	 */
	public static int BL_changeDate2WeekDay(Document doc, BizContext param)
		throws Exception {
		String date = (String) param.getParaObjectAt(0);		
		Node weekDay = (Node) param.getParaObjectAt(1);
		String week=ChangeDate2WeekDay.getWeekDay(date);
		XmlUtil.setNodeValue(weekDay,week);
		return 1;
	}
  
	
  public static String getWeekDay(String date){
  //	 System.out.println("===============day:"+date);
  	String weekDay="";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date d=new Date();
    if(date.equals("")||date==null){
      	 return "";
      }
    String year="";
    String month="";
    String day="";
   
 
    try{   
    	year=date.substring(0,4);
    	month=date.substring(4,6);
    	day=date.substring(6,8);
        date=year+"-"+month+"-"+day;
        
       d= sdf.parse(date);
       d.setTime(d.getTime());
       weekDay=d.toString();
       weekDay=weekDay.substring(0,3);
       if(weekDay.equals("Mon")){
       	weekDay="一";
       }
       if(weekDay.equals("Tue")){
       	weekDay="二";
       }
       if(weekDay.equals("Wed")){
       	weekDay="三";
       }
       if(weekDay.equals("Thu")){
       	weekDay="四";
       }
       if(weekDay.equals("Fri")){
       	weekDay="五";
       }
       if(weekDay.equals("Sat")){
       	weekDay="六";
       }
       if(weekDay.equals("Sun")){
       	weekDay="日";
       }
      // System.out.println("============="+d.toString());
    }catch(Exception e){
      e.printStackTrace();	
    }
  	return weekDay;
  }
}