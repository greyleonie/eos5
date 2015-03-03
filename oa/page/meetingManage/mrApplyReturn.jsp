<%@include file="/internet/common.jsp"%>

<form method="post" action="oa.prMeetingManage.mrApplyList.do">

		<html:hidden property="temptype" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
</form>


<script>
	<logic:present property="queryaction">
	document.forms[0].action = '<bean:write property="queryaction"/>';
	</logic:present>
	
	document.forms[0].submit();
</script>