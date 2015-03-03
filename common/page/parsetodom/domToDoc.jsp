<%@ page language="java" contentType="text/html; charset=GBK"%>
<%
response.setContentType("application/msword;charset=gb2312");
%>


<%
String title=base.util.TalentContext.getValue(pageContext,null,"title");
String xmlfcc=base.util.TalentContext.getValue(pageContext,null,"xmlfcc");
 %>
<div id="ss" align="center">
<%=title%>
<%=xmlfcc%>
</div>



