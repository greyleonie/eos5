<!-- saved from url=(0022)http://internet.e-mail -->
<%@ include file="/internet/eosapp/hciHead.jsp" %> 
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">

<body>
<p align="left"><font size="4" color="#0000FF"><b>查询结果</b></font></p>

<table class="hci" cellspacing="1" cellpadding="0" border="0" width="75%">
  <tr class="head">
    <td width="20%" align="center">用户ID</td>
    <td width="20%" align="center">操作员名</td>
    <td width="30%" align="center">所属机构/部门</td>
    <td width="30%" align="center"></td>

  </tr>
  <logic:iterate id="EOSVOperatorOrg" property="list[@name='operators']">
  <tr class="content">
    <td align="center">
      <bean:write id="EOSVOperatorOrg" property="EOSVOperatorOrg/userID"/>
    </td>
    <td align="center">
      <bean:write id="EOSVOperatorOrg" property="EOSVOperatorOrg/operatorName"/>
    </td>
    <td align="center">
      <bean:write id="EOSVOperatorOrg" property="EOSVOperatorOrg/organizationName"/>
    </td>
    <td align="center">
      <a href="ROLE.pr_automata.ROLEOperatorRoleAdmin.do?EOSOperator/operatorID=<bean:write id="EOSVOperatorOrg" property="EOSVOperatorOrg/operatorID"/>">            [修改角色]
     </a>
      <html:link page="ROLE.pr_automata.ROLESearchOperator.do?command=update"> 
          <html:linkParam  id="EOSVOperatorOrg" property="EOSVOperatorOrg/operatorID"/>[修改信息]
      </html:link>    
     </a>
     <html:link page="ROLE.pr_automata.ROLEDeleteOperator.do?navigation=refresh&command=delete" confirm="true" confirmMsg="是否确定删除此操作员?">
	  <html:linkParam  property="EOSOrganization/organizationID" />
          <html:linkParam id="EOSVOperatorOrg" property="EOSVOperatorOrg/operatorID" name="EOSUser/personID"/>
	  <html:linkParam  property="pagingContext/page" name="pagingContext/page"/>
	  <html:linkParam  property="pagingContext/length" name="pagingContext/length" />
	  <html:linkParam  property="pagingContext/total" name="pagingContext/total"/>
 	  <html:linkParam  id="EOSVOperatorOrg" property="EOSVOperatorOrg/organizationID" name="EOSOrganization/organizationID"/>
     [删除]</html:link>
    </td>
  </tr>
</logic:iterate>
</table>

<table border="0" width="40%">
  <tr>
    <td width="75%">
</td>
  </tr>
</table>


<p></p>
<p></p>
<p></p>
<logic:equal property="command" value="update">
<html:form action="ROLE.pr_automata.ROLEUpdateSearchOperator.do" name="updateuser" method="post">
  <p class="blue_text">用户ID:&nbsp;&nbsp;&nbsp; <html:text property="EOSOperator/userID" readonly="true" size="20" maxlength="20"  /></p>
  <p class="blue_text">操作员名： <html:text property="EOSOperator/operatorName"  size="20" maxlength="10"/>  </p> 
  <p class="blue_text">所属机构： <html:select property="EOSOperator/organizationID" size="1" >
       <html:options property="list[@name='orgs']/EOSOrganization/organizationID"
  		labelProperty="list[@name='orgs']/EOSOrganization/organizationName"/>
  </html:select></p>
 <html:hidden  property="command" value="update" />
 <html:hidden  property="navigation" value="refresh" />
 <html:hidden  property="EOSOrganization/organizationID" />
                                
  <html:hidden name="EOSUser/userID" property="EOSOperator/userID"/>
  <html:hidden property="EOSOperator/operatorID"/>
  <html:hidden name="EOSUser/userName"/>
  <html:hidden name="EOSUser/organizationID"/>
  <p class="blue_text">&nbsp;<input type="button" value="修改" name="B1" onClick="javascript:save()"> <input type="reset" value="全部重写" name="B2"></p> 
</html:form>
</logic:equal>

</body>
<script language="JavaScript">
function save()
{
  var frm = document.forms["updateuser"];
 if (frm.elements["EOSOperator/operatorName"].value=="")  
    {
         alert("用户姓名不能为空！");
    }
  else 
  {  
  frm.elements["EOSUser/organizationID"].value=frm.elements["EOSOperator/organizationID"].value;
  frm.elements["EOSUser/userName"].value=frm.elements["EOSOperator/operatorName"].value;
  frm.submit();
  }
}
</script>
<script language="JavaScript" src="/internet/scripts/check.js"></script>   
<%@ include file="/internet/hciTail.jsp" %> 