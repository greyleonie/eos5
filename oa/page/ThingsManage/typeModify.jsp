<%@include file="/internet/common.jsp"%>
<logic:greaterThan property="count" value="1">
<script>
alert("�Ѿ����ڴ����");
</script>
</logic:greaterThan>
<form method="post" action="oa.prThingsManage.typeModifyDo.do">
<html:hidden property="COMM_TYPE/ENABLE" />
<html:hidden property="COMM_TYPE/PARENTID" />
<html:hidden property="COMM_TYPE/TYPEID" />
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="15"> </td>
      </tr>
  <tr><td>
	<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" class="text" >
		  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
            <tr >
              <td align="right" class="td2">�������</td>              
              <td class="td1"><html:text property="COMM_TYPE/TYPENAME"  maxlength="100" attributesText="size='24' class='input' ValidateType='notempty' Msg='���������Ϊ��'"/>&nbsp;<span class="text_red">*</span></td>
            </tr >
            <tr class="td2">
                <td align="right">��ע��</td>
                <td  class="td1"><html:textarea property="COMM_TYPE/REMARK" cols="50" rows="3" style="width:100%"/></td>
            </tr>
          </table> 
            <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="javascript:save()">
            </tr>
          </table>
		  </td>
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