<%@include file="/internet/common.jsp"%>
<form name="form1" action="" method="post">
  <html:hidden property="PageCond"/>
  <html:hidden property="start"/>
  <html:hidden property="end"/>
</form>
<script>
  document.forms[0].action="ICCard.prMsg.msg.do";
  document.forms[0].target="mainframe";
  document.forms[0].submit();
</script>