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
    String fileName = realpath+"/internet/tagsample/logic/not,and,or.xml";
//   RequestContext dom = new RequestContext(fileName);
//  pageContext.getRequest().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
    SessionContext dom = new SessionContext(fileName);
  pageContext.getSession().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
%>
<body>
��<form name="mainForm" method="post" >
and:
<logic:and value="true" property="FDBID/projectProperty" scope="session">
�ɹ���ʾ
</logic:and>
<logic:and  property="FDBID/projectProperty" valueProperty="FDBID/flag" scope="session" valueScope="session">
�ɹ���ʾseeion
</logic:and>
<p>
or:
<logic:or value="true" property="FDBID/orFlag" scope="session">
�ɹ���ʾ
</logic:or>
<logic:or  property="FDBID/orFlag" valueProperty="FDBID/flag" scope="session" valueScope="session">
�ɹ���ʾseeion
</logic:or>
<p>
not:
<logic:not  property="FDBID/orFlag" scope="session">
�ɹ���ʾ
</logic:not>
<logic:not  property="FDBID/flag"  scope="session" >
�ɹ���ʾseeion
</logic:not>
<p>
	</form> 
��</body>
</html>