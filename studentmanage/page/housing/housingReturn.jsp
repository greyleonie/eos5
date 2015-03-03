<%@include file="/internet/common.jsp"%>

<form method="post" action="studentmanage.prHousing.classStudentList.do">
		<html:hidden property="QueryStudentRoom/ClassID/criteria/value"/>
		<html:hidden property="QueryStudentRoom/TeamID/criteria/value"/>
		<html:hidden property="QueryStudentRoom/Sex/criteria/value"/>
		<html:hidden property="QueryStudentRoom/fenpei"/>
</form>

<script>
	<logic:notPresent property="RightReload">
	window.parent.document.rightFrame.toquery(0);
	</logic:notPresent>
	document.forms[0].submit();
</script>