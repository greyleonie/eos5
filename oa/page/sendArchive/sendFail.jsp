<%@include file="/internet/common.jsp"%>
<%
String recordId = base.util.TalentContext.getValue(pageContext,null,"SendArchive/RecordID");

//�жϵ�ǰ�����Ƿ��ѱ���
//if (application.getAttribute("sendArchive"+recordId) != null && "open".equals((String)application.getAttribute("sendArchive"+recordId))) {
//    application.removeAttribute("sendArchive"+recordId);
//}
%>
<script>
	alert("���ı���ʧ�ܣ�")
</script>
<form method="post" action="oa.prSendArchive.sendList.do">
		<html:hidden property="SendArchive/_order/col1/field"/>
		<html:hidden property="SendArchive/_order/col1/asc" />
		<html:hidden property="temptype" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
</form>
<script>
	
	document.forms[0].submit();
</script>