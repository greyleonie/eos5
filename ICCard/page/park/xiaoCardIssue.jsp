<%@include file="/internet/common.jsp"%>

<html:html locale="true">
<head>
<title>发卡</title>


<!-- 读取物理卡号 -->
<script language="javascript">
			function getCardID(){
			var cardid;
			cardid=control.GetCardID();
			if(cardid>0){
			usersForm.elements["Card/CardID"].value=cardid;
			usersForm.submit();
			}
			}
			
			function start(){
			control.Init(0);
			//if(usersForm.info.value.length>0)
			//	alert(usersForm.info.value);			
			}
		</script>

</head>

<body class="Standard-BodyStyle" topmargin="0" leftmargin="0"
	style="overflow-y:scroll" onLoad="start()"  onbeforeunload="control.Quit()" onUnload="toUnload()">
<br>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
	<form method="post" action="ICCard.prIssueCard.issueCardDO.do" name="usersForm">
		
			<tr>
				<td width="20%" align="right" nowrap class="td2">操作说明：</td>
				<td align="left" class="td1">请把IC卡放在发卡机上,点击下面"发卡"按钮即可.</td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">车牌号：</td>
				<td align="left" class="td1"><bean:write property="CAR_CARINFO/CARNO"/></td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">厂牌型号：</td>
				<td align="left" class="td1"><bean:write property="CAR_CARINFO/MANUNO"/></td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">驾驶员：</td>
				<td align="left" class="td1"><bean:write property="CAR_CARINFO/DRIVER"/></td>
			</tr>
		
			<tr>
				<td colspan="2" height="30" valign="bottom" class="td1">
				<div align="center"><input type="button" onClick="getCardID()"
					value="发卡" Class="button_02" /></div>				</td>
			</tr>
	
		<html:hidden property="Card/CardLastSum" />
		<html:hidden	property="fid" />
		<html:hidden property="Card/CardID" /> 
		<html:hidden property="Card/CardUsingTimes" /> 
		<html:hidden property="info" /> 
	</form>
</table>

<script>
	function toUnload(){
	
	  var ofrm= window.opener.document.forms[0];
	  ofrm.action=ofrm.elements["queryaction"].value
	  ofrm.submit();
	  
	}
	
	if(usersForm.info.value.length>0)
			alert(usersForm.info.value);
</script>
</body>

<OBJECT ID="Card Control" WIDTH="" HEIGHT=""
	CLASSID="CLSID:AEA5E7AD-4A2F-44BE-88FE-0CF9A8E648D4"
	codebase="/internet/ActiveX/card.cab" name="control"> </OBJECT>
</html:html>