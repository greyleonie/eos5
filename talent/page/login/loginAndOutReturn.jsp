<%@include file="/internet/common.jsp"%>

<form method="post" action="talent.pr.loginAndOutList.do">
		<html:hidden property="QuerySysLog/_order/col1/field"/>
		<html:hidden property="QuerySysLog/_order/col1/asc" />
		
		
		
		
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
</form>
<script>
	
	document.forms[0].submit();
</script>