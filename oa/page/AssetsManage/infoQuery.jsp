<%@include file="/internet/common.jsp"%>
<form method="post" action="oa.prAssetsManage.infoAddDo.do">
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="15"> </td>
      </tr>
  <tr><td>
	<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" class="text" >
		     <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                <tr>
                  <td align="right" nowrap="nowrap"  class="td2" >�ؼ��֣�</td>
                  <td colspan="3" nowrap="nowrap"  class="td1" >
                       <html:text property="CAPT_CAPITALINFO/CAPTCODE" maxlength="20" attributesText='class="input" size="30"' readonly="true"/> 
                    </td>
                </tr>
              </table> 
            <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ѯ" onClick="javascript:save()">
            </tr>
          </table>
    	  </td>
      </tr>
    </table>
</form>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
 </script>