<%@ include file="/internet/common.jsp" %>

<script language="JavaScript" for="window" event="onLoad">
	var frm = document.forms[0];
	var pop3 = "<bean:write property="TOOL_MAILSERVER/POP3ADDRESS"/>";
	var smtp = "<bean:write property="TOOL_MAILSERVER/SMTPSERVER"/>";
	var array1 = pop3.split(":");
	var array2 = smtp.split(":");
	if(array1!=null){
		frm.elements["pop3host"].value = array1[0];
		frm.elements["pop3port"].value = array1[1];
	}
	if(array2!=null){
		frm.elements["smtphost"].value = array2[0];
		frm.elements["smtpport"].value = array2[1];
	}
</script>
<form method="post" action="">
<html:hidden property="PageCond/begin" />
<html:hidden property="PageCond/length" />
<html:hidden property="Order/col1"/>
<html:hidden property="Order/col1/@order"/>
<html:hidden property="marked"/>
<input type="hidden" name="TOOL_MAILSERVER/POP3ADDRESS">
<input type="hidden" name="TOOL_MAILSERVER/SMTPSERVER">
<html:hidden property="TOOL_MAILSERVER/SERVERID"/>
<html:hidden property="TOOL_MAILSERVER/USERACCOUNT"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;服务器修改</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td> </td>
  </tr>
</table>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td width="15">&nbsp;</td>
    <td>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center">
		  <fieldset>
		   <legend style="font-size:12px;color:#ff0000;line-height:30px">接收端信息(pop3)</legend>
		  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
              <tr class="td2"> 
                <td width="25%" align="right" class="text">帐号名称： </td>
                <td width="75%"> <input name="TOOL_MAILSERVER/POP3NAME" type="text" class="input" size="50" maxlength="30" value='<bean:write property="TOOL_MAILSERVER/POP3NAME"/>'>
                  <span style="color:#FF0000;font-size:12px">&nbsp;*&nbsp;</span></td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">服务器地址、端口：</td>
                  <td class="text"> <input name="pop3host" type="text" class="input" size="44" maxlength="25">
                    <input name="pop3port" class="input" type="text" size="3" maxlength="5"><span style="color:#FF0000;font-size:12px">&nbsp;*&nbsp;</span>
                    一般情况下为110</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">登录账号： </td>
                <td> <input name="TOOL_MAILSERVER/POP3ACCOUNT" type="text" class="input" size="50" maxlength="30" value='<bean:write property="TOOL_MAILSERVER/POP3ACCOUNT"/>'>
				<span style="color:#FF0000;font-size:12px">&nbsp;*&nbsp;</span>
				</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">登录密码： </td>
                <td><input name="TOOL_MAILSERVER/POP3PWD" type="password" class="input" size="50" maxlength="120" value='<bean:write property="TOOL_MAILSERVER/POP3PWD"/>'></td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text"> 删除远程邮件： </td>
                <td class="text"><html:select property="TOOL_MAILSERVER/DELFLAG">
                    	<html:option value="0">是</html:option>
                    	<html:option value="1">否</html:option>
                    </html:select>
				  </td>
              </tr>
              <tr class="td2">
                <td align="right" class="text">接收邮件夹：</td>
                <td><html:select property="TOOL_MAILSERVER/INCEPTMAILDIR">
                    <html:option value="0">收件箱</html:option>
                    <html:option value="1">发件箱</html:option>
                    <html:option value="2">草稿箱</html:option>
                    <html:option value="3">垃圾箱</html:option>
                  </html:select></td>
              </tr>
            </table>
			 </fieldset>
			<fieldset>
		   	<legend style="font-size:12px;color:#ff0000;line-height:30px">发送端信息(smtp)</legend>
			<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
              <tr class="td2"> 
                <td width="25%" align="right" class="text">服务器地址、端口：</td>
                  <td width="75%" class="text"> <input name="smtphost" type="text" class="input" size="44" maxlength="25">
                    <input name="smtpport" class="input" type="text"  size="3" maxlength="5">
                    一般情况下为25 </td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">显示姓名： </td>
                <td> <input name="TOOL_MAILSERVER/SHOWNAME" type="text" class="input" size="50" maxlength="200" value='<bean:write property="TOOL_MAILSERVER/SHOWNAME"/>'> 
                  <span style="color:#FF0000;font-size:12px">&nbsp;</span></td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">发信地址：</td>
                <td> <input name="TOOL_MAILSERVER/SHOWADDRESS" type="text" class="input" size="50" value='<bean:write property="TOOL_MAILSERVER/SHOWADDRESS"/>'>
				<span style="color:#FF0000;font-size:12px">&nbsp;*您的POP3邮件地址&nbsp;</span>
				</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">账号状态：</td>
                <td> 
				<html:select property="TOOL_MAILSERVER/DEFAULTFLAG">
					<html:option value="0">正常</html:option>
					<html:option value="1">停用</html:option>
					<html:option value="2">帐号</html:option>
				</html:select>
				</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">发送验证： </td>
                <td> <html:select property="TOOL_MAILSERVER/SMTPAUTH" onchange="fcc_auth(this.options[selectedIndex].value,'auth')">
						<html:option value="1">需要</html:option>
						<html:option value="0">不需要</html:option>
					</html:select>
               </td>
              </tr>
			  
              <tr class="td2" id="auth1" style="display:block"> 
                <td height="18" align="right" class="text">验证账号： </td>
                <td><input name="TOOL_MAILSERVER/SMTPNAME" type="text" class="input" size="50" maxlength="30" value='<bean:write property="TOOL_MAILSERVER/SMTPNAME"/>'></td>
              </tr>
              <tr class="td2"  id="auth2" style="display:block">
                <td align="right" class="text">验证密码： </td>
                  <td><input name="TOOL_MAILSERVER/SMTPPWD" type="password" class="input"size="50" maxlength="120" value='<bean:write property="TOOL_MAILSERVER/SMTPPWD"/>'> 
                  </td>
              </tr>
            </table>
		</fieldset>
			</td>
        </tr>
      </table>      
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> </td>
        </tr>
      </table>
      <table width="98%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td align="center"><input name="Submit222" type="button" class="button_03" value="保存并返回" onClick="pop3modifyDo()">
              <input name="Submit223" type="button" class="button_02" value="返 回" onClick="history.back()">
