<%@ include file="/internet/common.jsp" %>
<html>
<head>
	<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css" />
</head>
<body>
<form name="frmOpAction" action="#333" method="post">

	<html:hidden property="EOSOperator/operatorID" />
	<html:hidden name="EOSOperator/isLocal" value="Y" />
	<html:hidden name="EOSOperator/status" value="1" />
	<html:hidden name="EOSOperator/modPWD" />

<!--
<table border=0 cellPadding=1 cellSpacing=1 align="center" width="100%" >
	<tr>
		<td class="tabCommon" align="center">
	
			<b>用户基本信息</b>
		</td>
		<td class="tabCommon" align="center">
			<a href='ROLE.pr_automata.ROLE_P_SetRoleForOperator.do?EOSOperator/operatorID=<bean:write property="EOSOperator/operatorID"/>'>
				<b>为用户赋角色</b>
			</a>
			
		</td>
		
		<td background="/internet/theme/style0/tag-line.gif"></td>
	</tr>
</table>
-->
	<table border=0 cellPadding=1 cellSpacing=1 align="left" width="35%" class="result">
	
		<tr><td colspan="2" class="result_title">【用户基本信息】</td></tr>
		
		<tr class="query_content">
			<td width="25%">用户登录名:</td>
			<td><bean:write property="EOSOperator/userID"/></td>
		</tr>
		<tr class="query_content">
			<td width="25%">用户真实姓名:</td>
			<td>
				<input type="text" name="EOSOperator/operatorName" value='<bean:write property="EOSOperator/operatorName"/>' />
			</td>
		</tr>
		<tr class="query_content">
			<td width="25%"><input type="checkbox" name="box" onclick="openReadonly()">修改密码</td>
			<td></td>
		</tr>
		
		<tr class="query_content">
			<td width="25%">输入密码(6-20位):</td>
			<td>
				<html:password property="EOSOperator/password" size="20" maxlength="20" readonly="true" value=""/>
			</td>
		</tr>
		<tr class="query_content">
			<td width="25%">确认密码:</td>
			<td>
				<html:password property="EOSOperator/password0" size="20" maxlength="20" readonly="true" />
			</td>
		</tr>
		
		<tr>
		<td align="center" colspan="2" class="result_bottom">
			<a href="#1" onclick="javascript:submit1();">
				<img src="/internet/theme/style0/save.gif" border="0" />
			</a>
			<a href="#2" onclick="javascript:document.frmOpAction.reset();">
				<img src="/internet/theme/style0/reset.gif" border="0" />
			</a>
			<a href="ROLE.pr_automata.ROLE_P_OperatorMain.do" target="_parent">
				<img src="/internet/theme/style0/return.gif" border="0" />
			</a>
		</td>
		</tr>
	</table>
</form>

</body>
</html>
<%@ include file="/internet/commonTail.jsp" %> 
<SCRIPT language=JavaScript src="/internet/scripts/check.js"></SCRIPT>
<script language="JavaScript">
function submit1(){
	var frm = document.frmOpAction;
	frm.target="_parent"
	
	if(frm.elements["EOSOperator/operatorName"].value == "") {
		alert("请添入用户真实姓名");
		frm.elements["EOSOperator/operatorName"].focus();
		return;
	}
	
	
	if(getTotalBytes(frm.elements["EOSOperator/operatorName"])>60) {
			alert("用户真实姓名输入过长！");
			return;
	}
	
	if(isChinaOrNumbOrLett(frm.elements["EOSOperator/operatorName"].value)==false) {
			alert("输入的用户姓名为非法字符，请重新输入！");
	                frm.elements["EOSOperator/operatorName"].focus();
			return;
	}


	if(frm.elements["box"].checked == true) {
		
		frm.elements["EOSOperator/modPWD"].value = "true";
		
		if(frm.elements["hciPasswordTypeEOSOperator/password"].value == "") {
			alert("请填入新密码");
			frm.elements["hciPasswordTypeEOSOperator/password"].focus();
			return;
		}
		if(frm.elements["hciPasswordTypeEOSOperator/password0"].value == "") {
			alert("请重复新密码");
			frm.elements["hciPasswordTypeEOSOperator/password0"].focus();
			return;
		}
		
		if(frm.elements["hciPasswordTypeEOSOperator/password"].value.length < 6 || frm.elements["hciPasswordTypeEOSOperator/password"].value.length > 20) {
			alert("密码长度请在6--20位之间");
			frm.elements["hciPasswordTypeEOSOperator/password"].focus();
			return;
		}
		if(frm.elements["hciPasswordTypeEOSOperator/password"].value != frm.elements["hciPasswordTypeEOSOperator/password0"].value) {
			alert("请确认密码一致!");
			frm.elements["hciPasswordTypeEOSOperator/password"].focus();
			return;
		}
		
		//frm.action="ROLE.pr_automata.ROLE_P_OperatorModPwdSubmit.do";
		frm.action="ROLE.pr_automata.ROLE_P_OperatorModSubmit.do";
		
	} else {
	
		frm.elements["EOSOperator/modPWD"].value = "false";
		
		if(frm.elements["EOSOperator/operatorName"].value == "<bean:write property="EOSOperator/operatorName"/>") {
			alert("没有做任何修改!");
			return false;
		}
		frm.action="ROLE.pr_automata.ROLE_P_OperatorModSubmit.do";
	}

	frm.submit();
}
</script>

<script>
function openReadonly() {
	var frm = document.frmOpAction;
	if(frm.elements["box"].checked == true) {
		
		//frm.elements["EOSOperator/operatorName"].disabled = true;
		
		frm.elements["hciPasswordTypeEOSOperator/password"].readOnly = false;
		frm.elements["hciPasswordTypeEOSOperator/password0"].readOnly = false;
		frm.elements["hciPasswordTypeEOSOperator/password"].focus();
		
		//frm.elements["EOSOperator/operatorName"].value = '<bean:write property="EOSOperator/operatorName"/>';
	
	} else {
	
		//frm.elements["EOSOperator/operatorName"].disabled = false;
		frm.elements["EOSOperator/operatorName"].focus();
		
		
		frm.elements["hciPasswordTypeEOSOperator/password"].readOnly = true;
		frm.elements["hciPasswordTypeEOSOperator/password0"].readOnly = true;
		
		
		frm.elements["hciPasswordTypeEOSOperator/password"].value = "";
		frm.elements["hciPasswordTypeEOSOperator/password0"].value = "";
		
	}
}
</script>