<%@include file="/internet/common.jsp"%>
<%
talent.util.EOSMenuMap menuMap = new talent.util.EOSMenuMap();
menuMap.loadMenu(pageContext.getServletContext());
 %>
<form method="post" action="talent.prEosMenu.eosMenulist.do">
		<html:hidden property="TEOSMenu/_order/col1/field"/>
		<html:hidden property="TEOSMenu/_order/col1/asc" />
		<html:hidden property="TEOSMenu/parentsID/criteria/value" />
		<html:hidden property="TEOSMenu/parentName" />
		<html:hidden property="TEOSMenu/parentLevel" />
		
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
</form>
<script>
	parent.leftFrame.document.location.reload();
	document.forms[0].submit();
</script>