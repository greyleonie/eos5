<%@include file="/internet/common.jsp" %>

<body>


<form name="roleFrame" action="#" method="POST" > 

	<html:hidden property="EOSRole/roleID" />
	<html:hidden property="EOSRole/roleName" />
 

	
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 align="center">
  <TBODY> 
    <TR> 
    <TD class=bgd vAlign=top width="21%" height="437"> 
	<p>
    
    </TD>
    <TD class=bgd vAlign=top width="1%" height="437">&nbsp;</TD>
    <TD class=bgf vAlign=top width="78%" height="437"> 
      <div align="left">
        <table border="0" width="95%" cellspacing="1" cellpadding="1" class="hci">
          <tr>
            <td colspan="101" height="24"> 
             <iframe marginwidth=0 frameborder=0
      		marginheight=0  width="900" scrolling=no  height="20" src="/internet/role/ROLE_Table.jsp" name="role_frame_tab">
              </iframe>               
            </td>
          </tr>
         
          <tr> 
            <td colspan="101"> 
            <iframe name="detailWindow" marginwidth=0 frameborder=1
      		marginheight=0  width="900" scrolling=no  height="380" src="ROLE.pr_automata.ROLE_P_QueryRoleDtl.do?EOSRole/roleID=<bean:write property="EOSRole/roleID"/>&EOSRole/roleName=<bean:write property="EOSRole/roleName"/>"> 
            </iframe> 
            </td>
          </tr>
        </table>
      </div>
      <p>&nbsp;</p>
    </TD>
  </TR>
  </TBODY> 
</TABLE>
</form>
<%@include file="/internet/commonTail.jsp" %>
</body>

