<html>
<head>
<title>无标题文档</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-info.tld" prefix="info" %>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ page import="com.primeton.tp.core.prservice.context.RequestContext,   com.primeton.tp.web.driver.webdriver.WebDriver,com.primeton.tp.common.xml.XmlUtil"%>
<%@ page import=" org.w3c.dom.*,com.primeton.tp.common.xml.*"%>

<%
    /*
        现在暂时是用默认的绝对路径
        正式应用的时候要通过
        getapp.gatPath()来获取绝对路径。            */
        String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"/internet/tagsample/logic/logic.xml";
    RequestContext dom1 = new RequestContext(fileName);
  pageContext.getRequest().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom1);
System.out.println("=======================================");
System.out.println("+++++++++++++++++++++++++++++++++++++++++++==");
/* 		Document dom = XmlUtil.parseString("<?xml version=\"1.0\" encoding=\"GB2312\"?><root><data><list type='EOSRole'><EOSRole><roleID>1</roleID></EOSRole></list></data></root>");
		Node role = XmlUtil.findNode(dom, "/root/data/list/EOSRole");
		int i=0;
		long start = System.currentTimeMillis();
		for (i=0; i<1000; i++) {
			RequestContext rContext = new RequestContext(role);
			String a = rContext.getProperty("EOSRole/roleID");
			String a1 = rContext.getProperty("EOSRole/roleID");
			String a2 = rContext.getProperty("EOSRole/roleID");
			String a3 = rContext.getProperty("EOSRole/roleID");
			String a4 = rContext.getProperty("EOSRole/roleID");
		}
		System.out.println(("iterate time=" + String.valueOf(System.currentTimeMillis() - start) +"ms"));*/


%>
<body>
　<form name="mainForm" method="post" >
    <table>
		<tr><td>
<logic:iterate id="aa" property="menu[@type='menuID']">1<html:hidden property="menuID/projectID" /><html:hidden property="menuID/projectName" /><html:hidden property="menuID/author" /><html:hidden property="menuID/date" /><html:hidden property="menuID/desc" />
</logic:iterate></td>
		</tr>
<tr><td>
<logic:newIterate id="aa" property="menu[@type='menuID']">1<html:hidden property="menuID/projectID" /><html:hidden property="menuID/projectName" /><html:hidden property="menuID/author" /><html:hidden property="menuID/date" /><html:hidden property="menuID/desc" />
</logic:newIterate></td>
		</tr>
	　</table>
	</form> 
　</body>
</html>



