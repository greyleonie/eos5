/*
 * 创建日期 2007-6-11
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimerTask;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import base.util.DBconnection;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class HandleClassStatus extends TimerTask {
	private Log log=LogFactory.getLog(HandleClassStatus.class);
	public static HandleClassStatus handleClassStatus;
	private static Connection con=null;
	private static Statement st=null;
	
	public static HandleClassStatus getInstance(){
		try{	 
	     	DBconnection db = new DBconnection();
	     	HandleClassStatus.con=db.getEOSConnection();
	     	HandleClassStatus.st =HandleClassStatus.con.createStatement();
		 	
	   	}catch(Exception e){
	   	 System.out.println("=========AllExecutedPlan============errors:"+e);	
	   	}
		
	   if(handleClassStatus==null){
	     	handleClassStatus=new HandleClassStatus();	
	   }
		return handleClassStatus;
	}
	
	public void run() {
		String sql="select c.classId, c.BeginTime,c.EndTime,c.isHistoryClass from class c where c.isHistoryClass=0 or c.isHistoryClass=2 order by c.isHistoryClass ";
		String beg="";
		String end="";
		int    classId=0;
		String planClass="";
		String curClass="";
		int   classStatus=0;
		ResultSet rs=null;
		String today=getStringToday();
		long   days=0;
		try{
			log.info("----------------------开始扫描班级的状态----------------------");
			rs=HandleClassStatus.st.executeQuery(sql);
			while(rs!=null&&rs.next()){
				classId=rs.getInt("classId");
				beg=rs.getString("BeginTime");
				end=rs.getString("EndTime");
				classStatus=rs.getInt("isHistoryClass");
				
				if(classStatus==0){//如果是当前班级
					days=getTwoDay(today,end);
					
					if(days>7){
					  	if(curClass.equals("")){
					  		 curClass=" classId="+classId;
					  	}else{
					  	     curClass+=" or classId="+classId;	
					  	}
					}
				}else{//计划班级
					days=getTwoDay(beg,today);
					
					if(days<14){
						if(curClass.equals("")){
					  		 curClass=" classId="+classId;
					  	}else{
					  	     curClass+=" or classId="+classId;	
					  	}
					}
				}
				
				}
			rs.close();
		}catch(Exception e){
			System.out.println("============error:"+e);
		}
		
		setClassStatus(planClass,curClass);
		closeCon();
		
	}
	
	public static void closeCon(){
		try{
	      if(HandleClassStatus.st!=null)HandleClassStatus.st.close();	
	      if(HandleClassStatus.con!=null)HandleClassStatus.con.close();	
		}catch(Exception e){
		 System.out.println("=========error:"+e);	
		}
	}
	
	//更新班级的状态
	public static void setClassStatus(String planClass,String curClass){
		try{
			String updateCurClassSql="update class set isHistoryClass=1 where "+curClass;
			String updatePlanClassSql="update class set isHistoryClass=0 where "+planClass;
		
			if(!planClass.trim().equals("")&&!curClass.trim().equals("")){
				
				HandleClassStatus.st.execute(updateCurClassSql+";"+updatePlanClassSql);
			}else if(planClass.equals("")&&!curClass.equals("")){				
				HandleClassStatus.st.execute(updateCurClassSql);
			}else if(!planClass.equals("")&&curClass.equals("")){
				HandleClassStatus.st.execute(updatePlanClassSql);
			}
		}catch(Exception e){
			System.out.println("============error:"+e);
		}
	}
	
	
	//2个时间的间隔
	 public static long getTwoDay(String sj1, String sj2) {
	 	  SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd");
	 	  long day = 0;
	 	  try {
	 	   java.util.Date date = myFormatter.parse(sj1);
	 	   java.util.Date mydate = myFormatter.parse(sj2);
	 	   day = (date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000);
	 	  } catch (Exception e) {
	 	   return 0;
	 	  }
	 	  return day ;
	 	 }
	 //得到当前时间
	 public static String getStringToday() {
	 	  Date currentTime = new Date();
	 	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 	  String dateString = formatter.format(currentTime);
	 	  return dateString;
	 	 }
	 
	 public static void main(String args[]){
	 	System.out.println("*****"+getTwoDay("2007-11-22","2007-11-18"));
	 }
}
