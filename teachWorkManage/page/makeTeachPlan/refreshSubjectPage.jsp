<%@include file="/internet/common.jsp"%>
<form name="refresh" method="post">
<html:hidden property="TeachingPlan/PlanID"/>
<html:hidden property="TeachingPlan/State"/>
<html:hidden property="loc"/>
</form>
<script>
var msg='<bean:write property="msg"/>';
var loc=document.refresh.elements["loc"].value;
if(msg!=""){
  alert(msg);
}

document.refresh.action="teachWorkManage.prMakeTeachPlan.editMajorSuject.do";
if(loc=="5"){//����ͨ����
   document.refresh.action="teachWorkManage.prMakeTeachPlan.filterSubject.do";
}
if(loc=="4"){//�ϱ��׶�
   document.refresh.action="teachWorkManage.prMakeTeachPlan.subjectReport.do";
}
document.refresh.submit();
</script>