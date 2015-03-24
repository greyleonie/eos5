<%@ include file="/internet/BNOM/omappbase.jsp" %>
<html>
<body topmargin="0" rightmargin="0" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" bgcolor="#EEEEEE">
<form name="frmOperatorList" action="BNOM.pr_automata.BNOM_P_QueryAllEmps.do" method="POST">
<input type="hidden" name="redirectURL" value="BNOM.pr_automata.BNOM_P_QueryAllEmps.do?QueryCondition=&">
	
	<!----------Hidden Param Start---------------->
    <html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/operatorName" />
	<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/userID" />
	<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/empCode" />
	<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/EOSORG_V_Users/orgID" />
	
	<logic:notEqual property="roleID" value="0">
		<html:hidden property="roleID" />
	</logic:notEqual>
	<!--<html:hidden property="queryRole" />
	<html:hidden property="queryAll" />
    <html:hidden property="EOSOperator/operatorID" />-->
    <html:hidden property="EOSRole[@name='remove']/roleID"  />
	<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/PageCond/begin" />
	<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/PageCond/length" />
	<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/PageCond/count" />
	<!----------Hidden Param END---------------->
	
	<script>
		var otherPage = new page();
		otherPage.init("frmOperatorList", "QueryCondition[@entity='EOSORG_V_Users']/PageCond/begin", "QueryCondition[@entity='EOSORG_V_Users']/PageCond/length", "QueryCondition[@entity='EOSORG_V_Users']/PageCond/count");
	</script>
	
	<display:resultHead title="用户列表" />
  
    <table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse">
      <tr class="tableHeadTR">
		<!--<table class="result" width="100%">
			<tr class="result_title">
		      <td colspan="9" width="100%"> 
		        <div align="left">用户列表</div>
		      </td>
		   </tr>
		   <tr class="result_head"> 
				<td width="2%"></td>
				<td width="44%">用户真实姓名</td>
				<td width="44%">用户登录名</td>

			</tr>
			<tr> -->
          <td width="2%" nowrap>
          <!--<input type="checkbox" name="checkAll" onclick="dealAllCheckBox(this)" />-->选择</td>
          <td width="10%">用户登录名</td>
          <td width="12%">用户姓名</td>
          <td width="8%"> 用户编号</td>
          <td width="12%">所属主机构</td>   
          <td width="14%">工作电话 </td>
          <td width="12%">用户角色</td>
          <!--<td width="18%">email</td>
          <td width="12%">注册日期</td>-->
         </tr>

			
			<%
			int count=0;
			String trClass = "tableContentTR";
			int resultShowLen = 10;
			%>
			
			<logic:iterate id="notePaper" property="QueryCondition[@entity='EOSORG_V_Users']/list[@type='EOSORG_V_Users']">		
			
				<%
				if(count%2==0)
				trClass = "tableContentTR";
				else
				trClass = "tableContentTR";
				%>
				<tr class="<%=trClass%>">
					<td width="2%">
					<%
					
					com.primeton.tp.core.prservice.context.RequestContext ctx = (com.primeton.tp.core.prservice.context.RequestContext)request.getAttribute("notePaper");
					String userID = ctx.getProperty("EOSORG_V_Users/userID");
					com.primeton.tp.core.management.users.EOSUser[] us = com.primeton.tp.core.management.users.EOSUserManager.findUsers(null,userID,null,null,0,0,0,0);
					if(us.length<=0){
					%>
						<html:checkbox indexed="true" id="notePaper" name="list[@type='EOSOperator']/EOSOperator/operatorID" property="EOSORG_V_Users/operatorID"/>
					<%
					}else{%>
						<font style="color:#3399FF">在线</font>
					<%}%>
					</td>
					<td width="10%">
						<a href="BNOM.pr_automata.BNOM_P_ShowEmp.do?back=1&mode=U&operatorID=<bean:write id="notePaper" property="EOSORG_V_Users/operatorID"/>"><bean:write id="notePaper" property="EOSORG_V_Users/userID"/></a>
					</td>
					<td width="12%">
						<bean:write id="notePaper" property="EOSORG_V_Users/operatorName"/>
					</td>
					<td width="8%" align="center"><bean:write id="notePaper" property="EOSORG_V_Users/empCode"/></td>
					<td width="12%">
						<bean:write id="notePaper" property="EOSORG_V_Users/orgName"/>
					</td>
					<td width="14%" align="center">
						<bean:write id="notePaper" property="EOSORG_V_Users/OTel1"/>
					</td>
					<td width="12%">
						<bean:write id="notePaper" property="EOSORG_V_Users/roleString"/>
					</td>
					<!--<td width="12%">
						<dict:write id="notePaper" businTypeId="BNORG_position" property="EOSORG_V_Users/positionID"/>
					</td>
					<td width="18%">
						<bean:write id="notePaper" property="EOSORG_V_Users/OEmail"/>&nbsp;&nbsp;
					</td>
					<td width="12%" align="center">
						<bean:write id="notePaper" property="EOSORG_V_Users/regDate"/>&nbsp;&nbsp;
					</td>-->
				</tr>
				<%count++;%>
			</logic:iterate>
			
    
	        <logic:equal property="entityshow" value="0">
			<logic:iterate id="notePaper" property="QueryCondition[@entity='EOSORG_V_Users']/list[@type='EOSORG_V_Users']">
			
			
				<%
				if(count%2==0)
				trClass = "tableContentTR";
				else
				trClass = "tableContentTR";
				%>
				<tr class="<%=trClass%>">
					<td width="2%">
						<html:checkbox indexed="true" id="notePaper" name="list[@type='EOSOperator']/EOSOperator/operatorID" property="EOSORG_V_Users/operatorID" />
					</td>
					<td width="8%" align="center">
						<a href="BNOM.pr_automata.BNOM_P_ShowEmp.do?back=1&mode=U&operatorID=<bean:write id="notePaper" property="EOSORG_V_Users/operatorID"/>">
							<bean:write id="notePaper" property="EOSORG_V_Users/empCode"/>
						</a>
					</td>
					<td width="12%">
						<bean:write id="notePaper" property="EOSORG_V_Users/operatorName"/>
					</td>
					<td width="10%">
						<bean:write id="notePaper" property="EOSORG_V_Users/userID"/>
					</td>
					<td width="12%">
						<bean:write id="notePaper" property="EOSORG_V_Users/orgName"/>
					</td>
					<td width="14%" align="center">
						<bean:write id="notePaper" property="EOSORG_V_Users/OTel1"/>
					</td>
					<td width="12%">
						<bean:write id="notePaper" property="EOSORG_V_Users/roleString"/>
					</td>
					<!--<td width="12%">
						<dict:write id="notePaper" businTypeId="BNORG_position" property="EOSORG_V_Users/positionID"/>
					</td>
					<td width="18%">
						<bean:write id="notePaper" property="EOSORG_V_Users/OEmail"/>&nbsp;&nbsp;
					</td>
					<td width="12%" align="center">
						<bean:write id="notePaper" property="EOSORG_V_Users/regDate"/>&nbsp;&nbsp;
					</td>-->
				</tr>
				<%count++;%>
			</logic:iterate>
			</logic:equal>
			
			<!-- 补充行数!  -->
			<%
				for(int i=count; i<resultShowLen; i++) {
					if(i%2 == 0) {
						trClass = "tableContentTR";
					} else {
						trClass = "tableContentTR"; 
					}
			%>
				<tr class="<%=trClass%>">
				<td> </td><td> </td><td></td><td></td><td></td><td></td><td></td>
				</tr>
			<%
				}// end of for count
			%>
			</table>
			<display:resultTail />
			
		    <table border="0" width="100%" cellspacing="4" cellpadding="4">
        	   <tr> 
        	  
            <!--<td align="left" class="hcibottom"> 
            [<A       href="JavaScript:CheckAll()">全选</A>] 
            [<A       href="JavaScript:UnCheckAll()">全取消</A>]
	    </TD>		-->	
	    		   <td nowrap width="40%">
	          		<div align="left">
	          			<!--<a href="#1" onclick="javascript:add();">
	          				<img src="/internet/theme/style0/add.gif" border="0"/>
	          			</a>-->
	          			<input type="button" value="删除" title="删除" onclick="del()" class="button"></input>
	          			<input type="button" value="为用户赋角色" title="为用户赋角色" onclick="setPart()" class="button"></input>
	          			&nbsp;&nbsp;
	          			<input type="button" value="新建用户" title="新建用户" onclick="add()" class="button"></input>
     			
	          		</div>
	               </td>
	               <td>
				<html:select size="1" property="EOSOperatorRole/roleID" style="width:150px" >
		    	           <option value="0" selected>--请选择角色类型--&nbsp;&nbsp;&nbsp;</option>
				   <html:options property="list/EOSRole/roleID" labelProperty="list/EOSRole/roleName"/>
		    	         </html:select>

			</td>
	                <td align="right">              	   
	                  <script>
						if (otherPage.total > 1 && !otherPage.noCount) {
							document.write('<input type="button" value="上一页" title="上一页" onclick="otherPage.previousPage();" class="button"></input>&nbsp;');
                			document.write('<input type="button" value="下一页" title="下一页" onclick="otherPage.nextPage();" class="button"></input>');
                			document.write('&nbsp;');
							//document.write('<font size=2>总共' + otherPage.count + '条');
							document.write('<font size=2>&nbsp;第');
							document.write(otherPage.current + '页/');
							document.write('共'+otherPage.total + '页</font>')
				 		}
			         </script>
			 </td>
	           </tr>
	        	 

      	     </table>
	</form>
