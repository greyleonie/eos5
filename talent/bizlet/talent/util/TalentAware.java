/*
 * �������� 2007-2-7
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TalentAware extends TimerTask {
	private Log fccLog = LogFactory.getLog(TalentAware.class);
	private Properties pro = null;
	
	private String morningstart = null;//���Ͽ�ʼ����ʱ��
	private String morningend = null;//���Ͻ�������ʱ��
	private String afternoonstart = null;//���翪ʼ����ʱ��
	private String afternoonend = null;//�����������ʱ��
	private String nightstart = null;//���Ͽ�ʼ����ʱ��
	private String nightend = null;//���Ͻ�������ʱ��

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
			fccLog.info("----------------------------------------��ʼִ���߳���run-------------------------------------");
			
			
			Date currentTime = Calendar.getInstance().getTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String baseDate = sdf.format(currentTime);
			
			//---------------------------����ѧԱˢ�����ݣ���Ҫ��ȷ�����ε�ѧԱ--------------------------------------------
			SimpleDateFormat parseDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date morStart = parseDate.parse(baseDate + " " + morningstart);
			Date morEnd = parseDate.parse(baseDate + " " + morningend);
			Date aftStart = parseDate.parse(baseDate + " " + afternoonstart);
			Date aftEnd = parseDate.parse(baseDate + " " + afternoonend);
			Date nightStart = parseDate.parse(baseDate + " " + nightstart);
			Date nightEnd = parseDate.parse(baseDate + " " + nightend);
			
			
			int noon = -1;//���
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
			//--------------------------����ѧԱˢ�����ݣ���Ҫ��ȷ�����ε�ѧԱ----------------------------------------------
			
			fccLog.info("----------------------------------------����ִ���߳���run-------------------------------------");
			
			//�ֶ�����ѧԱˢ�����ݣ���Ҫ��ȷ�����ε�ѧԱ
			//noon = 0; //���
		    //baseDate = "2008-04-09";//����
			//checkTime = baseDate + " " + "12:00:00";//���ʱ�� �������϶���
			//currentTime = sdf.parse(baseDate);
			//DXCardDataHander hander = new DXCardDataHander(baseDate,checkTime,noon);
			//hander.setLogDate(currentTime);
			//hander.doProcess();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
}
