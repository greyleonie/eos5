<%@include file="/internet/BNOM/hciHead.jsp" %>
<html>
<head>
	<link rel="stylesheet" href="/internet/css/style.css" type="text/css" />
</head>
<body>
<form name="frmModPWD" action="#333" method="post">

	<html:hidden name="EOSOperator/isLocal" value="Y" />
	<html:hidden name="EOSOperator/status" value="1" />
	<html:hidden name="EOSOperator/operatorID" />
<table width="100%" height="100%" border=0>

   <tr>
 
     <td height="80%">	
       <eos:OneTab name="修改密码" imagePath="/internet/images/tt.gif" >
         <table cellpadding=0 cellspacing=0 border="0" bgcolor="#EEEEEE" height="100%" width="85%">
          <tr valign="top">
               <td colspan="2">
          <table border=0 cellPadding=5 cellSpacing=5 align="center" width="100%">	
		<tr class="query_content">
			<td width="30%" align="center">输入旧密码:</td>
			<td>
				<html:password property="EOSOperator/oldpassword" size="30" maxlength="20" />
			</td>
		</tr>		
		<tr class="query_content">
			<td width="30%" align="center">输入新密码(6-20位):</td>
			<td>
				<html:password property="EOSOperator/password" size="30" maxlength="20" />
			</td>
		</tr>
		<tr class="query_content">
			<td width="30%" align="center">确认新密码:</td>
			<td>
				<html:password property="EOSOperator/password0" size="30" maxlength="20" />
			</td>
		</tr>	
		<tr><td  colspan="2"  align="center">  </td></tr>
		<tr><td  colspan="2"  align="center">  </td></tr>
		<tr>
		<td></td>
		<Td align="left">
		    <input type="button" name="button1" value="&nbsp;保存&nbsp;" onclick="javascript:submit1()"/>
		    <input type="button" name="button2" value="&nbsp;重置&nbsp;" onclick="javascript:document.frmModPWD.reset()"/>
		</td>
		</tr>				

	 </table>      
	      </td>
	 </tr>
       </table>       
     </eos:OneTab>  
    </td>
  </tr>
</table>

</form>

</body>
</html>
<%@include file="/internet/hciTail.jsp" %>

<script language="JavaScript">
function submit1(){
	var frm = document.frmModPWD;
	
	frm.elements["EOSOperator/operatorID"].value = '<bean:write property="SessionEntity/operatorID"/>';
	
	if(frm.elements["hciPasswordTypeEOSOperator/oldpassword"].value == "") {
		alert("请填入旧密码");
		frm.elements["hciPasswordTypeEOSOperator/oldpassword"].focus();
		return;
	}
	if(frm.elements["hciPasswordTypeEOSOperator/password"].value == "") {
		alert("请填入新密码");
		frm.elements["hciPasswordTypeEOSOperator/password"].focus();
		return;
	}
	if(frm.elements["hciPasswordTypeEOSOperator/password0"].value == "") {
		alert("请填入新密码");
		frm.elements["hciPasswordTypeEOSOperator/password0"].focus();
		return;
	}
	
	if(frm.elements["hciPasswordTypeEOSOperator/password"].value.length < 6 || frm.elements["hciPasswordTypeEOSOperator/password"].value.length > 20) {
		alert("密码长度请在6--20位之间");
		frm.elements["hciPasswordTypeEOSOperator/password"].focus();
		return;
	}
	if(frm.elements["hciPasswordTypeEOSOperator/password"].value != frm.elements["hciPasswordTypeEOSOperator/password0"].value) {
		alert("请确认新密码一致!");
		frm.elements["hciPasswordTypeEOSOperator/password"].focus();
		return;
	}
	frm.action="ROLE.pr_automata.ROLE_P_OperatorModPwdSubmit.do";
	frm.submit();
}
</script>