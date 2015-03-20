<%@include file="/internet/common.jsp"%>
<script language="javascript">

	function fistlayer() {
		var i,j;
		var num;
		var layeNo=<%=  base.util.TalentContext.getValue(pageContext,null,"RoomManager/LayerNO") %>
		var layeNum=<%=  base.util.TalentContext.getValue(pageContext,null,"RoomManager/BuildingID") %>
//		alert(layeNo);
//		alert(layeNum);
		for (j=0;j<roomManager.na.options.length;j++ ) {
			if (roomManager.na.options(j).value==layeNum) {
				roomManager.na.selectedIndex =j;
				num=roomManager.na.options(j).title;
			}
		}
		//alert(num);
		//alert(roomManager.na.selectedIndex);
		if (layeNo=='-1'||layeNo==null) {
			HideLayerNO();
		}
		for (i=1;i<=num;i++ ) {
			var oOption = document.createElement("OPTION");
			roomManager.oSelect.options.add(oOption);
			oOption.innerText ="第"+ i +"层";
			oOption.value = i;
			if (layeNo==oOption.value) {
				oOption.selected="selected";
			}
		}
	}

	function select(num) {
		roomManager.oSelect.length=0;
		var i;
		for (i=1;i<=num;i++ ) {
			var oOption = document.createElement("OPTION");
			roomManager.oSelect.options.add(oOption);
			oOption.innerText = "第"+i+"层";
			oOption.value = i;
		}
	}
</script>
<body onLoad="Initial();" onUnload="cardcontrol.Quit()">
	<form method="post" name="roomManager" action="ICCard.prIssueCard.roomManagerAddDO.do">
		<html:hidden property="RoomManager/RoomManagerID" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">首页—&gt;一卡通—&gt;总管卡管理—&gt;卡新增/修改</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
		</table>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="8"></td>
			</tr>
			<tr>
				<td class="text">
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="22%">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
										<td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">总管卡管理</td>
										<td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
									</tr>
								</table>
							</td>
							<td width="60%" valign="bottom">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td align="center"></td>
									</tr>
								</table>
								<table width="100%" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
									<tr>
										<td></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="2" colspan="2"></td>
						</tr>
					</table>
					<table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#A2C4DC">
						<tr>
							<td width="12%" align="right" class="td2">物理卡号：</td>
							<td width="88%" class="td1">
								<html:text property="Card/CardID" styleClass="input" size="30" readonly="true"
									attributesText=' ValidateType="notempty" Msg="物理卡号不能为空"' />

								<input name="query" type="button" class="button_02" value="读 卡" onClick="GetCardID()"></td>
						</tr>
						<tr>
							<td align="right" class="td2">卡 类 型：</td>
							<td class="td1"><%
        int layerNO = talent.core.TalentFunctions.getInt(
                base.util.TalentContext.getValue(pageContext, null,
                        "RoomManager/LayerNO"), -1);
        if (layerNO < 0) {
        %> <input type="radio" name="RoomManager/type" value="1" onclick="ShowLayerNO()" />楼层卡 <input type="radio"
									name="RoomManager/type" value="2" checked="true" onclick="HideLayerNO()" />楼房总管卡 <%} else {
        %> <input
									type="radio" name="RoomManager/type" value="1" checked="true" onclick="ShowLayerNO()" />楼层卡 <input type="radio"
									name="RoomManager/type" value="2" onclick="HideLayerNO()" />楼房总管卡 <%}
    %></td>
						</tr>
						<tr id="cardcovernorow">
							<td align="right" class="td2">受权楼房：</td>
							<td class="td1"><SELECT onchange="select(this.options[selectedIndex].title);" name="RoomManager/BuildingID"
									ID="na">
									<logic:iterate id="Buildings" property="list[@type='Building']">
										<option value="<bean:write id="Buildings" property="Building/BuildingID"/>"
											title="<bean:write id="Buildings" property="Building/LayerNum"/>" id="getlayer">
											<bean:write id="Buildings" property="Building/BuildingName" />
										</option>
									</logic:iterate>
								</SELECT></td>
						</tr>
						<tr id="layernorow">
							<td align="right" class="td2">受权楼层：</td>
							<td class="td1"><SELECT ID="oSelect" name="RoomManager/LayerNO">

								</SELECT></td>
						</tr>
						<tr>
							<td align="right" class="td2">失效时间：</td>
							<td class="td1">
								<html:text property="RoomManager/EndTime[@pattern='yyyy-MM-dd']" styleClass="input" size="30" readonly="true"
									attributesText=' ValidateType="notempty" Msg="失效时间不能为空"' />
								<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle"
									onClick=calendar(document.forms[0].elements[ "RoomManager/EndTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")></td>
						</tr>
						<tr>
							<td align="right" class="td2">持 卡 人：</td>
							<td class="td1">
								<html:text property="RoomManager/Cardholder" styleClass="input" size="30"
									attributesText=' ValidateType="notempty" Msg="持卡人不能为空"' />
							</td>
						</tr>

					</table>
					<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
						<tr>

							<td align="center">&nbsp;</td>
						</tr>
					</table>

				</td>
			</tr>
			<tr>
				<td class="text">
					<p align="center">&nbsp;<input name="query1" type="button" class="button_02" value="保 存" onClick="save()"> <input
							name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)"></p>
				</td>
			</tr>
		</table>
	</form>
</body>
<OBJECT ID="Card Control" WIDTH="" HEIGHT="" CLASSID="CLSID:AEA5E7AD-4A2F-44BE-88FE-0CF9A8E648D4"
	codebase="/internet/ActiveX/card.cab" name="cardcontrol"> </OBJECT>
<script>

	<!-- 读取物理卡号 -->

	function GetCardID() {
		document.all["Card/CardID"].value=cardcontrol.GetCardID();
	}

	function Initial() {
		cardcontrol.Init(0);
		//是否隐藏受权层数
		if (document.all["RoomManager/LayerNO"].disabled=="") 
			document.all["layernorow"].style.display="block";
		else
			document.all["layernorow"].style.display="none";
		fistlayer();
	}

	//validater函数功能
	//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
	//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
	//function validater(frmObj)
	
  function save() {
		var frm = document.forms[0];
		if (frm.elements["RoomManager/LayerNO"].disabled=="") {
			var layernoStr=frm.elements["RoomManager/LayerNO"].value;
			if (isNaN(layernoStr) || parseFloat(layernoStr)!=parseInt(parseFloat(layernoStr)) || 0>parseFloat(layernoStr)) {
				alert("受权楼层数必须是正整数！");
				return;
			}
		}
		if (validater(frm)) {
			frm.submit();
		}
	}

	function ShowLayerNO() {
		document.forms[0].elements["RoomManager/LayerNO"].disabled="";
		document.all["layernorow"].style.display="block";
	}

	function HideLayerNO() {
		document.forms[0].elements["RoomManager/LayerNO"].disabled="ture";
		document.all["layernorow"].style.display="none";
	}
</script>