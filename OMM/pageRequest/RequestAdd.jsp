<%@include file="/internet/common.jsp"%>
<%
java.util.Date date = new java.util.Date();
date.setHours(date.getHours()+8);
if(date.getHours()>24){date.setHours(0);date.setDate(date.getDate()+1);}
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.text.SimpleDateFormat stf = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
String curdate = sdf.format(date);
String reqSn="REQ"+stf.format(date);
%>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<script>

	var i=1

	function insertFile() {
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
		C1.innerHTML = "<input  type='file' name='file' class='input' size='30'>&nbsp;<input class='button_02' type='button' value='删 除' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'>";
	}
</script>
<body>
	<form method="post" name="myform" action="OMM.prRequest.prRequestAddDo.do" enctype="multipart/form-data">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">运维管理—&gt;运维申请—&gt;新增运维申请</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5">
					<html:hidden property="OMM_Request/_order/col1/field" />
					<html:hidden property="OMM_Request/_order/col1/asc" />
					<html:hidden property="temptype" />
					<html:hidden property="PageCond/begin" />
					<html:hidden property="PageCond/length" />
					<html:hidden property="WFWorkItem/submitType" />
					<html:hidden property="WFWorkItem/workItemID" />
					<html:hidden property="WFWorkItem/processInstID" />
					<html:hidden property="WFWorkItem/processDefID" />
					<html:hidden property="WFWorkItem/processDefName" />
					<html:hidden property="WFWorkItem/activityDefID" />
					<html:hidden property="WFWorkItem/activityInstID" />
					<html:hidden property="OMM_Request/ProposerID" />
					<html:hidden property="OMM_Request/DeviceID" />
					<html:hidden property="OMM_Request/BuildingID" />
					<html:hidden property="OMM_Request/RoomTypeId" />
					<html:hidden property="OMM_Request/RoomID" />
					<html:hidden property="UserName" />
					<input type="hidden" name="SetTypeList/type[@num='0']"  value="1"/>
					<input type="hidden" name="SetTypeList/type[@num='1']"   value="2"/>
					<input type="hidden" name="SetTypeList/type[@num='2']"   value="3"/>	
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse">
			<tr>
				<td></td>
			</tr>
			<tr>
				<td height="100%" valign="top" nowrap bgcolor="#FFFFFF" style="border:1px #000000 solid;border-top:none">
					<table width="96%" height="20" border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
						<tr>
							<td height="10"></td>
						</tr>
					</table>
					<!------------------------------  文头  ----------------------------->
					<table width="96%" height="20" border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
						<tr>
							<td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">广州市委党校IT运维申请单</td>
						</tr>
					</table>
					<!------------------------------  表单意见  ----------------------------->
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr>
							<td width="15%" align="center" nowrap class="td2">申请编号</td>
							<td width="35%"  1align="center" nowrap class="td1"><%=reqSn %><input type="hidden" name="OMM_Request/ReqSN" value="<%=reqSn %>"/></td>
							<td width="15%" align="center" nowrap class="td2">请求状态</td>
							<td width="35%"  1align="center" nowrap class="td1">草稿<input type="hidden" name="OMM_Request/ReqState" value="1"/></td>
						</tr>
						<tr>
							<td width="15%" align="center" nowrap class="td2">创建时间</td>
							<td width="35%"  1align="center" nowrap class="td1"><%=curdate %><input type="hidden" name="OMM_Request/CreateTime" value="<%=curdate %>"/></td>
							<td width="15%" align="center" nowrap class="td2">紧急程度</td>
							<td width="35%"  1align="center" nowrap class="td1">
								<SELECT name="OMM_Request/Urgency" style="width: 152px;">
									<OPTION value="1" selected="selected">一般</OPTION>
									<OPTION value="2">紧急</OPTION>
									<OPTION value="3">特急</OPTION>
								</SELECT>
							</td>
						</tr>
						<tr>
							<td width="15%" align="center" nowrap class="td2">请求类型</td>
							<td width="35%" 1align="center" nowrap class="td1" style="border:solid 1px red;">
							<SELECT name="OMM_Request/ReqTypeID" onchange="GetTitle(this)" style="width: 152px;">
									<OPTION value="-1">请选择请求类型</OPTION>
									<logic:iterate id="item" property="list[@type='OMM_ReqType']">
										<option value='<bean:write id="item" property="OMM_ReqType/TypeID"/>'>
											<bean:write id="item" property="OMM_ReqType/TypeName" />
										</option>
									</logic:iterate>
								</SELECT></td>
							<td width="15%" align="center" nowrap class="td2">优先级别</td>
							<td width="35%"  1align="center" nowrap class="td1">
								<SELECT name="selPriorityLevel" disabled="disabled" style="width: 152px;">
									<OPTION value="1">低</OPTION>
									<OPTION value="2" selected="selected">中</OPTION>
									<OPTION value="3">高</OPTION>
								</SELECT>
								<input type="hidden" name="OMM_Request/PriorityLevel" value="2"/>
							</td>
						</tr>
						<tr>
							<td width="15%" align="center" nowrap class="td2">申报地点</td>
							<td width="35%" 1align="center" nowrap class="td1" style="border:solid 1px red;"><input type="text" name="RoomName" readonly="readonly" width="80px" /> <input type="button" name="QueryRoomInfo"
									value="选择" class="button_02" onclick="GetRoomInfo(this)" /><input
									type="hidden" name="RoomId" /></td>
							<td width="15%" align="center" nowrap class="td2">故障时间</td>
							<td width="35%"  1align="center" nowrap class="td1">
								<input type="text" name="OMM_Request/DownTime" readonly="readonly" width="80px"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["OMM_Request/DownTime"],"yyyy-MM-dd")>
							</td>
						</tr>
						<tr>
							<td align="center" nowrap class="td2">标题</td>
							<td 1align="center" nowrap class="td1" colspan="3" style="border:solid 1px red;"><span class="text_red"><SELECT name="OMM_Request/Title" style="width: 710px; font-size:16px;line-height: 100px;" onkeydown="catch_keydown(this);"
									onkeypress="catch_press(this);">
									<OPTION value="-1"></OPTION>
								</SELECT>提示：可直接在选项中编辑内容</span></td>
						</tr>
						<tr>
							<td align="center" nowrap class="td2">故障描述</td>
							<td 1align="center" nowrap class="td1" colspan="3"><TEXTAREA style="width: 100%"  name="OMM_Request/Description" rows="5"></TEXTAREA></td>
						</tr>
					</table>
					<BR>
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr>
							<td width="10%" align="center" nowrap class="td2">选择</td>
							<td width="30%" align="center" nowrap class="td2">使用人</td>
							<td width="30%" align="center" nowrap class="td2">类型</td>
							<td width="30%" align="center" nowrap class="td2">资产名称</td>
						</tr>
					</table>
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="DevList">
						<tr>
							<td align="center" nowrap class="td1" colspan="3"><font color="red">没有运维设备,请获取列表!</font></td>
						</tr>
					</table>
					<BR>
					<DIV style="display: none;">
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1">
						<tr>
							<td width="15%" align="left" nowrap class="td1" colspan="4" style="background-color: white;">知识库关键字:
								<input type="text" name="keyWord" size="81" />&nbsp;&nbsp;
								<input type="button" name="btnSearch" value="查询" onclick="GetKnow(this);"/>&nbsp;&nbsp;
								<span class="text_red">根据知识库关键可查询相关故障的处理方法</span>
							</td>
						</tr>
					</table>
					<BR>
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr>
							<td width="10%" align="center" nowrap class="td2">知识编号</td>
							<td width="50%" align="center" nowrap class="td2">标题</td>
							<td width="20%" align="center" nowrap class="td2">知识类别</td>
							<td width="20%" align="center" nowrap class="td2">详细信息</td>
						</tr>
					</table>
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="knowledge">
					</table>
					<BR></DIV>
					<!------------------------------  流转  ----------------------------->
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
						<tr>
							<td width="19%" align="right" nowrap colspan="2" bgcolor="#FFFFFF"><iframe
									src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0"
									name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20"
									scrolling="auto"></iframe></td>
						</tr>
						<tr>
							<td width="19%" align="right" nowrap class="td2">下环节流转选择：</td>
							<td width="81%" class="td1" style="border:solid 1px red;"><%
        int i = 0;
        %>
								<logic:iterate id="resultset" property="list[@type='nextnodes']">
									<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>'
										nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%>>
									<bean:write id="resultset" property="Activity/actDefName" />&nbsp;
			<%
				i++;
			%>
								</logic:iterate>
							</td>
						</tr>
						<tr id="nextNode" style="display: none;">
							<td width="19%" align="right" nowrap class="td2">下环节人员选择：</td>
							<td class="td1" style="border:solid 1px red;">
								<html:text property="OMM_Request/nextParticipantName"
									attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
								<html:hidden property="OMM_Request/nextParticipantId" />
								<input name="select" type="button" class="button_02" value="选 择"
									onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','OMM_Request/nextParticipantName','OMM_Request/nextParticipantId')">
								<workflow:AppointActivity workItemID="@WFWorkItem/workItemID" maxPartiNum="10" buttonName="选择..."
									isSelOrg="false" isSelRole="false" isSelPerson="true" uselessDisplay="true" />
							</td>
						</tr>				
					</table>
					<table width="96%" height="100" border="0" align="center" cellpadding="0" cellspacing="1" id="spacedown">
						<tr>
							<td></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
			</tr>
			</td>
		</table>
		<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center"><input name="wfsend" type="button" class="button_02" value="发 送" onClick="send()"> <!-- <input
						name="wfsave" type="button" class="button_02" value="保 存" onClick="save()"> --> <input name="wfcancel" type="button"
						class="button_02" value="返 回" onClick="history.back()"></td>
			</tr>
		</table>
	</form>
