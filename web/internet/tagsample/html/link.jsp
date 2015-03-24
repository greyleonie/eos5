<html>
<%@ page import="com.primeton.tp.core.prservice.context.RequestContext,com.primeton.tp.core.prservice.context.SessionContext,com.primeton.tp.web.driver.webdriver.WebDriver,com.primeton.tp.common.xml.XmlUtil"%>
<%
    String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"/internet/tagsample/html/select.xml";
//    RequestContext dom = new RequestContext(fileName);
//    pageContext.getRequest().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
      SessionContext dom = new SessionContext(fileName);
    pageContext.getSession().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
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
<html:link  page="AAA.do">
<html:linkParam property="show1/info1" name="dddd" scope="session"/>无标题
<html:linkParam property="show1/info2" name="para2" scope="session"/>文档
</html:link>


</table>
</form>
</body>
</html>
