
<%@include file="/internet/common.jsp"%>
<title>ɾ���γ���ʾ��</title>
<form>
<table width="60%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="80%"  border="0" align="center" cellpadding="0" cellspacing="1" >
          <tr > 
            <td align="center" class="td1">ɾ���ÿγ̣�ȷ����</td>
           
          </tr>
        </table>
          <table width="90%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center" nowrap><input name="Submit" type="button" class="button_eight" value="ɾ��������" onclick="setStatus('1')">
                <input name="Submit22" type="button" class="button_eight" value="ɾ��������" onclick="setStatus('0')">
                <input name="Submit2" type="button" class="button_02" value="ȡ ��" onclick="setStatus('-1')"></td>
            </tr>
        </table></td>
    </tr>
   
  </table>
</form>
<script>
 function setStatus(remark){
   window.returnValue=remark;
   window.close();
 }
</script>