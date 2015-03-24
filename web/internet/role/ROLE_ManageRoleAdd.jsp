<%--
	---------------------------------------------------------------------------------
	Revision           Revision Date    Revision Man         Reason/Statement
	1.0                2004/04/26       xuyb                 create
	
--%>
<%@include file="/internet/eosapp/hciHead.jsp" %>

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

<TABLE align="center" height="100%" width="100%">
  <TR>
    <TD id=frmTitle  vAlign=center width="20%">
    <IFRAME frameBorder=0 id=treeLeft name="treeLeft"
      src="ROLE.pr_automata.ROLE_P_ShowRoleTree.do" scrolling="no"
      style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 2" ></IFRAME>
    </TD>
    <TD width="100%">
    <IFRAME frameBorder=0 id=treeMain name="treeMain" scrolling="no"
      src="ROLE.pr_automata.ROLE_P_AddRole.do"
      style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1"></IFRAME>
    </TD>
  </TR>
</TABLE>

<%@include file="/internet/hciTail.jsp" %>