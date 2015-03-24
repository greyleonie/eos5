<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<iframe src="<%=request.getParameter("url")%>" name="addPerson" width="100%" height="100%" align="left" frameBorder="0"></iframe>
<SCRIPT LANGUAGE="JavaScript">
<!-- 
caller = window.dialogArguments;

function refreshWin(){
	//caller.location.replace(caller.location.href + "&refresh=tree");
	caller.location=caller.location.href + "&refresh=tree";
	window.close();
}

// --> 
</SCRIPT>