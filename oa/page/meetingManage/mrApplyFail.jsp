<%@include file="/internet/common.jsp"%>
<script>
	alert("�������뱣��ʧ�ܣ�")
</script>
<form method="post" action="oa.prMeetingManage.mrApplyList.do">

		<html:hidden property="temptype" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
</form>
<script>
	
	document.forms[0].submit();
</script>