/*
 * 创建日期 2005-12-9
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;

import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionEvent;
import java.util.Enumeration;
import com.primeton.tp.core.prservice.monitor.CurrentUserMBean;
import com.primeton.tp.core.management.users.EOSUser;
import com.primeton.tp.core.management.users.EOSUserManager;


/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TalentSessionListenerImpl implements HttpSessionListener{
	  public TalentSessionListenerImpl() {
	  }
	  
	  public void sessionCreated(HttpSessionEvent httpsessionevent)
	   {
	      Enumeration enu = httpsessionevent.getSession().getAttributeNames();
	      while(enu.hasMoreElements()) System.out.println("###### session name is: " + enu.nextElement().toString());
	   }

	   public void sessionDestroyed(HttpSessionEvent httpsessionevent)
	   {
	       System.out.println("sessionDestory!");
	       String s = httpsessionevent.getSession().getId();
	       System.out.println("session id:" + s);
	       CurrentUserMBean.getUserMBean().unregisterUser(s);
	       EOSUser aeosuser[] = EOSUserManager.findUsers(null, null, s, null, 0L, 0L, 0L, 0L);
	       System.out.println("sessionDestroyed, user size:" + aeosuser.length);
	       for(int i = 0; i < aeosuser.length; i++)
	       {
	           EOSUser eosuser = aeosuser[i];
	           eosuser.getOwner().remove(eosuser);
	       }

	   }

	}
