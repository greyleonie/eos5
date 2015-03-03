<%@include file="/internet/common.jsp"%>

<form name="refresh" method="post">
<html:hidden property="TeachingPlan/PlanID"/>
<html:hidden property="isAdopted"/>
<html:hidden property="loc"/>
</form>
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
}
</script>