<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<%@ page import="java.io.*,java.util.*,org.w3c.dom.*,com.primeton.tp.core.prservice.context.*,com.primeton.tp.web.driver.webdriver.*,com.primeton.tp.common.xml.*,com.primeton.eos.util.StringUtil" %>
<%
String errMsg="";

RequestContext dom1 = (RequestContext) pageContext.getAttribute(WebDriver.REQUEST_REQUEST_CONTEXT);
if (dom1 == null)
    dom1 = (RequestContext) pageContext.getRequest().getAttribute(WebDriver.REQUEST_REQUEST_CONTEXT);
if (dom1 == null)
  errMsg=errMsg+"RequestContext is null";
Node root =XPathAPI.selectSingleNode(dom1.getDocument().getDocumentElement(),"/root/data/root");
%>


<html>
    <head><title>wfRelativeDataList</title>
    </head>
<display:pageHead bodyColor="#EEEEEE"/>
  
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="10"></td>
  </tr>
  <tr>
    <td><b><font size="4">相关数据显示区</font></b></td>
  </tr>
  <tr>
    <td height="20"></td>
  </tr>
  <tr> 
      <td>

<%
if (root==null)  errMsg=errMsg+"相关数据为空！";
String value = "";
if (!errMsg.equals("")){
   System.out.print(errMsg);
}

else		{
	value = XmlUtil.node2String(root);
	value=StringUtil.replaceStr(value,"\"","\\\"");
	value=StringUtil.replaceStr(value,"\r"," ");
	value=StringUtil.replaceStr(value,"\n"," ");
}
%>

<script>	
  //装载数据
  var source = new ActiveXObject("Msxml2.DOMDocument");
  source.async = false;
  source.loadXML("<%=value%>");
  //alert(source.xml)

  // 装载样式单
  var stylesheet = new ActiveXObject("Msxml2.DOMDocument");
  stylesheet.async = false;
  stylesheet.resolveExternals = false;
  stylesheet.load("/internet/WFINSTMGR/style.xsl");
 // alert(stylesheet.xml)
 
  // 创建结果对象
  var result = new ActiveXObject("Msxml2.DOMDocument");
  result.async = false;

  // 把解析结果放到结果对象中方法1
  source.transformNodeToObject(stylesheet, result);
 // alert(result.xml)
  
   // 把解析结果放到结果对象中方法2
  result2 = "";
  result2 = source.transformNode(stylesheet);
  source.loadXML(result2);
  document.write("<textarea name=\"textfield\" rows=\"21\" cols=\"80\" style=\"overflow:auto;background-color:#EEEEEE\" readonly>");
   document.write(source.xml);
   document.write("</textarea>");
	
</script> 
    </td>
  </tr>
</table>
<display:pageTail/>
</html>       
