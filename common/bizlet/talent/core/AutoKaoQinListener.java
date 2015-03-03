/*
 * 创建日期 2008-4-16
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
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
 * TODO 要更改此生成的类型注释的模板，请转至 窗口 － 首选项 － Java － 代码样式 － 代码模板
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
            fccLog.info("---------自动考勤开始---------------");
            //timer.schedule(HandleKaoqinData.getInstance(),0,10*60*60*1000);
        } catch (Exception e) {
            fccLog.info("---------自动考勤失败---------------");
        }
    }

    public void contextDestroyed(ServletContextEvent arg0) {
        timer.cancel();
        fccLog.info("-----------------自动考勤的定时器销毁----------------");

    }
}