/* 
 * Title:     TRS ��ݷ����� 
 * Copyright: Copyright (c) 2004-2007, TRS��Ϣ�������޹�˾. All rights reserved. 
 * License:   see the license file. 
 * Company:   TRS��Ϣ�������޹�˾(www.trs.com.cn) 
 *  
 * Class:     base.util.IDSActor 
 * Created:   liushen@Jun 4, 2007 3:47:38 PM 
 * Modified:  Alex@Aug 7, 2009 2:39:48 PM
 */
package base.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.xerces.dom.NodeImpl;
import org.dom4j.dom.DOMNamespace;
import org.w3c.dom.Node;

import talent.util.TalentHand;

import com.primeton.tp.core.prservice.context.SessionContext;
import com.primeton.tp.core.prservice.exception.PrException;
import com.trs.idm.client.actor.ActorException;
import com.trs.idm.client.actor.SSOUser;
import com.trs.idm.client.actor.StdHttpSessionBasedActor;

/**
 * DemoӦ�õ�Actor��ʵ��. <BR>
 * 
 * @author TRS��Ϣ�������޹�˾
 */
public class IDSActor extends StdHttpSessionBasedActor {
	private Log log = LogFactory.getLog(IDSActor.class);

	/**
	 * DemoӦ����Session�ĵ�¼���.
	 */
	private static final String LOGIN_FLAG = "loginUser";

	/**
	 * �жϵ�ǰSession�Ƿ��¼.
	 * 
	 * @see StdHttpSessionBasedActor#checkLocalLogin(javax.servlet.http.Ht
	 *      tpSession)
	 */
	public boolean checkLocalLogin(HttpSession session) throws ActorException {
		
		//try {
		//	System.out.println("######SSOUser checkLocalLogin######" + session.getAttribute(LOGIN_FLAG) );
		//	com.primeton.tp.core.prservice.context.SessionContext sessionContext = null;
		//	sessionContext = (SessionContext)session.getAttribute(com.primeton.tp.web.driver.webdriver.WebDriver.SESSION_CONTEXT);
		//	if( sessionContext == null ){
		//		return false;
		//	}
			//return session.getAttribute(LOGIN_FLAG) != null;
		//	return false;
		//} catch (IllegalStateException e) {
		//	return false;
		//}
		
		//return session.getAttribute(LOGIN_FLAG) != null;
		return false;
//		System.out.println("######У���Ƿ��½#####"  );
//		com.primeton.tp.core.prservice.context.SessionContext sessionContext = null;
//		sessionContext = (SessionContext)session.getAttribute(com.primeton.tp.web.driver.webdriver.WebDriver.SESSION_CONTEXT);
//		if(sessionContext==null) return false;
//		return true;
	}

