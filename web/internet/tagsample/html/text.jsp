<%@ page import="com.primeton.tp.core.prservice.context.RequestContext,com.primeton.tp.core.prservice.context.SessionContext,com.primeton.tp.web.driver.webdriver.WebDriver,com.primeton.tp.common.xml.XmlUtil"%>
<%
    String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"/internet/tagsample/html/text.xml";
    RequestContext dom = new RequestContext(fileName);
//      SessionContext dom = new SessionContext(fileName);
    pageContext.getRequest().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
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
hidden: <html:hidden property="show/info" />
<p>text:<html:text property="show/info" />
<p>texttextarea:<html:textarea property="show/info" />
<p>password:<html:password property="show/info" />
</form>
</body>
</html>