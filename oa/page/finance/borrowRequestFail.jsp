<%@include file="/internet/common.jsp"%>
<script>
	alert("����ʧ�ܣ�")
</script>
<form method="post" action="oa.prFinance.borrowRequestList.do">

		<html:hidden property="temptype" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
</form>
<script>
	
	document.forms[0].submit();
</script>