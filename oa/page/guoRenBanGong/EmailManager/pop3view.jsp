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
        <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���˰칫��&gt;�鿴�ʼ�����</td>
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
		   <legend style="font-size:12px;color:#ff0000;line-height:30px">���ն���Ϣ(pop3)</legend>
		  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
              <tr class="td2"> 
                <td width="25%" align="right" class="text">�ʺ����ƣ� </td>
                <td width="75%" class="text"><bean:write property="TOOL_MAILSERVER/POP3NAME"/>
                  </td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">��������ַ���˿ڣ�</td>
                  <td class="text"><bean:write property="TOOL_MAILSERVER/POP3ADDRESS"/></td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">��¼�˺ţ� </td>
                <td class="text"><bean:write property="TOOL_MAILSERVER/POP3ACCOUNT"/>
				
				</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">��¼���룺 </td>
                <td class="text"><bean:write property="TOOL_MAILSERVER/POP3PWD"/></td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text"> ɾ��Զ���ʼ��� </td>
                <td class="text"><logic:equal property="TOOL_MAILSERVER/DELFLAG" value="0">
                    ��
                    
                    </logic:equal>
					<logic:equal property="TOOL_MAILSERVER/DELFLAG" value="1">
                    
                    ��
                    </logic:equal>
				  </td>
              </tr>
              <tr class="td2">
                <td align="right" class="text">�����ʼ��䣺</td>
                <td class="text">
				  <logic:equal property="TOOL_MAILSERVER/INCEPTMAILDIR" value="0">
				  	�ռ���
				  </logic:equal>
				  <logic:equal property="TOOL_MAILSERVER/INCEPTMAILDIR" value="1">
				  	������
				  </logic:equal>
				  <logic:equal property="TOOL_MAILSERVER/INCEPTMAILDIR" value="2">
				  	�ݸ���
				  </logic:equal>
				  <logic:equal property="TOOL_MAILSERVER/INCEPTMAILDIR" value="3">
				  	������
				  </logic:equal>
				  </td>
              </tr>
            </table>
			 </fieldset>
			<fieldset>
		   	<legend style="font-size:12px;color:#ff0000;line-height:30px">���Ͷ���Ϣ(smtp)</legend>
			<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
              <tr class="td2"> 
                <td width="25%" align="right" class="text">��������ַ���˿ڣ�</td>
                  <td width="75%" class="text"><bean:write property="TOOL_MAILSERVER/SMTPSERVER"/></td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">��ʾ������ </td>
                <td class="text"><bean:write property="TOOL_MAILSERVER/SHOWNAME"/> 
                 </td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">���ŵ�ַ��</td>
                <td class="text"><bean:write property="TOOL_MAILSERVER/SHOWADDRESS"/>
				
				</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">�˺�״̬��</td>
                <td class="text">
				<logic:equal property="TOOL_MAILSERVER/DEFAULTFLAG" value="0">
				  	����
				</logic:equal>
				<logic:equal property="TOOL_MAILSERVER/DEFAULTFLAG" value="1">
				  	ͣ��
				</logic:equal>
				<logic:equal property="TOOL_MAILSERVER/DEFAULTFLAG" value="2">
				  	�ʺ�
				</logic:equal>
				</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">������֤�� </td>
                <td class="text"> 
					<logic:equal property="TOOL_MAILSERVER/SMTPAUTH" value="1">
						��Ҫ
					</logic:equal>
					<logic:equal property="TOOL_MAILSERVER/SMTPAUTH" value="0">
						����Ҫ
					</logic:equal>
               </td>
              </tr>
			  <logic:equal property="TOOL_MAILSERVER/SMTPAUTH" value="1">
              <tr class="td2" id="auth1" style="display:block"> 
                <td height="18" align="right" class="text">��֤�˺ţ� </td>
                <td><bean:write property="TOOL_MAILSERVER/SMTPNAME"/></td>
              </tr>
              <tr class="td2"  id="auth2" style="display:block" class="text">
                <td align="right">��֤���룺 </td>
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
              <input name="Submit223" type="button" class="button_02" value="�� ��" onClick="history.back()">
</td></tr>
      </table></td>
    <td width="15">&nbsp;</td>
  </tr>
</table>
</form>