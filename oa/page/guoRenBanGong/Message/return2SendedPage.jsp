<%@ include file="/internet/common.jsp" %>

<html>
<head></head>
<body>
<!-- Insert your jsp/html code here -->
<script>
//parent.leftFrame.document.location.reload();
</script>
<form method="post" action="oa.prPersonOffice.queryInnerNote.do?InnerNote=&&type=send">

<html:hidden property="PageCond/begin"  />
<html:hidden property="PageCond/length" value="10" />
<html:hidden property="PageCond/count" />


</form>
<script>
document.forms[0].submit();
</script>

</body>
</html>