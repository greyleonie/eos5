<%@include file="/internet/common.jsp"%>

<form method="post" action="talent.pr.deptlist.do">
		<html:hidden property="EOSORG_T_Organization/_order/col1/field"/>
		<html:hidden property="EOSORG_T_Organization/_order/col1/asc" />
		<html:hidden property="EOSORG_T_Organization/parentOrgID/criteria/value" />
		<html:hidden property="EOSORG_T_Organization/orgLevel" />
		<html:hidden property="EOSORG_T_Organization/parentName" />
		
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
</form>
<script>
	parent.leftFrame.document.location.reload();
	document.forms[0].submit();
</script>