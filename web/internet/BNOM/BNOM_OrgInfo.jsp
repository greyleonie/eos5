<%@ include file="/internet/BNOM/omappbase.jsp" %> 
<%
	String refresh=request.getParameter("refresh");
	if(refresh==null){
		refresh="";
	}
%>

<script language="JavaScript">
<!--
	var ref="<%=refresh%>";
	if(ref=="tree"){
		window.top.frames("tree").navigate("BNOM.pr_automata.BNOM_P_ShowOrgTree.do?");
	}

	function save(){
		if(org2.elements("EOSORG_T_Organization/orgCode").value==""){
			alert("������Ų���Ϊ�գ�");
			return;
		}
		if(org2.elements("EOSORG_T_Organization/orgName").value==""){
			alert("�������Ʋ���Ϊ�գ�");
			return;
		}
		//(1)�绰���������֡�"("��")"��"-"����
����		//(2)�绰����Ϊ3��8λ
����		//(3)����绰�����а��������ţ���ô����Ϊ��λ����λ
����		//(4)������"("��")"��"-"
		//(5)�ֻ�����"("��")"��"-"
		//(6)�ֺź�Ϊ3λ��4λ
		org2.elements("EOSORG_T_Organization/linkManTel").value=cTrim(org2.elements("EOSORG_T_Organization/linkManTel").value,0);
		org2.elements("EOSORG_T_Organization/zipCode").value=cTrim(org2.elements("EOSORG_T_Organization/zipCode").value,0);
		if(org2.elements("EOSORG_T_Organization/linkManTel").value != ""){
			if(!new RegExp(/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}\-[0-9]{3,4}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^[0-9]{3,4}\-[0-9]{3,8}\-[0-9]{3,4}$)|(^[0-9]{3,8}\([0-9]{3,4}\)$)|(^\([0-9]{3,4}\)[0-9]{3,8}\([0-9]{3,4}\)$)|(^[0-9]{3,8}$)/).test(org2.elements("EOSORG_T_Organization/linkManTel").value)){
		   		alert("����ĵ绰�����ʽ����ȷ�����������룡");
		   		org2.elements("EOSORG_T_Organization/linkManTel").focus();
				return;	
			}
		}
		//(1)����������6λ�����������(����6λ)��
		if(org2.elements("EOSORG_T_Organization/zipCode").value != ""){
		  if(!new RegExp(/(^[0-9]{6}$)/).test(org2.elements("EOSORG_T_Organization/zipCode").value)){
		   	alert("��������������ʽ����ȷ�����������룡");
		   	org2.elements("EOSORG_T_Organization/zipCode").focus();
			return;
		  }
		}
		
		org2.elements("EOSORG_T_Organization/email").value=cTrim(org2.elements("EOSORG_T_Organization/email").value,0);
		
		//(1)�������뺺��
		//(2)������"@"����
		//(3)������"."����
		//(4)"."�������2��3λ���ֻ���ĸ
		if(org2.elements("EOSORG_T_Organization/email").value!=""){
			if(!new RegExp(/^([-_A-Za-z0-9\.]+)@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/).test(org2.elements("EOSORG_T_Organization/email").value)){
		   		alert("����ĵ��������ʽ����ȷ�����������룡");
		   		org2.elements("EOSORG_T_Organization/email").focus();
				return;	
			}
		}

		org2.elements("EOSORG_T_Organization/webURL").value=cTrim(org2.elements("EOSORG_T_Organization/webURL").value,0);
		//(1)������.��β
		if(org2.elements("EOSORG_T_Organization/webURL").value!=""){
			if(!new RegExp(/^((http:[/][/])?\w+([.]\w+|[/]\w*)*)?$/).test(org2.elements("EOSORG_T_Organization/webURL").value)){
		   		alert("�������ַ��ʽ����ȷ�����������룡");
		   		org2.elements("EOSORG_T_Organization/webURL").focus();
				return;	
			}
		}
		
		window.top.frames("tree").navigate("BNOM.pr_automata.BNOM_P_ShowOrgTree.do?");
		document.forms("org2").action="BNOM.pr_automata.BNOM_P_UpdateOrg.do";
		org2.submit();
	}
	function rst(){
		org2.reset();
	}
	function del(){
	if(confirm("ȷ��Ҫɾ���˻���?") == true){
	window.navigate("BNOM.pr_automata.BNOM_P_DeleteOrg.do?refresh=tree&orgID=<bean:write property="EOSORG_V_Organization/orgID"/>");
	}
		
	}
	
	function addChildOrg(){
		window.childOrg.location.replace("BNOM.pr_automata.BNOM_P_ShowNewOrg.do?parentOrgID=<bean:write property="EOSORG_V_Organization/orgID"/>");
	}
	

//-->
</script>

