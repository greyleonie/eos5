/*
 * 创建日期 2006-2-21
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

import java.sql.*;
import java.util.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.text.*;
import java.util.TimerTask;
import java.util.List;
import java.util.ArrayList;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import base.util.DBconnection;

/**
 * @author FCC
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TalentAware extends TimerTask {
	private Log fccLog = LogFactory.getLog(TalentAware.class);
	public static TalentAware talentAware = null;
	
	private TalentAware() {
		
	}
	
	public static TalentAware getInstance() {
		if(talentAware==null) talentAware = new TalentAware();
		return talentAware;
	}
	
	
	
	public void run() {
		

	}
	
	
	public boolean isRest(List list,String d) {
		boolean result = false;
		for(int i = 0; i < list.size(); i++) {
			WorkCale wc = (WorkCale) list.get(i);
			String rest = wc.getRestDate();
			if(d.equalsIgnoreCase(rest)) return true;
		}
		return result;
	
	}
	
	public String getWorkDay(List list,String d) {
		String result = d;
		String newstr = d;
		if(isRest(list,d)){
			
			String yyyy = d.substring(0,4);
			String mm = d.substring(4,6);
			String dd = d.substring(6,8);
			GregorianCalendar gc = new GregorianCalendar(Integer.parseInt(yyyy),Integer.parseInt(mm)-1,Integer.parseInt(dd));
			gc.add(Calendar.DAY_OF_YEAR,1);
			newstr = String.valueOf(gc.get(Calendar.YEAR));
			if(gc.get(Calendar.MONTH)+1 < 10) {
				
			     newstr += "0" + String.valueOf(gc.get(Calendar.MONTH)+1);
			}else{
			     newstr += gc.get(Calendar.MONTH)+1;
			}
			if(gc.get(Calendar.DAY_OF_MONTH)<10) {
			     newstr += "0" + gc.get(Calendar.DAY_OF_MONTH);
			}else{
			     newstr += gc.get(Calendar.DAY_OF_MONTH);
			}
			
			result = "";
			
			
		}
		return "".equals(result)?getWorkDay(list,newstr):result;
	
	}
	
	
	public String getAddOneDay(String d) {
		String newstr = d;
		String yyyy = d.substring(0,4);
		String mm = d.substring(4,6);
		String dd = d.substring(6,8);
		GregorianCalendar gc = new GregorianCalendar(Integer.parseInt(yyyy),Integer.parseInt(mm)-1,Integer.parseInt(dd));
		gc.add(Calendar.DAY_OF_YEAR,1);
		newstr = String.valueOf(gc.get(Calendar.YEAR));
		if(gc.get(Calendar.MONTH)+1 < 10) {
		     newstr += "0" + String.valueOf(gc.get(Calendar.MONTH)+1);
		}else{
		     newstr += gc.get(Calendar.MONTH)+1;
		}
		if(gc.get(Calendar.DAY_OF_MONTH)<10) {
		     newstr += "0" + gc.get(Calendar.DAY_OF_MONTH);
		}else{
		     newstr += gc.get(Calendar.DAY_OF_MONTH);
		}
		return newstr;
	
	}
	
	
	
	
	
	
	

}
