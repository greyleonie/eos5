<%@include file="/internet/common.jsp"%>
<form name="refresh" method="post">
  <html:hidden property="TeachingPlan/State"/>
  <html:hidden property="isAdopted"/>
  <html:hidden property="TeachingPlan/PlanID"/>
  <html:hidden property="loc"/> 
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

document.refresh.action="teachWorkManage.prMakeTeachPlan.filterSubject.do?TeachingPlan=";
document.refresh.submit();


</script>