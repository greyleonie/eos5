<%@include file="/internet/common.jsp"%>
<html:html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html;">

<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
</head>

<BODY BGCOLOR=#FFFFFF>
<form name="login" method="post" action="ROLE.pr_automata.login.do" focus="EOSOperator/userID">
  <p>&nbsp;</p>
  <p>&nbsp;</p><table width="779" height="10" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                  <td align="center"><font font-size="6pt" color="#FF0000">操作超时，请您重新登录。</font></td>
                </tr>
                </table>
  <p>&nbsp;</p><table width="779" height="360" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td align="left" valign="top"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="364" height="170" rowspan="2"><img src="/internet/images/cat1.gif" width="365" height="170"></td>
            <td height="136" colspan="2" valign="bottom" background="/internet/images/cat2.gif"> 
              <table width="204" height="102" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="85">&nbsp;</td>
                  <td width="144">&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
		     <td>
                     <html:text property="EOSOperator/userID" size="16"/>
                     </td>
                    
                </tr>
                <tr>
                  <td>&nbsp;</td>
		     <td>
                    <html:password property="EOSOperator/password" size="16"/>
                    </td>
                </tr>
              </table></td>
            <td width="222" rowspan="3"><img src="/internet/images/cat3.gif" width="210" height="360"></td>
          </tr>
          <tr> 
            <td width="90" height="34"></td>
            <td width="103"> <input type="image" name="login_r2_c3" src="/internet/images/dog2.gif" width="101" height="34" border="0"  tabindex="3"></td>
          </tr>
          <tr> 
            <td><img src="/internet/images/cat4.gif" width="365" height="190"></td>
            <td colspan="2"><img src="/internet/images/dog3.gif" width="204" height="190"></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</BODY>
</html:html>
<script language="javascript">
	document.forms[0].elements['EOSOperator/userID'].focus();
</script>
