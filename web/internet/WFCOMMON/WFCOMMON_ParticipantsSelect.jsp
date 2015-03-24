<%@ include file="/internet/common.jsp" %> 
<html>
<head>
<title>用户管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<frameset rows="*,200" frameborder="no" border="0" framespacing="0">
	<frameset cols="258,*" frameborder="no" border="0" framespacing="0" rows="*">
		<frame name="leftFrame" noresize src="/internet/WFCOMMON/WFCOMMON.pr_automata.WFCOMMON_P_OpenParticipantsTree.do?formName=<bean:write property="formName"/>&selectName=<bean:write property="selectName"/>&procInstID=<bean:write property="procInstID"/>&actDefID=<bean:write property="actDefID"/>&isDeepToPerson=<bean:write property="isDeepToPerson"/>">
		<frame name="rightFrame" src="/internet/WFCOMMON/blank.htm">
	</frameset>
	<frame name="bottomFrame" scrolling="no" noresize src="/internet/WFCOMMON/WFCOMMON.pr_automata.WFCOMMON_P_OpenUserSelectForm.do?formName=<bean:write property="formName"/>&selectName=<bean:write property="selectName"/>&needMultiple=<bean:write property="needMultiple"/>&tabIndex=<bean:write property="tabIndex"/>">
</frameset>
<noframes>
<body bgcolor="#FFFFFF" text="#000000">
</body>
</noframes>
</html>
