/*
 * 创建日期 2006-2-21
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

import java.util.Timer;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletContextEvent;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;





/**
 * Description: 应用监听器，系统启动自动执行定时器任务
 * @author FCC
 * @version 2.0
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TalentContextListener implements ServletContextListener {
	private Timer timer = null;
	private Log fccLog = LogFactory.getLog(TalentContextListener.class);

	
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		timer = new Timer(true);
		fccLog.info("---------定时器开始启动---------------");
		fccLog.info("---------2个小时执行一次监听---------------");
		timer.schedule(TalentAware.getInstance(),0,2*60*60*1000);
		fccLog.info("---------定时器已执行一次任务---------------");
		
		
		
	}
	
	 public void contextDestroyed(ServletContextEvent event) {
	 	timer.cancel();
	 	fccLog.info("-----------------定时器销毁----------------");
	 	
	 }

}