<%@ include file="/internet/common.jsp" %>
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
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;查看邮件设置</td>
      </tr>
    </table></td>
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
                <td width="75%" class="text"><bean:write property="TOOL_MAILSERVER/POP3NAME"/>
                  </td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">服务器地址、端口：</td>
                  <td class="text"><bean:write property="TOOL_MAILSERVER/POP3ADDRESS"/></td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">登录账号： </td>
                <td class="text"><bean:write property="TOOL_MAILSERVER/POP3ACCOUNT"/>
				
				</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">登录密码： </td>
                <td class="text"><bean:write property="TOOL_MAILSERVER/POP3PWD"/></td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text"> 删除远程邮件： </td>
                <td class="text"><logic:equal property="TOOL_MAILSERVER/DELFLAG" value="0">
                    是
                    
                    </logic:equal>
					<logic:equal property="TOOL_MAILSERVER/DELFLAG" value="1">
                    
                    否
                    </logic:equal>
				  </td>
              </tr>
              <tr class="td2">
                <td align="right" class="text">接收邮件箱：</td>
                <td class="text">
				  <logic:equal property="TOOL_MAILSERVER/INCEPTMAILDIR" value="0">
				  	收件箱
				  </logic:equal>
				  <logic:equal property="TOOL_MAILSERVER/INCEPTMAILDIR" value="1">
				  	发件箱
				  </logic:equal>
				  <logic:equal property="TOOL_MAILSERVER/INCEPTMAILDIR" value="2">
				  	草稿箱
				  </logic:equal>
				  <logic:equal property="TOOL_MAILSERVER/INCEPTMAILDIR" value="3">
				  	垃圾箱
				  </logic:equal>
				  </td>
              </tr>
            </table>
			 </fieldset>
			<fieldset>
		   	<legend style="font-size:12px;color:#ff0000;line-height:30px">发送端信息(smtp)</legend>
			<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
              <tr class="td2"> 
                <td width="25%" align="right" class="text">服务器地址、端口：</td>
                  <td width="75%" class="text"><bean:write property="TOOL_MAILSERVER/SMTPSERVER"/></td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">显示姓名： </td>
                <td class="text"><bean:write property="TOOL_MAILSERVER/SHOWNAME"/> 
                 </td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">发信地址：</td>
                <td class="text"><bean:write property="TOOL_MAILSERVER/SHOWADDRESS"/>
				
				</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">账号状态：</td>
                <td class="text">
				<logic:equal property="TOOL_MAILSERVER/DEFAULTFLAG" value="0">
				  	正常
				</logic:equal>
				<logic:equal property="TOOL_MAILSERVER/DEFAULTFLAG" value="1">
				  	停用
				</logic:equal>
				<logic:equal property="TOOL_MAILSERVER/DEFAULTFLAG" value="2">
				  	帐号
				</logic:equal>
				</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">发送验证： </td>
                <td class="text"> 
					<logic:equal property="TOOL_MAILSERVER/SMTPAUTH" value="1">
						需要
					</logic:equal>
					<logic:equal property="TOOL_MAILSERVER/SMTPAUTH" value="0">
						不需要
					</logic:equal>
               </td>
              </tr>
			  <logic:equal property="TOOL_MAILSERVER/SMTPAUTH" value="1">
              <tr class="td2" id="auth1" style="display:block"> 
                <td height="18" align="right" class="text">验证账号： </td>
                <td><bean:write property="TOOL_MAILSERVER/SMTPNAME"/></td>
              </tr>
              <tr class="td2"  id="auth2" style="display:block" class="text">
                <td align="right">验证密码： </td>
                  <td><bean:write property="TOOL_MAILSERVER/SMTPPWD"/>
                  </td>
              </tr>
			 </logic:equal> 
			 
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
            <td align="center"> 
              <input name="Submit223" type="button" class="button_02" value="返 回" onClick="history.back()">
</td></tr>
      </table></td>
    <td width="15">&nbsp;</td>
  </tr>
</table>
</form>