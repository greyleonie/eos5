<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="teachWorkManage.prTeachingCase.caseTypeModifyDo.do">
  <html:hidden property="CaseType/CaseTypeID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�����⡪&gt;��������޸�</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">����������ƣ�</td>
            <td width="88%" class="td1">
			<html:text property="CaseType/CaseTypeName" maxlength="50" attributesText='class="input" size="50" ValidateType="notempty" Msg="����������Ʋ���Ϊ��"'/> 
              <span class="text_red">*</span></td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="button" class="button_02" value="�� ��" onclick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
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
  <%
 
  %>