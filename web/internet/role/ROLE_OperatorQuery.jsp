<%@ include file="/internet/eosapp/hciHead.jsp" %>
<html>
<head>
<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css"/>
</head>
<SCRIPT language=JavaScript src="/internet/scripts/check.js"></SCRIPT>
<body>
	<form name="queryFrm" action="#3" method="post">
	<html:hidden name="QueryCondition[@entity='EOSOperator']/EOSOperator/operatorName" property="EOSOperator/operatorName"/>
	<html:hidden name="QueryCondition[@entity='EOSOperator']/EOSOperator/userID" property="EOSOperator/userID"/>
	<html:hidden name="QueryCondition[@entity='EOSOperator']/EOSOperatorRole/roleID" property="EOSOperatorRole/roleID"/>
		<html:hidden property="queryAll" />
		<html:hidden property="queryRole" />
	  <table class="result" border="0" width="100%">
		  <tr class="result_content_">
		  	<td align="center">【查询用户】</td>
		    <td>
		    	用户真实姓名:&nbsp;<input type="text" name="EOSOperator/operatorName" >
		    </td>
		    <td>
		        用户登录名:&nbsp;<input type="text" name="EOSOperator/userID" >
		    </td>


		   </tr>
		   		  <tr class="result_content_">
		  	<td align="center"></td>
		    <td>
		    	用户所属角色:		   
			<html:select size="1" property="EOSOperatorRole/roleID" style="width:150px" >
		    	<option value="0" selected>--请选择类型--&nbsp;&nbsp;&nbsp;</option>
				<option value="9999">没有分配角色
				<html:options property="list/EOSRole/roleID" labelProperty="list/EOSRole/roleName"/>
		   	</html:select>
		    </td>


		    <td>
			    <a href="#1" onclick="javascript:querysubmit()">
			    	<img src="/internet/theme/style0/query.gif" border="0"/> 
			    </a>
			    <a href="#2" onclick="javascript:document.queryFrm.reset();">
			    	<img src="/internet/theme/style0/reset.gif" border="0"/> 
			    </a>
		    </td>
		   </tr>
	  </table>
	</form>
</body>
<iframe name="param" src="ROLE.pr_automata.ROLE_P_ShowAllOperator.do?queryRole=0" frameborder="0" width="100%" height="400" marginwidth="0" marginheight="0" scrolling="no" align="left"></iframe>
</html>

<script language="JavaScript">
function querysubmit(){
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
}
</script>
<%@include file="/internet/hciTail.jsp" %>