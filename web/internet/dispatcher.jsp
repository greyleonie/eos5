<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.primeton.tp.core.prservice.context.SessionContext" %>
<%@ page import="com.primeton.tp.core.prservice.monitor.UserMessage" %>
<%@ page import="com.primeton.tp.web.driver.webdriver.WebDriverUpload" %>
<%@ page import="com.primeton.tp.core.management.StatQueue" %>
<%@ page import="com.primeton.tp.core.prservice.context.MenuContext" %>
<%@ page import="com.primeton.tp.core.prservice.controller.Controller" %>
<%@ page import="com.primeton.tp.core.prservice.monitor.CurrentUserMBean" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.primeton.tp.common.util.*" %>
<%@ page import="com.primeton.tp.manager.util.*" %>

<%@ page import="com.primeton.eos.wf.service.upgrade.*"%>
<%
	
	boolean success = false;
	if (request.getParameter("from")!=null)
	{
		long logTime = Long.parseLong(Base64.decode(Code.decode(request.getParameter("from"))));
		long curtime = System.currentTimeMillis();
		if (curtime >= logTime && (curtime - logTime)<=1000*60)
		{
			success = true;
		}
		
	}
	

	
	
	if (request.getParameter("from")!=null && success)
	{
	
		String SESSION_CONTEXT = "sessionContext";
		String SESSION_MENU = "menuContext";
		//赋Session
	
		//if (session.isNew() || session.getAttribute(SESSION_CONTEXT) == null)
		{
			SessionContext  sessionContext = new SessionContext();
			sessionContext.setUserID("sysadmin");
			sessionContext.setUserRemoteAddr(request.getRemoteAddr());
			//updated by jiaoly
			sessionContext.setUploadRoot(WebDriverUpload.getUploadRoot());
			
			sessionContext.setHttpSessionId(session.getId());
			session.setAttribute(SESSION_CONTEXT, sessionContext);
			
			//注册用户guest
			UserMessage userMsg = new UserMessage(CurrentUserMBean.getUserMBean(),"sysadmin", request.getRemoteAddr(), session.getId(),System.currentTimeMillis());
			userMsg.setRegister(true);
			StatQueue.theOne().put(userMsg);
			
			MenuContext menu = null;
			menu = Controller.getMenu(sessionContext);
			session.setAttribute(SESSION_MENU, menu);
		}
		
		
		
		
    
		//读参数set.jsp?redirectURL=ROLE.pr_automata.ROLE_P_OperatorMain.do&parameter1=a&parameter2=a&parameter3=a
		Enumeration enum = request.getParameterNames();
		String redirectURL = "";
		StringBuffer sb  = new StringBuffer();
		while(enum.hasMoreElements())
		{
			String name = (String)enum.nextElement();
			if (name == null || name.trim().length() == 0)
			{
				continue;
			}
			sb.append("&");
			if (name.equals("redirectURL"))
			{
				redirectURL = request.getParameter(name);
			}
			else
			{
				String value = request.getParameter(name);
				sb.append(name).append("=").append(value);
			}
		}
	
		redirectURL = redirectURL + "?" + sb.toString();
		
		
		UpGradeManager um = UpGradeManagerFactory.getInstance();
		if (um.getCurrentState()!=UpGradeManager.STAT_IDLE || um.isNeedUpgrade() ){
    	   	    redirectURL="WFCOMMON.pr_upgrade.startUpgrade.do";
		}
		
		
		//重定向
		response.sendRedirect(redirectURL);
		
		//String redirectURL = request.getParameter("redirectURL");
		//重定向
		//request.getRequestDispatcher(redirectURL).forward(request,response);
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
%>

