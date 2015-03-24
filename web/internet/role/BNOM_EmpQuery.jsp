<%@ include file="/internet/BNOM/omappbase.jsp" %>	
<div style="WIDTH:100%;style="overflow:auto  HEIGHT:100%"> 
<table width="100%" border=0 cellpadding="0" cellspacing="0" bgcolor="#eeeeee" align="left">
    <tr><td>
	<form name="queryFrm" action="#3" method="post">
	<html:hidden  property="roleID" />
	<html:hidden  property="roleName" />
	  <br>
	  <table width="94%" align="center">
		  <tr>
		    <td class="queryLabelTD">用户姓名</td>
		    <td class="queryFieldTD"><html:text property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/operatorName" /></td>
		    <td class="queryLabelTD">用户登录名</td>
		    <td class="queryFieldTD"><html:text property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/userID" /></td>
		      <td><input type="button" value="查询" title="查询" onclick="querysubmit()" class="button"></input></td>
		  </tr>
		  <tr>  
		    <td class="queryLabelTD">用户编号</td>
		    <td class="queryFieldTD"><html:text property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/empCode" /></td>
	
		    <td class="queryLabelTD">所属主机构</td>
		    <td class="queryFieldTD">
		    <html:select property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/orgID" style="width:152px">
				 <option value="">--请选择机构--&nbsp;&nbsp;&nbsp;</option>
				 <logic:iterate id="list" property="list[@type='EOSORG_V_Organization']">
           	                       <html:option id="list" property="EOSORG_V_Organization/orgID" 	labelProperty="EOSORG_V_Organization/orgName"/>
		 	         </logic:iterate>
		     </html:select></td>
		    <td>
			  <input type="button" value="重置" title="重置" onclick="document.queryFrm.reset()" class="button"></input>
		    </td>

		 </tr>
	  </table>
	</form>
  </td></tr>
  <tr><td align="center">
  	  <table width="96%"><tr><td>
	    <iframe name="param" src="ROLE.pr_automata.BNOM_P_QueryAllEmps.do?QueryCondition=&roleID=<bean:write property="roleID"/>&roleName=<bean:write property="roleName"/>" frameborder="0" width="100%" height="500"rightmargin="0" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" marginwidth="0" marginheight="0" scrolling="no" align="center"></iframe>
	  </td></tr></table>
  </td></tr>
</table>
</div>	
    </td>
  </tr>
</table>
</body>
</html>

<script language="JavaScript">
function querysubmit(){

	var frm = document.queryFrm;
	frm.action = "ROLE.pr_automata.BNOM_P_QueryAllEmps.do";
	frm.target = "param";
	frm.submit();

/*
	var frm = document.queryFrm;
	var buniTypeName=frm.elements["EOSOperator/operatorName"].value;
	var buniTypeID=frm.elements["EOSOperator/userID"].value;
		
        frm.elements["EOSOperator/userID"].value=cTrim(buniTypeID,0);
        frm.elements["EOSOperator/operatorName"].value=cTrim(buniTypeName,0);

	frm.elements["QueryCondition[@entity='EOSOperator']/EOSOperator/operatorName"].value=frm.elements["EOSOperator/operatorName"].value;
	frm.elements["QueryCondition[@entity='EOSOperator']/EOSOperator/userID"].value=frm.elements["EOSOperator/userID"].value;
	frm.elements["QueryCondition[@entity='EOSOperator']/EOSOperatorRole/roleID"].value=frm.elements["EOSOperatorRole/roleID"].value;

       frm.elements["queryRole"].value=frm.elements["EOSOperatorRole/roleID"].value;


	if(frm.elements["EOSOperator/operatorName"].value.length == 0 && frm.elements["EOSOperator/userID"].value.length == 0) {
		frm.elements["queryAll"].value = "true";
		frm.action = "ROLE.pr_automata.ROLE_P_ShowAllOperator.do";
		frm.target = "param";
		frm.submit();
	} else {
		frm.elements["queryAll"].value = "false";

		frm.action = "ROLE.pr_automata.ROLE_P_ShowAllOperator.do";
		frm.target = "param";
		frm.submit();
		//alert('aaa');
	}
*/
}
</script>
