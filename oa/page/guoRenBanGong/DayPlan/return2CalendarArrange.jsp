<%@ include file="/internet/common.jsp" %>

<html>
<head></head>
<body>
<!-- Insert your jsp/html code here -->
<script>
//parent.leftFrame.document.location.reload();
</script>
<form method="post" action="">

<html:hidden property="PageCond/begin"  />
<html:hidden property="PageCond/length" value="10" />
<html:hidden property="PageCond/count" />


</form>
<script>
alert("ÐÞ¸Ä³É¹¦£¡");
//document.forms[0].submit();
window.location.href = "oa.prPersonOffice.prQueryCalendarArrange.do?year=&month=&menuID=DX_OASYS_WORK_DAYPLAN";
</script>

</body>
</html>