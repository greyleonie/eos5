<%@include file="/internet/common.jsp"%>
<script>
	alert("该环节已被办理了！")
</script>
<form method="post" action="oa.prCarManage.useCarList.do">
		
		<html:hidden property="temptype" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
</form>
<script>
	
	document.forms[0].submit();
</script>