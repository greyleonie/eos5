<%@include file="/internet/common.jsp"%>

<form name="refresh" method="post">
<html:hidden property="PageCond"/>
<html:hidden property="Class"/>
</form>
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
}
document.refresh.action="teachWorkManage.prMakeTeachPlan.courseOfSpecialSubject.do";
document.refresh.submit();
</script>