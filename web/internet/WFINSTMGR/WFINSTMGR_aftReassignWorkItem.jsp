<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<form action="WFINSTMGR.pr_automata.WFINSTMGR_P_preReassignWorkItem.do" name="qryForm" method="POST">
<html:hidden property="WFActivityInstView/activityInstID"/>
<html:hidden name="activityInstID" property="WFActivityInstView/activityInstID"/>
<html:hidden property="processInstID"/>
<html:hidden property="showWhich"/>

</form>

<script  language="JavaScript">
	qryForm.submit();
</script>