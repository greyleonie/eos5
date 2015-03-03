<%@include file="/internet/common.jsp"%>
<form name="refresh" method="post">
<html:hidden property="TeachingPlanUnit/ClassID"/>
<input type="hidden" name="TeachingPlan/ClassID" value='<bean:write property="TeachingPlanUnit/ClassID"/>'>
  <html:hidden property="isAdopted"/>
  <html:hidden property="TeachingPlan/PlanID"/>
</form>
<form name="frm" method="post">
 <html:hidden property="loc"/> 
 <input type="hidden" name="TeachingPlan/ClassID" value='<bean:write property="TeachingPlanUnit/ClassID"/>'>
 
</form>
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
}

document.refresh.action="teachWorkManage.prMakeTeachPlan.filterMainClass.do?TeachingPlan=";
document.refresh.submit();


</script>