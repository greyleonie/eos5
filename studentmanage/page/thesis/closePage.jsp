<%@include file="/internet/common.jsp"%>


<script>
	window.opener.document.forms[0].action = 'studentmanage.prThesis.thesisAssignList.do'
	window.opener.document.forms[0].submit();
	window.close();
</script>