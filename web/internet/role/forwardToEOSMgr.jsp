<%@ include file="/internet/eosapp/hciHead.jsp" %> 

<%@ page import="com.primeton.tp.core.prservice.context.SessionContext%> 
<%@ page import="com.primeton.tp.core.prservice.context.RequestContext%> 
<%@ page import="com.primeton.tp.core.prservice.monitor.UserMessage%> 
<%@ page import="com.primeton.tp.core.prservice.monitor.CurrentUserMBean%> 
<%@ page import="com.primeton.tp.core.management.StatQueue%> 
<%@ page import="com.primeton.tp.common.xml.XmlUtil%> 
<%@ page import="com.primeton.tp.common.xml.XmlUtilException%> 
<%@ page import="org.w3c.dom.NodeList%> 

<%@ page import="java.util.List%> 
<%@ page import="java.util.Vector%> 
<%@ page import="com.primeton.tp.core.prservice.context.SessionContext" %> 


<%

     String userID = null;
     String url = null;
     
     SessionContext sessionContext = (SessionContext)session.getAttribute("sessionContext");
     if(sessionContext != null || !session.isNew())
     {
       userID = sessionContext.getUserID();
       if(userID != null)
       {
         response.sendRedirect("/eosmgr/manager.jsp?action=login&forwardType=inner&username="+userID+"");
       }
       else{
        response.getWriter().println("Î´µÇÂ¼,»òÕßµÇÂ¼Ê§°Ü¡£ÇëÖØÐÂµÇÂ¼¡£");
       }
     }
     else{
       response.getWriter().println("Î´µÇÂ¼,»òÕßµÇÂ¼Ê§°Ü¡£ÇëÖØÐÂµÇÂ¼¡£");
     }
 

%>


<%@ include file="/internet/hciTail.jsp" %>

