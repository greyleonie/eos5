<%@ include file="/internet/common.jsp" %>
<!-- Insert your jsp/html code here -->
<link href="/internet/theme/style0/style.css" rel="stylesheet" type="text/css">
<logic:present property="only">
  <info:alert information="文件夹已存在，请重新输入！" pass="true"/>
</logic:present>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif">
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;修改邮件夹</td>
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
                  <td width="26%" align="right">邮件夹名称：</td>
                  <td width="74%">&nbsp; 
				  <html:text property="TOOL_MailDirectory/MAILDIRNAME" size="30"/>
                    <span style="color:#FF0000;font-size:12px">*</span>
					</td>
                </tr>
                <tr class="td1"> 
                  <td width="26%" align="right">邮件夹备注：</td>
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
          <td align="center"><input name="Submit222" type="submit" class="button_03" value="保存并返回">
              <input name="Submit223" type="button" class="button_02" value="返 回" onClick="location.href='oa.prPersonOffice.mailfolder.do'">
</td></tr>
      </table></td>
  </tr>
</form></table>
<script language="JavaScript">
   function validate(){
   		if(document.form1.elements["TOOL_MailDirectory/MAILDIRNAME"].value==""){
			alert("邮件夹名不能为空！");
			document.form1.elements["TOOL_MailDirectory/MAILDIRNAME"].focus();
			return false;
		 }		
   	return true;
   }
</script>