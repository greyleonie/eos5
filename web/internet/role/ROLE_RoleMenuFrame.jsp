<%--
	---------------------------------------------------------------------------------
	Revision           Revision Date    Revision Man         Reason/Statement
	1.0                2004/04/26       xuyb                 create
	
--%>
<%@include file="/internet/common.jsp" %>



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

<TABLE align="left" height="100%" width="84%">
  <tr class="add_title">
    <td colspan="2" align="left">　
	为角色“<bean:write property="EOSRole/roleName"/>”设置菜单权限
        <html:hidden  property="EOSRole/roleID"/>
        <html:hidden  property="EOSRole/roleName"/>
    </td>
   </tr>
  <tr class="add_title">
    <td  align="left">　
	所有菜单
    </td>
    <td  align="left">　
	当前角色拥有的菜单
    </td>
  </tr>
  <TR>
    <TD width="30%">
    <IFRAME frameBorder=1 id=treeLeft name="treeLeft"
      src="ROLE.pr_automata.ROLE_P_ShowRoleMenuTree.do?EOSRole/roleID=<bean:write property="EOSRole/roleID"/>" scrolling="yes"
      style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 2" ></IFRAME>
    </TD>
    <TD width="30%">
    <IFRAME frameBorder=1 id=treeMain name="treeMain" scrolling="yes"
      src="ROLE.pr_automata.ROLE_P_QueryRoleMenu.do?EOSRole/roleID=<bean:write property="EOSRole/roleID"/>&EOSRole/roleName=<bean:write property="EOSRole/roleName"/>&EOSMenu/parentsID=0&EOSMenu/parentsName=顶级菜单"
      style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1">
    </IFRAME>
    </TD>
  </TR>
</TABLE>