</body>
<script>

	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>
<script>
var knowCheckboxIndex = 0;
function GetKnow(obj){
	var keyWord=obj.value;
		knowCheckboxIndex=0;
		document.getElementById('knowledge').innerText="";
		var sub = new HiddenSubmit('');
			sub.add("keyWord", keyWord);
			if (sub.submit()) {
				if (sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo").length<1) {
					flag=false;
				} else{
					flag=true;
					for (var i=0;i<sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo").length;i++) {
						var deviceId=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/DeviceID");
						var captName=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/CAPTNAME");
						var operatorName=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/operatorName");
						var typeName=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/TypeName");
						var userId=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/UserID");
						insertDetail(deviceId,captName,operatorName,typeName,userId,i);
					}
				}
			}
}

var flag=false;
 function catch_keydown(sel){
	switch(event.keyCode)
	{
		case 13:
			//Enter;
			sel.options[sel.length] = new Option("","",false,true);
			event.returnValue = false;
			break;
		case 27:
			//Esc;
			alert("text:" + sel.options[sel.selectedIndex].text + ", value:" + sel.options[sel.selectedIndex].value + ";");
			event.returnValue = false;
			break;
		case 46:
			//Delete;
			if(confirm("确定删除当前选项吗?"))
			{
				sel.options[sel.selectedIndex] = null;
				if(sel.length>0)
				{
					sel.options[0].selected = true;
				}
			}
			event.returnValue = false;
			break;
		case 8:
			//Back Space;
			var s = sel.options[sel.selectedIndex].text;
			sel.options[sel.selectedIndex].text = s.substr(0,s.length-1);
			event.returnValue = false;
			break;
	}	
}

	function catch_press(sel){
	try{
		sel.options[sel.selectedIndex].text = sel.options[sel.selectedIndex].text + String.fromCharCode(event.keyCode);
		sel.options[sel.selectedIndex].value=sel.options[sel.selectedIndex].text;
		event.returnValue = false;
		}catch(e){}
	}

	function GetRoomInfo(obj){
	    	var loc="OMM.prRequest.prRoomList.do";
		    window.open(loc,"","width=700px,height=380,top=200,left=50,status=yes,scroll=yes");
	}
	
	function SetValue(roomTypeId,roomId,buildingId,buildingName,roomName,userId,userName){
		document.getElementById('OMM_Request/RoomTypeId').value=roomTypeId;
		document.getElementById('OMM_Request/BuildingID').value=buildingId;
		document.getElementById('OMM_Request/RoomID').value=roomId;
		if(userId=='null'){
			userId=-1;
		}
		document.getElementById('OMM_Request/ProposerID').value=userId;
		document.getElementById('UserName').value=userName;
		document.getElementById('RoomId').value=roomId;
		document.getElementById('RoomName').value=buildingName+roomName;
		GetDevList(roomId);
	}

	function GetTitle(obj){
		var objTitle=document.getElementById('OMM_Request/Title');
		for (var i = objTitle.options.length; i > -1 ; i--) {
			objTitle.options.remove(i);
		}
		var varItem = new Option('', -1);
		objTitle.options.add(varItem);
		var reqTypeId=obj.value;
		if (reqTypeId!=-1) {
			var sub = new HiddenSubmit('OMM.bizRequest.bizGetTitleList');
			sub.add("TitleList/ReqTypeID/criteria/value", reqTypeId);
			if (sub.submit()) {
				if (sub.getValues("root/data/list[@type='TitleList']/TitleList").length<1) {
				} else{
					for (var i=0;i<sub.getValues("root/data/list[@type='TitleList']/TitleList").length;i++) {
						var value=sub.getValues("root/data/list[@type='TitleList']/TitleList[@rowNum='"+i+"']/Title");
						var tempItem = new Option(value, value);
						objTitle.options.add(tempItem);
					}
				}
			}
		}
	}

	var checkboxIndex = 0;
	function GetDevList(roomId){
		checkboxIndex=0;
		document.getElementById('DevList').innerText="";
		var sub = new HiddenSubmit('OMM.bizRequest.bizGetDevLogsInfo');
			sub.add("DevLogsInfo/RoomID/criteria/value", roomId);
			sub.add("DevLogsInfo/EndTime/criteria/operator", 'match');
			sub.add("DevLogsInfo/EndTime/criteria/value", 'NULL');
			if (sub.submit()) {
				if (sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo").length<1) {
					flag=false;
				} else{
					flag=true;
					for (var i=0;i<sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo").length;i++) {
						var deviceId=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/DeviceID");
						var captName=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/CAPTNAME");
						var operatorName=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/operatorName");
						var typeName=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/TypeName");
						var userId=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/UserID");
						insertDetail(deviceId,captName,operatorName,typeName,userId,i);
					}
				}
			}
	}
	
	
	
	 // 增加明细表记录
	function insertDetail(deviceId,captName,operatorName,typeName,userId,index) {
		
		var objTable = document.all['DevList']; // 明细表
		var nameArray = new Array();  //要显示字段名称
		var i = 0;
		nameArray[i++] = "deviceId"; 
		nameArray[i++] = "operatorName"; 
		nameArray[i++] = "typeName"; 
		nameArray[i++] = "captName";
		addRecordToTable(objTable, nameArray,deviceId,captName,operatorName,typeName,userId,index);	
	}
	  //递增索引号
	function addRecordToTable(objTable, nameArray,deviceId,captName,operatorName,typeName,userId,index) {
		
		var formHTML = "";
		var bodyHTML = objTable.innerHTML;
		bodyHTML = bodyHTML.replace("<TBODY>", "");
		bodyHTML = bodyHTML.replace("</TBODY>", "");
		formHTML += "<table width =\"96%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\"  bgcolor=\"#A2C4DC\" id=\"DevList\">";
		formHTML += bodyHTML;
		formHTML += "<tr class=\"td1\" id=\"row_" + checkboxIndex + "\" onClick='changeTRBgColor(this)'>";
		for (var i=0; i<nameArray.length; i++) {
			var colHTML = "";
			switch (i) {
			case 0: 
				colHTML += "<td width=\"10%\" align=\"center\" nowrap class=\"td1\">";
				if(index==0){
					colHTML += "<input type='radio' name=\"DeviceID\" value='"+deviceId+","+userId+"' checked=\"checked\" />";
				}else{
				colHTML += "<input type='radio' name=\"DeviceID\" value='"+deviceId+","+userId+"' />";}
				break;
			case 2: 
				colHTML += "<td width=\"30%\" align=\"center\" nowrap class=\"td1\">";
				if(document.getElementById('UserName').value==''){
					colHTML += typeName;
				}else{
					colHTML += document.getElementById('UserName').value;
				}
				
				break;
		 	case 3: //操作
				colHTML += "<td width=\"30%\" align=\"center\" nowrap class=\"td1\">";
				if(captName==''){captName='<font color="red">该设备不属于固定资产范围</font>';}
				colHTML += captName;
				break;	
			default:
				colHTML += "<td width=\"30%\" align=\"center\" nowrap class=\"td1\">";
				colHTML += operatorName;
				break;
			}
			
			colHTML += "</td>";
			formHTML += colHTML;		
		}
		formHTML += "</tr>";
		formHTML += "</table>";  
		objTable.outerHTML = formHTML;
		var objTable = document.all['DevList']; // 明细表
		
		// 递增 checkboxIndex
		checkboxIndex ++ ;
	}
	////////////////////////////////////////////////////////////////

	function GetRoomID(obj) {
		var objRoomId=document.getElementById('RoomId');
		for (var i = objRoomId.options.length; i > -1 ; i--) {
			objRoomId.options.remove(i);
		}
		var varItem = new Option('请选择房号', -1);
		objRoomId.options.add(varItem);
		var layerNo=obj.value;
		var buildingId=document.getElementById('BuildingID').value;
		if (layerNo!=-1) {
			var sub = new HiddenSubmit('OMM.bizRequest.bizGetRoom');
			sub.add("Room/LayerNO/criteria/value", layerNo);
			sub.add("Room/BuildingID/criteria/value", buildingId);
			if (sub.submit()) {
				if (sub.getValues("root/data/list[@type='Room']/Room").length<1) {
					alert("房号查询错误，请重新查询！");
				} else{
					for (var i=0;i<sub.getValues("root/data/list[@type='Room']/Room").length;i++) {
						var value=sub.getValues("root/data/list[@type='Room']/Room[@rowNum='"+i+"']/RoomID");
						var option=sub.getValues("root/data/list[@type='Room']/Room[@rowNum='"+i+"']/RoomName");
						var tempItem = new Option(option, value);
						objRoomId.options.add(tempItem);
					}
				}
			}
		}
	}

	function GetLayerNo(obj) {
		var objLayerNo=document.getElementById('LayerNo');
		for (var i = objLayerNo.options.length; i > -1 ; i--) {
			objLayerNo.options.remove(i);
		}
		var varItem = new Option('请选择层号', -1);
		objLayerNo.options.add(varItem);
		var buildingID=obj.value;
		if (buildingID!=-1) {
			var sub = new HiddenSubmit('OMM.bizRequest.bizGetLayerNo');
			sub.add("LayerNo/BuildingID/criteria/value", buildingID);
			if (sub.submit()) {
				if (sub.getValues("root/data/list[@type='LayerNo']/LayerNo").length<1) {
					alert("层号查询错误，请重新查询！");
				} else{
					for (var i=0;i<sub.getValues("root/data/list[@type='LayerNo']/LayerNo").length;i++) {
						var no=sub.getValues("root/data/list[@type='LayerNo']/LayerNo[@rowNum='"+i+"']/LayerNO");
						var tempItem = new Option(no, no);
						objLayerNo.options.add(tempItem);
					}
				}
			}
		}
	}

	function save() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "0";
		if (validater(frm)) {
			getWFData(frm);
			var temp=document.getElementById('OMM_Request/ReqTypeID').value;
			if(temp==-1){
				alert("请选择请求类型!");
				return false;
			}
			temp=document.getElementById('roomName').value.trim();
			if(temp.length<1){
				alert("请选择故障地点!");
				return false;
			}
			/*
			if(flag==false){
				alert("该地点没有运维资产,请重新查询");
				return false;
			}
			*/
			try{
				temp=document.getElementById('DeviceID').value;
				var list=temp.split(",");
				document.getElementById('OMM_Request/DeviceID').value=list[0];
				if(document.getElementById('OMM_Request/ProposerID').value='-1'){
					document.getElementById('OMM_Request/ProposerID').value=list[1];
				}		
			}catch(err){}		
			temp=document.getElementById('OMM_Request/Title').options[document.getElementById('OMM_Request/Title').selectedIndex].text.trim();
			if(temp.length<1){
				alert("请输入标题!");
				return false;
			}
			temp=document.getElementById('OMM_Request/Title').options[document.getElementById('OMM_Request/Title').selectedIndex].text.trim();
			if(temp.length<1){
				alert("请输入标题!");
				return false;
			}
			temp=document.getElementById('OMM_Request/DownTime').value;
			if(temp.length<1){
				document.getElementById('OMM_Request/DownTime').value=document.getElementById('OMM_Request/CreateTime').value
			}
			frm.submit();
		}
	}

	function send() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if (validater(frm)) {
			getWFData(frm);
			var temp=document.getElementById('OMM_Request/ReqTypeID').value;
			if(temp==-1){
				alert("请选择请求类型!");
				return false;
			}
			temp=document.getElementById('roomName').value.trim();
			if(temp.length<1){
				alert("请选择故障地点!");
				return false;
			}
			/*
			if(flag==false){
				alert("该地点没有运维资产,请重新查询");
				return false;
			}
			*/
			try{
				temp=document.getElementById('DeviceID').value;
				var list=temp.split(",");
				document.getElementById('OMM_Request/DeviceID').value=list[0];
				if(document.getElementById('OMM_Request/ProposerID').value='-1'){
					document.getElementById('OMM_Request/ProposerID').value=list[1];
				}		
			}catch(err){}
			temp=document.getElementById('OMM_Request/Title').options[document.getElementById('OMM_Request/Title').selectedIndex].text.trim();
			if(temp.length<1){
				alert("请输入标题!");
				return false;
			}
			temp=document.getElementById('OMM_Request/DownTime').value;
			if(temp.length<1){
				document.getElementById('OMM_Request/DownTime').value=document.getElementById('OMM_Request/CreateTime').value
			}
			document.getElementById('OMM_Request/ReqState').value=2;
			frm.submit();
		}
	}
</script>