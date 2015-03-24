<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css"/>
<%
	String refresh=request.getParameter("refresh");
	if(refresh==null){
		refresh="";
	}
%>

<script language="JavaScript">
<!--
	var ref="<%=refresh%>";
	if(ref=="tree"){
		window.parent.parent.frames("tree").navigate("BNOM.pr_automata.BNOM_P_ShowOrgTree.do?");
	}
//->
</script>
