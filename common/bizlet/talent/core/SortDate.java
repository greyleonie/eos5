package talent.core;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-2-2
 * @class_displayName SortDate
 */

public class SortDate {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_sortDate
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="最小日期"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="最大日期"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="是否第一次查看"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="附加的查询条件"
	 */
	public static int BL_sortDate(Document doc, BizContext param) throws Exception{
		Node minDate = (Node)param.getParaObjectAt(0);
		Node maxDate = (Node)param.getParaObjectAt(1);
		String isFirst = (String)param.getParaObjectAt(2);
		String conditionSql=(String)param.getParaObjectAt(3);
		PersistenceBroker db = param.getDBBroker();
		String dateArray[]=SortDate.returnPlanDates(db,isFirst,conditionSql);
		
		if(dateArray!=null){
			if(dateArray[0].length()>9)dateArray[0]=dateArray[0].substring(0,10);
			if(dateArray[dateArray.length-1].length()>9)dateArray[dateArray.length-1]=dateArray[dateArray.length-1].substring(0,10);
			 XmlUtil.setNodeValue(minDate,dateArray[0]);//获取最早时间
			 XmlUtil.setNodeValue(maxDate,dateArray[dateArray.length-1]);//最迟时间
		}
		return 1;
	}
	
	
	public static String [] returnPlanDates(PersistenceBroker db,String isFirst,String conditionSql){
	     String dates[]=null;
	     Connection cn = null;
		 Statement st = null;
		 ResultSet rs = null;
	     String sql="select t.StartTime, t.EndTime from teachingplan t join Class c "+
                    "on c.classid=t.classid where  c.classId in (";
	     sql=sql+conditionSql;
		 String str=")";
		 sql=sql+str;
	   
		 
	     if(isFirst.equals("0")){//没有重新选择了班级	     	
		 	sql="select t.StartTime, t.EndTime from teachingplan t join " +
		 		"Class c on c.classid=t.classid where t.state=6 and c.isHistoryClass=0";
		 }
		 try{
		 	//System.out.println("============sql:"+sql);
		 	cn=db.getConnection();
		 	st=cn.createStatement();
		 	rs=st.executeQuery(sql);
		 	
		 	String start="";
		 	String end="";
		 	int i=-1;
		 	String allDates="";
		 
		 	while(rs.next()){
		 		start=rs.getString("StartTime");		 		
		 		end=rs.getString("EndTime");
		 		
		 		
		 		if(allDates.equals("")){
		 			allDates=start;
		 		}else{
		 			allDates+=","+start;
		 		}
		 		
		 		if(allDates.equals("")){
		 			allDates=end;
		 		}else{
		 			allDates+=","+end;
		 		}
		 		
		 		//System.out.print("=====================allDates:"+allDates);		 		
		 	}
		 	dates=SortDate.sortDate(allDates);		//日期排序 	
		 }catch(Exception e){
		 	 System.out.println("================errors;"+e);
		 }finally{
		 	try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		 }
	     return dates;
	}
	
	public static String [] sortDate(String datesValue){
		String dates[]=null;
		if(datesValue!=null){
			dates=datesValue.split(",");
		}		
		 SimpleDateFormat f =new SimpleDateFormat("yyyy-MM-dd");   
          try{   
//                System.out.println("before:");   
//                for(int   i   =   0;   i<dates.length;   i++)   {   
//                      System.out.println(dates[i]);   
//                }   

           Arrays.sort(dates,new Comparator(){   
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
		
		return dates;
	}
}