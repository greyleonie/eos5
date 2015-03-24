<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<html>
<body bgcolor="#FFD88D">
<form name="frmModPWD" action="login.do?action=modPassword" method="post">
<input type="hidden" name="operatorId" value="<%=request.getParameter("operatorId") %>">
<table width="100%"  border="0" cellspacing="0" cellpadding="0"  bgcolor="#FFD88D">
    <tr> 
      <td height="24"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte" align="center">修改密码
            </td></tr>
        </table></td>
    </tr>
  </table>

<table width="100%" height="100%" border=0>

   <tr>
 
     <td align="center" valign="middle">	
     
         <table cellpadding=0 cellspacing=0 border="0" bgcolor="#FFD88G" height="100%" width="98%">
          <tr valign="top">
               <td colspan="2">
          <table width="100%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
		<tr bgcolor="#FFD88D">
			<td align="center">输入旧密码:</td>
			<td class="td1">
				<input type="password" size="30" maxlength="20" name="oldPassword">
			</td>
		</tr>		
		<tr bgcolor="#FFD88D">
			<td align="center">输入新密码(6-20位):</td>
			<td class="td1">
				<input type="password" size="30" maxlength="20" name="newPassword">
			</td>
		</tr>
		<tr bgcolor="#FFD88D">
			<td align="center">确认新密码:</td>
			<td class="td1">
				<input type="password" size="30" maxlength="20" name="newPassword1">
			</td>
		</tr>	
		
		<tr>
		<td  bgcolor="#FFD88D"></td>
		<Td align="left" bgcolor="#FFD88D">
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

<form>

</body>
</html>

<script language="JavaScript">
function submit1(){
	var frm = document.frmModPWD;
	
	if(frm.elements["oldPassword"].value == "") {
		alert("请填入旧密码");
		frm.elements["oldPassword"].focus();
		return;
	}
	if(frm.elements["newPassword"].value == "") {
		alert("请填入新密码");
		frm.elements["newPassword"].focus();
		return;
	}
	if(frm.elements["newPassword1"].value == "") {
		alert("请填入新密码");
		frm.elements["newPassword1"].focus();
		return;
	}
	
	if(frm.elements["newPassword"].value.length < 6 || frm.elements["newPassword"].value.length > 20) {
		alert("密码长度请在6--20位之间");
		frm.elements["newPassword"].focus();
		return;
	}
	if(frm.elements["newPassword"].value != frm.elements["newPassword1"].value) {
		alert("请确认新密码一致!");
		frm.elements["newPassword"].focus();
		return;
	}
	frm.submit();
}
</script>