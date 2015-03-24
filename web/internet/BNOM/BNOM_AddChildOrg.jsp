<%@ include file="/internet/BNOM/omappbase.jsp" %> 
<%
	String refresh=request.getParameter("refresh");
	if(refresh==null){
		refresh="";
	}
%>

<script language="JavaScript">


<!--


var ref='<%=(request.getParameter("refresh")==null)?"":request.getParameter("refresh") %>';
	if(ref=="tree"){
		window.top.frames("tree").navigate("BNOM.pr_automata.BNOM_P_ShowOrgTree.do?");
	}

	function add(){
		if(document.forms(0).elements("EOSORG_T_Organization/orgCode").value==""){
			alert("机构编号不能为空！");
			return false;
		}
		if(document.forms(0).elements("EOSORG_T_Organization/orgName").value==""){
			alert("机构名称不能为空！");
			return false;
		}
		
		
		//(1)电话号码由数字、"("、")"和"-"构成
　　		//(2)电话号码为3到8位
　　		//(3)如果电话号码中包含有区号，那么区号为三位或四位
　　		//(4)区号用"("、")"或"-"
		//(5)分机号用"("、")"或"-"
		//(6)分号号为3位或4位
		org.elements("EOSORG_T_Organization/linkManTel").value=cTrim(org.elements("EOSORG_T_Organization/linkManTel").value,0);
		org.elements("EOSORG_T_Organization/zipCode").value=cTrim(org.elements("EOSORG_T_Organization/zipCode").value,0);
		if(org.elements("EOSORG_T_Organization/linkManTel").value != ""){
			if(!new RegExp(/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}\-[0-9]{3,4}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^[0-9]{3,4}\-[0-9]{3,8}\-[0-9]{3,4}$)|(^[0-9]{3,8}\([0-9]{3,4}\)$)|(^\([0-9]{3,4}\)[0-9]{3,8}\([0-9]{3,4}\)$)|(^[0-9]{3,8}$)/).test(org.elements("EOSORG_T_Organization/linkManTel").value)){
		   		alert("输入的电话号码格式不正确，请重新输入！");
		   		org.elements("EOSORG_T_Organization/linkManTel").focus();
				return;	
			}
		}
		//(1)邮政编码由6位以内数字组成(包含6位)。
		if(org.elements("EOSORG_T_Organization/zipCode").value != ""){
		  if(!new RegExp(/(^[0-9]{6}$)/).test(org.elements("EOSORG_T_Organization/zipCode").value)){
		   	alert("输入的邮政编码格式不正确，请重新输入！");
		   	org.elements("EOSORG_T_Organization/zipCode").focus();
			return;
		  }
		}
		
		
		org.elements("EOSORG_T_Organization/email").value=cTrim(org.elements("EOSORG_T_Organization/email").value,0);
		
		//(1)不能输入汉字
		//(2)必须有"@"符号
		//(3)必须有"."符号
		//(4)"."后必须有2－3位数字或字母
		if(org.elements("EOSORG_T_Organization/email").value!=""){
			if(!new RegExp(/^([-_A-Za-z0-9\.]+)@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/).test(org.elements("EOSORG_T_Organization/email").value)){
		   		alert("输入的电子信箱格式不正确，请重新输入！");
		   		org.elements("EOSORG_T_Organization/email").focus();
				return;	
			}
		}

		org.elements("EOSORG_T_Organization/webURL").value=cTrim(org.elements("EOSORG_T_Organization/webURL").value,0);
		//(1)不能以.结尾
		if(org.elements("EOSORG_T_Organization/webURL").value!=""){
			if(!new RegExp(/^((http:[/][/])?\w+([.]\w+|[/]\w*)*)?$/).test(org.elements("EOSORG_T_Organization/webURL").value)){
		   		alert("输入的网址格式不正确，请重新输入！");
		   		org.elements("EOSORG_T_Organization/webURL").focus();
				return;	
			}
		}
		
		org.submit();
	}
	function rst2(){
		org.reset();
	}
