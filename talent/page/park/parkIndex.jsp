<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>党校信息一体化平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<style type="text/css">
<!--
.STYLE2 {color: #FF0000; font-weight: bold; font-size: 52px; font-style: italic; }
.STYLE3 {color: #FF0000; font-weight: bold; font-size: 24px; font-style: italic; }
-->
</style>

<body topmargin="0" bottommargin="0">


	<table width="1024" height="768" align="center" border="0" cellpadding="0" cellspacing="0" topmargin="0" bgcolor="#CAE2F0">
		<tr>
		 <td id="top"></td>
		</tr>
		<tr>
		 <td id="time"></td>
		</tr>
		<tr>
		 <td height="300" id="display"></td>
		</tr>
	</table> 
	<form name="parkForm" action="/parkDispatcher" method="post" target="parkdata">
	 
	</form>
    
</body>
</html>

<script>
function showCurrentTime() {
	var curDate = new Date();
	var dateStr = curDate.toLocaleString();
	
	if(document.getElementById("clock")) {
		document.getElementById("clock").innerHTML = dateStr;
	}
	setTimeout("showCurrentTime()",1000);
}

function refreshIdle() {
	document.forms[0].submit();
	
	setTimeout("refreshIdle()",2*60*1000);

}

refreshIdle();

</script>