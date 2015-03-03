<%@include file="/internet/common.jsp"%>
<form action="oa.prwfAgent.agent.do" name="returnForm" method="post">
<input type="hidden" name="PageCond">
</form>
<script>
  var msg='<bean:write property="msg"/>';
  if(msg!=""){
    alert(msg);
  }
  document.returnForm.submit();
</script>