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
		<logic:present  property="QueryStudentCard/StudentID">
			<tr>
				<td width="20%" align="right" nowrap class="td2">班 级：</td>
				<td align="left" class="td1"><bean:write property="QueryStudentCard/ClassName"/></td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">姓 名：</td>
				<td align="left" class="td1"><bean:write property="QueryStudentCard/operatorname"/></td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">单 位：</td>
				<td align="left" class="td1"><bean:write property="QueryStudentCard/WorkingOrgan"/></td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">充卡金额：</td>
				<td align="left" class="td1">
				<logic:present property="Card/CardLastSum">
					<bean:write  property="Card/CardLastSum" filter='true' />
					<html:hidden property="Card/CardLastSum" />
				</logic:present> 
				<logic:notPresent property="Card/CardLastSum">
					<bean:write  property="QueryStudentCard/Deposit" filter='true' />
					<input type="hidden" name="Card/CardLastSum"	value="<bean:write  property="QueryStudentCard/Deposit" filter='true'/>">
				</logic:notPresent>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="30" valign="bottom" class="td1">
				<div align="center"><input type="button" onClick="getCardID()"
					value="发卡" Class="button_02" /></div>
				</td>
			</tr>
		</logic:present>

		<logic:present property="QueryTeacherCard/TeacherID">
			<tr>
				<td width="20%" align="right" nowrap class="td2">姓 名：</td>
				<td align="left" class="td1">
				<bean:write property="QueryTeacherCard/operatorname"/>
				</td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">职务职称：</td>
				<td align="left" class="td1"><bean:write property="QueryTeacherCard/DutyTechnicalPost"/></td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">部 门：</td>
				<td align="left" class="td1"><bean:write property="QueryTeacherCard/orgName"/></td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">充卡金额：</td>
				<td align="left" class="td1">
				<logic:present property="Card/CardLastSum">
					<bean:write  property="Card/CardLastSum" filter='true' />
					<html:hidden property="Card/CardLastSum" />
				</logic:present> 
				<logic:notPresent property="Card/CardLastSum">
					<bean:write  property="QueryTeacherCard/Money" filter='true' />
					<input type="hidden" name="Card/CardLastSum"	value="<bean:write  property="QueryTeacherCard/Money" filter='true'/>">
				</logic:notPresent></td>
			</tr>
			<tr>
				<td colspan="2" height="30" valign="bottom" class="td1">
				
				<div align="center"><input type="button" onClick="getCardID()"
					value="发卡" Class="button_02" /></div>
				</td>
			</tr>
		</logic:present>

		<logic:present property="Guest/GuestID">
			<tr>
				<td width="20%" align="right" nowrap class="td2">姓 名：</td>
				<td align="left" class="td1"><bean:write 
					property="sysTUser/operatorName" filter='true' /></td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">旧卡编号：</td>
				<td align="left" class="td1"><logic:present 
					property="sysTUser/cardID">
					<bean:write  property="sysTUser/cardID"
						filter='true' />
				</logic:present></td>
			</tr>
			<tr>
				<td width="20%" align="right" nowrap class="td2">卡内余额：</td>
				<td align="left" class="td1">
					<bean:write  property="Card/CardLastSum" filter='true' />
				<html:hidden property="Card/CardLastSum" />
				</td>
			</tr>
			<tr>
				<td colspan="2" height="30" valign="bottom"  class="td1"> 
				<div align="center"><input type="button" onClick="getCardID()"
					value="发卡" Class="button_02" /></div>
				</td>
			</tr>
		</logic:present>
		<html:hidden	property="fid" />
		<html:hidden property="Card/CardID" /> 
		<html:hidden property="Card/CardUsingTimes" /> 
		<html:hidden property="info" /> 
	</form>
</table>

<logic:present property="Card/InnerCardID">
	<center><font color="#FF0000">此人已发卡！</font></center>
</logic:present>
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