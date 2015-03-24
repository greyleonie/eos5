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
		pageContext.getSession().removeAttribute("tabmenuscript");
%>
<html>
<head ><LINK href="menu.css" rel=stylesheet type=text/css>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</HEAD>
<body>
<eos:tabMenu/>
<SCRIPT language=JavaScript src="/internet/scripts/tabmenu.js"></SCRIPT>

<iframe name="mainFrame" width="100%" height="100%" frameborder="0"></iframe>

</body>
</html>
