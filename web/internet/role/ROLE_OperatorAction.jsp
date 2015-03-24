<%@ include file="/internet/eosapp/hciHead.jsp" %>
<html>
<head>
	<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css" />
</head>
<body>
<form name="frmOpAction" action="#333" method="post">
	<%String strFlag = request.getParameter("command");%>
	<html:hidden property="EOSOperator/operatorID" />
	<html:hidden name="EOSOperator/isLocal" value="Y" />
	<html:hidden name="EOSOperator/status" value="1" />

<%if(strFlag.equals("mod")) {%>
<table border=0 cellPadding=1 cellSpacing=1 align="center" width="100%" >
	<tr>
		<td class="tabCommon" align="center">
			<!--<a href='ROLE.pr_automata.ROLE_P_ShowOperator.do?EOSOperator/operatorID=<bean:write property="EOSOperator/operatorID"/>' ><b>用户基本信息</b></a>-->
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
<%}%>
	<table border=0 cellPadding=1 cellSpacing=1 align="left" width="35%" class="result">
	
		<tr><td colspan="2" class="result_title">【用户基本信息】</td></tr>
		
		<tr class="query_content">
			<td width="25%">用户登录名(必须唯一):</td>
			<td>
			<%if(strFlag.equals("mod")) {%>
				<bean:write property="EOSOperator/userID"/>
			<%} else {%>
				<input type="text" name="EOSOperator/userID" />
			<%}%>
			</td>
		</tr>
		<tr class="query_content">
			<td width="25%">用户真实姓名:</td>
			<td>
				<input type="text" name="EOSOperator/operatorName" value="<bean:write property="EOSOperator/operatorName"/>" />
				<%if(strFlag.equals("mod")) {%>
					<font color="red">(修改密码时,不能修改该项.)</font>
				<%}%>
			</td>
		</tr>
		
		<!--因为增加和修改内容相近,故使用同一页面做处理-->
		<%if(strFlag.equals("mod")) {%>
			<tr class="query_content">
				<td width="25%"><input type="checkbox" name="box" onclick="openReadonly()">修改密码</td>
				<td>
				</td>
			</tr>
			<tr class="query_content">
			<td width="25%">输入旧密码:</td>
			<td>
				<html:password property="EOSOperator/oldpassword" size="20" maxlength="20" readonly="true" />
			</td>
		</tr>
		<%}%>
		
		<tr class="query_content">
			<td width="25%">输入密码(6-20位):</td>
			<td>
				<%if(strFlag.equals("mod")){%>
					<html:password property="EOSOperator/password" size="20" maxlength="20" readonly="true" value=""/>
				<%} else {%>
					<html:password property="EOSOperator/password" size="20" maxlength="20" />
				<%}%>
			</td>
		</tr>
		<tr class="query_content">
			<td width="25%">确认密码:</td>
			<td>
				<%if(strFlag.equals("mod")){%>
					<html:password property="EOSOperator/password0" size="20" maxlength="20" readonly="true" />
				<%} else {%>
					<html:password property="EOSOperator/password0" size="20" maxlength="20" />
				<%}%>
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
			<a href="javascript:history.go(-1)" target="_parent">
				<img src="/internet/theme/style0/return.gif" border="0" />
			</a>
		</td>
		</tr>
	</table>
</form>

</body>
</html>
<%@include file="/internet/hciTail.jsp" %>

<script language="JavaScript">
function submit1(){
	var frm = document.frmOpAction;
	frm.target="_parent"
	
	if(frm.elements["EOSOperator/operatorName"].value == "") {
		alert("请添入用户真实姓名");
		frm.elements["EOSOperator/operatorName"].focus();
		return;
	}
	
<%if(strFlag.equals("add")) {%>
	if(frm.elements["hciPasswordTypeEOSOperator/password"].value == "") {
		alert("请填入密码");
		frm.elements["hciPasswordTypeEOSOperator/password"].focus();
		return;
	}
	if(frm.elements["hciPasswordTypeEOSOperator/password0"].value == "") {
		alert("请填?朊苈?");
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
	
	frm.action="ROLE.pr_automata.ROLE_P_OperatorAddSubmit.do";
	
<%} else {%>
	if(frm.elements["box"].checked == true) {
		if(frm.elements["hciPasswordTypeEOSOperator/oldpassword"].value == "") {
			alert("请填入旧密码");
			frm.elements["hciPasswordTypeEOSOperator/oldpassword"].focus();
			return;
		}
		
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
		
		frm.action="ROLE.pr_automata.ROLE_P_OperatorModPwdSubmit.do";
		
	} else {
		if(frm.elements["EOSOperator/operatorName"].value == <bean:write property="EOSOperator/operatorName"/>) {
			alert("没有做任何修改,不能提交请求.");
			return false;
		}
		frm.action="ROLE.pr_automata.ROLE_P_OperatorModSubmit.do";
	}

<%}%>

	frm.submit();
}
</script>

<script>
function openReadonly() {
	var frm = document.frmOpAction;
	if(frm.elements["box"].checked == true) {
		
		frm.elements["EOSOperator/operatorName"].disabled = true;
		frm.elements["hciPasswordTypeEOSOperator/oldpassword"].readOnly = false;
		frm.elements["hciPasswordTypeEOSOperator/password"].readOnly = false;
		frm.elements["hciPasswordTypeEOSOperator/password0"].readOnly = false;
		frm.elements["hciPasswordTypeEOSOperator/oldpassword"].focus();
		
		frm.elements["EOSOperator/operatorName"].value = '<bean:write property="EOSOperator/operatorName"/>';
	
	} else {
	
		frm.elements["EOSOperator/operatorName"].disabled = false;
		frm.elements["EOSOperator/operatorName"].focus();
		
		frm.elements["hciPasswordTypeEOSOperator/oldpassword"].readOnly = true;
		frm.elements["hciPasswordTypeEOSOperator/password"].readOnly = true;
		frm.elements["hciPasswordTypeEOSOperator/password0"].readOnly = true;
		
		frm.elements["hciPasswordTypeEOSOperator/oldpassword"].value = "";
		frm.elements["hciPasswordTypeEOSOperator/password"].value = "";
		frm.elements["hciPasswordTypeEOSOperator/password0"].value = "";
		
	}
}
</script>