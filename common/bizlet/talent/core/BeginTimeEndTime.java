package talent.core;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.Vector;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-4-27
 * @class_displayName BeginTimeEndTime
 */

public class BeginTimeEndTime {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_beginTimeEndTim
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="最小日期"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="最大日期"
	 * @bizlet_param passing="in_out" type="variable" value="time" name="" desc=""
	 */
	public static int BL_beginTimeEndTim(Document doc, BizContext param)
		throws Exception {
		Node minDate = (Node)param.getParaObjectAt(0);
		Node maxDate = (Node)param.getParaObjectAt(1);
		String allTime = (String) param.getParaObjectAt(2);
		String dateArray[]=sortDate(allTime);
		if(dateArray!=null){			
			if(dateArray[0].length()>9)
				dateArray[0]=dateArray[0].substring(0,10);
			if(dateArray[dateArray.length-1].length()>9)
			 dateArray[dateArray.length-1]=dateArray[dateArray.length-1].substring(0,10);
			 XmlUtil.setNodeValue(minDate,dateArray[0]);//获取最早时间
			 XmlUtil.setNodeValue(maxDate,dateArray[dateArray.length-1]);//最迟时间
		}
		return 1;
	}
	
//	public static String [] returnPlanDates(String allDates){
//	    
//		String dates[]=null;		
//		 dates=SortDate.sortDate(allDates);		//日期排序 	
//		 
//	     return dates;
//	}
	
	public static String [] sortDate(String datesValue){
		String dates[]=null;
		String newArray[]=new String[2];
		int count=0;
		Vector v=new Vector();
		if(datesValue!=null){
			dates=datesValue.split(",");
		}		
		for(int k=0;k<dates.length;k++){
			if(dates[k]!=null&&!dates[k].equals("")){
				count++;
				v.add(dates[k]);
			}
		}
	   if(v!=null){
	   	 newArray=new String[v.size()];
	    v.copyInto(newArray);
	   	}
		
		 SimpleDateFormat f =new SimpleDateFormat("yyyy-MM-dd");   
          try{   
//                System.out.println("before:");   
//                for(int   i   =   0;   i<newArray.length;   i++)   {   
//                      System.out.println(newArray[i]);   
//                }   

           Arrays.sort(newArray,new Comparator(){   
                      public   int   compare(Object o1, Object o2){   
                            try{   
                                  SimpleDateFormat   df   =   new   java.text.SimpleDateFormat("yyyy-MM-dd");   
                                  Date   d1   =   df.parse((String)o1);   
                                  Date   d2   =   df.parse((String)o2);   
                                  return   d1.compareTo(d2);   
                                }catch(Exception  e){e.printStackTrace();}   
                                  return   -1;   
                      }   
                });   
   
          }catch(Exception   e){e.printStackTrace();}   
//          for(int   i   =   0;   i<newArray.length;   i++)   {   
//            System.out.println("===="+newArray[i]);   
//      }   
          if(newArray==null){
          	newArray[0]="";
        	newArray[1]="";
          }
		return newArray;
	}
	
	public static void main(String args[]){
	    String allDates=",2007-5-30,2007-1-22,2007-3-4,2007-2-5,2007-4-25,";	
	   String theDate[]=sortDate(allDates);
	   
	}

}