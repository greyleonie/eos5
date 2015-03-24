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

	<table border=0 cellPadding=1 cellSpacing=1 align="left" width="35%" class="result">
	
		<tr><td colspan="2" class="result_title">���û�������Ϣ��</td></tr>
		
		<tr class="query_content">
			<td width="25%">�û���¼��(����Ψһ):</td>
			<td>
				<input type="text" name="EOSOperator/userID" />
			</td>
		</tr>
		<tr class="query_content">
			<td width="25%">�û���ʵ����:</td>
			<td>
				<input type="text" name="EOSOperator/operatorName" />
			</td>
		</tr>
		
		<tr class="query_content">
			<td width="25%">��������(6-20λ):</td>
			<td>
				<html:password property="EOSOperator/password" size="20" maxlength="20" />
			</td>
		</tr>
		<tr class="query_content">
			<td width="25%">ȷ������:</td>
			<td>
				<html:password property="EOSOperator/password0" size="20" maxlength="20" />
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

<script type='text/javascript' src='/internet/scripts/check.js'></script>
<script languange="javascript">

function submit1(){
	var frm = document.frmOpAction;
	frm.target="_parent"


	if(frm.elements["EOSOperator/userID"].value == "") {
		alert("�������û���¼��");
		frm.elements["EOSOperator/userID"].focus();
		return;
	}
	if(frm.elements["EOSOperator/userID"].value.length>60) {
			alert("�û���¼�����������");
			return;
	}
	


	if(frm.elements["EOSOperator/operatorName"].value == "") {
		alert("�������û���ʵ����");
		frm.elements["EOSOperator/operatorName"].focus();
		return;
	}
	if(frm.elements["EOSOperator/operatorName"].value.length>60) {
			alert("�û���ʵ�������������");
			return;
	}
	
	if(isChinaOrNumbOrLett(frm.elements["EOSOperator/operatorName"].value)==false) {
			alert("������û�����Ϊ�Ƿ��ַ������������룡");
	                frm.elements["EOSOperator/operatorName"].focus();
			return;
	}
	
	if(frm.elements["hciPasswordTypeEOSOperator/password"].value == "") {
		alert("����������");
		frm.elements["hciPasswordTypeEOSOperator/password"].focus();
		return;
	}
	if(frm.elements["hciPasswordTypeEOSOperator/password0"].value == "") {
		alert("������ȷ������");
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
	frm.action="ROLE.pr_automata.ROLE_P_OperatorAddSubmit.do";
	frm.submit();
}
</script>