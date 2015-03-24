<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<form action="WFINSTMGR.pr_automata.WFINSTMGR_P_ProcessInst.do" name="qryForm" method="POST">
<html:hidden name="WFProcessInst/processInstID" property="processInstID"/>
<html:hidden property="showWhich"/>
</form>
 <script  language="JavaScript">
	qryForm.submit();
        </script>
