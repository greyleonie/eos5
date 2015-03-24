<%@taglib uri="/WEB-INF/i18n.tld" prefix="i18n" %>
<%@page import="com.primeton.eos.i18n.WebPageMessage"%>
<i18n:bundle baseName="message"/>
<HTML>
<HEAD>
<TITLE><i18n:message key="tree_jsp.Title"/></TITLE>

<META http-equiv=Content-Type content="text/html; charset=UTF-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<link rel="stylesheet" type="text/css" href="/internet/WFCOMMON/tree/mgrTreeRes/XMLSelTree.css">
<style type="text/css">
<!--
body {
	background-color: #C4D9EF;
}
-->
</style></HEAD>
<body   topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" text="#000000" >
<table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td height="2"></td>
        </tr>
</table>
<table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
		<!--<img src="/internet/WFCOMMON/images/lcslgl.gif"  width="173">-->
		<i18n:image src="/internet/WFCOMMON/resource/lcslgl.gif" width="173"/>
	    </td>
        </tr>
</table>

<DIV id="SrcDiv" onselectstart="selectstart()"></DIV>
<BODY>
</HTML>

<SCRIPT LANGUAGE=javascript src="/internet/WFCOMMON/tree/mgrTreeRes/XMLSelTree.js"></SCRIPT>
<SCRIPT LANGUAGE=javascript>
<!--
var m_sXMLFile	= "WFINSTMGR.pr_automata.WFINSTMGR_P_ShowDefineTree.do";					// ?????????(????TreeNode.asp)
var m_sXSLPath	= "/internet/WFCOMMON/tree/mgrTreeRes";						// xsl??????·??
var m_oSrcDiv	= SrcDiv;								// HTML???(???????????????????)


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

