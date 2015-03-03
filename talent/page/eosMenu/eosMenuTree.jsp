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
         
         eosMenuTree = new dTree('eosMenuTree');
		 
         eosMenuTree.add(0,-2,'党校系统平台','talent.prEosMenu.eosMenulist.do?TEOSMenu/parentsID/criteria/value=0&TEOSMenu/parentName=党校系统平台&TEOSMenu/parentLevel=0','','mainframe');
         
         <logic:iterate id="resultset" property="list[@type='eosmenu']" >
		 	
		 
           eosMenuTree.add('<bean:write id="resultset" property="entity/menuID"/>','<bean:write id="resultset" property="entity/parentsID"/>','<bean:write id="resultset" property="entity/menuName"/>','talent.prEosMenu.eosMenulist.do?TEOSMenu/parentsID/criteria/value=<bean:write id="resultset" property="entity/menuID"/>&TEOSMenu/parentName=<bean:write id="resultset" property="entity/menuName"/>&TEOSMenu/parentLevel=<bean:write id="resultset" property="entity/menuLevel"/>','','mainframe');
		
         </logic:iterate>
         
         document.write(eosMenuTree);

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
