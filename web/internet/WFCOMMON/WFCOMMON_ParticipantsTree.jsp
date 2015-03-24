<%@ include file="/internet/common.jsp" %> 
<HTML>
<HEAD>
<TITLE>参与者信息</TITLE>
<META http-equiv=Content-Type content="text/html; charset=GBK">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/internet/WFCOMMON/tree/treeRes/XMLSelTree.css">
</HEAD>
<body   topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" text="#000000" >
<DIV id="SrcDiv" onselectstart="selectstart()"></DIV>
</BODY>
</HTML>

<SCRIPT LANGUAGE=javascript src="/internet/WFCOMMON/tree/treeRes/XMLSelTree.js"></SCRIPT>
<SCRIPT LANGUAGE=javascript>
<!--
var m_sXMLFile	= "WFCOMMON.pr_automata.WFCOMMON_P_GetParticipantsTreeXML.do?formName=<bean:write property="formName"/>&selectName=<bean:write property="selectName"/>&procInstID=<bean:write property="procInstID"/>&actDefID=<bean:write property="actDefID"/>&isDeepToPerson=<bean:write property="isDeepToPerson"/>";
//var m_sXMLFile	= "/internet/BNOM/treexml.jsp";						
var m_sXSLPath	= "/internet/WFCOMMON/tree/treeRes";
var m_oSrcDiv	= SrcDiv;

caller = window.dialogArguments;

function window.onload()	
{
	InitTree(m_sXMLFile, m_sXSLPath, m_oSrcDiv);
}

/************************************************
** GoLink(p_sHref, p_sTarget)
************************************************/
function GoLink(p_sHref, p_sTarget)
{
	var sHref	= p_sHref;
	var sTarget	= p_sTarget;
	window.open(sHref, sTarget);
}
//-->
</SCRIPT>


