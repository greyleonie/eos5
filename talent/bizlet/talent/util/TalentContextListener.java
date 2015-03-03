/*
 * 创建日期 2007-2-7
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
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
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TalentContextListener implements ServletContextListener {
	//private Timer timer = null;
	private Log fccLog = LogFactory.getLog(TalentContextListener.class);

	public void contextInitialized(ServletContextEvent servletContextEvent) {
	//	timer = new Timer(true);
	//	fccLog.info("---------定时器开始启动---------------");
	//	fccLog.info("---------10分钟执行一次监听---------------");
	//	timer.schedule(TalentAware.getInstance(),0,10*60*1000);
	//	fccLog.info("---------5分钟执行一次监听---------------");
		//timer.schedule(RealTimeTransferTimer.getInstance(),0,5*60*1000);
	//	fccLog.info("---------15分钟执行一次监听---------------");
		//原数据同步
		//timer.schedule(NewDataTransfer.getInstance(),0,15*60*1000);
		//timer.schedule(DataTransferTimer.getInstance(),0,15*60*1000);
	//	fccLog.info("---------25分钟执行一次监听---------------");
		//timer.schedule(DeleteLogTimer.getInstance(),0,25*60*1000);
	//	fccLog.info("---------定时器已执行一次任务---------------");
		
		EOSMenuMap eosMenuMap =new EOSMenuMap();
		eosMenuMap.loadMenu(servletContextEvent.getServletContext());
		
	}
	
	
	
	public void contextDestroyed(ServletContextEvent event) {
	//	timer.cancel();
	 	fccLog.info("-----------------定时器销毁----------------");
	}
}
