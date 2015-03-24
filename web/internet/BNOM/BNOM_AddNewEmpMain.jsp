<%@include file="/internet/BNOM/omappbase.jsp"%>
<iframe src="BNOM.pr_automata.BNOM_P_ShowNewEmp.do?mode=N&from=orgMgr" name="addNewEmp" width="100%" height="100%" align="left" frameBorder="0"></iframe>
<SCRIPT LANGUAGE="JavaScript"> 
<!-- 
caller = window.dialogArguments;
function refreshWin(){
	//caller.location.reload();
	caller.location = "BNOM.pr_automata.BNOM_P_QueryEmpsByOrg.do?QueryCondition=&orgID=" + caller.el.orgID.value + "&type=" + caller.el.type.value;
	window.close();
}

// --> 
</SCRIPT>