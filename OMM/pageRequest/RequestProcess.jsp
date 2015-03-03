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
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">运维管理—&gt;运维申请—&gt;运维申请处理流程—&gt;
								<bean:write property="WFWorkItem/workItemName" />
							</td>
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
							<td height="40" align="center" style="font-size:30px;font-weight:bold;color:#ff0000;letter-spacing:5px">广州市委党校运维受理工单</td>
						</tr>
					</table>
					<!------------------------------  表单意见  ----------------------------->
					<table width="96%" align="center" cellpadding="0" cellspacing="1" bgcolor="red" style="border:1px solid red;">
						<tr height="40">
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;height:40px;">申请编号</th>
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;height:40px;">申报时间</th>
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;height:40px;">申报地点</th>
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;height:40px;">故障类型</th>
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;height:40px;">故障时间</th>
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;height:40px;">语音记录</th>
						</tr>
						<tr height="40">
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
										out.print("<a href=\"/oa/page/shareFolder/downloadFile.jsp?filePath=/primeton/audio-rec-files/data"+"&&fileName="+folderName+".wav\" ><SPAN style=\"color:#003681;font-size:30px;font-weight:bold;\">播放</SPAN></a>");
									}
								%>
							</td>
						</tr>
						<tr height="40">
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;">故障主题</th>
							<TD colspan="5" align="left" nowrap style="background-color:white;font-size: 12px"><bean:write property="OMM_Request/Title" /></TD>
						</tr>
						<tr>
							<th width="16%" align="center" nowrap style="background-color:white;font-size: 18px;">故障描述</th>
							<TD colspan="5" align="left" nowrap style="background-color:white;font-size: 12px"><TEXTAREA style="width: 100%"  readonly="readonly" name="description" rows="5"><bean:write property="name" />;<bean:write property="OMM_Request/DownTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="MM月dd日HH时mm分"/><bean:write property="BuildingRoomInfo" />出现故障:<bean:write property="OMM_Request/Description" /></TEXTAREA></TD>
						</tr>
						<!--
						<tr>
							<th width="16%" align="center" nowrap style="background-color:white;height:24px;font-size: 12px;">备注</th>
							<TD colspan="5" align="center" nowrap style="background-color:white;font-size: 12px"><TEXTAREA style="width: 100%" name="Remarks" rows="5"></TEXTAREA></TD>
						</tr>
						-->
						<tr height="40">
							<td colspan="6" height="40" align="center" style="background-color:white;font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">运维流程视图</td>
						</tr>
						<tr>
							<td width="19%" align="right" nowrap colspan="6" bgcolor="#FFFFFF"><iframe
									src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0"
									name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20"
									scrolling="auto"></iframe></td>

						</tr>
						<tr height="40">
							<td width="19%" align="right" nowrap style="background-color:white;font-size: 12px;">流转选择：</td>
							<td colspan="5" width="81%" class="td1"><%
        int i = 0;
        %>
								<logic:iterate id="resultset" property="list[@type='nextnodes']">
									<input name="Flow/nextNode" type="radio" onclick="NextDXDisplay(this);" value='<bean:write id="resultset" property="Activity/actDefID"/>'
										nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%>>
									<bean:write id="resultset" property="Activity/actDefName" />&nbsp;
			<%
				i++;
			%>
								</logic:iterate>
							</td>
						</tr>
						<logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
							<tr height="40" id="nextNode" style="display: none;">
								<td width="19%" align="right" nowrap style="background-color:white;font-size: 12px;">下环节人员选择：</td>
								<td colspan="5" class="td1" style="border:solid 1px red;">
									<html:text property="OMM_Request/nextParticipantName"
										attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
									<html:hidden property="OMM_Request/nextParticipantId" />
									<input name="select" type="button" class="button_02" value="选 择"
										onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','OMM_Request/nextParticipantName','OMM_Request/nextParticipantId')">

								</td>
							</tr>
						</logic:notEqual>
					</table>
					
					<!------------------------------  流转  ----------------------------->

					<!------------------------------  文头  ----------------------------->


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
		</table>
		<DIV id="listInfo" style="display:none;">
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr>
							<td width="15%" align="center" nowrap class="td2">申请编号</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<bean:write property="OMM_Request/ReqSN" />
								<input type="hidden" name="OMM_Request/ReqSN" value='<bean:write property="OMM_Request/ReqSN"/>' /></td>
							<td width="15%" align="center" nowrap class="td2">请求状态</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<SCRIPT type="text/javascript">

									var temp='<bean:write property="OMM_Request/ReqState"/>';
									if (temp==1) 
										temp='草稿';
									if (temp==2) 
										temp='等待验证';
									if (temp==3) 
										temp='拒绝受理';
									if (temp==4) 
										temp='已受理';
									if (temp==5) 
										temp='已完成';
									document.write(temp);
								</SCRIPT>
								<input type="hidden" name="OMM_Request/ReqState" value='<bean:write property="OMM_Request/ReqState"/>' /></td>
						</tr>
						<tr>
							<td width="15%" align="center" nowrap class="td2">创建时间</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<bean:write property="OMM_Request/CreateTime" />
								<input type="hidden" name="OMM_Request/CreateTime"
									value='<bean:write property="OMM_Request/CreateTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/>' /></td>
							<td width="15%" align="center" nowrap class="td2">紧急程度</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<SCRIPT type="text/javascript">

									var temp='<bean:write property="OMM_Request/Urgency"/>';
									if (temp==1) 
										temp='一般';
									if (temp==2) 
										temp='紧急';
									if (temp==3) 
										temp='特急';
									document.write(temp);
								</SCRIPT>
								<input type="hidden" name="OMM_Request/Urgency" value='<bean:write property="OMM_Request/Urgency"/>' /></td>
						</tr>
						<tr>
							<td width="15%" align="center" nowrap class="td2">请求类型</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<div id="panel" style="display: block">
									<bean:write property="OMM_ReqType/TypeName" />
									&nbsp;&nbsp;&nbsp;<INPUT type="checkbox" name="chkChoose1" onclick="ReChoose1(this);" />是否重选</div>
								<div id="npanel" style="display: none"><SELECT name="typeID" onchange="GetTitle(this)" style="width: 152px;">
										<option value="-1">请选择请求类型</option>
										<logic:iterate id="item" property="list[@type='OMM_ReqType']">
											<option value='<bean:write id="item" property="OMM_ReqType/TypeID"/>'>
												<bean:write id="item" property="OMM_ReqType/TypeName" />
											</option>
										</logic:iterate>
									</SELECT> <span class="text_red">*</span>&nbsp;&nbsp;&nbsp;<INPUT type="checkbox" name="chkChoose2"
										onclick="ReChoose2(this);" />是否重选</div>
								<INPUT type="hidden" name="OMM_Request/ReqTypeID" value='<bean:write property="OMM_Request/ReqTypeID"/>' /><INPUT
									type="hidden" name="tempTypeId" value='<bean:write property="OMM_Request/ReqTypeID"/>' /></td>
							<td width="15%" align="center" nowrap class="td2">优先级别</td>
							<td width="35%" 1align="center" nowrap class="td1"><SELECT name="OMM_Request/PriorityLevel" style="width: 152px;">
									<OPTION value="1">低</OPTION>
									<OPTION value="2" selected="selected">中</OPTION>
									<OPTION value="3">高</OPTION>
								</SELECT></td>
						</tr>
						<tr>
							<td width="15%" align="center" nowrap class="td2">申报地点</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<bean:write property="BuildingRoomInfo" />
								<input type="hidden" name="OMM_Request/DeviceID" value='<bean:write property="OMM_Request/DeviceID"/>' /></td>
							<td width="15%" align="center" nowrap class="td2">故障时间</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<bean:write property="OMM_Request/DownTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/>
								<input type="hidden" name="OMM_Request/DownTime" value='<bean:write property="OMM_Request/DownTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/>' /></td>
						</tr>
						<tr>
							<td align="center" nowrap class="td2">标题</td>
							<td 1align="center" nowrap class="td1" colspan="3"><SELECT name="OMM_Request/Title" style="width: 580px;"
									onkeydown="catch_keydown(this);" onkeypress="catch_press(this);">
									<OPTION value='<bean:write property="OMM_Request/Title" />'>
										<bean:write property="OMM_Request/Title" />
									</OPTION>
								</SELECT> <span class="text_red">*</span> <span class="text_red">提示：选中内容时可以直接编辑</span></td>
						</tr>
						<tr>
							<td align="center" nowrap class="td2">故障描述</td>
							<td 1align="center" nowrap class="td1" colspan="3"><TEXTAREA name="OMM_Request/Description" rows="5" cols="80"><bean:write property="OMM_Request/Description" /></TEXTAREA></td>
						</tr>
					</table>
					<BR>
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr>
							<td width="30%" align="center" nowrap class="td2">使用人</td>
							<td width="30%" align="center" nowrap class="td2">类型</td>
							<td width="30%" align="center" nowrap class="td2">资产名称</td>
							<td width="10%" align="center" nowrap class="td2">详细信息</td>
						</tr>
						<logic:iterate id="item" property="list[@type='DevLogsInfo']">
						<tr>
							<td width="30%" align="center" nowrap class="td1">
								<bean:write id="item" property="DevLogsInfo/operatorName" />
							</td>
							<td width="30%" align="center" nowrap class="td1">
								<bean:write id="item" property="DevLogsInfo/TypeName" />
							</td>
							<td width="30%" align="center" nowrap class="td1">
								<SCRIPT>

									var temp='<bean:write id="item" property="DevLogsInfo/CAPTNAME"/>';
									if (temp.length<1) {
										temp='<font color="red">该设备不属于固定资产范围</font>';
									}
									document.write(temp);
								</SCRIPT>
							</td>
							<td width="10%" align="center" nowrap class="td1"><A
									href='OMM.prCAPT.prGetInfo.do?OMM_ITDevice/DeviceID=<bean:write property="OMM_Request/DevicdID" />'>详细信息</A></td>
						</tr>
						</logic:iterate>
					</table>					
					</DIV>
					<BR>
		<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
					<logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
						<input name="wfsend" type="button" class="button_02" value="发 送" onClick="send()">
					</logic:notEqual>
					<logic:equal property="WFWorkItem/activityDefID" value="DX5">
						<input name="wfsend" type="button" class="button_02" value="结束流程" onClick="send()">
					</logic:equal>
					<input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()"> <input name="wfcancel"
						type="button" class="button_02" value="返 回" onClick="history.back()"></td>
			</tr>
		</table>
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
}


document.getElementById('OMM_Request/nextParticipantName').value='<bean:write property="SessionEntity/userName" formatClass="username" formatType="userid"/>';
document.getElementById('OMM_Request/nextParticipantId').value='<bean:write property="SessionEntity/operatorID" formatClass="username" formatType="userid"/>';
</script>