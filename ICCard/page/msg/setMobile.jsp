<%@include file="/internet/common.jsp"%>
<title>手动输入手机号码</title>
<form name="form1" method="post">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
            <td nowrap class="td2">
       手机号码：</td> <td nowrap class="td1"><input type="text" name="mobile">     
             </td></tr>
                   <tr>
            <td nowrap class="td1" colspan="2" align="center">
            <input type="button" class="button_02" value="确定" onclick="returnMobile()">
             <input type="button" value="关闭" class="button_02" onclick="window.close()"> 
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