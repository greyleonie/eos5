<%@include file="/internet/common.jsp"%>

<!--<form name="refresh" action="teachWorkManage.prMakeTeachPlan.singleClassPlan.do" method="post">-->
<form name="refresh" action="teachWorkManage.prMakeTeachPlan.singleClassPlan_new.do" method="post">
<INPUT type="hidden" id="TeachingPlan/ClassID" name="TeachingPlan/ClassID" value="<bean:write property='Course/ClassID'/>">
<input type="hidden" name="isAdopted" value="1" /> 
</form>
<script>
var msg='<bean:write property="msg"/>';
if(confirm(msg)==true){
  document.forms[0].submit();
}
</script>