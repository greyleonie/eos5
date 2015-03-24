<!-- saved from url=(0022)http://internet.e-mail -->
<%@include file="/internet/common.jsp" %>
<html>

<head>
</head>
<body>
<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>
  <table cellpadding=0 cellspacing=0 border="0"  bgcolor="#EEEEEE" height="100%" width="100%" bordercolor="#B6B5B5" style="border-collapse: collapse" >
    <tr> 
      <td valign="top"> 
                 <table width="100%" border="0"  cellspacing="0" cellpadding="0" align="center">

  <html:form action="ROLE.pr_automata.ROLE_P_UpdateOperatorRole.do" name="updateOperatorRole" method="post">
  <html:hidden name="command"/>
  <html:hidden name="EOSOperatorRole/operatorID" property="EOSOperator/operatorID"/>
  <html:hidden  property="EOSOperator/operatorID"/>
  
  <tr class="query_content">
    <td colspan="4" align="right"  >

       用户姓名:<bean:write property="EOSOperator/operatorName"/>
    </td>

  </tr>

  <tr class="query_content">
    <td width="20%"></td>
    <td   width="20%">
   未授予的角色:
    </td>
    <td width="15%"></td>
    <td   width="21%">
    已授予的角色:
    </td>
    <td width="22%"></td>

  </tr>

  <tr>
    <td width="20%"> </td>
    <td width="22%" rowspan="9">
    <html:select name="EOSRole[@name='add']/roleID" size="17" style="width:250px;" multiple="true" >
	<html:options property="list[@name='EOSRole']/list/roleID" labelProperty="list[@name='EOSRole']/list/roleName"/>
</html:select>
    </td>
    <td width="15%">　</td>
    <td width="19%" rowspan="9">
    <html:select name="EOSRole[@name='remove']/roleID" style="width:250px" size="17" multiple="true">
     <html:options property="list[@name='operatorRoles']/EOSVOperatorRole/roleID" labelProperty="list[@name='operatorRoles']/EOSVOperatorRole/roleName"/>
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
    <td width="15%"align="center"><input type="button" onClick="javascripts:return1()" value="<返回>" name="B1" >　</td>
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



function return1(){
      var frm = document.updateOperatorRole;
      	frm.target = "_parent";
      	frm.action = "BNOM.pr_automata.BNOM_P_ShowEmpMain.do";
	frm.submit();
}

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
