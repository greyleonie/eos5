<!-- saved from url=(0022)http://internet.e-mail -->
<%@include file="/internet/common.jsp" %>
<html>

<head>
</head>
<body>
<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>
<SCRIPT LANGUAGE="JavaScript" src="/internet/scripts/treetwo.js"></SCRIPT>
  <table cellpadding=0 cellspacing=0 border="1" class="tab" bgcolor="#EEEEEE" height="100%" width="102%" bordercolor="#B6B5B5" style="border-collapse: collapse" >
	    <tr> 
		      <td valign="top"> 
			        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
				          <tr class="query_content">
					             <td colspan="4" align="right"  >
					               角色：<bean:write property="EOSRole/roleName"/>
					             </td>
					  </tr>
					  <tr class="query_content">
						    <td width="20%">　</td>
						    <td   width="20%" >
						    全部功能:
						    </td>
						    <td width="15%">　</td>
						    <td   width="21%">
						    角色功能:
						    </td>
						    <td width="15%">　</td>
						    <td width="15%">　</td>
					  </tr>
					  <html:form action="ROLE.pr_automata.ROLE_P_UpdateRoleCatalog.do" name="updateRoleCatalog" method="post">
					  <html:hidden name="command"/>
					  <html:hidden  property="EOSRole/roleID"/>
					  <html:hidden  property="EOSRole/roleName"/>
					  <tr>
						    <td width="20%">　</td>
						    <td width="22%" rowspan="9">
						    <html:select name="list[@name='add']/catalogID" size="17" style="width:250px;" multiple="true" >
							<html:options property="list[@name='bizcatalog']/EOSBizCatalog/catalogID" labelProperty="list[@name='bizcatalog']/EOSBizCatalog/catalogName"/>
						    </html:select>
						    </td>
						    <td width="15%">　</td>
						    <td width="19%" rowspan="9">
						    <html:select name="list[@name='remove']/catalogID" style="width:250px" size="17" multiple="true">
						        <html:options property="list[@name='rolecatalog']/EOSVRoleCatalog/catalogID" labelProperty="list[@name='rolecatalog']/EOSVRoleCatalog/catalogName"/>
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
  var frm = document.updateRoleCatalog;
  if ( frm.elements["list[@name='add']/catalogID"].selectedIndex==-1)  
     {
      alert("请选择要增加的功能");
     }
  else
     {
       frm.elements["command"].value="add";
       frm.submit();
      }
}

function remove() 
{
  var frm = document.updateRoleCatalog;
  if ( frm.elements["list[@name='remove']/catalogID"].selectedIndex==-1)  
     {
      alert("请选择要删除的功能");
     }
  else
     {
       frm.elements["command"].value="remove";
       frm.submit();
      }
  
}

</script>
</html>   