	/**
	 * ���ص�¼��ͳһ�û���DemoӦ�õĵ�ǰ�Ự(Session����)��, ���DemoӦ���Լ��ĵ�¼�߼�(����Ҫ�ٴζ��û�������֤, ֻ��Ҫ����).
	 * 
	 * @see StdHttpSessionBasedActor#loadLoginUser(javax.servlet.http.Http
	 *      ServletRequest, com.trs.idm.client.actor.SSOUser)
	 */
	public void loadLoginUser(HttpServletRequest request, SSOUser user)
			throws ActorException {
		HttpSession session = request.getSession();
		String userID = user.getUserName();
		String url = request.getRequestURI();
		System.out.println("######SSOUser loadLoginUser#URL#####" + url );
		System.out.println("######SSOUser loadLoginUser#1#####" + user.getUserName() );
		//session.setAttribute("userProps", user.getProperties());

		//		��ʱ��sessionContext��������
		com.primeton.tp.core.prservice.context.SessionContext sessionContext = null;
		sessionContext = (SessionContext)session.getAttribute(com.primeton.tp.web.driver.webdriver.WebDriver.SESSION_CONTEXT);
		com.primeton.tp.core.prservice.context.RequestContext requestContext = (com.primeton.tp.core.prservice.context.RequestContext)request.getAttribute(com.primeton.tp.web.driver.webdriver.WebDriver.SESSION_CONTEXT);
		if( sessionContext == null ){
			System.out.println("######SSOUser loadLoginUser#2#####" + user.getUserName() );
			sessionContext = new com.primeton.tp.core.prservice.context.SessionContext();
			sessionContext.setHttpSessionId(session.getId());
		}
		//		com.primeton.tp.core.prservice.context.SessionContext sessionContext
		// =
		// (com.primeton.tp.core.prservice.context.SessionContext)session.getAttribute("sessionContext");
		sessionContext.setUserID(userID);
		sessionContext.setUserRemoteAddr(request.getRemoteAddr());
		//sessionContext.setHttpSessionId(session.getId());
		//
		System.out.println("######SSOUser loadLoginUser#3#####" + user.getUserName() );
		session.setAttribute(com.primeton.tp.web.driver.webdriver.WebDriver.SESSION_CONTEXT, sessionContext);
		//����ԭ�е�¼ҵ���߼�
		
		TalentHand handle = new TalentHand();
		try {
			System.out.println("######SSOUser loadLoginUser#4#####" + user.getUserName() );
			handle.doProcess(sessionContext, session);
		} catch (PrException e) {
			log.equals(e);
			System.out.println("######SSOUser loadLoginUser######" + user.getUserName() + " With ERROR: " + e.getMessage() );
		}
		//session.setAttribute("sessionContext", sessionContext);
		
		//com.primeton.tp.core.prservice.handle.InitPermissionHandle permissionHand = new com.primeton.tp.core.prservice.handle.InitPermissionHandle();
		//try {
		//	System.out.println("######SSOUser loadLoginUser#5#####" + user.getUserName() );
		//	permissionHand.doProcess(sessionContext, requestContext);
		//} catch (Exception e1) {
		//	e1.printStackTrace();
		//}

		//com.primeton.tp.core.prservice.handle.MenuHandle menuHand = new com.primeton.tp.core.prservice.handle.MenuHandle();
		//try {
		//	System.out.println("######SSOUser loadLoginUser#5#####" + user.getUserName() );
		//	menuHand.doProcess(sessionContext, requestContext);
		//} catch (Exception e1) {
		//	e1.printStackTrace();
		//}

		//		ע���û�
		com.primeton.tp.core.prservice.monitor.UserMessage userMsg = new com.primeton.tp.core.prservice.monitor.UserMessage(
				com.primeton.tp.core.prservice.monitor.CurrentUserMBean
						.getUserMBean(), userID, request.getRemoteAddr(),
				session.getId(), System.currentTimeMillis());
		userMsg.setRegister(true);
		com.primeton.tp.core.management.StatQueue.theOne().put(userMsg);
		System.out.println("######SSOUser loadLoginUser#4#####" + user.getUserName() );
		com.primeton.tp.core.prservice.context.MenuContext menu = null;
		try {
			menu = com.primeton.tp.core.prservice.controller.Controller
					.getMenu(sessionContext);
			System.out.println("######SSOUser loadLoginUser#8#####" + user.getUserName() );
			session.setAttribute("menuContext", menu);
		} catch (Exception e) {
			log.equals(e);
			System.out.println("######SSOUser loadLoginUser######" + user.getUserName() + " With ERROR_1: " + e.getMessage() );
		}
		session.setAttribute(LOGIN_FLAG, userID);
		System.out.println("######SSOUser loadLoginUser#7#####" + user.getUserName() );
	}

	/**
	 * ���DemoӦ���Լ����˳���¼���߼�.
	 * 
	 * @see StdHttpSessionBasedActor#logout(javax.servlet.http.HttpSession )
	 */
	public void logout(HttpSession session) throws ActorException {
		try {
			System.out.println("######SSOUser logout######");
			session.invalidate();
		} catch (IllegalStateException e) {
			// this can be ignored
		}
	}

	/**
	 * DemoӦ��ͬ�������û���ʵ��. ��ΪDemoӦ�úܼ�, ���洢�û�����, �� �Ա�ʵ�ֽ������� <code>true</code>,
	 * ��ʾͬ���ɹ�����.
	 * 
	 * @see StdHttpSessionBasedActor#addUser(com.trs.idm.client.actor.SSOU ser,
	 *      javax.servlet.http.HttpServletRequest)
	 */
	public boolean addUser(SSOUser user, HttpServletRequest request)
			throws ActorException {
		System.out.println("######SSOUser addUser######" + user.getUserName() + " ");
		return true;
	}

