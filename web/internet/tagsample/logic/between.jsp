<html>
<head>
<title>�ޱ����ĵ�</title>
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
        ������ʱ����Ĭ�ϵľ���·��
        ��ʽӦ�õ�ʱ��Ҫͨ��
        getapp.gatPath()����ȡ����·����            */
        String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"/internet/tagsample/logic/between.xml";
//   RequestContext dom = new RequestContext(fileName);
//  pageContext.getRequest().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
    SessionContext dom = new SessionContext(fileName);
  pageContext.getSession().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
%>
<body>
��<form name="mainForm" method="post" >
between:
<logic:between property="FDBID/projectID" scope="session" secondValueProperty="FDBID/end" secondValueScope="session" valueScope="session" valueProperty="FDBID/start" >
�ɹ���ʾ
</logic:between>

<p>betweenV5:
<logic:betweenV5  property="FDBID/projectID" value="FDBID/valueArea"scope="session" valueScope="session" valueType="variable">
�ɹ���ʾ
</logic:betweenV5>

<p>
	</form> 
��</body>
</html>

