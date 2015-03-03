/*
 * �������� 2006-2-21
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

import java.util.Timer;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletContextEvent;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;





/**
 * Description: Ӧ�ü�������ϵͳ�����Զ�ִ�ж�ʱ������
 * @author FCC
 * @version 2.0
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TalentContextListener implements ServletContextListener {
	private Timer timer = null;
	private Log fccLog = LogFactory.getLog(TalentContextListener.class);

	
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		timer = new Timer(true);
		fccLog.info("---------��ʱ����ʼ����---------------");
		fccLog.info("---------2��Сʱִ��һ�μ���---------------");
		timer.schedule(TalentAware.getInstance(),0,2*60*60*1000);
		fccLog.info("---------��ʱ����ִ��һ������---------------");
		
		
		
	}
	
	 public void contextDestroyed(ServletContextEvent event) {
	 	timer.cancel();
	 	fccLog.info("-----------------��ʱ������----------------");
	 	
	 }

}