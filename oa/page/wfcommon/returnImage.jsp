<%@include file="/internet/common.jsp"%>
<form method="post" action="oa.pr.getWfImageForRollback.do?type=0">
		<html:hidden property="WFWorkItem/processInstID"/>
		<html:hidden property="title"/>
		<html:hidden property="tableName"/>
</form>


<script>
	window.parent.document.location.reload();
	document.forms[0].submit();
</script>