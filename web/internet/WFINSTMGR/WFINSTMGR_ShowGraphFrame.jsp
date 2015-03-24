<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>流程定义</title>
</head>

<frameset name="mainTop" rows="300,5,*" cols="*" framespacing="0" frameborder="NO" border="0">
  <frame width=100% height=100% frameborder=0 scrolling=no src="WFINSTMGR.pr_automata.WFINSTMGR_P_preShowProcessInstGraph.do?processInstID=<bean:write property="processInstID"/>" name="graph">
  <frame width=100% height=100% frameborder=0 scrolling=no src="/internet/WFDEFMGR/WFDEFMGR_WFSwitchUpDown.jsp" name="updown">
  <frame width=100% height=100% frameborder=0 scrolling=auto src="WFINSTMGR.pr_automata.WFINSTMGR_P_QueryProcessActivityInstTab.do?showWhich=0&processInstID=<bean:write property="processInstID"/>" name="activityList">
</frameset>

<noframes><body>
</body></noframes>
</html>

<%@include file="/internet/commonTail.jsp"%>