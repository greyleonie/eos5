/*
 * �������� 2007-2-7
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.util;

import java.util.Timer;

import javax.servlet.ServletContextListener;
import javax.servlet.ServletContextEvent;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;





/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TalentContextListener implements ServletContextListener {
	//private Timer timer = null;
	private Log fccLog = LogFactory.getLog(TalentContextListener.class);

	public void contextInitialized(ServletContextEvent servletContextEvent) {
	//	timer = new Timer(true);
	//	fccLog.info("---------��ʱ����ʼ����---------------");
	//	fccLog.info("---------10����ִ��һ�μ���---------------");
	//	timer.schedule(TalentAware.getInstance(),0,10*60*1000);
	//	fccLog.info("---------5����ִ��һ�μ���---------------");
		//timer.schedule(RealTimeTransferTimer.getInstance(),0,5*60*1000);
	//	fccLog.info("---------15����ִ��һ�μ���---------------");
		//ԭ����ͬ��
		//timer.schedule(NewDataTransfer.getInstance(),0,15*60*1000);
		//timer.schedule(DataTransferTimer.getInstance(),0,15*60*1000);
	//	fccLog.info("---------25����ִ��һ�μ���---------------");
		//timer.schedule(DeleteLogTimer.getInstance(),0,25*60*1000);
	//	fccLog.info("---------��ʱ����ִ��һ������---------------");
		
		EOSMenuMap eosMenuMap =new EOSMenuMap();
		eosMenuMap.loadMenu(servletContextEvent.getServletContext());
		
	}
	
	
	
	public void contextDestroyed(ServletContextEvent event) {
	//	timer.cancel();
	 	fccLog.info("-----------------��ʱ������----------------");
	}
}
