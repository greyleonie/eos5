<%@ include file="/internet/common.jsp" %> 
<%@page import="com.primeton.eos.wf.web.util.*" %> 
<pre>
  <%
     String command =  request.getParameter("command");
     
     if ("enable".equals(command)){
       
       String prefix =  request.getParameter("prefix");
       
       String limit =  request.getParameter("limit");
       
       if (!(limit==null) && !(limit.equals("")) )
       {
             WFEngineMonitor.setMethodLogLimitNumber(Integer.parseInt(limit));
       		 out.println("LimitNumber setting to :"+limit);
        }
       
       if (!(prefix==null) && !(prefix.equals("")) )
       {
             WFEngineMonitor.setMethodLogPrefix(prefix);
       		 out.println("Prefix setting to :"+prefix);
        }
       
       
       WFEngineMonitor.setMethodLogStatus(true);
       out.println("Setting method log :true");
       
     }else if ("disable".equals(command)){

       WFEngineMonitor.setMethodLogStatus(false);
       out.println("Setting method log :false");

     }else if ("query".equals(command)){

     	String prefix = request.getParameter("prefix");
        out.println("<pre>");
        out.println(WFEngineMonitor.getMethodLogStaticsString(prefix));
        out.println("</pre>");

     }else{

       boolean status =  WFEngineMonitor.getMethodLogStatus();
       long  limitNumber=  WFEngineMonitor.getMethodLogLimitNumber();
       long  currentNumber=  WFEngineMonitor.getMethodLogCurrentNumber();
       String prefix=WFEngineMonitor.getMethodLogPrefix();
       out.println("MethodLogStatus="+status + "  prefix="+prefix + "  limitnumber="+limitNumber +"  currentNumber="+currentNumber);
       out.println("<br>command list<br>command=enable&prefix=xxx&limit=yyy<br>command=disable<br>command=query&prefix=xxx");

     }
  
  %>
</pre>