<%@ include file="/internet/common.jsp" %>

    <link type="text/css" href="/internet/theme/style0/style.css" rel="stylesheet"/>
    <script language="javascript" src="/internet/scripts/tab.js" type="text/javascript"></script>
    <html:hidden property="EOSRole/roleID"/>
    <html:hidden property="EOSRole/roleName"/>
  <table width="101%" height="100%" >
             <tr><td height="3%"> </td></tr>
	     <tr height="100%">        
		        <td width="100%">
			    <eos:tabframe id="test"  width="100%" height="83%" frameborder="0" scrolling="auto" imgPath="/pageComponent/resources/images/tab">
			        <eos:tabframetitle url="ROLE.pr_automata.ROLE_P_QueryRoleDtl.do" property="EOSRole"  type="xpath"  selected="true"  title="角色基本信息"/>
			        <eos:tabframetitle url="ROLE.pr_automata.ROLE_P_QueryRoleOperator.do" property="EOSRole"  type="xpath" title="用户信息"/>
			        <eos:tabframetitle url="ROLE.pr_automata.ROLE_P_ShowRoleMenuTree.do" property="EOSRole"  type="xpath" title="菜单权限"/>
			        <eos:tabframetitle url="ROLE.pr_automata.ROLE_P_QueryRoleCatalog.do" property="EOSRole"  type="xpath"   title="功能权限"/>
			        <eos:tabframetitle url="ROLE.pr_automata.ROLE_P_SetRoleDataPrivilege.do" property="EOSRole"  type="xpath"  title="数据权限"/>
			    </eos:tabframe>
		        </td>
	      </tr>       
      </table>      