<%@ include file="/internet/BNOM/omappbase.jsp" %>
<html> <div style="overflow:auto;width:640;height:400" align="center">
<body topmargin="0" rightmargin="0" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" bgcolor="#EEEEEE">
<form name="frmOperatorList" action="ROLE.pr_automata.BNOM_P_QueryAllEmps.do?queryRole=<bean:write property='BackqueryRole'/>&queryAll=<bean:write property='BackqueryAll'/>" method="POST">
<input type="hidden" name="redirectURL" value="BNOM.pr_automata.BNOM_P_QueryAllEmps.do?QueryCondition=&">	
	<!----------Hidden Param Start---------------->
   <html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/EOSOperator/operatorName" />
	<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/EOSOperator/userID" />
	<!--<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/EOSOperatorRole/roleID" />
	<html:hidden property="queryRole" />
	<html:hidden property="queryAll" />
         <html:hidden property="EOSOperator/operatorID" />-->
        <html:hidden property="EOSRole[@name='remove']/roleID"  />
	<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/PageCond/begin" />
	<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/PageCond/length" />
	<html:hidden property="QueryCondition[@entity='EOSORG_V_Users']/PageCond/count" />
	<!----------Hidden Param END---------------->
	<html:hidden  property="roleID" />
	<html:hidden  property="roleName" />
	<script>
		var otherPage = new page();
		otherPage.init("frmOperatorList", "QueryCondition[@entity='EOSORG_V_Users']/PageCond/begin", "QueryCondition[@entity='EOSORG_V_Users']/PageCond/length", "QueryCondition[@entity='EOSORG_V_Users']/PageCond/count");
	</script>  
    <table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse">
      <tr class="tableHeadTR">
          <td width="2%" nowrap>选择</td>
          <td width="10%">用户登录名</td>
          <td width="12%">用户姓名</td>
          <td width="8%"> 用户编号</td>
          <td width="12%">所属主机构</td>   
          <td width="26%">用户角色</td>
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
						<html:checkbox indexed="true" id="notePaper" name="list[@type='EOSOperator']/EOSOperator/operatorID" property="EOSORG_V_Users/operatorID" />
					</td>
					<td width="10%">
						<bean:write id="notePaper" property="EOSORG_V_Users/userID"/>
					</td>
					<td width="12%">
						<bean:write id="notePaper" property="EOSORG_V_Users/operatorName"/>
					</td>
					<td width="8%" align="center"><bean:write id="notePaper" property="EOSORG_V_Users/empCode"/></td>
					<td width="12%">
						<bean:write id="notePaper" property="EOSORG_V_Users/orgName"/>
					</td>
					<td width="26%">
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
					<td width="26%">
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
				<td> </td><td> </td><td></td><td></td><td></td><td></td>
				</tr>
			<%
				}// end of for count
			%>
			</table>			
		    <table width="100%" cellspacing="4" cellpadding="4">
		             <tr> 
		        	      <td align="left" width="20%">      	  
				            [<A       href="JavaScript:CheckAll()">全选</A>] 
				            [<A       href="JavaScript:UnCheckAll()">全取消</A>]
				      </td>
		            </tr>
	                    <tr>			
		    		 <td nowrap width="40%">
                                         <input type="button" value="&nbsp;提交&nbsp;" title="提交" onclick="setPart()" ></input>
                                         <input type="button" value="&nbsp;返回&nbsp;" title="返回" onclick="cancelSel()" ></input> 			
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
</body></div>
</html>

<script language="javascript">
function cancelSel(){
     window.parent.close();
     parent.opener.location.href="/ROLE.pr_automata.ROLE_P_QueryRoleOperator.do?roleID=<bean:write property="roleID"/>&roleName=<bean:write property="roleName"/>";
  }
  

function setPart() {
	var frm = document.frmOperatorList;
	frm.target="_top";
	if(selectedCheckboxCount(frm) < 1){
		alert("您必须选择用户才能执行操作！");
		return false;
	}
	frm.elements["EOSRole[@name='remove']/roleID"].value=frm.elements["roleID"].value; 
	frm.action = "ROLE.pr_automata.ROLE_P_MulAddOperatorRole.do";	
	frm.submit();
	  
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