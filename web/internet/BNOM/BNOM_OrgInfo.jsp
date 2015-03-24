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
			alert("机构编号不能为空！");
			return;
		}
		if(org2.elements("EOSORG_T_Organization/orgName").value==""){
			alert("机构名称不能为空！");
			return;
		}
		//(1)电话号码由数字、"("、")"和"-"构成
　　		//(2)电话号码为3到8位
　　		//(3)如果电话号码中包含有区号，那么区号为三位或四位
　　		//(4)区号用"("、")"或"-"
		//(5)分机号用"("、")"或"-"
		//(6)分号号为3位或4位
		org2.elements("EOSORG_T_Organization/linkManTel").value=cTrim(org2.elements("EOSORG_T_Organization/linkManTel").value,0);
		org2.elements("EOSORG_T_Organization/zipCode").value=cTrim(org2.elements("EOSORG_T_Organization/zipCode").value,0);
		if(org2.elements("EOSORG_T_Organization/linkManTel").value != ""){
			if(!new RegExp(/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}\-[0-9]{3,4}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^[0-9]{3,4}\-[0-9]{3,8}\-[0-9]{3,4}$)|(^[0-9]{3,8}\([0-9]{3,4}\)$)|(^\([0-9]{3,4}\)[0-9]{3,8}\([0-9]{3,4}\)$)|(^[0-9]{3,8}$)/).test(org2.elements("EOSORG_T_Organization/linkManTel").value)){
		   		alert("输入的电话号码格式不正确，请重新输入！");
		   		org2.elements("EOSORG_T_Organization/linkManTel").focus();
				return;	
			}
		}
		//(1)邮政编码由6位以内数字组成(包含6位)。
		if(org2.elements("EOSORG_T_Organization/zipCode").value != ""){
		  if(!new RegExp(/(^[0-9]{6}$)/).test(org2.elements("EOSORG_T_Organization/zipCode").value)){
		   	alert("输入的邮政编码格式不正确，请重新输入！");
		   	org2.elements("EOSORG_T_Organization/zipCode").focus();
			return;
		  }
		}
		
		org2.elements("EOSORG_T_Organization/email").value=cTrim(org2.elements("EOSORG_T_Organization/email").value,0);
		
		//(1)不能输入汉字
		//(2)必须有"@"符号
		//(3)必须有"."符号
		//(4)"."后必须有2－3位数字或字母
		if(org2.elements("EOSORG_T_Organization/email").value!=""){
			if(!new RegExp(/^([-_A-Za-z0-9\.]+)@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/).test(org2.elements("EOSORG_T_Organization/email").value)){
		   		alert("输入的电子信箱格式不正确，请重新输入！");
		   		org2.elements("EOSORG_T_Organization/email").focus();
				return;	
			}
		}

		org2.elements("EOSORG_T_Organization/webURL").value=cTrim(org2.elements("EOSORG_T_Organization/webURL").value,0);
		//(1)不能以.结尾
		if(org2.elements("EOSORG_T_Organization/webURL").value!=""){
			if(!new RegExp(/^((http:[/][/])?\w+([.]\w+|[/]\w*)*)?$/).test(org2.elements("EOSORG_T_Organization/webURL").value)){
		   		alert("输入的网址格式不正确，请重新输入！");
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
	if(confirm("确定要删除此机构?") == true){
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
			      [当前机构]
			    </td>
			  </tr>
			  <tr> 
			    <td class="queryLabelTD" nowrap>机构编码</td>
			    <td class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/orgCode"   name="EOSORG_T_Organization/orgCode" maxlength="12"/>*
			    </td>
			    <td class="queryLabelTD" nowrap>机构名称</td>
			    <td colspan="3" class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/orgName" name="EOSORG_T_Organization/orgName" maxlength="32"/>*
			    </td>
			  </tr>
			  <tr> 
			    <td class="queryLabelTD">上级机构</td>
			    <td class="queryFieldTD"> 
			      <html:select property="EOSORG_V_Organization/parentOrgID" name="EOSORG_T_Organization/parentOrgID" style="width:152px">
				  	 <logic:equal property="EOSORG_V_Organization/orgID" value="99999">
					   <option value="">--无上级--</option>
				 	 </logic:equal>
				  	 
				  	 <logic:notEqual property="EOSORG_V_Organization/orgID" value="99999">
					   <logic:iterate id="list" property="list[@type='EOSORG_V_Organization']">
					     <html:option id="list" property="EOSORG_V_Organization/orgID" labelProperty="EOSORG_V_Organization/orgName"/>
			  	 	   </logic:iterate>
				 	 </logic:notEqual>
			     </html:select>
			    </td>
			    <td class="queryLabelTD">管理者</td>
			    <td class="queryFieldTD"> 
			      <html:select property="EOSORG_V_Organization/managerID" name="EOSORG_T_Organization/managerID" style="width:152px">
				  	   <option value="">--无管理者--</option>
				  	   <logic:iterate id="empList" property="list[@type='EOSORG_V_MainOrgEmp']">
					     <html:option id="empList" property="EOSORG_V_MainOrgEmp/operatorID" labelProperty="EOSORG_V_MainOrgEmp/operatorName"/>
			        </logic:iterate>
			      </html:select>
			    </td>
			    <!--<td width="11%" class="queryFieldTD" height="22">地域编号</td>
			    <td class="queryFieldTD" height="22"> 
			      <html:text name="EOSORG_T_Organization/addressCode" property="EOSORG_V_Organization/addressCode" maxlength="12"/>
			    </td>
			    <td width="10%" height="18" class="queryFieldTD">机构类型</td>
			      <td colspan="3" height="18" class="queryFieldTD"> 
			        <dict:select businTypeId="BNORG_orgType" property="EOSORG_V_Organization/orgTypeID" name="EOSORG_T_Organization/orgTypeID"/>
			      </td>-->
			    <td class="queryLabelTD" nowrap>邮政编码</td>
			    <td class="queryFieldTD">
			      <html:text name="EOSORG_T_Organization/zipCode"  property="EOSORG_V_Organization/zipCode" maxlength="10"/>
			    </td>
			  </tr>
			  <tr> 
			    <td class="queryLabelTD">联系人</td>
			    <td height="18" class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/linkMan" name="EOSORG_T_Organization/linkMan" maxlength="15"/>
			    </td>
			    <td height="18" class="queryLabelTD">联系电话</td>
			    <td height="18" class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/linkManTel"  name="EOSORG_T_Organization/linkManTel" maxlength="20"/>
			    </td>
			    <td height="18" class="queryLabelTD" nowrap>电子信箱</td>
			    <td height="18" class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/email" name="EOSORG_T_Organization/email" maxlength="128"/>
			    </td>
			  </tr>
			  <tr> 
			    <td class="queryLabelTD">网址</td>
			    <td class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/webURL"  name="EOSORG_T_Organization/webURL" maxlength="512"/>
			    </td>
			    <td class="queryLabelTD">地址</td>
			    <td colspan="3" class="queryFieldTD"> 
			      <html:text property="EOSORG_V_Organization/orgAddress" name="EOSORG_T_Organization/orgAddress" size="52" maxlength="128"/>
			    </td>
			  </tr>
			  <tr> 
			    <td class="queryLabelTD" height="18">备注</td>
			    <td colspan="5" class="queryFieldTD" height="18"> 
			      <html:text property="EOSORG_V_Organization/memo" name="EOSORG_T_Organization/memo" size="85" maxlength="256"/>
			    </td>
			  </tr>
			  <tr> 
			   <td colspan="6" class="query_bottom" height="3"> 
			            <div align="center">
			              <!--<a target="childOrg" href="BNOM.pr_automata.BNOM_P_ShowNewOrg.do?parentOrgID=<bean:write property="EOSORG_V_Organization/orgID"/>">-->
			              <input type="button" value="新增下级机构" title="新增下级机构" onclick="addChildOrg()" class="button"></input><!--<html:image src="/add_4.gif"  border="0" /></a>-->
						  <input type="button" value="保存" title="保存" onclick="save()" class="button"></input>
						  <!--<a href="javascript:save();"><html:image src="/save.gif"  border="0" /></a>
			              <a href="javascript:rst();"><html:image src="/reset.gif"  border="0" /></a>-->
			              <input type="button" value="重置" title="重置" onclick="rst()" class="button"></input>
			              <logic:notEqual property="EOSORG_V_Organization/orgID" value="99999">
			                <!--<a href="javascript:del();"><html:image src="/delete.gif"  border="0"/></a>-->
			                <input type="button" value="删除" title="删除" onclick="del()" class="button"></input>
			              </logic:notEqual>
			              </div>
			    </td>
			  </tr>
			</table>
</form>
<iframe name="childOrg" src="/internet/BNOM/blank.htm" width="100%" height="250" frameborder="0" />
<display:pageTail/>




