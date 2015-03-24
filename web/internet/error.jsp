<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>

<%@ page import="com.primeton.tp.core.prservice.context.RequestContext,
                 com.primeton.tp.web.driver.webdriver.WebDriver,com.primeton.tp.common.exception.EOSException,
                 com.primeton.tp.common.xml.XmlUtil"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Primeton EOS 5</title>
<!-- Add a progrss bar script -->
<script language='javascript' src='/internet/scripts/progress.js' type='text/javascript'> </script>
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
<link rel="stylesheet" href="/internet/css/style.css" type="text/css">
<eos:css/>
<script language="JavaScript">
function change()
{
	if(document.getElementById('buttonid').value=="正常"){
		document.getElementById('buttonid').value="反转"
		document.getElementById('content').innerHtml=init;
	}else
	{
		document.getElementById('buttonid').value="正常"
		document.getElementById('content').innerHtml=reverse;
	}
}
function test(obj)
{
if (obj.value=='显示异常栈')
{
obj.value='隐藏异常栈';
document.getElementById('test').style.visibility='visible';
}
else
{
obj.value='显示异常栈';
document.getElementById('test').style.visibility='hidden';
}
}
</script>
</head>

<body>

<!-- PRIMETON LOGO -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td valign="top"> 
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
        <td width="20%"><img src="/internet/images/logo.gif" width="221" height="44"></td>
        <td width="80%">
        	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
	          <tr align="right">
	            <td>&nbsp;</td>
	            <td width="70"><a href="forward.do?nextPage=/internet/welcome.jsp"><img src="/internet/images/home.gif" width="58" height="22" border="0"></a></td>
	            <td width="70"><a href="/internet/logout.jsp"><img src="/internet/images/zx.gif" width="58" height="22" border="0"></a></td>
	        	</tr>
        	</table>
        </td>
        </tr>
       </table>
      </td>
</tr>
</table>
<div align="center" class="error_top"><b>出现错误</b> </div>
<eos:error showException="true"/>
</body>
</html>
