<%@ include file="/internet/common.jsp" %>
<logic:present property="only">
  <info:alert information="�ļ����Ѵ��ڣ����������룡" pass="true"/>
</logic:present>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif">
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���˰칫��&gt;�����ʼ���</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
 <form name="form1" method="post" action="oa.prPersonOffice.doaddFolder.do" onSubmit="return validate();">
  <tr>
    <td width="15">&nbsp;</td>
    <td><table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td> </td>
      </tr>
    </table>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1">
                <tr class="td2"> 
                  <td class="text" width="26%" align="right">�ʼ������ƣ�</td>
                  <td class="text" width="74%">&nbsp; <input name="TOOL_MailDirectory/MAILDIRNAME" type="text" class="" size="30" maxlength="15">
                    <span style="color:#FF0000;font-size:12px">*</span>
					</td>
                </tr>
                <tr class="td2"> 
                  <td class="text" width="26%" align="right">�ʼ��б�ע��</td>
                  <td class="text" width="74%">&nbsp; <input name="TOOL_MailDirectory/REMARK" type="text" class=""  size="30" maxlength="50"> 
                    <input type="hidden" name="TOOL_MailDirectory/FLAG" value="1">
					<input type="hidden" name="TOOL_MailDirectory/MAILDIRTYPE" value="1">
					<input type="hidden" name="TOOL_MailDirectory/USERACCOUNT" value='<bean:write property="SessionEntity/operatorID"/>'>
					</td>
                </tr>
              </table> </td>
        </tr>
      </table>      
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> </td>
        </tr>
      </table>
      <table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td align="center"><input name="Submit222" type="submit" class="button_03" value="���沢����">
              <input name="Submit223" type="button" class="button_02" value="�� ��" onClick="location.href='oa.prPersonOffice.mailfolder.do'">
</td></tr>
      </table></td>
  </tr>
</form></table>
<script language="JavaScript">
   function validate(){
   		if(document.form1.elements["TOOL_MailDirectory/MAILDIRNAME"].value==""){
			alert("�ʼ���������Ϊ�գ�");
			document.form1.elements["TOOL_MailDirectory/MAILDIRNAME"].focus();
			return false;
		 }		
   	return true;
   }
</script>