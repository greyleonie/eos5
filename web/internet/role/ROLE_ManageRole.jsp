<%--
	---------------------------------------------------------------------------------
	Revision           Revision Date    Revision Man         Reason/Statement
	1.0                2004/04/26       xuyb                 create
	
--%>
<%@include file="/internet/BNOM/hciHead.jsp" %>

<SCRIPT language=javascript>
function switchSysBar()
{
	if (switchPoint.innerText==3)
	{
		switchPoint.innerText=4;
		document.all("frmTitle").style.display="none";
	}
	else
	{
		switchPoint.innerText=3;
		document.all("frmTitle").style.display="";
	}
}
</SCRIPT>
<table  width="100%" height="600">
	<tr>
		<div>
			<td width=20%>
			    <IFRAME frameBorder=0 id=treeLeft name="treeLeft"
			      src="ROLE.pr_automata.ROLE_P_ShowRoleTree.do" scrolling="auto"
			      style="HEIGHT: 85%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 2" ></IFRAME>
			</td>
			<td width=80%>
			    <IFRAME frameBorder=0 id=treeMain name="treeMain" scrolling="no"
			      src="ROLE.pr_automata.ROLE_P_QueryRoleAll.do"
			      style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1"></IFRAME>
			</td>
		</div>
	</tr>
</table>
<%@include file="/internet/hciTail.jsp" %>