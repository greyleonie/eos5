<%@include file="/internet/common.jsp"%>
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
	<form method="post" name="myform" action="OMM.prRequest.prRequestProcessDo.do" enctype="multipart/form-data">
	<html:hidden property="OMM_Request/_order/col1/field" />
					<html:hidden property="OMM_Request/_order/col1/asc" />
					<html:hidden property="temptype" />
					<html:hidden property="OMM_Request/RequestID" />
					<html:hidden property="OMM_Request/participant" />
					<html:hidden property="OMM_Request/passParticipant" />
					<html:hidden property="OMM_Request/ProposerID" />
					<html:hidden property="OMM_Request/processInstID" />
					<html:hidden property="OMM_Request/activityDefID" />
					<html:hidden property="OMM_Request/RoomID" />
					<input type="hidden" name="OMM_Request/BuildingID" value='<bean:write property="BuildingRoomInfo/BuildingID" />'/>
					
					<input type="hidden" name="OMM_Request/RoomTypeID" value='<bean:write property="BuildingRoomInfo/RoomTypeID" />'/>
					<input type="hidden" name="SetTypeList/type[@num='0']"  value="1"/>
					<input type="hidden" name="SetTypeList/type[@num='1']"   value="2"/>
					<input type="hidden" name="SetTypeList/type[@num='2']"   value="3"/>	
		<table width="98%" border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse">
			<tr>
				<td height="100%" valign="top" nowrap bgcolor="#FFFFFF" style="border:1px #ffffff solid;border-top:none">
					<!------------------------------  文头  ----------------------------->
					<table width="96%" height="20" border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
						<tr>
							<td height="40" align="center" style="font-size:30px;font-weight:bold;color:#ff0000;letter-spacing:5px">广州市委党校运维受理工单</td>
						</tr>
					</table>
					<!------------------------------  表单意见  ----------------------------->
					<table width="96%" align="center" cellpadding="0" cellspacing="1" bgcolor="red" style="border:1px solid red;">
						<tr height="32">
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;height:32px;">申请编号</th>
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;height:32px;">申报时间</th>
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;height:32px;">申报地点</th>
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;height:32px;">故障类型</th>
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;height:32px;">故障时间</th>
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;height:32px;">语音记录</th>
						</tr>
						<tr height="32">
							<td width="16%" align="center" nowrap style="background-color:white;font-size: 12px;">
								<bean:write property="OMM_Request/ReqSN" />
							</td>
							
							<td width="16%" align="center" nowrap style="background-color:white;font-size: 12px;">
								<bean:write property="OMM_Request/CreateTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/>
							</td>
							
							<td width="16%" align="center" nowrap style="background-color:white;font-size: 12px;">
								<bean:write property="BuildingRoomInfo" />
							</td>
							
							<td width="16%" align="center" nowrap style="background-color:white;font-size: 12px;">
								<bean:write property="OMM_ReqType/TypeName" />
							</td>
							
							<td width="16%" align="center" nowrap style="background-color:white;font-size: 12px;">
								<bean:write property="OMM_Request/DownTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/>
							</td>
							
							<td width="16%" align="center" nowrap style="background-color:white;font-size: 12px;">
								<%
									com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.web.driver.webdriver.WebDriver.REQUEST_REQUEST_CONTEXT);
									String folderName=(String)reqContext.getProperty("OMM_Request/ReqSN");
									if (!(new java.io.File("D:/primeton/audio-rec-files/data/"+folderName+".wav").exists())){
										out.print("<SPAN class=\"linkOA\">没有语音记录文件</SPAN>");
									}else{
										out.print("<a href=\"/oa/page/shareFolder/downloadFile.jsp?filePath=/primeton/audio-rec-files/data"+"&&fileName="+folderName+".wav\" ><SPAN style=\"color:#003681;font-size:18px;font-weight:bold;\">播放</SPAN></a>");
									}
								%>
							</td>
						</tr>
						<tr height="32">
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;">故障主题</th>
							<TD colspan="5" align="left" nowrap style="background-color:white;"><SPAN style="color:#003681;font-size:32px;font-weight:bold;"><bean:write property="OMM_Request/Title" /></SPAN></TD>
						</tr>
						<tr height="32">
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;">故障描述</th>
							<TD colspan="5" align="left" nowrap style="background-color:white;font-size: 12px"><bean:write property="name" />;<bean:write property="OMM_Request/DownTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="MM月dd日HH时mm分"/><bean:write property="BuildingRoomInfo" />出现故障:<bean:write property="OMM_Request/Description" /></TD>
						</tr>
						<tr>
							<td width="19%" align="right" nowrap colspan="6" bgcolor="#FFFFFF"><iframe
									src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="OMM_Request/processInstID"/>' frameborder="0"
									name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20"
									scrolling="auto"></iframe></td>

						</tr>
					</table>
		</table>
		
					<BR>
	</form>
	<div id="pubLemma"
		style="position:absolute; top:301px; width:185px; height:85px; z-index:1; left: 385px; visibility: visible;display:none"
		onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
		<table width="98%" align="center" border="0" cellpadding="0" cellspacing="1" bgcolor="#CAD6E8">
			<logic:iterate id="pubLemmas" property="list[@type='pubLemmas']">
				<tr class="td1">
					<td><a href="javascript:setValue('<bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION'/>');">
							<bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION' />
						</a></td>
				</tr>
			</logic:iterate>
		</table>
	</div>
