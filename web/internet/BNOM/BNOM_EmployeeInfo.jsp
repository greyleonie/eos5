<%@include file="/internet/BNOM/omappbase.jsp"%>

<script language="JavaScript">
<!--

	//submit the form;
	function submitEmp(){
		if(!validate()){
			return;
		}
		if(emp.elements("mode").value=="N"){
			emp.action="BNOM.pr_automata.BNOM_P_AddEmployee.do";
		}else{
			emp.redirectURL.value = "BNOM.pr_automata.BNOM_P_ShowEmp.do?mode=U&operatorID=<bean:write property='EOSORG_V_Users/operatorID' />";
			emp.action="BNOM.pr_automata.BNOM_P_UpdateEmp.do";
		}
		if (document.forms[0].elements["EOSORG_T_Employee/orgID"].disabled ==  true){
			document.forms[0].elements["EOSORG_T_Employee/orgID"].disabled = false;
		}
<logic:equal property="from" value="orgMgr">
		emp.redirectURL.value = "/internet/BNOM/BNOM_CloseModalDialog.jsp";
</logic:equal>
		
		emp.submit();

	}
	
	function submitEmpAddRole(){
		if(!validate()){
			return;
		}
		emp.action="BNOM.pr_automata.BNOM_P_AddEmpRole.do";
		//emp.redirectURL.value = "/internet/BNOM/BNOM_AddEmpRole.jsp";	
		emp.submit();

	}
	
	//validate the form;
	function validate(){
		if(emp.elements["EOSOperator/userID"].value == "") {
			alert("请添入用户登录名");
			emp.elements["EOSOperator/userID"].focus();
			return false;
		}
		
		if(emp.elements["EOSOperator/operatorName"].value == "") {
			alert("请添入用户姓名");
			emp.elements["EOSOperator/operatorName"].focus();
			return false;
		}
/*
		if(emp.elements["EOSORG_T_Employee/empCode"].value == "") {
			alert("请添入用户编号");
			emp.elements["EOSORG_T_Employee/empCode"].focus();
			return false;
		}
*/		
		if(emp.elements("mode").value=="N" ){
			if(emp.elements["hciPasswordTypeEOSOperator/password"].value == "") {
				alert("请填入密码");
				emp.elements["hciPasswordTypeEOSOperator/password"].focus();
				return;
			}
			if(emp.elements["hciPasswordTypeEOSOperator/password0"].value == "") {
				alert("请输入确认密码");
				emp.elements["hciPasswordTypeEOSOperator/password0"].focus();
				return;
			}
			
			if(emp.elements["hciPasswordTypeEOSOperator/password"].value.length < 6 || emp.elements		["hciPasswordTypeEOSOperator/password"].value.length > 20) {
				alert("密码长度请在6--20位之间");
				emp.elements["hciPasswordTypeEOSOperator/password"].focus();
				return;
			}
			if(emp.elements["hciPasswordTypeEOSOperator/password"].value != emp.elements		["hciPasswordTypeEOSOperator/password0"].value) {
				alert("请确认密码一致!");
				emp.elements["hciPasswordTypeEOSOperator/password"].focus();
				return;
			}
			
		}
		
		if(emp.elements("mode").value=="U" ){
			if (emp.elements["changePswd"].checked == false){
				emp.elements["hciPasswordTypeEOSOperator/password"].disabled = true;
				emp.elements["hciPasswordTypeEOSOperator/password0"].disabled = true;
			} else{
				if(emp.elements["hciPasswordTypeEOSOperator/password"].value == "") {
					alert("请填入密码");
					emp.elements["hciPasswordTypeEOSOperator/password"].focus();
					return;
				}
				if(emp.elements["hciPasswordTypeEOSOperator/password0"].value == "") {
					alert("请输入确认密码");
					emp.elements["hciPasswordTypeEOSOperator/password0"].focus();
					return;
				}
				
				if(emp.elements["hciPasswordTypeEOSOperator/password"].value.length < 6 || emp.elements		["hciPasswordTypeEOSOperator/password"].value.length > 20) {
					alert("密码长度请在6--20位之间");
					emp.elements["hciPasswordTypeEOSOperator/password"].focus();
					return;
				}
				if(emp.elements["hciPasswordTypeEOSOperator/password"].value != emp.elements		["hciPasswordTypeEOSOperator/password0"].value) {
					alert("请确认密码一致!");
					emp.elements["hciPasswordTypeEOSOperator/password"].focus();
					return;
				}
			}
			
		}
/*		
		if(emp.elements["EOSORG_T_Employee/regDate"].value == "") {
			alert("请添入注册日期");
			emp.elements["EOSORG_T_Employee/regDate"].focus();
			return false;
		}
		
		if(emp.elements("EOSORG_T_Employee/gender").item(0).checked==false && emp.elements("EOSORG_T_Employee/gender").item(1).checked==false){
			alert("请指定员工性别！");
			return false;
		}	
*/
		if(emp.elements("EOSORG_T_Employee/birthDate").value!="" && !isDate(emp.elements("EOSORG_T_Employee/birthDate").value)){
			alert("出生日期格式错误，正确格式为YYYYMMDD，例如：20030101");
			return false;
		}
		if(emp.elements("EOSORG_T_Employee/regDate").value!="" && !isDate(emp.elements("EOSORG_T_Employee/regDate").value)){
			alert("注册日期格式错误，正确格式为YYYYMMDD，例如：20030101");
			return false;
		}	
			
		return true;
	}
	
