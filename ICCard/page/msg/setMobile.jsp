<%@include file="/internet/common.jsp"%>
<title>�ֶ������ֻ�����</title>
<form name="form1" method="post">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
            <td nowrap class="td2">
       �ֻ����룺</td> <td nowrap class="td1"><input type="text" name="mobile">     
             </td></tr>
                   <tr>
            <td nowrap class="td1" colspan="2" align="center">
            <input type="button" class="button_02" value="ȷ��" onclick="returnMobile()">
             <input type="button" value="�ر�" class="button_02" onclick="window.close()"> 
            </td></tr>
</table>
</form>
<script language="javascript">

  function returnMobile(){
   var mobile=document.all("mobile").value;
 
   window.returnValue=mobile;
   window.close();
    
  }
  
</script>