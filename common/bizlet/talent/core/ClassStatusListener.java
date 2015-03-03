/*
 * 创建日期 2007-6-11
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
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class ClassStatusListener implements ServletContextListener {

	private Timer timer = null;
	private Log fccLog = LogFactory.getLog(ClassStatusListener.class);
	public void contextInitialized(ServletContextEvent arg0) {
		timer = new Timer(true);
		fccLog.info("---------扫描班级类型的定时器启动---------------");
		timer.schedule(HandleClassStatus.getInstance(),0,24*60*60*1000); 
	}

	
	public void contextDestroyed(ServletContextEvent arg0) {
		timer.cancel();
	 	fccLog.info("-----------------扫描班级类型的定时器销毁----------------");
		
	}

}