function beforeDelete(){
	if(confirm("您真的要删除该员工吗?")==true){
		return true;
	}else{
		return false;
	}
}

function deleteEmp(){
	document.forms(0).action="BNOM.pr_automata.BNOM_P_DeleteEmp.do";
	document.forms(0).submit();
}

function backEmpList(){
	var frm = parent.queryFrm;
	frm.action = "BNOM.pr_automata.BNOM_P_QueryAllEmps.do";
	frm.target = "param";
	if (frm.elements["roleID"].value == "0"){
		frm.elements["roleID"].disabled = true;
	}
	frm.submit();
	frm.elements["roleID"].disabled = false;
}

function setPswdInput(chk){
	emp.elements["hciPasswordTypeEOSOperator/password"].disabled= true;
	emp.elements["hciPasswordTypeEOSOperator/password0"].disabled= true;
	if (chk.checked){
		//alert(chk.name);
		emp.elements["hciPasswordTypeEOSOperator/password"].disabled= false;
		emp.elements["hciPasswordTypeEOSOperator/password0"].disabled= false;
	}
}

function init(){
	<logic:equal property="mode" value="U">
		emp.elements["hciPasswordTypeEOSOperator/password"].disabled= true;
		emp.elements["hciPasswordTypeEOSOperator/password0"].disabled= true;
	</logic:equal>
}


-->
</script>
<body bgcolor="#EEEEEE" onload="init()">
<table border=0 width="100%"><tr><td>

<form name="emp" action="" method="POST">

<input type="hidden" name="redirectURL" value="BNOM.pr_automata.BNOM_P_QueryAllEmps.do?QueryCondition=&">
<input type="hidden" name="back">
<html:hidden property="mode"/>
<html:hidden property="from"/>
<logic:equal property="mode" value="U">
<html:hidden name="EOSOperator/operatorID" property="EOSORG_V_Users/operatorID"/>
<html:hidden name="EOSORG_T_Employee/operatorID" property="EOSORG_V_Users/operatorID"/>
</logic:equal>

