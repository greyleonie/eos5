<%@include file="/internet/common.jsp"%>
<script>
function initFcc(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("��ɫ���Ѵ��ڣ����������룡");
		</logic:greaterThan>
	</logic:present>
}
</script>
<body onload="initFcc()">
<form method="post" action="talent.pr.roleaddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ϵͳ����&gt;��ɫ����&gt;������ɫ</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		<input type="hidden" name="EOSRole/roleClass" value="300">
		<html:hidden property="EOSRole/_order/col1/field"/>
		<html:hidden property="EOSRole/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
		 
		
		
		
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="23%" align="right" nowrap class="td2">��ɫ���ƣ� </td>
            <td width="77%" class="td1"><html:text property="EOSRole/roleName" maxlength="32" attributesText='class="input" size="70" ValidateType="notempty" Msg="��ɫ���Ʋ���Ϊ��"'/> 
              <span class="text_red">*</span>
            </td>
          </tr>
          <!--tr> 
            <td width="23%" align="right" nowrap class="td2">�����û��� </td>
            <td class="td1"><html:text property="EOSRole/roleUsers" attributesText='class="input" size="70" '/> 
              <input name="Button" type="button" class="button_02" value="�û�ѡ��"> 
            </td>
          </tr-->
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) {
		
	  
	  frm.submit();	
	} 
  
}
  




</script>