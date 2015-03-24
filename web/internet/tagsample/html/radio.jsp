<html>
<%@ page import="com.primeton.tp.core.prservice.context.RequestContext,com.primeton.tp.core.prservice.context.SessionContext,com.primeton.tp.web.driver.webdriver.WebDriver,com.primeton.tp.common.xml.XmlUtil"%>
<%
    String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"/internet/tagsample/html/checkbox.xml";
//    RequestContext dom = new RequestContext(fileName);
      SessionContext dom = new SessionContext(fileName);
    pageContext.getSession().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
String result = dom.getProperty("show/info");
System.out.println(result);
//    pageContext.setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
%>
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
</head>
<SCRIPT src="/internet/scripts/openWin.js" type="text/javascript"></SCRIPT>
<SCRIPT src="/internet/scripts/sortTable.js" type="text/javascript"></SCRIPT>
<SCRIPT src="/internet/scripts/progress.js" type="text/javascript"></SCRIPT>
<SCRIPT src="/internet/scripts/pageComponent/print.js" type="text/javascript"></SCRIPT>
<body bgcolor="#CCFFCC" text="#000000">
<form name="myform" method="post">
<table border="0" cellspacing="1" cellpadding="1" class="result" id="printTable" align="center">
<html:radio property="show/info" value="Banana" tabindex="1" scope="session"/>
Banana
<p>
<html:radio property="show/info" value="Apple" tabindex="0" scope="session"/>
Apple
<p>
<html:radio property="show/info" value="Orange" tabindex="2" scope="session"/>
Orange
<p>
<bean:write  property='show/info'/>

</table>
</form>
</body>
</html>
