<%@include file="/internet/common.jsp"%>

<form name="refresh" method="post">
<html:hidden property="PageCond"/>
<html:hidden property="keyWord"/>
<html:hidden property="group" value="-1"/>
<html:hidden property="isHistory" value="0"/>

</form>
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
}
document.refresh.action="teachWorkManage.prMakeTeachPlan.subjectManage.do";
document.refresh.submit();
</script>