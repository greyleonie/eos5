<%@include file="/internet/common.jsp"%>
<%
String recordId = base.util.TalentContext.getValue(pageContext,null,"SendArchive/RecordID");

//判断当前正文是否已被打开
//if (application.getAttribute("sendArchive"+recordId) != null && "open".equals((String)application.getAttribute("sendArchive"+recordId))) {
//    application.removeAttribute("sendArchive"+recordId);
//}
%>
<form method="post" action="oa.prSendArchive.sendList.do">
		<html:hidden property="SendArchive/_order/col1/field"/>
		<html:hidden property="SendArchive/_order/col1/asc" />
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