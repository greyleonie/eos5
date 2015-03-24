<%@ page language="java" contentType="text/html; charset=GBK"%>

<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ page import="com.primeton.tp.core.prservice.context.RequestContext,com.primeton.tp.core.prservice.context.SessionContext,com.primeton.tp.web.driver.webdriver.WebDriver,com.primeton.tp.common.xml.XmlUtil"%>

<%
    /*
        现在暂时是用默认的绝对路径
        正式应用的时候要通过
        getapp.gatPath()来获取绝对路径。            
     */
        String realpath = pageContext.getServletContext().getRealPath("/");
    String fileName = realpath+"/internet/tagsample/logic/equal.xml";
//   RequestContext dom = new RequestContext(fileName);
//  pageContext.getRequest().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);
    SessionContext dom = new SessionContext(fileName);
  pageContext.getSession().setAttribute(WebDriver.REQUEST_REQUEST_CONTEXT,dom);

%>
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" src="/internet/scripts/pagefortreetwo.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" src="/internet/scripts/treetwo.js"></SCRIPT>
　<body>
　　<form name="mainForm" method="post" >
	　<table>

		<tr>
			<td>

<logic:iterate iterateId="list" property="list[@type='FDBID']" scope="session">
<logic:equal propertyId="list" property="FDBID/projectID" value="FDBID/projectID" valueType="variable" scope="session" valueScope="session">
<html:text id="list" property="FDBID/projectID" scope="session"/>
</logic:equal>
</logic:iterate>
</td>
		</tr>
	　</table>
	</form> 
　</body>
