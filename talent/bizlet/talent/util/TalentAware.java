/*
 * 创建日期 2007-2-7
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.util;

import java.util.Calendar;
import java.util.Date;
import java.util.TimerTask;
import java.util.Properties;
import java.text.*;
import java.io.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TalentAware extends TimerTask {
	private Log fccLog = LogFactory.getLog(TalentAware.class);
	private Properties pro = null;
	
	private String morningstart = null;//早上开始计算时间
	private String morningend = null;//早上结束计算时间
	private String afternoonstart = null;//下午开始计算时间
	private String afternoonend = null;//下午结束计算时间
	private String nightstart = null;//晚上开始计算时间
	private String nightend = null;//晚上结束计算时间

	public static TalentAware talentAware = null;

	private TalentAware() {
		init();
	}
	
	protected void init() {
		try{
			pro = new Properties();
			InputStream in = this.getClass().getResourceAsStream("/properties/database.properties");
			pro.load(in);
			
			in.close();
			
			morningstart = pro.getProperty("morningstart");
			morningend = pro.getProperty("morningend");
			afternoonstart = pro.getProperty("afternoonstart");
			afternoonend = pro.getProperty("afternoonend");
			nightstart = pro.getProperty("nightstart");
			nightend = pro.getProperty("nightend");
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	public static TalentAware getInstance() {
		if (talentAware == null)
			talentAware = new TalentAware();
		return talentAware;
	}
	
	
	

	public void run() {
		try{
			fccLog.info("----------------------------------------开始执行线程体run-------------------------------------");
			
			
			Date currentTime = Calendar.getInstance().getTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String baseDate = sdf.format(currentTime);
			
			//---------------------------处理学员刷卡数据，主要是确定旷课的学员--------------------------------------------
			SimpleDateFormat parseDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date morStart = parseDate.parse(baseDate + " " + morningstart);
			Date morEnd = parseDate.parse(baseDate + " " + morningend);
			Date aftStart = parseDate.parse(baseDate + " " + afternoonstart);
			Date aftEnd = parseDate.parse(baseDate + " " + afternoonend);
			Date nightStart = parseDate.parse(baseDate + " " + nightstart);
			Date nightEnd = parseDate.parse(baseDate + " " + nightend);
			
			
			int noon = -1;//午别
			String checkTime = null;
			
			if(currentTime.after(morStart) && currentTime.before(morEnd)) {
				noon = 0;
				checkTime = baseDate + " " + "12:00:00";
				DXCardDataHander hander = new DXCardDataHander(baseDate,checkTime,noon);
				hander.setLogDate(currentTime);
				hander.doProcess();
				
				
			}else if(currentTime.after(aftStart) && currentTime.before(aftEnd)) {
				noon = 1;
				checkTime = baseDate + " " + "18:00:00";
				DXCardDataHander hander = new DXCardDataHander(baseDate,checkTime,noon);
				hander.setLogDate(currentTime);
				hander.doProcess();
				
			}else if(currentTime.after(nightStart) && currentTime.before(nightEnd)) {
				noon = 2;
				checkTime = baseDate + " " + "22:00:00";
				DXCardDataHander hander = new DXCardDataHander(baseDate,checkTime,noon);
				hander.setLogDate(currentTime);
				hander.doProcess();
				
			}
			//--------------------------处理学员刷卡数据，主要是确定旷课的学员----------------------------------------------
			
			fccLog.info("----------------------------------------结束执行线程体run-------------------------------------");
			
			//手动处理学员刷卡数据，主要是确定旷课的学员
			//noon = 0; //午别
		    //baseDate = "2008-04-09";//日期
			//checkTime = baseDate + " " + "12:00:00";//午别时间 按照以上定义
			//currentTime = sdf.parse(baseDate);
			//DXCardDataHander hander = new DXCardDataHander(baseDate,checkTime,noon);
			//hander.setLogDate(currentTime);
			//hander.doProcess();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
}
