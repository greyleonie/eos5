/*
 * �������� 2007-4-16
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author tim
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class SendMsg implements ServletContextListener {
	private Timer timer = null;
	private Log fccLog = LogFactory.getLog(TalentContextListener.class);

	
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		timer = new Timer(true);
		fccLog.info("---------��ʱ����ʼ����---------------");
		fccLog.info("---------1����ʱִ��һ�μ���---------------");
		timer.schedule(TalentAware.getInstance(),0,60*1000);
		fccLog.info("---------��ʱ����ִ��һ������---------------");
		
		
		
	}
	
	 public void contextDestroyed(ServletContextEvent event) {
	 	timer.cancel();
	 	fccLog.info("-----------------��ʱ������----------------");
	 	
	 }

}
