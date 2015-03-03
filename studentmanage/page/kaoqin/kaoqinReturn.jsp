<%@include file="/internet/common.jsp"%>

<form method="post" action="studentmanage.prKaoqin.kaoqinList.do">
		<html:hidden property="QueryStudentlaterLogs/ClassID"/>
		<html:hidden property="QueryStudentlaterLogs/checkTime"/>
		<html:hidden property="QueryStudentlaterLogs/wubie"/>
		
</form>

<script>
	
	document.forms[0].submit();
</script>