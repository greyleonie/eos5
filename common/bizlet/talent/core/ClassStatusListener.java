/*
 * �������� 2007-6-11
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
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class ClassStatusListener implements ServletContextListener {

	private Timer timer = null;
	private Log fccLog = LogFactory.getLog(ClassStatusListener.class);
	public void contextInitialized(ServletContextEvent arg0) {
		timer = new Timer(true);
		fccLog.info("---------ɨ��༶���͵Ķ�ʱ������---------------");
		timer.schedule(HandleClassStatus.getInstance(),0,24*60*60*1000); 
	}

	
	public void contextDestroyed(ServletContextEvent arg0) {
		timer.cancel();
	 	fccLog.info("-----------------ɨ��༶���͵Ķ�ʱ������----------------");
		
	}

}
