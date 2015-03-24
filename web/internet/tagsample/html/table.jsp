<%@ page import="com.primeton.tp.core.prservice.context.RequestContext,com.primeton.tp.core.prservice.context.SessionContext,com.primeton.tp.web.driver.webdriver.WebDriver,com.primeton.tp.common.xml.XmlUtil"%>
<%
    String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"/internet/tagsample/html/table.xml";
    RequestContext dom = new RequestContext(fileName);
    pageContext.getRequest().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
//      SessionContext dom = new SessionContext(fileName);
//    pageContext.getSession().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
//    pageContext.setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
System.out.println("---------=============--------");
System.out.println("---------=================--------");
%>
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
</head>
<body bgcolor="#CCFFCC" text="#000000">
<form name="myform" method="post">
<html:table property="list[@type='cust']" border="1" radio="true" offset="0" length="3" />
</form>
</body>
</html>