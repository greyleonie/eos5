<%@include file="/internet/common.jsp"%>

<form method="post" action="">
		
	<html:hidden property="queryaction"/>		
	<html:hidden property="PageCond/begin"/>
	<html:hidden property="PageCond/count"/>
	<html:hidden property="PageCond/length" />	
</form>
<script>
	var frm =document.forms[0];
	frm.action=frm.elements["queryaction"].value;;
	frm.submit();
</script>