</body>
</html>

<script language="javascript">
function add() {
	var submitFrm = document.frmOperatorList;
	submitFrm.action = "BNOM.pr_automata.BNOM_P_ShowNewEmp.do?mode=N";
	submitFrm.submit();
}

function mod() {
	var frm = document.frmOperatorList;
	if(selectedCheckboxCount(frm) != 1){
		alert("您必须选择一条记录才能执行修改操作！");
		return false;
	}
	frm.action = "ROLE.pr_automata.ROLE_P_OperatorMod.do";
	frm.submit();

}

function setPart() {
	var frm = document.frmOperatorList;
	if(selectedCheckboxCount(frm) < 1){
		alert("您必须选择记录才能执行修改操作！");
		return false;
	}
    if(selectedCheckboxCount(frm) ==1){
	  var vID = getCheckedValue(frm);
	  frm.action = "ROLE.pr_automata.ROLE_P_SetRoleForOperator.do?EOSOperator/operatorID="+vID;
	}
	if(selectedCheckboxCount(frm) > 1) {
		frm.elements["EOSRole[@name='remove']/roleID"].value=frm.elements["EOSOperatorRole/roleID"].value; 
		if(frm.elements["EOSRole[@name='remove']/roleID"].value==0){ 
		    alert("请选择角色!");
		   return false;
	          }
	  frm.action = "BNOM.pr_automata.BNOM_P_MulAddOperatorRole.do";
	}
	  frm.submit();
	  
}

