<%@include file="/internet/common.jsp"%>
<title>�޸���ʷ�༶����</title>
<form name="updateForm" method="post">
  <table width="90%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="90%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="20"> </td>
            <td class="text_wirte">�޸���ʷ�༶����</td> 
          </tr>
      </table></td>
    </tr>
  </table>
  
   <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"><input type="hidden" name="Class/ClassID"/> </td>
    </tr>
    <tr>
      <td class="text">
  <table width="500"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
      <tr>
            <td width="100" align="right" class="td2">�༶���ƣ�</td>
            <td colspan="7"  class="td1" width="400" id="className"> 
     </td>            
          </tr>
    <tr>
            <td  width="100" align="right" class="td2">ԭ��������</td>
            <td colspan="7" class="td1" width="400" id="stuNum">
    </td>            
          </tr>
          <tr>
            <td  width="100" align="right" nowrap class="td2">��������Ϊ��</td>
            <td colspan="7" class="td1" width="400">
            <html:text maxlength="4" property="Class/factNum" attributesText='class="input" size="25" ValidateType="notempty" Msg="������������Ϊ��"'/>
            
              <span class="text_red">*</span></td>                     
          </tr>
  </table>
    <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <input name="Submit" type="button" class="button_02" onclick="save()" value="�� ��">
              <input name="Submit2" type="button" class="button_02" onclick="window.close()" value="�� ��"></td>
            </tr>
          </table>
  </td></tr></table>
</form>
<script>
   var obj=window.dialogArguments;  
   document.updateForm.elements["Class/ClassID"].value=obj[0];
   document.all.className.innerHTML=obj[1];
   if(obj[2]=="undefined"){
     obj[2]="";
   }
   document.all.stuNum.innerHTML=obj[2];
</script>
<script language="javascript">
function save(){  
   document.updateForm.action="teachWorkManage.prClassInfoManage.updateFactNum.do";  
   document.updateForm.target="mainframe";
   document.updateForm.submit();
  // window.close();
}
</script>