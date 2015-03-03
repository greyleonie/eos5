/*
 * 创建日期 2007-4-16
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
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
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class SendMsg implements ServletContextListener {
	private Timer timer = null;
	private Log fccLog = LogFactory.getLog(TalentContextListener.class);

	
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		timer = new Timer(true);
		fccLog.info("---------定时器开始启动---------------");
		fccLog.info("---------1分钟时执行一次监听---------------");
		timer.schedule(TalentAware.getInstance(),0,60*1000);
		fccLog.info("---------定时器已执行一次任务---------------");
		
		
		
	}
	
	 public void contextDestroyed(ServletContextEvent event) {
	 	timer.cancel();
	 	fccLog.info("-----------------定时器销毁----------------");
	 	
	 }

}
