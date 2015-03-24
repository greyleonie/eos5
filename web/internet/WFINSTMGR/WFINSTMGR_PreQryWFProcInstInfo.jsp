<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<html>
<body>
<form action="WFINSTMGR.pr_automata.WFINSTMGR_P_ShowProcessInstDetialTab.do" name="qryForm" method="POST">
<html:hidden  property="processInstID"/>
<html:hidden  name="WFProcessInst/processInstID" property="processInstID"/>
</form>
</body>
</html>
<script  language="JavaScript">
	qryForm.submit();
 </script>
 