</body>
<script>

	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>
<script>
function NextDXDisplay(obj){
	var temp=obj.value;
	if(temp=="DX1"||temp=="DX6"){
		document.getElementById('nextNode').style.display="block";
	}else{
		document.getElementById('nextNode').style.display="none";
	}
}

function ReChoose1(obj){
	if(obj.checked==true){
		document.getElementById('chkChoose2').checked=true;
		document.getElementById('panel').style.display="none";
		document.getElementById('npanel').style.display="block";
	}else{
	document.getElementById('OMM_Request/ReqTypeID').value=document.getElementById('tempTypeId').value;
		document.getElementById('chkChoose2').checked=false;
		document.getElementById('panel').style.display="block";
		document.getElementById('npanel').style.display="none";
	}
}

function ReChoose2(obj){
	if(obj.checked==true){
		document.getElementById('chkChoose1').checked=true;
		document.getElementById('panel').style.display="none";
		document.getElementById('npanel').style.display="block";
	}else{
	document.getElementById('OMM_Request/ReqTypeID').value=document.getElementById('tempTypeId').value;
		document.getElementById('chkChoose1').checked=false;
		document.getElementById('panel').style.display="block";
		document.getElementById('npanel').style.display="none";
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

	function GetRoomInfo(){
	    	var loc="OMM.prRequest.prRoomList.do";
		    window.open(loc,"","width=700px,height=380,status=yes,top=180,left=180,scroll=yes");
	}
	
	function SetValue(roomId,buildingName,roomName){
		document.getElementById('RoomId').value=roomId;
		document.getElementById('RoomName').value=buildingName+roomName;
		GetDevList(roomId);
	}

	function GetTitle(obj){
		if(obj.value!=-1){document.getElementById('OMM_Request/ReqTypeID').value=obj.value;}
		else{document.getElementById('OMM_Request/ReqTypeID').value=document.getElementById('tempTypeId').value;}
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
					alert("标题查询错误，请重新查询或直接输入！");
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
				colHTML += typeName;
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
		if(validater(frm)) {
			getWFData(frm);
			var temp=document.getElementById('OMM_Request/Title').options[document.getElementById('OMM_Request/Title').selectedIndex].text.trim();
			if(temp.length<1){
				alert("请输入标题!");
				return false;
			}
			frm.submit();	
		}

}

function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
			getWFData(frm);
			var temp=document.getElementById('OMM_Request/Title').options[document.getElementById('OMM_Request/Title').selectedIndex].text.trim();
			if(temp.length<1){
				alert("请输入标题!");
				return false;
			}
			frm.submit();	
		}
}
</script>
<script language="javascript">function menuControl(obj,show)
{
window.event.cancelBubble=true;
inputobj = event.srcElement;
var objID=event.srcElement.id;
var index=objID.indexOf("_");
var mainID=objID.substring(0,index);
var numID=objID.substring(index+1,objID.length);

if(show==1)
{
eval("showMenu("+obj+")");
}
else
{
eval("hideMenu("+obj+")");
}


}

var nbottom=0,speed=11;
function displayMenu(obj)
{
obj.style.clip="rect(0 100% "+nbottom+"% 0)";
nbottom+=speed;
if(nbottom<=100) 
{
timerID=setTimeout("displayMenu("+obj.id+"),70");
}
else clearTimeout(timerID);
}
function showMenu(obj)
{var parent = event.srcElement;
obj.style.display="block";
//obj.style.clip="rect(0 0 0 0)";
obj.style.top = ylib_getPageY(parent)+18;
obj.style.left = ylib_getPageX(parent);
//nbottom=5;
//displayMenu(obj);
}
function hideMenu(obj)
{
nbottom=0;
obj.style.display="none";
}
function keepMenu(obj)
{
obj.style.display="block";
}

function ylib_getPageX(o) { 
	var x=0;
	{ while(eval(o)) { 
		x+=o.offsetLeft; o=o.offsetParent; 
	} 
  } 
return x; 
}
function ylib_getPageY(o) {
 	var y=0; 
 	{ while(eval(o)) {
		 y+=o.offsetTop; o=o.offsetParent;
		  } 
	} 
	return y;
 }
 
function setValue(value) {
inputobj.value = inputobj.value + value;
}</script>