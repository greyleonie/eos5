<%@include file="/internet/common.jsp"%>

<form name="refresh" method="post">
<html:hidden property="PageCond"/>
</form>
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
}
document.forms[0].action="teachWorkManage.prMakeTeachPlan.educationModelManage.do?PageCond=";
document.forms[0].target="mainFrame";
document.forms[0].submit();
window.close();
</script>