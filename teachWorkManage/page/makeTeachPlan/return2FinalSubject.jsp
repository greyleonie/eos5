<%@include file="/internet/common.jsp"%>
<form name="refresh" method="post" action="teachWorkManage.prMakeTeachPlan.courseOfSpecialSubject.do">
 <html:hidden property="Class/ClassID"/>
</form>
<script>
var msg='<bean:write property="msg"/>';
if(msg!="")alert(msg);
document.forms[0].submit();
</script>