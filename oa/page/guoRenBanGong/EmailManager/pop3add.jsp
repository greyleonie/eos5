<%@ include file="/internet/common.jsp" %>

<form method="post" action="">
<html:hidden property="PageCond/begin" />
<html:hidden property="PageCond/length" />
<html:hidden property="Order/col1"/>
<html:hidden property="Order/col1/@order"/>
<html:hidden property="marked"/>
<html:hidden property="TOOL_MAILSERVER/POP3ADDRESS"/>
<html:hidden property="TOOL_MAILSERVER/SMTPSERVER"/>
<input type="hidden" name="TOOL_MAILSERVER/USERACCOUNT" value='<bean:write property="SessionEntity/operatorID"/>'>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���˰칫��&gt;����POP3������</td>
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
		   <legend style="font-size:12px;color:#ff0000;line-height:30px">���ն���Ϣ(pop3)</legend>
		  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
              <tr class="td2"> 
                <td width="25%" align="right" class="text">�ʺ����ƣ� </td>
                <td width="75%"> <input name="TOOL_MAILSERVER/POP3NAME" type="text" class="input" size="50" maxlength="30">
                  <span style="color:#FF0000;font-size:12px">&nbsp;*&nbsp;</span></td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">��������ַ���˿ڣ�</td>
                  <td> <input name="pop3host" type="text" class="input" size="44" maxlength="25">
                    <input name="pop3port" class="input" type="text" value="110" size="3" maxlength="5"><span style="color:#FF0000;font-size:12px">&nbsp;*&nbsp;</span>
                    һ�������Ϊ110</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">��¼�˺ţ� </td>
                <td> <input name="TOOL_MAILSERVER/POP3ACCOUNT" type="text" class="input" size="50" maxlength="30">
				<span style="color:#FF0000;font-size:12px">&nbsp;*&nbsp;</span>
				</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">��¼���룺 </td>
                <td><input name="TOOL_MAILSERVER/POP3PWD" type="password" class="input" size="50" maxlength="120"></td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text"> ɾ��Զ���ʼ��� </td>
                <td><select name="TOOL_MAILSERVER/DELFLAG">
                    <option value="0">��</option>
                    <option value="1">��</option>
                  </select>
				  </td>
              </tr>
              <tr class="td2">
                <td align="right" class="text">�����ʼ��У�</td>
                <td><select name="TOOL_MAILSERVER/INCEPTMAILDIR">
                    <option value="0">�ռ���</option>
                    <option value="1">������</option>
                    <option value="2">�ݸ���</option>
                    <option value="3">������</option>
                  </select></td>
              </tr>
            </table>
			 </fieldset>
			<fieldset>
		   	<legend style="font-size:12px;color:#ff0000;line-height:30px">���Ͷ���Ϣ(smtp)</legend>
			<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
              <tr class="td2"> 
                <td width="25%" align="right" class="text">��������ַ���˿ڣ�</td>
                  <td width="75%" class="text"> <input name="smtphost" type="text" class="input" size="44" maxlength="25">
                    <input name="smtpport" class="input" type="text" value="25" size="3" maxlength="5">
                    һ�������Ϊ25 </td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">��ʾ������ </td>
                <td class="text"> <input name="TOOL_MAILSERVER/SHOWNAME" type="text" class="input" size="50" maxlength="200"> 
                  <span style="color:#FF0000;font-size:12px">&nbsp;</span></td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">���ŵ�ַ��</td>
                <td> <input name="TOOL_MAILSERVER/SHOWADDRESS" type="text" class="input" size="50" maxlength="60">
                    <span style="color:#FF0000;font-size:12px">&nbsp;*����POP3�ʼ���ַ&nbsp;</span> 
                    </td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">�˺�״̬��</td>
                <td> 
				<select name="TOOL_MAILSERVER/DEFAULTFLAG">
					<option value="0">����</option>
					<option value="1">ͣ��</option>
					<option value="2">�ʺ�</option>
				</select>
				</td>
              </tr>
              <tr class="td2"> 
                <td align="right" class="text">������֤�� </td>
                <td> <select name="TOOL_MAILSERVER/SMTPAUTH" onChange="fcc_auth(this.options[selectedIndex].value,'auth')">
						<option value="1">��Ҫ</option>
						<option value="0">����Ҫ</option>
						
                     </select>
               </td>
              </tr>
			  
              <tr class="td2" id="auth1" style="display:block"> 
                <td height="18" align="right" class="text">��֤�˺ţ� </td>
                <td><input name="TOOL_MAILSERVER/SMTPNAME" type="text" class="input" size="50" maxlength="30"></td>
              </tr>
              <tr class="td2"  id="auth2" style="display:block">
                <td align="right" class="text">��֤���룺 </td>
                  <td><input name="TOOL_MAILSERVER/SMTPPWD" type="password" class="input"size="50" maxlength="120"> 
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
      <table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td align="center">              <input name="Submit222" type="button" class="button_03" value="���沢����" onClick="pop3addDo()">
              <input name="Submit223" type="button" class="button_02" value="�� ��" onClick="history.back()">
</td></tr>
      </table></td>
    <td width="15">&nbsp;</td>
  </tr>
</table>
</form>
<script language="JavaScript">
	function fcc_auth(mark,obj){
		var obj1 = document.getElementById(obj + "1");
		var obj2 = document.getElementById(obj + "2");
		if(mark=="1"){
			obj1.style.display="block";
			obj2.style.display="block";
		}else{
			obj1.style.display="none";
			obj2.style.display="none";
		}
	}
</script>

<script language="JavaScript">
	function pop3addDo(){
		var frm = document.forms[0];
		if(frm.elements["TOOL_MAILSERVER/POP3NAME"].value==""){
			alert("�ʺ����Ʋ���Ϊ��");
			frm.elements["TOOL_MAILSERVER/POP3NAME"].focus();
			return
		}
		
		if(frm.elements["pop3host"].value==""){
			alert("��������ַ����Ϊ��");
			frm.elements["pop3host"].focus();
			return
		}
		if(frm.elements["TOOL_MAILSERVER/POP3ACCOUNT"].value==""){
			alert("��¼�˺Ų���Ϊ��");
			frm.elements["TOOL_MAILSERVER/POP3ACCOUNT"].focus();
			return
		}
		
		if(frm.elements["TOOL_MAILSERVER/SHOWADDRESS"].value==""){
			alert("���ŵ�ַ����Ϊ��");
			frm.elements["TOOL_MAILSERVER/SHOWADDRESS"].focus();
			return
		}
		
		frm.elements["TOOL_MAILSERVER/POP3ADDRESS"].value = frm.elements["pop3host"].value + ":" + frm.elements["pop3port"].value
		
		frm.elements["TOOL_MAILSERVER/SMTPSERVER"].value = frm.elements["smtphost"].value + ":" + frm.elements["smtpport"].value
		frm.action = "oa.prPersonOffice.pop3addDo.do";
		frm.submit();
		
	}
</script>