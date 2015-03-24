
<%@ include file="/internet/hciHead.jsp" %> 
<%

     String userID = null;
     String url = null;
     
     com.primeton.tp.core.prservice.context.SessionContext sessionContext = (com.primeton.tp.core.prservice.context.SessionContext)session.getAttribute("sessionContext");
     if(sessionContext != null || !session.isNew())
     {
       userID = sessionContext.getUserID();

       if(userID.equals("petstore"))
       {

%>

<%
       }
    }

%>

<%@ include file="/internet/hciTail.jsp" %>