<!-- saved from url=(0022)http://internet.e-mail -->
<%@include file="/internet/common.jsp" %>
<html>

<head>
</head>
<body>
<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>
  <table cellpadding=0 cellspacing=0 border="1" class="tab" bgcolor="#EEEEEE" height="100%" width="102%" bordercolor="#B6B5B5" style="border-collapse: collapse" >
    <tr> 
      <td valign="top"> 
                 <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

  <html:form action="ROLE.pr_automata.ROLE_P_UpdateRoleDataPrivilege.do" name="updateRoleDataPrivilege" method="post">
  <html:hidden name="command"/>
  <html:hidden  property="EOSRole/roleID"/>
  <html:hidden  property="EOSRole/roleName"/>
  
  <tr class="query_content">
    <td colspan="4" align="right"  >

       角色：<bean:write property="EOSRole/roleName"/>
    </td>

  </tr>

  <tr class="query_content">
    <td width="20%"></td>
    <td   width="20%">
    全部数据权限:
    </td>
    <td width="15%"></td>
    <td   width="21%">
    角色数据权限:
    </td>
    <td width="22%"></td>

  </tr>

  <tr>
    <td width="20%"> </td>
    <td width="22%" rowspan="9">
    <html:select name="list[@name='add']/privilegeID" size="17" style="width:250px;" multiple="true" >
	<html:options property="clist/EOSDataPrivilegeModel/privilegeID" labelProperty="clist/EOSDataPrivilegeModel/name"/>
    </html:select>
    </td>
    <td width="15%">　</td>
    <td width="19%" rowspan="9">
    <html:select name="list[@name='remove']/privilegeID" style="width:250px" size="17" multiple="true">
        <html:options property="QueryCondition/list/EOSVRoleDataPrivilege/privilegeID" labelProperty="QueryCondition/list/EOSVRoleDataPrivilege/name"/>
    </html:select>
    </td>
    </html:form>
    <td width="22%">　</td>

  </tr>
  <tr>
    <td width="20%">　</td>
    <td width="15%">　</td>
    <td width="22%">　</td>
  </tr>
  <tr>
    <td width="20%">　</td>
    <td width="15%" align="center"><input type="button" onClick="javascripts:add()" value="增加>>" name="B1" >　</td>
    <td width="22%">　</td>
  </tr>
  <tr>
    <td width="20%">　</td>
    <td width="15%">　</td>
    <td width="22%">　</td>
  </tr>
  <tr>
    <td width="20%">　</td>
    <td width="15%" align="center"><input type="button" onClick="javascripts:remove()" value="删除<<" name="B1" >　</td>
    <td width="22%">　</td>
  </tr>
  <tr>
    <td width="20%">　</td>
    <td width="15%">　</td>
    <td width="22%">　</td>
  </tr>
  <tr>
    <td width="20%">　</td>
    <td width="15%">　</td>
    <td width="22%">　</td>
  </tr>
  <tr>
    <td width="20%">　</td>
    <td width="15%">　</td>
    <td width="22%">　</td>
  </tr>
  <tr>
    <td width="20%">　</td>
    <td width="15%">　</td>
    <td width="22%">　</td>
  </tr>
</table>
</td>
</tr>
</table>


</body>   
   
<script language="JavaScript">

function GetRoleFunctions() {
  role.submit();
}


function add()
{
  var frm = document.updateRoleDataPrivilege;
  if ( frm.elements["list[@name='add']/privilegeID"].selectedIndex==-1)  
     {
      alert("请选择要增加的数据权限");
     }
  else
     {
       frm.elements["command"].value="add";
       frm.submit();
      }
}

function remove() 
{
  var frm = document.updateRoleDataPrivilege;
  if ( frm.elements["list[@name='remove']/privilegeID"].selectedIndex==-1)  
     {
      alert("请选择要删除的数据权限");
     }
  else
     {
       frm.elements["command"].value="remove";
    //   alert(frm.elements["command"].value);
       frm.submit();
      }
  
}

</script>
</html>   
