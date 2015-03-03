<%@include file="/internet/common.jsp"%>

<form method="post" action="">
		
</form>
<script>
	
	<logic:present property="queryaction">
	document.forms[0].action='<bean:write property="queryaction"/>';
	</logic:present>
	document.forms[0].submit();
</script>