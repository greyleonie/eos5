<%@include file="/internet/common.jsp"%>

<html:html locale="true">
<head>
<title>����</title>


<!-- ��ȡ������ -->
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
				<td width="20%" align="right" nowrap class="td2">����˵����</td>
				<td align="left" class="td1">���IC�����ڷ�������,�������"����"��ť����.</td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">���ƺţ�</td>
				<td align="left" class="td1"><bean:write property="CAR_CARINFO/CARNO"/></td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">�����ͺţ�</td>
				<td align="left" class="td1"><bean:write property="CAR_CARINFO/MANUNO"/></td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">��ʻԱ��</td>
				<td align="left" class="td1"><bean:write property="CAR_CARINFO/DRIVER"/></td>
			</tr>
		
			<tr>
				<td colspan="2" height="30" valign="bottom" class="td1">
				<div align="center"><input type="button" onClick="getCardID()"
					value="����" Class="button_02" /></div>				</td>
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
	CLASSID="CLSID:00BCB426-4501-496F-B780-267302BE3BA3"
	codebase="/internet/ActiveX/card.cab" name="control"> </OBJECT>
</html:html>