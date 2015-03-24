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
		request.getSession().setAttribute(WebDriver.SESSION_CONTEXT,sessionContext);
%>

<html>
<head ><LINK href="menu.css" rel=stylesheet type=text/css>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</HEAD>
<body>
<eos:dropMenu startTop="0" startLeft="0" lineMenuCount="8" menuTextLen="16" menuWidth="124" subMenuWidth="124"/>

<script type='text/javascript' src='/internet/config_var.js'></script>
<script type='text/javascript' src='/internet/menu_com.js'></script>

<!-- MENU END -->

<!-- MENU PLACEHOLDER BEGIN -->
<table id="PlaceHolder" width="1000"><tr><td><td><tr><table>
<script language="javascript">
	var LineCount=Math.round(NoOffFirstLineMenus/MenuLineCount);
	if(LineCount>0){
		var srcEle=eval("PlaceHolder");
		srcEle.style.height=LineCount*22+2+'px';
	}
</script>

</body>
</html>
