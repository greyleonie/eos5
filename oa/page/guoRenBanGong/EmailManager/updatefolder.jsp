<%@ include file="/internet/common.jsp" %>
<!-- Insert your jsp/html code here -->
<link href="/internet/theme/style0/style.css" rel="stylesheet" type="text/css">
<logic:present property="only">
  <info:alert information="�ļ����Ѵ��ڣ����������룡" pass="true"/>
</logic:present>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif">
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���˰칫��&gt;�޸��ʼ���</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
 <form name="form1" method="post" action="oa.prPersonOffice.doupdateFolder.do" onSubmit="return validate();">
  <tr>
    <td>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1">
                <tr class="td1"> 
                  <td width="26%" align="right">�ʼ������ƣ�</td>
                  <td width="74%">&nbsp; 
				  <html:text property="TOOL_MailDirectory/MAILDIRNAME" size="30"/>
                    <span style="color:#FF0000;font-size:12px">*</span>
					</td>
                </tr>
                <tr class="td1"> 
                  <td width="26%" align="right">�ʼ��б�ע��</td>
                  <td width="74%">&nbsp;  
				  <html:text property="TOOL_MailDirectory/REMARK" size="30"/>
				  <html:hidden property="TOOL_MailDirectory/MAILDIRID"/>
				  <html:hidden property="TOOL_MailDirectory/FLAG"/>
				  <html:hidden property="TOOL_MailDirectory/MAILDIRTYPE"/>
				  <html:hidden property="TOOL_MailDirectory/USERACCOUNT"/>
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