<display:pageHead bodyColor="#EEEEEE"/>
<form name="org2" action="" method="POST">
<input type="hidden" name="redirectURL" value="BNOM.pr_automata.BNOM_P_ShowOrg.do?refresh=tree&orgID=<bean:write property="EOSORG_V_Organization/orgID"/>">
<input type="hidden" name="EOSORG_T_Organization/orgID" value="<bean:write property="EOSORG_V_Organization/orgID"/>">
		<table border="0" cellspacing="1" cellpadding="1" align="center" width="600">
			  <tr> 
			    <td colspan="6" class="queryTitle"> 
			      [��ǰ����]
			    </td>
			  </tr>
			  <tr> 
			    <td class="queryLabelTD" nowrap>��������</td>
			    <td class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/orgCode"   name="EOSORG_T_Organization/orgCode" maxlength="12"/>*
			    </td>
			    <td class="queryLabelTD" nowrap>��������</td>
			    <td colspan="3" class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/orgName" name="EOSORG_T_Organization/orgName" maxlength="32"/>*
			    </td>
			  </tr>
			  <tr> 
			    <td class="queryLabelTD">�ϼ�����</td>
			    <td class="queryFieldTD"> 
			      <html:select property="EOSORG_V_Organization/parentOrgID" name="EOSORG_T_Organization/parentOrgID" style="width:152px">
				  	 <logic:equal property="EOSORG_V_Organization/orgID" value="99999">
					   <option value="">--���ϼ�--</option>
				 	 </logic:equal>
				  	 
				  	 <logic:notEqual property="EOSORG_V_Organization/orgID" value="99999">
					   <logic:iterate id="list" property="list[@type='EOSORG_V_Organization']">
					     <html:option id="list" property="EOSORG_V_Organization/orgID" labelProperty="EOSORG_V_Organization/orgName"/>
			  	 	   </logic:iterate>
				 	 </logic:notEqual>
			     </html:select>
			    </td>
			    <td class="queryLabelTD">������</td>
			    <td class="queryFieldTD"> 
			      <html:select property="EOSORG_V_Organization/managerID" name="EOSORG_T_Organization/managerID" style="width:152px">
				  	   <option value="">--�޹�����--</option>
				  	   <logic:iterate id="empList" property="list[@type='EOSORG_V_MainOrgEmp']">
					     <html:option id="empList" property="EOSORG_V_MainOrgEmp/operatorID" labelProperty="EOSORG_V_MainOrgEmp/operatorName"/>
			        </logic:iterate>
			      </html:select>
			    </td>
			    <!--<td width="11%" class="queryFieldTD" height="22">������</td>
			    <td class="queryFieldTD" height="22"> 
			      <html:text name="EOSORG_T_Organization/addressCode" property="EOSORG_V_Organization/addressCode" maxlength="12"/>
			    </td>
			    <td width="10%" height="18" class="queryFieldTD">��������</td>
			      <td colspan="3" height="18" class="queryFieldTD"> 
			        <dict:select businTypeId="BNORG_orgType" property="EOSORG_V_Organization/orgTypeID" name="EOSORG_T_Organization/orgTypeID"/>
			      </td>-->
			    <td class="queryLabelTD" nowrap>��������</td>
			    <td class="queryFieldTD">
			      <html:text name="EOSORG_T_Organization/zipCode"  property="EOSORG_V_Organization/zipCode" maxlength="10"/>
			    </td>
			  </tr>
			  <tr> 
			    <td class="queryLabelTD">��ϵ��</td>
			    <td height="18" class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/linkMan" name="EOSORG_T_Organization/linkMan" maxlength="15"/>
			    </td>
			    <td height="18" class="queryLabelTD">��ϵ�绰</td>
			    <td height="18" class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/linkManTel"  name="EOSORG_T_Organization/linkManTel" maxlength="20"/>
			    </td>
			    <td height="18" class="queryLabelTD" nowrap>��������</td>
			    <td height="18" class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/email" name="EOSORG_T_Organization/email" maxlength="128"/>
			    </td>
			  </tr>
			  <tr> 
			    <td class="queryLabelTD">��ַ</td>
			    <td class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/webURL"  name="EOSORG_T_Organization/webURL" maxlength="512"/>
			    </td>
			    <td class="queryLabelTD">��ַ</td>
			    <td colspan="3" class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/orgAddress" name="EOSORG_T_Organization/orgAddress" size="52" maxlength="128"/>
			    </td>
			  </tr>
			  <tr> 
			    <td class="queryLabelTD" height="18">��ע</td>
			    <td colspan="5" class="queryFieldTD" height="18"> 
			      <html:text property="EOSORG_V_Organization/memo" name="EOSORG_T_Organization/memo" size="85" maxlength="256"/>
			    </td>
			  </tr>
			  <tr> 
			   <td colspan="6" class="query_bottom" height="3"> 
			            <div align="center">
			              <!--<a target="childOrg" href="BNOM.pr_automata.BNOM_P_ShowNewOrg.do?parentOrgID=<bean:write property="EOSORG_V_Organization/orgID"/>">-->
			              <input type="button" value="�����¼�����" title="�����¼�����" onclick="addChildOrg()" class="button"></input><!--<html:image src="/add_4.gif"  border="0" /></a>-->
						  <input type="button" value="����" title="����" onclick="save()" class="button"></input>
						  <!--<a href="javascript:save();"><html:image src="/save.gif"  border="0" /></a>
			              <a href="javascript:rst();"><html:image src="/reset.gif"  border="0" /></a>-->
			              <input type="button" value="����" title="����" onclick="rst()" class="button"></input>
			              <logic:notEqual property="EOSORG_V_Organization/orgID" value="99999">
			                <!--<a href="javascript:del();"><html:image src="/delete.gif"  border="0"/></a>-->
			                <input type="button" value="ɾ��" title="ɾ��" onclick="del()" class="button"></input>
			              </logic:notEqual>
			              </div>
			    </td>
			  </tr>
			</table>
</form>
<iframe name="childOrg" src="/internet/BNOM/blank.htm" width="100%" height="250" frameborder="0" />
<display:pageTail/>




