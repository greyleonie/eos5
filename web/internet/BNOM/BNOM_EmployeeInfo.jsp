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
			alert("�������û���¼��");
			emp.elements["EOSOperator/userID"].focus();
			return false;
		}
		
		if(emp.elements["EOSOperator/operatorName"].value == "") {
			alert("�������û�����");
			emp.elements["EOSOperator/operatorName"].focus();
			return false;
		}
/*
		if(emp.elements["EOSORG_T_Employee/empCode"].value == "") {
			alert("�������û����");
			emp.elements["EOSORG_T_Employee/empCode"].focus();
			return false;
		}
*/		
		if(emp.elements("mode").value=="N" ){
			if(emp.elements["hciPasswordTypeEOSOperator/password"].value == "") {
				alert("����������");
				emp.elements["hciPasswordTypeEOSOperator/password"].focus();
				return;
			}
			if(emp.elements["hciPasswordTypeEOSOperator/password0"].value == "") {
				alert("������ȷ������");
				emp.elements["hciPasswordTypeEOSOperator/password0"].focus();
				return;
			}
			
			if(emp.elements["hciPasswordTypeEOSOperator/password"].value.length < 6 || emp.elements		["hciPasswordTypeEOSOperator/password"].value.length > 20) {
				alert("���볤������6--20λ֮��");
				emp.elements["hciPasswordTypeEOSOperator/password"].focus();
				return;
			}
			if(emp.elements["hciPasswordTypeEOSOperator/password"].value != emp.elements		["hciPasswordTypeEOSOperator/password0"].value) {
				alert("��ȷ������һ��!");
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
					alert("����������");
					emp.elements["hciPasswordTypeEOSOperator/password"].focus();
					return;
				}
				if(emp.elements["hciPasswordTypeEOSOperator/password0"].value == "") {
					alert("������ȷ������");
					emp.elements["hciPasswordTypeEOSOperator/password0"].focus();
					return;
				}
				
				if(emp.elements["hciPasswordTypeEOSOperator/password"].value.length < 6 || emp.elements		["hciPasswordTypeEOSOperator/password"].value.length > 20) {
					alert("���볤������6--20λ֮��");
					emp.elements["hciPasswordTypeEOSOperator/password"].focus();
					return;
				}
				if(emp.elements["hciPasswordTypeEOSOperator/password"].value != emp.elements		["hciPasswordTypeEOSOperator/password0"].value) {
					alert("��ȷ������һ��!");
					emp.elements["hciPasswordTypeEOSOperator/password"].focus();
					return;
				}
			}
			
		}
/*		
		if(emp.elements["EOSORG_T_Employee/regDate"].value == "") {
			alert("������ע������");
			emp.elements["EOSORG_T_Employee/regDate"].focus();
			return false;
		}
		
		if(emp.elements("EOSORG_T_Employee/gender").item(0).checked==false && emp.elements("EOSORG_T_Employee/gender").item(1).checked==false){
			alert("��ָ��Ա���Ա�");
			return false;
		}	
*/
		if(emp.elements("EOSORG_T_Employee/birthDate").value!="" && !isDate(emp.elements("EOSORG_T_Employee/birthDate").value)){
			alert("�������ڸ�ʽ������ȷ��ʽΪYYYYMMDD�����磺20030101");
			return false;
		}
		if(emp.elements("EOSORG_T_Employee/regDate").value!="" && !isDate(emp.elements("EOSORG_T_Employee/regDate").value)){
			alert("ע�����ڸ�ʽ������ȷ��ʽΪYYYYMMDD�����磺20030101");
			return false;
		}	
			
		return true;
	}
	
