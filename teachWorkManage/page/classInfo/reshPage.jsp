<%@include file="/internet/common.jsp"%>
<form action="teachWorkManage.prClassInfoManage.classInfoList.do" name="returnForm" method="post">
<input type="hidden" name="PageCond">
<input type="hidden" name="Class/isHistoryClass/criteria/value" value="<bean:write property="Class/isHistoryClass"/>">
<html:hidden property="Class/Enable/criteria/value"/>
</form>
<script>
  var msg='<bean:write property="msg"/>';
  if(msg!=""){
    alert(msg);
  }
  document.returnForm.submit();
</script>