<table border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td colspan="6" class="queryTitle"> 
        <div align="left">【用户基本信息】</div>
      </td>
    </tr>
    <tr>
			<td class="queryLabelTD">用户登录名(必须唯一)</td>
			<td class="queryFieldTD">
			   <logic:equal property="mode" value="U">
			  	   <html:text name="EOSOperator/userID" property="EOSORG_V_Users/userID" readonly="true" maxlength="32" attributesText="AUTOCOMPLETE='off'"/>* 
			   </logic:equal>
			   <logic:equal property="mode" value="N">
			   	   <html:text name="EOSOperator/userID" property="EOSORG_V_Users/userID" maxlength="32" attributesText="AUTOCOMPLETE='off'"/>* 
			   </logic:equal>
			</td>
			<td class="queryLabelTD">用户姓名</td>
	      <td class="queryFieldTD"> <html:text name="EOSOperator/operatorName" 	property="EOSORG_V_Users/operatorName" maxlength="32"/>* 
	      </td>
	      <td class="queryLabelTD">用户编号</td>
	      <td class="queryFieldTD">
			   <html:text name="EOSORG_T_Employee/empCode" property="EOSORG_V_Users/empCode" maxlength="12"/>
	      </td>
	 </tr>
	 
	<logic:equal property="mode" value="N">
    <tr>
    		<td class="queryLabelTD">输入密码(6-20位)</td>
			<td class="queryFieldTD">
				<html:password property="EOSOperator/password" maxlength="20" style="width:152px" />*
			</td>
			<td width="11%" class="queryLabelTD">确认密码</td>
			<td class="queryFieldTD">
				<html:password property="EOSOperator/password0" maxlength="20" style="width:152px" />*
			</td>
			<td></td><td></td>
	 </tr>
	 </logic:equal>
	 
	 <logic:equal property="mode" value="U">
     <tr>
     		<td class="queryLabelTD">修改密码</td>
     		<td class="queryFieldTD"><input type="checkbox" name="changePswd" onclick="setPswdInput(this)" class="mycheckbox"></td>
    		<td class="queryLabelTD">输入密码(6-20位)</td>
			<td class="queryFieldTD">
				<html:password property="EOSOperator/password" maxlength="20" style="width:152px"/>
			</td>
			<td width="11%" class="queryLabelTD">确认密码</td>
			<td class="queryFieldTD">
				<html:password property="EOSOperator/password0" maxlength="20" style="width:152px" />
			</td>
			
	 </tr>
	 </logic:equal>
	 
    <tr> 
      <td class="queryLabelTD">注册日期</td>
      <td class="queryFieldTD"> <html:text name="EOSORG_T_Employee/regDate" property="EOSORG_V_Users/regDate" maxlength="12"/><eos:calendar target="emp.elements['EOSORG_T_Employee/regDate']" format="YYYYMMDD"/>
      </td>
      <td class="queryLabelTD">出生日期</td>
      <td class="queryFieldTD"> 
      <html:text name="EOSORG_T_Employee/birthDate" property="EOSORG_V_Users/birthDate" maxlength="12"/><eos:calendar target="emp.elements['EOSORG_T_Employee/birthDate']" format="YYYYMMDD"/> 
      </td>
      <td class="queryLabelTD">性别</td>
	      <td class="queryFieldTD" width="21%"> <html:radio name="EOSORG_T_Employee/gender" property="EOSORG_V_Users/gender" value="1"/> 
	        男 <html:radio name="EOSORG_T_Employee/gender" property="EOSORG_V_Users/gender" value="0"/> 
	        女</td>
    </tr>
    <tr> 
      <td class="queryLabelTD">家庭电话</td>
      <td class="queryFieldTD"> <html:text name="EOSORG_T_Employee/HTel" property="EOSORG_V_Users/HTel" maxlength="12"/> 
      </td>
      <td class="queryLabelTD">移动电话</td>
      <td class="queryFieldTD"> <html:text name="EOSORG_T_Employee/mobileNO" property="EOSORG_V_Users/mobileNO" maxlength="12"/> 
      </td>
      <td class="queryLabelTD">工作电话</td>
      <td  class="queryFieldTD"> <html:text name="EOSORG_T_Employee/OTel1" property="EOSORG_V_Users/OTel1" maxlength="12"/> 
      </td>
    </tr>
    <tr> 
      <td class="queryLabelTD">电子信箱</td>
      <td class="queryFieldTD"> <html:text name="EOSORG_T_Employee/OEmail" property="EOSORG_V_Users/OEmail" maxlength="128"/> 
      </td>
      <td class="queryLabelTD">职位</td>
      <td class="queryFieldTD"> <dict:select businTypeId="BNORG_position" name="EOSORG_T_Employee/positionID" property="EOSORG_V_Users/positionID" style="width:152px" />
      </td>
      <td class="queryLabelTD">学位</td>
      <td class="queryFieldTD"> <dict:select businTypeId="BNDICT_education" property="EOSORG_V_Users/degree" name="EOSORG_T_Employee/degree" style="width:152px" /> 
      </td>
    </tr>
    <tr> 
      <td class="queryLabelTD" width="10%">家庭住址</td>
      <td colspan="1" class="queryFieldTD" > <html:text name="EOSORG_T_Employee/HAddress" property="EOSORG_V_Users/HAddress" maxlength="128"/> 
      </td>
      <td class="queryLabelTD">主机构</td>
      <td class="queryFieldTD"> 
        <html:select property="EOSORG_V_Users/orgID" name="EOSORG_T_Employee/orgID" style="width:152px">
         <option value="">--无主机构--</option>
	  	    <logic:iterate id="list" property="list[@type='EOSORG_V_Organization']">
	  	      <html:option id="list" property="EOSORG_V_Organization/orgID" labelProperty="EOSORG_V_Organization/orgName"/>
	 	    </logic:iterate>
	 	  </html:select>
      </td>
      
      <td class="queryLabelTD" >邮政编码</td>
      <td class="queryFieldTD" > <html:text name="EOSORG_T_Employee/zipCode" property="EOSORG_V_Users/zipCode" maxlength="10"/> 
      </td>
    </tr>
    <tr class="query_content"> 
      <td class="queryLabelTD" nowrap>身份证号码</td>
      <td class="queryFieldTD" > <html:text name="EOSORG_T_Employee/PID" property="EOSORG_V_Users/PID" maxlength="20"/> 
      </td>
      <td class="queryLabelTD">传真</td>
      <td class="queryFieldTD"> <html:text name="EOSORG_T_Employee/faxNO" property="EOSORG_V_Users/faxNO" maxlength="12"/> 
      </td><td></td><td></td>
    </tr>
        
    <logic:equal property="mode" value="U">
    
    <tr class="query_content"> 
      <td class="queryLabelTD">附属机构</td>
      <td class="queryFieldTD" >
        <html:select name="subOrgs" property="EOSORG_V_SubOrgEmp/orgID" multiple="true" style="width:152px">
         <logic:iterate id="subOrgs" property="list[@type='attachOrgs']">
	  	      <html:option id="subOrgs" property="EOSORG_T_Organization/orgID" labelProperty="EOSORG_T_Organization/orgName"/>
	 	    </logic:iterate>
	 	  </html:select>
      </td>
      <td class="queryLabelTD">管辖的机构</td>
      <td class="queryFieldTD">
        <html:select name="presidialOrgs" property="EOSORG_T_Organization/orgID" multiple="true" style="width:152px">
         <logic:iterate id="presidialOrgs" property="list[@type='EOSORG_T_Organization']">
	  	      <html:option id="presidialOrgs" property="EOSORG_T_Organization/orgID" labelProperty="EOSORG_T_Organization/orgName"/>
	 	    </logic:iterate>
	 	  </html:select>
      </td><td></td><td></td>
    </tr>
    
	 </logic:equal>
	 </table>
	 
	<table border=0 width="100%" cellspacing="4" cellpadding="4">
     <tr> 
      <td colspan="6" align="center"> 
        <div align="center">
        <!--<a href="javascript:submitEmp();"><html:image src="/save.gif"  border="0" /></a>&nbsp;<a href="javascript:emp.reset();"><html:image src="/reset.gif"  border="0" /></a>&nbsp;-->
            <input type="button" value="保存" title="保存" onclick="submitEmp()" class="button"></input>
			
		<logic:notPresent property="from">
		    <!--<a href="javascript:history.go(-1);"><html:image src="/return.gif" border="0" /></a>-->
			<input type="button" value="返回" title="返回" onclick="backEmpList()" class="button"></input>
		</logic:notPresent>
		<logic:equal property="mode" value="U">
			<!--<A href="javascript:deleteEmp();" onclick="return beforeDelete();"><html:image src="/delete.gif"  border="0"/></A>-->
			<input type="button" value="删除" title="删除" onclick="if (beforeDelete()){deleteEmp();}" class="button"></input>
		</logic:equal>
		<logic:equal property="mode" value="N">
			<logic:notPresent property="from">
			<!--<A href="javascript:deleteEmp();" onclick="return beforeDelete();"><html:image src="/delete.gif"  border="0"/></A>-->
			<input type="button" value="为用户赋角色" title="为用户赋角色" onclick="submitEmpAddRole()" class="button"></input>
			</logic:notPresent>
		</logic:equal>
		</div>
      </td>
    </tr>
   </table>    
</form>

</td></tr></table>
</body>
</html>

<logic:equal property="from" value="orgMgr">

<script language="JavaScript">
<!--
document.forms[0].elements["EOSORG_T_Employee/orgID"].value = parent.caller.el.orgID.value;
document.forms[0].elements["EOSORG_T_Employee/orgID"].disabled= true;
//document.forms[0].elements["redirectURL"].value= "/internet/error.jsp";
-->
</script>

</logic:equal>