</td></tr>
      </table></td>
    <td width="15">&nbsp;</td>
  </tr>
</table>
</form>

<script language="JavaScript">
	function pop3modifyDo(){
		var frm = document.forms[0];
		if(frm.elements["TOOL_MAILSERVER/POP3NAME"].value==""){
			alert("帐号名称不能为空");
			frm.elements["TOOL_MAILSERVER/POP3NAME"].focus();
			return
		}
		
		if(frm.elements["pop3host"].value==""){
			alert("服务器地址不能为空");
			frm.elements["pop3host"].focus();
			return
		}
		if(frm.elements["TOOL_MAILSERVER/POP3ACCOUNT"].value==""){
			alert("登录账号不能为空");
			frm.elements["TOOL_MAILSERVER/POP3ACCOUNT"].focus();
			return
		}
		
		if(frm.elements["TOOL_MAILSERVER/SHOWADDRESS"].value==""){
			alert("发信地址不能为空");
			frm.elements["TOOL_MAILSERVER/SHOWADDRESS"].focus();
			return
		}
		
		frm.elements["TOOL_MAILSERVER/POP3ADDRESS"].value = frm.elements["pop3host"].value + ":" + frm.elements["pop3port"].value
		
		frm.elements["TOOL_MAILSERVER/SMTPSERVER"].value = frm.elements["smtphost"].value + ":" + frm.elements["smtpport"].value
		frm.action = "oa.prPersonOffice.pop3modifyDo.do";
		frm.submit();
		
	}
</script>