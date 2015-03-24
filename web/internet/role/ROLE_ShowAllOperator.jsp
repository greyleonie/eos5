<%@ include file="/internet/common.jsp" %>
<html>
<head>
	<script language="JavaScript" src="/internet/scripts/pagination.js"></script>
	<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css" />
</head>
<form name="frmOperatorList" action="ROLE.pr_automata.ROLE_P_ShowAllOperator.do?queryRole=<bean:write property='BackqueryRole'/>&queryAll=<bean:write property='BackqueryAll'/>" method="POST">
	
	<!----------Hidden Param Start---------------->
    <html:hidden property="QueryCondition[@entity='EOSOperator']/EOSOperator/operatorName" />
	<html:hidden property="QueryCondition[@entity='EOSOperator']/EOSOperator/userID" />
	<html:hidden property="QueryCondition[@entity='EOSOperator']/EOSOperatorRole/roleID" />
	 <html:hidden property="queryRole" />
	 <html:hidden property="queryAll" />
          <html:hidden property="EOSOperator/operatorID" />
         <html:hidden property="EOSRole[@name='remove']/roleID"  />
	<html:hidden property="QueryCondition[@entity='EOSOperator']/PageCond/begin" />
	<html:hidden property="QueryCondition[@entity='EOSOperator']/PageCond/length" />
	<html:hidden property="QueryCondition[@entity='EOSOperator']/PageCond/count" />
	<!----------Hidden Param END---------------->
	
	<script>
		var otherPage = new page();
		otherPage.init("frmOperatorList", "QueryCondition[@entity='EOSOperator']/PageCond/begin", "QueryCondition[@entity='EOSOperator']/PageCond/length", "QueryCondition[@entity='EOSOperator']/PageCond/count");
	</script>
	
		<table width="100%">
			<tr class="result_title">
		      <td colspan="4" width="100%"> 
		        <div align="left">用户列表</div>
		      </td>
		    </tr>
			<tr > 
				<td width="2%"></td>
				<td width="20%">用户真实姓名</td>
				<td width="20%">用户登录名</td>
				<td width="58%">用户角色</td>

			</tr>
			
			<%
			int count=0;
			String trClass = "result_content";
			int resultShowLen = 10;
			%>
			<logic:equal property="entityshow" value="1">
			<logic:iterate id="notePaper" property="QueryCondition[@entity='EOSOperator']/list[@type='EOSOperator']">		
			
				<%
				if(count%2==0)
				trClass = "result_content_";
				else
				trClass = "result_content";
				%>
				<tr class="<%=trClass%>">
					<td width="2%">
						<html:checkbox indexed="true" id="notePaper" name="list[@name='operators']/EOSOperator/operatorID" property="entity/operatorID" />
					</td>
					<td width="20%">
						<bean:write id="notePaper" property="entity/operatorName"/>
					</td>
					<td width="20%">
						<bean:write id="notePaper" property="entity/userID"/>
					</td>
					<td width="58%">
					        <bean:write id="notePaper" property="entity/roleString"/>
					</td>
				</tr>
				<%count++;%>
			</logic:iterate>
			</logic:equal>
    
	        <logic:equal property="entityshow" value="0">
			<logic:iterate id="notePaper" property="QueryCondition[@entity='EOSOperator']/list[@type='EOSOperator']">
			
			
				<%
				if(count%2==0)
				trClass = "result_content_";
				else
				trClass = "result_content";
				%>
				<tr class="<%=trClass%>">
					<td width="2%">
						<html:checkbox indexed="true" id="notePaper" name="list[@name='operators']/EOSOperator/operatorID" property="EOSOperator/operatorID" />
					</td>
					<td width="20%">
						<bean:write id="notePaper" property="EOSOperator/operatorName"/>
					</td>
					<td width="20%">
						<bean:write id="notePaper" property="EOSOperator/userID"/>
					</td>
					<td width="58%">
					      <bean:write id="notePaper" property="EOSOperator/roleString"/>
					 </td>
				</tr>
				<%count++;%>
			</logic:iterate>
			</logic:equal>
			
			<!-- 补充行数!  -->
			<%
				for(int i=count; i<resultShowLen; i++) {
					if(i%2 == 0) {
						trClass = "result_content_";
					} else {
						trClass = "result_content"; 
					}
			%>
				<tr class="<%=trClass%>">
				<td></td><td></td><td></td><td></td>
				</tr>
			<%
				}// end of for count
			%>
			
		<tr> 
          <td colspan="4" class="hcibottom" >
     	     <table border="0" width="100%" cellspacing="0" cellpadding="0">
        	   <tr> 
        	  
            <td align="left" class="hcibottom"> 
            [<A       href="JavaScript:CheckAll()">全选</A>] 
            [<A       href="JavaScript:UnCheckAll()">全取消</A>]
	    </TD>			
        	    
        	   

	                     <td align="right" class="hcibottom">              	   
	                         <script>
						if (otherPage.total > 1 && !otherPage.noCount) {
							document.write('<a href="javascript:otherPage.previousPage();">上一页</a>&nbsp;');
							document.write('<a href="javascript:otherPage.nextPage();">下一页</a>&nbsp;&nbsp;&nbsp;');
							document.write('总共' + otherPage.count + '条');
							document.write('&nbsp;&nbsp;第');
							document.write(otherPage.current + '/');
							document.write(otherPage.total + '页')
				 		}
			         </script>
			      </td>
			  </tr>
	      <tr ><td width="40%" height="20"></td></tr>
	       <tr>
	  
	       	        	   <td nowrap width="40%" height="20">
	          		<div align="left">
	          			<a href="#1" onclick="javascript:add();">
	          				<img src="/internet/theme/style0/add.gif" border="0"/>
	          			</a>
	          			<a href="#2" onclick="javascript:mod();">
	          				<img src="/internet/theme/style0/modify.gif" border="0"/>
	          			</a>
	          			<a href="#4" onclick="javascript:del()">
	          				<img src="/internet/theme/style0/delete.gif" border="0"/>
	          			</a>
					<a onclick="javascript:setPart()">
	          				<img src="/internet/images/role_addRole2Oper.gif" border="0"/>
	          			</a>	          			

	          		</div>
	          	   </td>
		           <td>
				<html:select size="1" property="EOSOperatorRole/roleID" style="width:150px" >
		    	           <option value="0" selected>--请选择角色类型--&nbsp;&nbsp;&nbsp;</option>
				   <html:options property="list/EOSRole/roleID" labelProperty="list/EOSRole/roleName"/>
		    	         </html:select>
			    </td>
	       </tr>
      	     </table>
          </td>
        </tr>
		
		</table>
	</form>
</html>

<%@ include file="/internet/commonTail.jsp" %>

<script language="javascript">
function add() {
	var submitFrm = document.frmOperatorList;
	submitFrm.action = "ROLE.pr_automata.ROLE_P_OperatorAdd.do";
	submitFrm.submit();
}

function mod() {
	var frm = document.frmOperatorList;
	if(selectedCheckboxCount(frm) != 1){
		alert("您必须选择一条记录才能执行该操作！");
		return false;
	}
	frm.action = "ROLE.pr_automata.ROLE_P_OperatorMod.do";
	frm.submit();

}

function setPart() {
	var frm = document.frmOperatorList;
	if(selectedCheckboxCount(frm) < 1){
		alert("您必须选择记录才能执行该操作！");
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
	  frm.action = "ROLE.pr_automata.ROLE_P_MulAddOperatorRole.do";
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
		if(confirm("此动作将删除掉该用户对应的所有信息,请谨慎使用,确定删除吗?")) {
			frm.target = "_parent";
			frm.action = "ROLE.pr_automata.ROLE_P_OperatorDelSubmit.do";
			frm.submit();
		} else {
			return false;
		}
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
				count++;
			}
		}
		i++;
	}
	return count;
}
</script>