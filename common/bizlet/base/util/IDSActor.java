/* 
 * Title:     TRS 身份服务器 
 * Copyright: Copyright (c) 2004-2007, TRS信息技术有限公司. All rights reserved. 
 * License:   see the license file. 
 * Company:   TRS信息技术有限公司(www.trs.com.cn) 
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
 * Demo应用的Actor的实现. <BR>
 * 
 * @author TRS信息技术有限公司
 */
public class IDSActor extends StdHttpSessionBasedActor {
	private Log log = LogFactory.getLog(IDSActor.class);

	/**
	 * Demo应用中Session的登录标记.
	 */
	private static final String LOGIN_FLAG = "loginUser";

	/**
	 * 判断当前Session是否登录.
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
//		System.out.println("######校验是否登陆#####"  );
//		com.primeton.tp.core.prservice.context.SessionContext sessionContext = null;
//		sessionContext = (SessionContext)session.getAttribute(com.primeton.tp.web.driver.webdriver.WebDriver.SESSION_CONTEXT);
//		if(sessionContext==null) return false;
//		return true;
	}

	/**
	 * 加载登录的统一用户到Demo应用的当前会话(Session对象)中, 完成Demo应用自己的登录逻辑(不需要再次对用户进行认证, 只需要加载).
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

		//		这时候sessionContext还不存在
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
		//调用原有登录业务逻辑
		
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

		//		注册用户
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
	 * 完成Demo应用自己的退出登录的逻辑.
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
	 * Demo应用同步增加用户的实现. 因为Demo应用很简单, 不存储用户数据, 所 以本实现仅仅返回 <code>true</code>,
	 * 表示同步成功即可.
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
	 * Demo应用禁用用户的实现. 因为Demo应用很简单, 不需要对禁用用户进行特 别处理, 所以本实现仅仅返回 <code>true</code>,
	 * 表示禁用成功即可.
	 * 
	 * @see StdHttpSessionBasedActor#disableUser(com.trs.idm.client.actor.
	 *      SSOUser)
	 */
	public boolean disableUser(SSOUser user) throws ActorException {
		System.out.println("######SSOUser disableUser######" + user.getUserName() + " ");
		return true;
	}

	/**
	 * Demo应用启用用户的实现. 因为Demo应用很简单, 不需要对启用用户进行特 别处理, 所以本实现仅仅返回 <code>true</code>,
	 * 表示启用成功即可.
	 * 
	 * @see StdHttpSessionBasedActor#enableUser(com.trs.idm.client.actor.S
	 *      SOUser)
	 */
	public boolean enableUser(SSOUser user) throws ActorException {
		System.out.println("######SSOUser disableUser######" + user.getUserName() + " ");
		return true;
	}

	/**
	 * 从Demo应用的自有登录页面的表单中获取用户名.
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
	 * 从Demo应用的自有登录页面的表单中获取密码.
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
	 * Demo应用同步删除用户的实现. 因为Demo应用很简单, 不存储用户数据, 所 以本实现仅仅返回 <code>true</code>,
	 * 表示同步成功即可.
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
	 * Demo应用同步更新用户的实现. 因为Demo应用很简单, 不存储用户数据, 所 以本实现仅仅返回 <code>true</code>,
	 * 表示同步成功即可.
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
	 * Demo应用判断用户是否存在的实现. 因为Demo应用很简单, 不存储用户数据, 所以本实现仅仅返回 <code>true</code>,
	 * 表示用户存在, 使得登录时不必先调用 同步增加用户的方法.
	 * 
	 * @see StdHttpSessionBasedActor#userExist(com.trs.idm.client.actor.SS
	 *      OUser)
	 */
	public boolean userExist(SSOUser user) throws ActorException {
		System.out.println("######SSOUser userExist######" + user.getUserName() + " ");
		return true;
	}

}