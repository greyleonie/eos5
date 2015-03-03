<%@include file="/internet/common.jsp"%>
<table width="170"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/internet/image/left_menu_01.gif" width="170" height="32"></td>
  </tr>
  <tr>
    <td><img src="/internet/image/left_menu_02.gif" width="170" height="20"></td>
  </tr>
  <tr>
    <td background="/internet/image/left_menu_bg.gif">
	<table width="80%" height="300"  border="0" align="center" cellpadding="0" cellspacing="0" onClick="menu3(this)">
      
	 
      <tr>
        
        
		<td class="menu31">
		<script type="text/javascript">
       
         //function(id, pid, name, url, title, target, icon, iconOpen, open)
         
         deptTree = new dTree('deptTree');
		 
         deptTree.add(99999,-2,'党校部门','talent.pr.deptlist.do?EOSORG_T_Organization/parentOrgID/criteria/value=99999&EOSORG_T_Organization/parentName=党校所有部门&EOSORG_T_Organization/orgLevel=1','','mainframe');
         
         <logic:iterate id="resultset" property="list[@type='teacherorg']" >
		 	
		 
           deptTree.add('<bean:write id="resultset" property="EOSORG_T_Organization/orgID"/>','<bean:write id="resultset" property="EOSORG_T_Organization/parentOrgID"/>','<bean:write id="resultset" property="EOSORG_T_Organization/orgName"/>','talent.pr.deptlist.do?EOSORG_T_Organization/parentOrgID/criteria/value=<bean:write id="resultset" property="EOSORG_T_Organization/orgID"/>&EOSORG_T_Organization/parentName=<bean:write id="resultset" property="EOSORG_T_Organization/orgName"/>&EOSORG_T_Organization/orgLevel=<bean:write id="resultset" property="EOSORG_T_Organization/orgLevel"/>','','mainframe');
		
         </logic:iterate>
         
         document.write(deptTree);

     </script>
		</td>
        
      </tr>
	  
     
	  
      
      <tr>
      <a href="javascript:void(0)" onClick="return false">
        <td height="260" colspan="2" > </td>
      </a>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="/internet/image/left_menu_03.gif" width="170" height="25"></td>
  </tr>
</table>
