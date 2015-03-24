<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>中共广州市委党校</title>
<link href="/css/css.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
.STYLE1 {
	color: #F83818;
	font-size: 16px;
	font-weight: bold;
}
.STYLE2 {
	color: #FF0000;
	font-size: 12px;
	
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

-->
</style>
</head><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%@include file="common/top.jsp" %></td>
  </tr>
  <tr>
    <td><html:form action="login.do?action=login"  target="_top" >
<table width="100%" height="400" border="0" cellpadding="0" cellspacing="0" bgcolor="#F8D8B8">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="2" align="center" valign="middle"><span class="STYLE1">用 户 登 陆</span></td>
        </tr>
        <tr>
          <td colspan="2" align="center" >&nbsp;
          <logic:present name="errorStr">
          	<span class="STYLE2"><bean:write name="errorStr"/></span>
          </logic:present>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center"><table width="280" height="100" border="0" cellpadding="0" cellspacing="1" bordercolor="#F97421" bgcolor="#F97421">
            <tr>
              <td colspan="2" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="3">
                  <tr class="td1">
                    <td width="38%" align="right">用户名：</td>
                    <td width="62%" align="left"><html:text property="username"/></td>
                  </tr>
                  <tr class="td1">
                    <td align="right">密　码：</td>
                    <td align="left"><html:password property="password" /></td>
                  </tr>
                  <tr class="td1">
                    <td align="right">&nbsp;</td>
                    <td align="left"><input type="image" src="image/loginx.gif" onclick="return checkLogin()" /></td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="60" colspan="2" align="center">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form></td>
  </tr>
  <tr >
    <td valign="top"><%@include file="common/bottom.jsp" %></td>
  </tr>
</table>
<script type="text/javascript">
  function checkLogin(){
		 if(document.all.username.value==""){
		 		alert("请输入用户名");
		 		return false;
		 }
		 if(document.all.password.value==""){
		 		alert("请输入密码");
		 		return false;
		 }
		 document.forms(0).submint;
		 return true;
	}
	
</script>



