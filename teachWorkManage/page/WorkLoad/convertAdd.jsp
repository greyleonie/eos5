<%@include file="/internet/common.jsp"%>
<title>���ӹ�����Ŀ</title>

<body>
<form name="convertForm" action="teachWorkManage.prWorkLoad.convertAddDo.do" target="_parent">
<html:hidden property="WorkLoadConvert/IsAdopted" value="1"/>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
      <tr class="td2">
        <td align="center">���ӹ�����Ŀ </td>
      </tr>
    </table> 
       <table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
       <tr class="td1"><td align="right">�������</td><td><html:select property="WorkLoadConvert/WorkType"  attributesText=' ValidateType="notempty"  Msg="���������Ϊ��" '> 
              <html:option value="">--��ѡ�������--</html:option> <html:options property="list[@type='WorkType']/WorkType/WorkType" labelProperty="list[@type='WorkType']/WorkType/WorkType"/> 
              </html:select>  &nbsp;<span class="text_red">*</span></td></tr>
       <tr class="td1"><td align="right">������Ŀ��</td><td><html:text property="WorkLoadConvert/WorkItem" attributesText='class="input" size="40" ValidateType="notempty" Msg="������Ŀ����Ϊ��"'/> &nbsp;<span class="text_red">*</span></td></tr>
       <tr class="td1"><td align="right">����δΣ�</td><td><html:text property="WorkLoadConvert/ClassNum" attributesText='class="input" size="10" ValidateType="notempty,numeric" Msg="����δβ���Ϊ��;����δα���Ϊ����" '/> &nbsp;<span class="text_red">*</span></td></tr>
       <tr class="td1"><td align="right">��&nbsp;&nbsp;&nbsp;&nbsp;λ��</td><td><html:text property="WorkLoadConvert/Unit" attributesText='class="input" size="10" ValidateType="notempty" Msg="��λ����Ϊ��"'/> &nbsp;<span class="text_red">*</span></td></tr>
    
      </table>      
      <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center">
          <input name="Submit" type="button" class="button_02" onClick="save()" value="ȷ ��">
          <input name="Submit" type="button" class="button_02" value="�� ��" onclick="window.close()">
          </td>
        </tr>
      </table></td>
  </tr>
</table>
</form>

</body>
<script language="javascript">
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) {
	  frm.submit();
	  window.opener.location.href="teachWorkManage.prWorkLoad.convertModify.do"; 
	  window.close();
	}
  
  }
</script>