function beforeDelete(){
	if(confirm("�����Ҫɾ����Ա����?")==true){
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
        <div align="left">���û�������Ϣ��</div>
      </td>
    </tr>
    <tr>
			<td class="queryLabelTD">�û���¼��(����Ψһ)</td>
			<td class="queryFieldTD">
			   <logic:equal property="mode" value="U">
			  	   <html:text name="EOSOperator/userID" property="EOSORG_V_Users/userID" readonly="true" maxlength="32" attributesText="AUTOCOMPLETE='off'"/>* 
			   </logic:equal>
			   <logic:equal property="mode" value="N">
			   	   <html:text name="EOSOperator/userID" property="EOSORG_V_Users/userID" maxlength="32" attributesText="AUTOCOMPLETE='off'"/>* 
			   </logic:equal>
			</td>
			<td class="queryLabelTD">�û�����</td>
	      <td class="queryFieldTD"> <html:text name="EOSOperator/operatorName" 	property="EOSORG_V_Users/operatorName" maxlength="32"/>* 
	      </td>
	      <td class="queryLabelTD">�û����</td>
	      <td class="queryFieldTD">
			   <html:text name="EOSORG_T_Employee/empCode" property="EOSORG_V_Users/empCode" maxlength="12"/>
	      </td>
	 </tr>
	 
	<logic:equal property="mode" value="N">
    <tr>
    		<td class="queryLabelTD">��������(6-20λ)</td>
			<td class="queryFieldTD">
				<html:password property="EOSOperator/password" maxlength="20" style="width:152px" />*
			</td>
			<td width="11%" class="queryLabelTD">ȷ������</td>
			<td class="queryFieldTD">
				<html:password property="EOSOperator/password0" maxlength="20" style="width:152px" />*
			</td>
			<td></td><td></td>
	 </tr>
	 </logic:equal>
	 
	 <logic:equal property="mode" value="U">
     <tr>
     		<td class="queryLabelTD">�޸�����</td>
     		<td class="queryFieldTD"><input type="checkbox" name="changePswd" onclick="setPswdInput(this)" class="mycheckbox"></td>
    		<td class="queryLabelTD">��������(6-20λ)</td>
			<td class="queryFieldTD">
				<html:password property="EOSOperator/password" maxlength="20" style="width:152px"/>
			</td>
			<td width="11%" class="queryLabelTD">ȷ������</td>
			<td class="queryFieldTD">
				<html:password property="EOSOperator/password0" maxlength="20" style="width:152px" />
			</td>
			
	 </tr>
	 </logic:equal>
	 
    <tr> 
      <td class="queryLabelTD">ע������</td>
      <td class="queryFieldTD"> <html:text name="EOSORG_T_Employee/regDate" property="EOSORG_V_Users/regDate" maxlength="12"/><eos:calendar target="emp.elements['EOSORG_T_Employee/regDate']" format="YYYYMMDD"/>
      </td>
      <td class="queryLabelTD">��������</td>
      <td class="queryFieldTD"> 
      <html:text name="EOSORG_T_Employee/birthDate" property="EOSORG_V_Users/birthDate" maxlength="12"/><eos:calendar target="emp.elements['EOSORG_T_Employee/birthDate']" format="YYYYMMDD"/> 
      </td>
      <td class="queryLabelTD">�Ա�</td>
	      <td class="queryFieldTD" width="21%"> <html:radio name="EOSORG_T_Employee/gender" property="EOSORG_V_Users/gender" value="1"/> 
	        �� <html:radio name="EOSORG_T_Employee/gender" property="EOSORG_V_Users/gender" value="0"/> 
	        Ů</td>
    </tr>
    <tr> 
      <td class="queryLabelTD">��ͥ�绰</td>
      <td class="queryFieldTD"> <html:text name="EOSORG_T_Employee/HTel" property="EOSORG_V_Users/HTel" maxlength="12"/> 
      </td>
      <td class="queryLabelTD">�ƶ��绰</td>
      <td class="queryFieldTD"> <html:text name="EOSORG_T_Employee/mobileNO" property="EOSORG_V_Users/mobileNO" maxlength="12"/> 
      </td>
      <td class="queryLabelTD">�����绰</td>
      <td  class="queryFieldTD"> <html:text name="EOSORG_T_Employee/OTel1" property="EOSORG_V_Users/OTel1" maxlength="12"/> 
      </td>
    </tr>
    <tr> 
      <td class="queryLabelTD">��������</td>
      <td class="queryFieldTD"> <html:text name="EOSORG_T_Employee/OEmail" property="EOSORG_V_Users/OEmail" maxlength="128"/> 
      </td>
      <td class="queryLabelTD">ְλ</td>
      <td class="queryFieldTD"> <dict:select businTypeId="BNORG_position" name="EOSORG_T_Employee/positionID" property="EOSORG_V_Users/positionID" style="width:152px" />
      </td>
      <td class="queryLabelTD">ѧλ</td>
      <td class="queryFieldTD"> <dict:select businTypeId="BNDICT_education" property="EOSORG_V_Users/degree" name="EOSORG_T_Employee/degree" style="width:152px" /> 
      </td>
    </tr>
    <tr> 
      <td class="queryLabelTD" width="10%">��ͥסַ</td>
      <td colspan="1" class="queryFieldTD" > <html:text name="EOSORG_T_Employee/HAddress" property="EOSORG_V_Users/HAddress" maxlength="128"/> 
      </td>
      <td class="queryLabelTD">������</td>
      <td class="queryFieldTD"> 
        <html:select property="EOSORG_V_Users/orgID" name="EOSORG_T_Employee/orgID" style="width:152px">
         <option value="">--��������--</option>
	  	    <logic:iterate id="list" property="list[@type='EOSORG_V_Organization']">
	  	      <html:option id="list" property="EOSORG_V_Organization/orgID" labelProperty="EOSORG_V_Organization/orgName"/>
	 	    </logic:iterate>
	 	  </html:select>
      </td>
      
      <td class="queryLabelTD" >��������</td>
      <td class="queryFieldTD" > <html:text name="EOSORG_T_Employee/zipCode" property="EOSORG_V_Users/zipCode" maxlength="10"/> 
      </td>
    </tr>
    <tr class="query_content"> 
      <td class="queryLabelTD" nowrap>���֤����</td>
      <td class="queryFieldTD" > <html:text name="EOSORG_T_Employee/PID" property="EOSORG_V_Users/PID" maxlength="20"/> 
      </td>
      <td class="queryLabelTD">����</td>
      <td class="queryFieldTD"> <html:text name="EOSORG_T_Employee/faxNO" property="EOSORG_V_Users/faxNO" maxlength="12"/> 
      </td><td></td><td></td>
    </tr>
        
    <logic:equal property="mode" value="U">
    
    <tr class="query_content"> 
      <td class="queryLabelTD">��������</td>
      <td class="queryFieldTD" >
        <html:select name="subOrgs" property="EOSORG_V_SubOrgEmp/orgID" multiple="true" style="width:152px">
         <logic:iterate id="subOrgs" property="list[@type='attachOrgs']">
	  	      <html:option id="subOrgs" property="EOSORG_T_Organization/orgID" labelProperty="EOSORG_T_Organization/orgName"/>
	 	    </logic:iterate>
	 	  </html:select>
      </td>
      <td class="queryLabelTD">��Ͻ�Ļ���</td>
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
            <input type="button" value="����" title="����" onclick="submitEmp()" class="button"></input>
			
		<logic:notPresent property="from">
		    <!--<a href="javascript:history.go(-1);"><html:image src="/return.gif" border="0" /></a>-->
			<input type="button" value="����" title="����" onclick="backEmpList()" class="button"></input>
		</logic:notPresent>
		<logic:equal property="mode" value="U">
			<!--<A href="javascript:deleteEmp();" onclick="return beforeDelete();"><html:image src="/delete.gif"  border="0"/></A>-->
			<input type="button" value="ɾ��" title="ɾ��" onclick="if (beforeDelete()){deleteEmp();}" class="button"></input>
		</logic:equal>
		<logic:equal property="mode" value="N">
			<logic:notPresent property="from">
			<!--<A href="javascript:deleteEmp();" onclick="return beforeDelete();"><html:image src="/delete.gif"  border="0"/></A>-->
			<input type="button" value="Ϊ�û�����ɫ" title="Ϊ�û�����ɫ" onclick="submitEmpAddRole()" class="button"></input>
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


