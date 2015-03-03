/*
 * �������� 2008-4-16
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author netkidfan
 * 
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת�� ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class AutoKaoQinListener implements ServletContextListener {
    private Timer timer = null;

    private Log fccLog = LogFactory.getLog(AutoKaoQinListener.class);

    public void contextInitialized(ServletContextEvent arg0) {
        try {
            timer = new Timer(true);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date today = new Date();
            String date = sdf.format(today);
            date += " 17:45:00";
            today = sdf2.parse(date);
            timer.schedule(HandleKaoqinData.getInstance(), today, 24*60*60*1000);
            fccLog.info("---------�Զ����ڿ�ʼ---------------");
            //timer.schedule(HandleKaoqinData.getInstance(),0,10*60*60*1000);
        } catch (Exception e) {
            fccLog.info("---------�Զ�����ʧ��---------------");
        }
    }

    public void contextDestroyed(ServletContextEvent arg0) {
        timer.cancel();
        fccLog.info("-----------------�Զ����ڵĶ�ʱ������----------------");

    }
}