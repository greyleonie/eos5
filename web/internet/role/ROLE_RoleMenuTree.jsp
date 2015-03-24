
<%@ include file="/internet/common.jsp" %> 

<html>

<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css" />
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
<LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>
<SCRIPT LANGUAGE="JavaScript" src="/internet/scripts/pagefortreetwo.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" src="/internet/scripts/treetwo.js"></SCRIPT>

<html:form name="updateRoleMenu" action="ROLE.pr_automata.ROLE_P_AddRoleMenu.do" method="post">
	<html:hidden name="EOSRoleMenu/roleID" property="roleID"/> 
	<html:hidden name="EOSRole/roleID" property="roleID"/> 
	<html:hidden property="roleName"/>
	<html:hidden name="menu_checkbox"/>
  <table cellpadding=0 cellspacing=0 border="1" class="tab" bgcolor="#EEEEEE" height="100%" width="102%" bordercolor="#B6B5B5" style="border-collapse: collapse" >
    <tr> 
      <td valign="top"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr valign="top" class="query_content"> 
            <td width="100"></td>
            <td align="center">角色：<bean:write property="roleName"/></td>
          </tr>
          <tr > 
            <td width="100"></td>
            <td align="center">
	            <eos:tree property="menu" multiSelected="true" expandDepth="1"/>
	            <SCRIPT LANGUAGE="JavaScript">init();</SCRIPT>
            </td>	
          </tr>
          <tr><td width="20"></td><td>&nbsp;</td></tr>
          <tr><td width="20"></td><td>&nbsp;</td></tr>
          <tr>
             <td align="center" colspan=2>    
                  <input type="button"  name="button1" value="&nbsp;&nbsp;确认&nbsp;&nbsp;" onclick="javascript:submit1()">
             </td>
         </tr>
       </table>
     </td>
   </tr>

 </table>
</html:form>

   
<script language="JavaScript">

function submit1() {

    var frm = document.updateRoleMenu;
    var constring="";
    var frm=document.updateRoleMenu;
    var d = document.getElementsByName("treemenu_checkbox");
   for(var i=0;i<d.length;i++){
    if(d[i].checked) constring=d[i].value+","+constring;
   }
   if(constring==""){
    constring=-9999;
    if (confirm("确实要删除该角色的所有菜单吗?") == false) 
       return false;
   }
   frm.elements["menu_checkbox"].value=constring;
   frm.submit();
 }

</script>
  
