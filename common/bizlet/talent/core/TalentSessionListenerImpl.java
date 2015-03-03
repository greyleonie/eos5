/*
 * �������� 2005-12-9
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
