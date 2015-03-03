<%@include file="/internet/common.jsp"%>
<form method="post" name="f" action="studentmanage.student_xj.xjlist.do">
  <html:hidden property="PageCond"/>
  <html:hidden property="QueryStudent/ClassID/criteria/value"/>
</form>
<script>
 document.forms[0].submit();
</script>