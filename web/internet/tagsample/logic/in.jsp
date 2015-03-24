<html>
<head>
<title>无标题文档</title>
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
    String fileName = realpath+"/internet/tagsample/logic/in.xml";
//   RequestContext dom = new RequestContext(fileName);
//  pageContext.getRequest().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
    SessionContext dom = new SessionContext(fileName);
  pageContext.getSession().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
%>
<body>
　<form name="mainForm" method="post" >
in:
<logic:iterate iterateId="list" property="list[@type='FDBID']" scope="session">
<logic:in propertyId="list" property="FDBID/projectID" value="888,fff,ddd" scope="session" valueScope="session">
<html:text id="list" property="FDBID/projectID"scope="session" />
</logic:in>
</logic:iterate>
<p>
notIn:
<logic:iterate iterateId="list" property="list[@type='FDBID']" scope="session">
<logic:notIn propertyId="list" property="FDBID/projectID" value="FDBID/projectID" valueType="variable" valueScope="session" scope="session">
<html:text id="list" property="FDBID/projectID" scope="session"/>
</logic:notIn>
</logic:iterate>
<p>
	</form> 
　</body>
</html>

