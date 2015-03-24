<%@ include file="/internet/common.jsp" %> 
<html>
<head>
<title>修改业务</title>
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
</head>
<body>
<table border=0 cellPadding=1 cellSpacing=1 align="center" width="100%" >
	<tr>
		<td class="tabCommon" align="center">
			<a href='ROLE.pr_automata.ROLE_P_ShowFunction.do?EOSBizCatalog/catalogID=<bean:write property="EOSBizCatalog/catalogID"/>' >
				<b>业务基本信息</b>
			</a>
		</td>
		<td class="tabCommon" align="center">
			<a href='ROLE.pr_automata.ROLE_P_AddFunctionForBiz.do?EOSBizCatalog/catalogID=<bean:write property="EOSBizCatalog/catalogID"/>'>
				<b>为业务加功能</b>
			</a>
		</td>
		<td background="/internet/theme/style0/tag-line.gif"></td>
	</tr>
</table>

<table border="0" width="100%" bgcolor="#EFF9FC">

  <tr>
    <td width="14%">　</td>
    <td width="25% columnspan="2">
      <p class="blue_text">业务名:<bean:write property="EOSBizCatalog/catalogName"/></p>
    </td>
    <td width="15%">　</td>
    <td width="15%">
	    功能包：
	    <html:select property="EOSVCatalogFunction/unitID" style="width:250px" >
			<html:options  property="list[@name='functionUnits']/EOSFunctionUnit/unitID" labelProperty="list[@name='functionUnits']/EOSFunctionUnit/unitName"/>
		</html:select>
    </td>
  </tr>


  <tr>
    <td width="14%">　</td>
    <td width="22%">
      <p class="blue_text">业务已定义功能</p>
    </td>
    <td width="15%">　</td>
    <td width="19%">
      <p class="blue_text">该包对应的所有功能</p>
    </td>
    <td width="15%">　</td>
    <td width="15%">　</td>
  </tr>
 
  <html:form action="ROLE.pr_automata.ROLE_P_UpdateOperatorRole.do" name="updateOperatorRole" method="post">
  <html:hidden name="command"/>
  <html:hidden name="EOSBizCatalogRole/operatorID" property="EOSBizCatalog/operatorID"/>
  <html:hidden  property="EOSBizCatalog/operatorID"/>
  <tr>
    <td width="14%">　</td>
    <td width="22%" rowspan="9">
    <html:select name="EOSRole[@name='add']/roleID" size="17" style="width:250px;" multiple="true" >
	<html:options property="list[@name='roles']/EOSRole/roleID" labelProperty="list[@name='roles']/EOSRole/roleName"/>
</html:select>
</td>
    <td width="15%">　</td>
    <td width="19%" rowspan="9">
    <html:select name="EOSRole[@name='remove']/roleID" style="width:250px" size="17" multiple="true">
     <html:options property="list[@name='operatorRoles']/EOSVOperatorRole/roleID" labelProperty="list[@name='operatorRoles']/EOSVOperatorRole/roleName"/>
</html:select>
</td>
</html:form>
    <td width="15%">　</td>
    <td width="15%">　</td>
  </tr>
  <tr>
    <td width="14%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
  </tr>
  <tr>
    <td width="14%">　</td>
    <td width="15%" align="center"><input type="button" onClick="javascripts:add()" value="增加>>" name="B1" >　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
  </tr>
  <tr>
    <td width="14%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
  </tr>
  <tr>
    <td width="14%">　</td>
    <td width="15%" align="center"><input type="button" onClick="javascripts:remove()" value="删除<<" name="B1" >  </td>
    <td width="15%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
  </tr>
  <tr>
    <td width="14%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
  </tr>
  <tr>
    <td width="14%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
  </tr>
  <tr>
    <td width="14%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
  </tr>
  <tr>
    <td width="14%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
    <td width="15%">　</td>
  </tr>
</table>


</body>   
   
<script language="JavaScript">

function GetRoleFunctions() {
  role.submit();
}


function add()
{
  var frm = document.updateOperatorRole;
  if ( frm.elements["EOSRole[@name='add']/roleID"].selectedIndex==-1)  
     {
      alert("请选择要增加的角色");
     }
  else
     {
       frm.elements["command"].value="add";
       frm.submit();
      }
}

function remove() 
{
  var frm = document.updateOperatorRole;
  if ( frm.elements["EOSRole[@name='remove']/roleID"].selectedIndex==-1)  
     {
      alert("请选择要删除的角色");
     }
  else
     {
       frm.elements["command"].value="remove";
       frm.submit();
      }
}

</script>
</html>   
<%@ include file="/internet/commonTail.jsp" %> 