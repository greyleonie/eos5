<%@include file="/internet/common.jsp"%>
<form name="refresh" method="post">
<html:hidden property="TeachingPlan/PlanID"/>
<html:hidden property="loc" value="6"/>
<html:hidden property="isAdopted" value="1"/> 
</form>
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
}
document.refresh.action="teachWorkManage.prMakeTeachPlan.singleClassPlan.do";
document.refresh.submit();
</script>