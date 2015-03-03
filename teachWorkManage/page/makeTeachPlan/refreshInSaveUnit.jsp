<%@include file="/internet/common.jsp"%>
<form name="refresh" method="post">
<html:hidden property="TeachingPlanUnit/ClassID"/>
<input type="hidden" name="TeachingPlan/ClassID" value='<bean:write property="TeachingPlanUnit/ClassID"/>'>
<html:hidden property="TeachingPlan/PlanID"/>
<html:hidden property="PageCond"/>
</form>
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
}
document.refresh.action="teachWorkManage.prMakeTeachPlan.editUnit_new.do";
document.refresh.submit();
</script>