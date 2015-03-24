<%@ include file="/internet/BNOM/hciHead.jsp" %>

<eos:OneTab name="用户管理" imagePath="/internet/images/tt.gif">	
<div style="BORDER-LEFT: gray 1px solid; WIDTH:100%;  HEIGHT:100%"> 
<table width="100%" border=0 cellpadding="0" cellspacing="0" bgcolor="#eeeeee" align="left">
    <tr><td>
	<form name="queryFrm" action="#3" method="POST">
	<!--
	<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/operatorName" />
	<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/userID" />
	<html:hidden name="QueryCondition[@entity='EOSOperator']/EOSOperatorRole/roleID" property="EOSOperatorRole/roleID"/>
	<html:hidden property="queryAll" />
	<html:hidden property="queryRole" />
	-->
	  <br>
	  <table border="0" width="94%" align="center">
		  <tr>
		  	<td class="queryLabelTD">用户真实姓名</td>
		    <td class="queryFieldTD"><html:text property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/operatorName" /></td>
		    <td class="queryLabelTD">用户登录名</td>
		    <td class="queryFieldTD"><html:text property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/userID" /></td>
		    <td class="queryLabelTD">用户编号</td>
		    <td class="queryFieldTD"><html:text property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/empCode" /></td>
		    <td><input type="button" value="查询" title="查询" onclick="querysubmit()" class="button"></input></td>
		  </tr>
		  <tr>
		    <td class="queryLabelTD">用户所属主机构</td>
		    <td class="queryFieldTD"><html:select property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/orgID" style="width:152px">
				 <option value="">--请选择机构--&nbsp;&nbsp;&nbsp;</option>
				 <logic:iterate id="list" property="list[@type='EOSORG_V_Organization']">
           	     <html:option id="list" property="EOSORG_V_Organization/orgID" 	labelProperty="EOSORG_V_Organization/orgName"/>
		 	    </logic:iterate>
		 	    </html:select>
		 	</td>
		    <td class="queryLabelTD">用户所属角色</td>
		    <td class="queryFieldTD">   
				<html:select size="1" name="roleID" property="EOSOperatorRole/roleID" style="width:152px" >
		    	<option value="0" selected>--请选择角色--&nbsp;&nbsp;&nbsp;</option>
				<!--<option value="9999">没有分配角色-->
				<html:options property="list/EOSRole/roleID" labelProperty="list/EOSRole/roleName"/>
		   		</html:select>
		    </td>
		    <!--<td class="queryLabelTD">用户职位</td>
		    <td class="queryFieldTD">
		    	<dict:select businTypeId="BNORG_position" property="EOSORG_V_MainOrgEmp/positionID" name="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/positionID" nullOption="true" nullLabel="--请选择--" style="width:152px" /></td>
		    -->
		    
		    <td></td>
		    <td></td>
		    <td>
			    <!--<a href="#1" onclick="javascript:querysubmit()">
			    	<img src="/internet/theme/style0/query.gif" border="0"/> 
			    </a>
			    <a href="#2" onclick="javascript:document.queryFrm.reset();">
			    	<img src="/internet/theme/style0/reset.gif" border="0"/> 
			    </a>-->
			    <input type="button" value="重置" title="重置" onclick="document.queryFrm.reset()" class="button"></input>
			</td>
		 </tr>
	  </table>
	</form>
  </td></tr>
  <tr><td align="center">
  	  <table width="96%"><tr><td>
	    <iframe name="param" src="BNOM.pr_automata.BNOM_P_QueryAllEmps.do?QueryCondition=&" frameborder="0" width="100%" height="350" rightmargin="0" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" marginwidth="0" marginheight="0" align="left"></iframe>
	  </td></tr></table>
  </td></tr>
</table>
</div>
</eos:OneTab>
		
    </td>
  </tr>
</table>
</body>
</html>

<script language="JavaScript">
function querysubmit(){

	var frm = document.queryFrm;
	frm.action = "BNOM.pr_automata.BNOM_P_QueryAllEmps.do";
	if (frm.elements["roleID"].value == "0"){
		frm.elements["roleID"].disabled = true;
	}
	frm.target = "param";
	frm.submit();
	frm.elements["roleID"].disabled = false;

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
