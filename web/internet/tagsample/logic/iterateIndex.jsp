<html>
<head>
<title>�ޱ����ĵ�</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-info.tld" prefix="info" %>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ page import="com.primeton.tp.core.prservice.context.*,   com.primeton.tp.web.driver.webdriver.WebDriver,com.primeton.tp.common.xml.XmlUtil"%>
<%@ page import=" org.w3c.dom.*,com.primeton.tp.common.xml.*"%>
<%@ page import="com.primeton.eos.webtag.logic.*"%>
<%
    /*
        ������ʱ����Ĭ�ϵľ���·��
        ��ʽӦ�õ�ʱ��Ҫͨ��
        getapp.gatPath()����ȡ����·����            */
        String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"/internet/tagsample/logic/logic.xml";
//    RequestContext dom = new RequestContext(fileName);
//  pageContext.getRequest().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
    SessionContext dom = new SessionContext(fileName);
  pageContext.getSession().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
%>
<body>
��<form name="mainForm" method="post" >
iterateIndex:
<logic:iterate iterateId="list" property="list[@type='FDBID']" scope="session" fixRenderingLength="5">
    <bean:write id="list" property="FDBID/projectID" scope="session"/><br>
<logic:iterateIndex/>
</logic:iterate>

	</form> 
��</body>
</html>
