<%@ include file="/internet/eosapp/hciHead.jsp" %>
<html>
<head>
	<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css" />
</head>
<body>


	<form name="frmModOp" action="#333" method="post">
	<html:hidden name="EOSOperator/isLocal" value="Y" />
	<html:hidden name="EOSOperator/status" value="1" />
	<html:hidden property="EOSOperator/operatorID" />

<table border=0 cellPadding=1 cellSpacing=1 align="center" width="100%" >
	<tr>
		<td class="tabCommon" align="center">
			<!--<a href='ROLE.pr_automata.ROLE_P_ShowOperator.do?EOSOperator/operatorID=<bean:write property="EOSOperator/operatorID"/>' ><b>�û�������Ϣ</b></a>-->
			<b>�û�������Ϣ</b>
		</td>
		<td class="tabCommon" align="center">
			<a href='ROLE.pr_automata.ROLE_P_SetRoleForOperator.do?EOSOperator/operatorID=<bean:write property="EOSOperator/operatorID"/>'>
				<b>Ϊ�û�����ɫ</b>
			</a>
			
		</td>
		
		<td background="/internet/theme/style0/tag-line.gif"></td>
	</tr>
</table>

		<table border=0 cellPadding=1 cellSpacing=1 align="left" width="35%" class="result">
			<tr>
				<td colspan="2" class="result_title">���û�������Ϣ��</td>
			</tr>
			
			<tr class="query_content">
				<td width="25%">�û���¼��(����Ψһ)��</td>
				<td>
					<bean:write property="EOSOperator/userID"/>
				</td>
			</tr>
			<tr class="query_content">
				<td width="25%">�û���ʵ������</td>
				<td>
					<input type="text" name="EOSOperator/operatorName" value="<bean:write property="EOSOperator/operatorName"/>"/>
					<font color="red"></font>
				</td>
			</tr>
			<tr class="query_content">
				<td width="25%"><input type="checkbox" name="box" onclick="openReadonly()">�޸�����</td>
				<td>
				</td>
			</tr>
			<tr class="query_content">
			<td width="25%">���������:</td>
			<td>
				<html:password property="EOSOperator/oldpassword" size="20" maxlength="20" readonly="true" />
			</td>
			</tr>
			
			<tr class="query_content">
			<td width="25%">��������(6-20λ):</td>
			<td>
				<html:password property="EOSOperator/password" size="20" maxlength="20" readonly="true" value="" />
			</td>
		</tr>
		<tr class="query_content">
			<td width="25%">ȷ������:</td>
			<td>
				<html:password property="EOSOperator/password0" size="20" maxlength="20" readonly="true" />
			</td>
		</tr>
		
			<tr>
			<td align="center" colspan="2" class="result_bottom">
				<a href="#1" onclick="javascript:submit1();">
					<img src="/internet/theme/style0/save.gif" border="0" />
				</a>
				<a href="#2" onclick="javascript:document.frmModOp.reset();">
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
<%@include file="/internet/hciTail.jsp" %>
<script language="JavaScript">
function submit1(){
	var frm = document.frmModOp;
	frm.target="_parent"
	
	if(frm.elements["box"].checked == true) {
		if(frm.elements["hciPasswordTypeEOSOperator/oldpassword"].value == "") {
			alert("�����������");
			frm.elements["hciPasswordTypeEOSOperator/oldpassword"].focus();
			return;
		}
		
		if(frm.elements["hciPasswordTypeEOSOperator/password"].value == "") {
			alert("������������");
			frm.elements["hciPasswordTypeEOSOperator/password"].focus();
			return;
		}
		if(frm.elements["hciPasswordTypeEOSOperator/password0"].value == "") {
			alert("���ظ�������");
			frm.elements["hciPasswordTypeEOSOperator/password0"].focus();
			return;
		}
		
		if(frm.elements["hciPasswordTypeEOSOperator/password"].value.length < 6 || frm.elements["hciPasswordTypeEOSOperator/password"].value.length > 20) {
			alert("���볤������6--20λ֮��");
			frm.elements["hciPasswordTypeEOSOperator/password"].focus();
			return;
		}
		if(frm.elements["hciPasswordTypeEOSOperator/password"].value != frm.elements["hciPasswordTypeEOSOperator/password0"].value) {
			alert("��ȷ������һ��!");
			frm.elements["hciPasswordTypeEOSOperator/password"].focus();
			return;
		}
		
		frm.action="ROLE.pr_automata.ROLE_P_OperatorModPwdSubmit.do";
		
	} else {
		if(frm.elements["EOSOperator/operatorName"].value == <bean:write property="EOSOperator/operatorName"/>) {
			alert("û�����κ��޸�,�����ύ����.");
			return false;
		}
		frm.action="ROLE.pr_automata.ROLE_P_OperatorModSubmit.do";
	}
	
	frm.submit();
}
</script>
<script>
function openReadonly() {
	var frm = document.frmModOp;
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