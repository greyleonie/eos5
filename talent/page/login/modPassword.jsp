<%@include file="/internet/common.jsp"%>
<html>
<body>
<form name="frmModPWD" action="talent.pr.modPasswordDO.do" method="post">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">  系统管理—&gt;修改密码
            </td></tr>
        </table></td>
    </tr>
  </table>

<table width="100%" height="100%" border=0>

   <tr>
 
     <td align="center" valign="middle">	
     
         <table cellpadding=0 cellspacing=0 border="0" bgcolor="#EEEEEE" height="100%" width="98%">
          <tr valign="top">
               <td colspan="2">
          <table width="100%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
		<tr class="td2">
			<td align="center">输入旧密码:</td>
			<td class="td1">
				<input type="hidden" name="EOSOperator/opwd"/>
				<html:password property="EOSOperator/oldpassword" size="30" maxlength="20" styleClass="input" onblur="setPwd(this,'EOSOperator/opwd')" />
			</td>
		</tr>		
		<tr class="td2">
			<td align="center">输入新密码(6-20位):</td>
			<td class="td1">
				<input type="hidden" name="EOSOperator/npwd"/>
				<html:password property="EOSOperator/password" size="30" maxlength="20" styleClass="input" onblur="setPwd(this,'EOSOperator/npwd')"/>
			</td>
		</tr>
		<tr class="td2">
			<td align="center">确认新密码:</td>
			<td class="td1">
				<input type="hidden" name="EOSOperator/spwd"/>
				<html:password property="EOSOperator/password0" size="30" maxlength="20" styleClass="input" onblur="setPwd(this,'EOSOperator/spwd')"/>
			</td>
		</tr>	
		
		<tr>
		<td class="td1"></td>
		<Td align="left" class="td1">
		    <input type="button" name="button1" value="&nbsp;保存&nbsp;" onClick="javascript:submit1()" class="button_02"/>
		    <input type="button" name="button2" value="&nbsp;重置&nbsp;" onClick="javascript:document.frmModPWD.reset()" class="button_02"/>
		</td>
		</tr>				

	 </table>      
	      </td>
	 </tr>
       </table>         
    </td>
  </tr>
</table>

</form>

</body>
</html>

<script language="JavaScript">
function setPwd(obj,id){
	document.getElementById(id).value=obj.value;
}
function submit1(){
	var frm = document.frmModPWD;
	
	
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
	frm.submit();
}
</script>