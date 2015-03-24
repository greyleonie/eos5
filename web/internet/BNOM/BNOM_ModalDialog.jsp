<%@include file="/internet/BNOM/omappbase.jsp"%>
<iframe src="<%=request.getParameter("url")%>" name="addBizOrg" width="100%" height="100%" align="left" frameBorder="0"></iframe>
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