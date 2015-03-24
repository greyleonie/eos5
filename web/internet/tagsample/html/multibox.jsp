<%@ page import="com.primeton.tp.core.prservice.context.RequestContext,com.primeton.tp.core.prservice.context.SessionContext,com.primeton.tp.web.driver.webdriver.WebDriver,com.primeton.tp.common.xml.XmlUtil"%>
<%
    String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"/internet/tagsample/html/multibox.xml";
//    RequestContext dom = new RequestContext(fileName);
//    pageContext.getRequest().setAttribute("ert",dom);
      SessionContext dom = new SessionContext(fileName);
    pageContext.getSession().setAttribute("ert",dom);
//    pageContext.setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
System.out.println("=======================================");
System.out.println("+++++++++++++++++++++++++++++++++++++++++++==");
%>
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
</head>
<SCRIPT src="/internet/scripts/openWin.js" type="text/javascript"></SCRIPT>
<SCRIPT src="/internet/scripts/sortTable.js" type="text/javascript"></SCRIPT>
<SCRIPT src="/internet/scripts/progress.js" type="text/javascript"></SCRIPT>
<SCRIPT src="/internet/scripts/pageComponent/print.js" type="text/javascript"></SCRIPT>
<body bgcolor="#CCFFCC" text="#000000">
<form name="myform" method="post">

<br>
<logic:iterate id="aa" propertyId="ert" property="list[@type='cust']" scope="session">
	<html:multibox id="aa" property="cust/custID" value="1" scope="session"/>
	<html:text id="aa" property="cust/custName" scope="session"/>
</logic:iterate>


</form>
</body>
</html>