<%@include file="/internet/common.jsp"%>
<form name="refresh" method="post">
<html:hidden property="TeachingPlan"/>
</form>
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
}
document.refresh.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?PageCond=";
document.refresh.submit();
</script>