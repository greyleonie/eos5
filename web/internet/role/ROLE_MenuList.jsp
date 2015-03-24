<table  class="hci" cellspacing="1" cellpadding="0" border="0" width="100%" >
  <tr class="head">
    <td width="8%" align="center">菜单ID</td>
    <td width="12%" align="center">菜单名称</td>
    <td width="12%" align="center">是否叶子菜单</td>
    <td width="12%" align="center">菜单级别</td>
    <td width="12%" align="center">显示顺序</td>
    <td width="" align="center">对应功能</td>
    <td width="15%" align="center">&nbsp;</td>
  </tr>
  <logic:iterate id="EOSMenu" property="list">
  <tr class="content">
    <td width="8%" align="center"><bean:write id="EOSMenu" property="EOSMenu/menuID"/></td>
    <td width="12%" align="center"><bean:write id="EOSMenu" property="EOSMenu/menuName"/></td>
    <td width="12%" align="center"><bean:write id="EOSMenu" property="EOSMenu/isLeaf"/></td>
    <td width="12%" align="center"><bean:write id="EOSMenu" property="EOSMenu/menuLevel"/></td>
    <td width="12%" align="center"><bean:write id="EOSMenu" property="EOSMenu/displayOrder"/></td>
    <td width="" align="center"><bean:write id="EOSMenu" property="EOSMenu/menuAction"/></td>
    <td width="15%" align="center">
      <html:link page="ROLE.pr_automata.ROLEMenuAdmin.do?navigation=refresh&command=update" >
        <html:linkParam id="EOSMenu" name="EOSMenu/menuID" property="EOSMenu/menuID"/>
        [修改]
      </html:link> 
      <html:link page="ROLE.pr_automata.ROLEDeleteMenuTree.do?navigation=refresh&command=delete"  confirm="true" confirmMsg="是否确定删除此菜单及其子菜单?">
        <html:linkParam id="EOSMenu" name="EOSMenu/menuID" property="EOSMenu/menuID"/>
        [删除]
      </html:link> 
      <logic:equal id="EOSMenu" property ="EOSMenu/isLeaf" value="N">
        <a href="ROLE.pr_automata.ROLEMenuAdmin.do?grandparents=<bean:write property="parents"/>&parents=<bean:write id="EOSMenu" property="EOSMenu/menuID"/>&navigation=query&pagingContext/page=1&pagingContext/total=0&pagingContext/length=<bean:write property="pagingContext/length"/>&command=query">[子菜单]</a>
      </logic:equal>
    </td>
  </tr>
  </logic:iterate>
</table>