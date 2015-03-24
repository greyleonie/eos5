<%@ page language="java" contentType="text/html; charset=GBK"%><%@ page import="java.io.*,java.util.*,org.w3c.dom.*,com.primeton.tp.core.prservice.context.*, com.primeton.tp.web.driver.webdriver.*,com.primeton.tp.common.xml.*" %><%
String errMsg="";

RequestContext dom1 = (RequestContext) pageContext.getAttribute(WebDriver.REQUEST_REQUEST_CONTEXT);
if (dom1 == null)
    dom1 = (RequestContext) pageContext.getRequest().getAttribute(WebDriver.REQUEST_REQUEST_CONTEXT);
if (dom1 == null)
  errMsg=errMsg+"RequestContext is null";

Document reqDom = dom1.getDocument();
Node treeNode =XPathAPI.selectSingleNode(dom1.getDocument().getDocumentElement(),"/root/data/TreeXML/Root");

if (treeNode==null)  errMsg=errMsg+"treeNode is null";

if (!errMsg.equals("")){
   System.out.print(errMsg);
}

else
{
	String ret = XmlUtil.node2String(treeNode);
	//System.out.println(ret);
	out.print(ret);
}
%>