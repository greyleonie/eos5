<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>
<%@ page import="com.primeton.tp.common.xml.XmlUtil"%>
<%@ page import="com.primeton.tp.web.driver.webdriver.WebDriver,org.w3c.dom.Document,org.xml.sax.SAXException,java.io.File"%>
<%@ page import="javax.xml.parsers.*,com.primeton.tp.core.prservice.context.*"%>
<%
		   String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"\\internet\\tagsample\\transmenu\\menutrans.xml";
		
		DocumentBuilder documentBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		File file = new File(fileName);
		Document doc = documentBuilder.parse(file);
		MenuContext menucontext = new MenuContext(doc.getDocumentElement());
	
		SessionContext sessionContext = new SessionContext();
		sessionContext.setMenu(menucontext);
		
		pageContext.setAttribute(WebDriver.SESSION_CONTEXT,sessionContext);
		pageContext.getSession().removeAttribute("menuscript");
%>
<html>
<head ><LINK href="menu.css" rel=stylesheet type=text/css>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script language="javaScript" src="/internet/scripts/autoInputCheck.js"></script>
<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css"/>
 
<link rel="stylesheet" href="/internet/theme/style0/tree.css" type="text/css" >
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">

<script type="text/javascript" src="/internet/scripts/tree.js"></script>
</HEAD>
<body>
<table><tr><td width=150 valign="top">
<eos:treeMenu mainMenuName="Ö÷²Ëµ¥" target="mainFrame"/> 
</td><td><iframe name="mainFrame" width="0" height="0" scrolling="no" frameborder="0"></iframe></td></tr></table>

</body>
</html>