//-->
</script>
<body topmargin="0" rightmargin="0" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" bgcolor="#EEEEEE" onload="org.elements['EOSORG_T_Organization/orgCode'].focus();">
<form name="org" action="BNOM.pr_automata.BNOM_P_AddOrg.do" method="POST">
<html:hidden name="EOSORG_T_Organization/parentOrgID" property="parentOrgID"/>
<input type="hidden" name="redirectURL" value="BNOM.pr_automata.BNOM_P_ShowNewOrg.do?parentOrgID=<bean:write property="parentOrgID"/>&refresh=tree">

		  <table class="add" border="0"  cellspacing="1" cellpadding="1" align="center">
		    <tr class="query"> 
		      <td colspan="6" class="queryTitle">
		         [新增下级机构]
		      </td>
		    </tr>
		    <tr class="query"> 
		      <td class="queryLabelTD" nowrap>机构编码</td>
		      <td class="queryFieldTD"> <html:text   name="EOSORG_T_Organization/orgCode" maxlength="12"/>*
		      </td>
		      <td class="queryLabelTD" nowrap>机构名称</td>
		      <td colspan="3" class="queryFieldTD"> <html:text  name="EOSORG_T_Organization/orgName" maxlength="32"/>* 
		      </td>
		    </tr>
		    <tr class="query"> 
		      <td width="12%" height="18" class="queryLabelTD">上级机构</td>
		      <td width="24%" height="18" class="queryFieldTD"> <html:select  name="EOSORG_T_Organization/parentOrgID"  property="parentOrgID" disabled="true" style="width:152px"> <option value="">
		        --无上级--</option> <logic:iterate id="orgs" property="list[@type='EOSORG_V_Organization']"> 
		        <html:option id="orgs" property="EOSORG_V_Organization/orgID" labelProperty="EOSORG_V_Organization/orgName"/> 
		        </logic:iterate> </html:select> </td>
		      <!--<td width="10%" height="18" class="queryLabelTD">机构类型</td>
		      <td colspan="3" height="18" class="queryFieldTD"> 
		          <dict:select businTypeId="BNORG_orgType" property="EOSORG_T_Organization/orgTypeID" />
		      </td>
		      <td width="11%" class="queryLabelTD" height="22">地域编号</td>
		      <td colspan="3" class="queryFieldTD" height="22"> <html:text name="EOSORG_T_Organization/addressCode" maxlength="12"/>-->
				 <td class="queryLabelTD">邮政编码</td>
				 <td colspan="3" class="queryFieldTD"> <html:text name="EOSORG_T_Organization/zipCode" maxlength="10"/> 
		      </td>
		      </td>
		    </tr>
		    </tr>
		    <tr> 
		      <td class="queryLabelTD">联系人</td>
		      <td class="queryFieldTD"><html:text name="EOSORG_T_Organization/linkMan" maxlength="30"/> 
		      </td>
		      <td class="queryLabelTD">联系电话</td>
		      <td class="queryFieldTD"><html:text name="EOSORG_T_Organization/linkManTel" maxlength="20"/> 
		      </td>
		      <td class="queryLabelTD" nowrap>电子信箱</td>
		      <td class="queryFieldTD"><html:text name="EOSORG_T_Organization/email" maxlength="128"/> 
		      </td>
		    </tr>
		    <tr> 
		      <td class="queryLabelTD">网址</td>
		      <td class="queryFieldTD"><html:text  name="EOSORG_T_Organization/webURL" maxlength="256"/> 
		      </td>
		      <td class="queryLabelTD">地址</td>
		      <td colspan="3" class="queryFieldTD"><html:text  name="EOSORG_T_Organization/orgAddress" size="51" maxlength="128"/> 
		      </td>
		    </tr>
		    <tr class="query"> 
		      <td class="queryLabelTD">备注</td>
		      <td colspan="5" class="queryFieldTD"> <html:text  name="EOSORG_T_Organization/memo" size="84" maxlength="256"/> 
		      </td>
		    </tr>
		    <tr> 
		      <td colspan="6" class="add_bottom" height="3"> 
		        <table border="0" width="100%" cellspacing="0" cellpadding="0">
		          <tr> 
		            <td nowrap height="20"> 
		              <div align="center"> 
					    <!--<a href="#" onclick="javascript:return add();"><html:image src="/saveadd.gif" border="0" /> </a>-->
					    <input type="button" value="保存并继续" title="保存并继续" onclick="add()" class="button"></input>
		                <input type="button" value="重置" title="重置" onclick="rst2()" class="button"></input>
		                <!--<a href="javascript:rst2();"><html:image src="/reset.gif"  border="0"/></a> 
		                <html:image src="/return.gif" border="0" onclick="javascript:window.navigate('about:blank');"/> -->
		                <input type="button" value="返回" title="返回" onclick="javascript:window.navigate('/internet/BNOM/blank.htm');" class="button"></input>
		              </div>
		            </td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table>

</form>
</body>