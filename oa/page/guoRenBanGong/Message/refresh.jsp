<%@ include file="/internet/common.jsp" %>

<html>
<head></head>
<body>
<!-- Insert your jsp/html code here -->

<html:form method="post" action="tools.pr.queryInnerNote.do">
  <input type="hidden" name="mark" value="1"/>
  <html:hidden property="PageCond/begin" />
  <html:hidden property="PageCond/length" />
  <html:hidden property="PageCond/count" />
  <html:hidden property="InnerNote/_order/col1/field" value="SENDDATE"/>
  <html:hidden property="InnerNote/_order/col1/asc" value="DESC"/>
  <html:hidden property="InnerNote/MSGTYPE"/>
  <html:hidden property="InnerNote/ISREAD"/>
  <html:hidden property="type"/>
  <input type="hidden" name="InnerNote/CONTENT/criteria/operator" value="like">
  <html:hidden property="InnerNote/SENDACCOUNT"/>
  <html:hidden property="InnerNote/SENDDATE"/>

</html:form>
<script>
document.forms[0].submit();
</script>

</body>
</html>