<%@include file="/internet/common.jsp"%>

<form method="post" action="talent.pr.teacherUserlist.do">
		<html:hidden property="QueryTeacher/_order/col1/field"/>
		<html:hidden property="QueryTeacher/_order/col1/asc" />
		<html:hidden property="QueryTeacher/DepartmentID/criteria/value"/>
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
</form>
<script>
	
	document.forms[0].submit();
</script>