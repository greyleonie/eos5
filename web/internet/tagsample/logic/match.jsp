<html>
<head>
<title>match</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-info.tld" prefix="info" %>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ page import="com.primeton.tp.core.prservice.context.*,   com.primeton.tp.web.driver.webdriver.WebDriver,com.primeton.tp.common.xml.XmlUtil"%>
<%@ page import=" org.w3c.dom.*,com.primeton.tp.common.xml.*"%>
<%
    /*
        现在暂时是用默认的绝对路径
        正式应用的时候要通过
        getapp.gatPath()来获取绝对路径。            */
        String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"/internet/tagsample/logic/match.xml";
//    RequestContext dom = new RequestContext(fileName);
//   pageContext.getRequest().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
    SessionContext dom = new SessionContext(fileName);
     pageContext.getSession().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
%>
<body>
　<form name="mainForm" method="post" >
match:
<logic:iterate iterateId="list" property="list[@type='FDBID']" scope="session">
<logic:match propertyId="list" property="FDBID/projectID" value="FDBID/projectID" valueType="variable" scope="session" valueScope="session">
<html:text id="list" property="FDBID/projectID" scope="session"/>
</logic:match>
</logic:iterate>
<p>
notMatch:
<logic:iterate iterateId="list" property="list[@type='FDBID']" scope="session">
<logic:notMatch propertyId="list" property="FDBID/projectID" value="FDBID/projectID" valueType="variable" scope="session" valueScope="session">
<html:text id="list" property="FDBID/projectID" scope="session"/>
</logic:notMatch>
</logic:iterate>
<p>
	</form> 
　</body>
</html>
