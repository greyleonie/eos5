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
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_changeDate2WeekDay
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="����"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="����"
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
       	weekDay="һ";
       }
       if(weekDay.equals("Tue")){
       	weekDay="��";
       }
       if(weekDay.equals("Wed")){
       	weekDay="��";
       }
       if(weekDay.equals("Thu")){
       	weekDay="��";
       }
       if(weekDay.equals("Fri")){
       	weekDay="��";
       }
       if(weekDay.equals("Sat")){
       	weekDay="��";
       }
       if(weekDay.equals("Sun")){
       	weekDay="��";
       }
      // System.out.println("============="+d.toString());
    }catch(Exception e){
      e.printStackTrace();	
    }
  	return weekDay;
  }
}