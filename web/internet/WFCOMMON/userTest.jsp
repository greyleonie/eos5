<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
function doSubmit(selectObj){
	if(selectObj != null){
		alert(selectObj.options.length);
	}
	for(i=0;i<selectObj.options.length;i++){
		alert(selectObj.options[i].value + '##' + selectObj.options[i].text);
	}
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="userForm" method="post" action="">
  <select name="userSelect" size="10" multiple>
  <option value="11">胰岛素</option>
  </select>
  <input type="button" name="btUser" value="用户选择" onclick="MM_openBrWindow('WFCOMMON.pr_automata.WFCOMMON_P_OpenUserSel.do?formName=userForm&selectName=userSelect&needMultiple=true','','toolbar=no,location=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=500,height=500,left=250,top=100')">
  <input type="button" name="bt" value="OK" onclick="doSubmit(document.userForm.userSelect);">
</form>
</body>
</html>