	/**
	 * DemoӦ�ý����û���ʵ��. ��ΪDemoӦ�úܼ�, ����Ҫ�Խ����û������� ����, ���Ա�ʵ�ֽ������� <code>true</code>,
	 * ��ʾ���óɹ�����.
	 * 
	 * @see StdHttpSessionBasedActor#disableUser(com.trs.idm.client.actor.
	 *      SSOUser)
	 */
	public boolean disableUser(SSOUser user) throws ActorException {
		System.out.println("######SSOUser disableUser######" + user.getUserName() + " ");
		return true;
	}

	/**
	 * DemoӦ�������û���ʵ��. ��ΪDemoӦ�úܼ�, ����Ҫ�������û������� ����, ���Ա�ʵ�ֽ������� <code>true</code>,
	 * ��ʾ���óɹ�����.
	 * 
	 * @see StdHttpSessionBasedActor#enableUser(com.trs.idm.client.actor.S
	 *      SOUser)
	 */
	public boolean enableUser(SSOUser user) throws ActorException {
		System.out.println("######SSOUser disableUser######" + user.getUserName() + " ");
		return true;
	}

	/**
	 * ��DemoӦ�õ����е�¼ҳ��ı��л�ȡ�û���.
	 * 
	 * @see StdHttpSessionBasedActor#extractUserName(javax.servlet.http.Ht
	 *      tpServletRequest)
	 */
	public String extractUserName(HttpServletRequest request)
			throws ActorException {
		String result = request.getParameter("userName");
		System.out.println("######SSOUser extractUserName######" + result);
		return (result == null) ? "" : result;
	}

	/**
	 * ��DemoӦ�õ����е�¼ҳ��ı��л�ȡ����.
	 * 
	 * @see StdHttpSessionBasedActor#extractUserPwd(javax.servlet.http.Htt
	 *      pServletRequest)
	 */
	public String extractUserPwd(HttpServletRequest request)
			throws ActorException {
		String result = request.getParameter("password");
		System.out.println("######SSOUser extractUserPwd######");
		return (result == null) ? "" : result;
	}

	/**
	 * DemoӦ��ͬ��ɾ���û���ʵ��. ��ΪDemoӦ�úܼ�, ���洢�û�����, �� �Ա�ʵ�ֽ������� <code>true</code>,
	 * ��ʾͬ���ɹ�����.
	 * 
	 * @see StdHttpSessionBasedActor#removeUser(com.trs.idm.client.actor.S
	 *      SOUser, javax.servlet.http.HttpServletRequest)
	 */
	public boolean removeUser(SSOUser user, HttpServletRequest request)
			throws ActorException {
		System.out.println("######SSOUser removeUser######" + user.getUserName() + " ");
		return true;
	}

	/**
	 * DemoӦ��ͬ�������û���ʵ��. ��ΪDemoӦ�úܼ�, ���洢�û�����, �� �Ա�ʵ�ֽ������� <code>true</code>,
	 * ��ʾͬ���ɹ�����.
	 * 
	 * @see StdHttpSessionBasedActor#updateUser(com.trs.idm.client.actor.S
	 *      SOUser, javax.servlet.http.HttpServletRequest)
	 */
	public boolean updateUser(SSOUser user, HttpServletRequest request)
			throws ActorException {
		System.out.println("######SSOUser updateUser######" + user.getUserName() + " ");
		return true;
	}

	/**
	 * DemoӦ���ж��û��Ƿ���ڵ�ʵ��. ��ΪDemoӦ�úܼ�, ���洢�û�����, ���Ա�ʵ�ֽ������� <code>true</code>,
	 * ��ʾ�û�����, ʹ�õ�¼ʱ�����ȵ��� ͬ�������û��ķ���.
	 * 
	 * @see StdHttpSessionBasedActor#userExist(com.trs.idm.client.actor.SS
	 *      OUser)
	 */
	public boolean userExist(SSOUser user) throws ActorException {
		System.out.println("######SSOUser userExist######" + user.getUserName() + " ");
		return true;
	}

}