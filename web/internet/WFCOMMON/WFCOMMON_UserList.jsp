<html>
<head>
<title>用户列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %> 
<script language="JavaScript" type="text/JavaScript">
<!--
caller = window.dialogArguments;

function getOldPosi() {
	for (var i=0; i<caller.<bean:write property="formName"/>.elements['<bean:write property="selectName"/>'].options.length; i++) {
		addBottomList(caller.<bean:write property="formName"/>.elements['<bean:write property="selectName"/>'].options[i].value,caller.<bean:write property="formName"/>.elements['<bean:write property="selectName"/>'].options[i].text);
	}
}

function checkPosi(posi) {
	var rtn = true;
	for (var i=0; i<parent.bottomFrame.window.selForm.sel_posi.options.length; i++) {
		if (parent.bottomFrame.window.selForm.sel_posi.options[i].value == posi) {
			rtn = false;
			break;
		}
	} 
	return rtn;
}
		
function addBottomList(posi_id,posi_name) {
	if (!checkPosi(posi_id)) 
	{
		window.alert("该用户已存在");
		return;
	}
	if (parent.bottomFrame.window.mul.value=="true")
	{
		parent.bottomFrame.window.selForm.sel_posi.options.length = parent.bottomFrame.window.selForm.sel_posi.options.length + 1;
		parent.bottomFrame.window.selForm.sel_posi.options[parent.bottomFrame.window.selForm.sel_posi.options.length-1] = new Option(posi_name,posi_id);
	} else 
	{
		parent.bottomFrame.window.selForm.sel_posi.options.length = 1;
		parent.bottomFrame.window.selForm.sel_posi.options[0] = new Option(posi_name,posi_id);		
	}
}

//-->
</script>
</head>

<body topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" text="#000000">
<form name="userFrm" method="post" action="">
  <input type="hidden" name="PageCond/count" value="noCount">
  <html:hidden property="PageCond/length"/>
  <html:hidden property="PageCond/begin"/>  
  <script>
	var myPage = new page();
	myPage.init("userFrm", "PageCond/begin", "PageCond/length", "PageCond/count");
  </script>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
		<eos:tableTab name="用户列表" style="tab">
		<table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse">
		<tr class="tableHeadTR" align="center"> 
		  <td height="16" align="center">用户ID</td>
		  <td height="16" align="center">用户名</td>
		</tr>
		<%int currRowCount = 0;%>
		<logic:iterate id="userList" property="list"> 
		<tr class="tableContentTR" align="center" style="cursor:hand" onClick="javascript:addBottomList('<bean:write id="userList" property="PersonParticipant/ID"/>','<bean:write id="userList" property="PersonParticipant/name"/>');"> 
		  <td height="16">
			<bean:write id="userList" property="PersonParticipant/ID"/> 
		  </td>
		  <td height="16">
			<bean:write id="userList" property="PersonParticipant/name"/>
		  </td>
		</tr>
		<%currRowCount++;%>
		</logic:iterate> 
		<script>
		var rowNum = <bean:write property="list/@rowNum"/>;
		for(i=0;i<10-rowNum;i++){
			document.write("<tr class=\"result_head\">");
			document.write("<td height=\"16\">&nbsp;</td>");
			document.write("<td height=\"16\">&nbsp;</td>");
			document.write("</tr>");
		}
		</script>
		<tr class="detailLabelTD" align="center"> 
		  <td align="right" colspan="2">
			<logic:present property="PageCond/begin">
				<script>myPage.printPageCode(<%=currRowCount%>)</script>
			</logic:present>
		  </td>
		</tr>
	  </table>
	  </eos:tableTab>
	</td>
  </tr>
</table>
  </form>
</body>
</html>
