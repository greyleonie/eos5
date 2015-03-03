<%@include file="/internet/common.jsp"%>
<script>
	alert('<bean:write property="errorStr"/>')
</script>
<form method="post" action="">

		<html:hidden property="temptype" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
</form>
<script>
	document.forms[0].action = '<bean:write property="returnURL"/>';
	document.forms[0].submit();
</script>