<%@include file="/internet/common.jsp"%>
<form name="refresh" method="post">
<html:hidden property="TeachingPlan/ClassID"/>
</form>
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
}
document.refresh.action="teachWorkManage.prMakeTeachPlan.leaderCheckFramPage.do";
document.refresh.submit();
</script>