function del() {
	var frm = document.frmOperatorList;
	var selectedName="";
	if(selectedCheckboxCount(frm) < 1){
		alert("您至少选择一条记录才能执行删除操作!");
		return false;
	} else {
		if(confirm("此动作将删除掉该用户对应的所有记录,请谨慎使用,确定删除吗?")) {
			//frm.target = "_parent";
			frm.action = "BNOM.pr_automata.BNOM_P_DeleteEmps.do";
			frm.submit();
		} else {
			return false;
		}
	}
}

function dealAllCheckBox(chkAll){
	if ( chkAll.checked == true ){
		CheckAll();
	} else {
		UnCheckAll();
	}
}
	
	function CheckAll()	// Select all the check boies
{   
	for (var i=0;i<document.frmOperatorList.elements.length;i++)
	{
		
		var e = document.frmOperatorList.elements[i];
		  
		   e.checked = true;
	}
}

function UnCheckAll()	// uncheck all the check boies 
{
	for (var i=0;i<document.frmOperatorList.elements.length;i++)
	{
		var e = document.frmOperatorList.elements[i];
		    
		   e.checked = false;
	}
}

</script>

<script language="javascript">
function getCheckedValue(frm) {

	var length =0;
	var i=0;
	var count =0;
	eles = frm.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.type;
		if(type == "checkbox"){
			if(obj.checked){
				return obj.value;
			}
		}
		i++;
	}
	
}

function selectedCheckboxCount(frm){
	var length =0;
	var i=0;
	var count =0;
	eles = frm.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.type;
		if(type == "checkbox"){
			if(obj.checked){
				if (eles.item(i).name!="checkAll"){
					count++;
				}
			}
		}
		i++;
	}
	return count;
}
</script>
