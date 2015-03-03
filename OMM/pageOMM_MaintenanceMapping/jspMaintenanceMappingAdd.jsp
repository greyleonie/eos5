<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/internet/scripts/fccnewtab.js"></SCRIPT>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree"%>
<script language="jscript" src="/pageComponent/resources/scripts/rtree.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/string.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/eventManager.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></script>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<body>
	<form method="post" action="OMM.prOMM_MaintenanceMapping.prMaintenanceMappingInsert.do" name="formName">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">运维管理—&gt;运维管理—&gt;维修记录-&gt;新增维修记录</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="8"></td>
			</tr>
			<tr>
				<td class="text">
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr>
							<td width="20%" align="center" nowrap class="td2">维&nbsp;修&nbsp;员:</td>
							<td width="80%" class="td1">
								<html:text property="OMM_MaintenanceMapping/MaintenanceManID" name="OMM_MaintenanceMappingT/MaintenanceManID"  readonly="true"/>
								<html:button name="btn1" value="选 择" onclick="selectUserlist('btn1')"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="text_red">*</span>
								<html:hidden property="OMM_MaintenanceMapping/MaintenanceManID" name="OMM_MaintenanceMapping/MaintenanceManID"/>
							</td>
						</tr>
						<!--<tr>
							<td width="20%" align="center" nowrap class="td2">设&nbsp;备&nbsp;名:</td>
							<td width="80%" class="td1">
								<html:text property="OMM_MaintenanceMapping/DeviceID" name="OMM_MaintenanceMappingT/DeviceID" readonly="true"/>
								<span class="text_red">*</span>
								<html:button name="btn2" value="选 择" onclick="selectUserlist('btn2')" />
								<html:hidden property="OMM_MaintenanceMapping/DeviceID" name="OMM_MaintenanceMapping/DeviceID"/>
							</td>
						</tr>
						<tr>
							<td width="20%" align="center" nowrap class="td2">设备类型:</td>
							<td width="80%" class="td1">
							<html:text property="OMM_MaintenanceMapping/DevTypeID" name="OMM_MaintenanceMappingT/DevTypeID" readonly="true"/>
								<span class="text_red">*</span>
								<html:button name="btn3" value="选 择" onclick="selectUserlist('btn2')"/>
								<html:hidden property="OMM_MaintenanceMapping/DevTypeID" name="OMM_MaintenanceMapping/DevTypeID" />
							</td>
						</tr>
						<tr>
							<td width="20%" align="center" nowrap class="td2">楼&nbsp;房&nbsp;名:</td>
							<td width="80%" class="td1">
								<html:text property="OMM_MaintenanceMapping/BuildingID" name="OMM_MaintenanceMappingT/BuildingID" readonly="true"/>
								<span class="text_red">*</span>
								<html:button name="btn4" value="选 择" onclick="selectUserlist('btn4')"/>
								<html:hidden property="OMM_MaintenanceMapping/BuildingID" name="OMM_MaintenanceMapping/BuildingID" />
							</td>
						</tr>
						<tr>
							<td width="20%" align="center" nowrap class="td2">房&nbsp;间&nbsp;号:</td>
							<td width="80%" class="td1">
								<html:text property="OMM_MaintenanceMapping/RoomID" name="OMM_MaintenanceMappingT/RoomID" readonly="true"/>
								<span class="text_red">*</span>
								<html:button name="btn5" value="选 择" onclick="selectUserlist('btn4')"/>
								<html:hidden property="OMM_MaintenanceMapping/RoomID" name="OMM_MaintenanceMapping/RoomID" />
							</td>
						</tr>-->
						
						<!--<tr>
							<td width="20%" align="center" nowrap class="td2">房间类型:</td>
							<td width="80%" class="td1">
								<html:radio name="OMM_MaintenanceMapping/RoomTypeID" value="1" property="OMM_MaintenanceMapping/RoomTypeID" checked="true"/>教室&nbsp;
								<html:radio name="OMM_MaintenanceMapping/RoomTypeID" value="2" property="OMM_MaintenanceMapping/RoomTypeID" />客房&nbsp;
								<html:radio name="OMM_MaintenanceMapping/RoomTypeID" value="3" property="OMM_MaintenanceMapping/RoomTypeID" />讨论室&nbsp;
								<html:radio name="OMM_MaintenanceMapping/RoomTypeID" value="4" property="OMM_MaintenanceMapping/RoomTypeID" />办公室&nbsp;
								<html:radio name="OMM_MaintenanceMapping/RoomTypeID" value="5" property="OMM_MaintenanceMapping/RoomTypeID" />所有房间&nbsp;
							</td>
						</tr>-->
						<tr>
							<td width="20%" align="center" nowrap class="td2">负责范围:</td>
							<td width="80%" class="td1">
				            <select size="10" style="width:250" id="recordSelect" ondblclick="deleteOption1(this)"></select>
				            <input type="button" name="buttonArea" class="button_01" value="区 域" onclick="areaSelect()">
				            <br/><font color="red">双击可删除选项</font>
							</td>
						</tr>
						<tr>
							<td width="20%" align="center" nowrap class="td2"></td>
							<td width="80%" class="td1">
								&nbsp;&nbsp;&nbsp;
								<input type="button" name="buttonDevice" class="button_01" value="设 备" onclick="deviceSelect()">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				            <br/><font color="red">先选择区域,再选择设备</font>
							</td>
						</tr>
					</table>
					<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center">
							<input name="button" type="button" class="button_02" value="保 存" onClick="save()"> 
							<input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<!--<input type="button" value="取值测试" onclick="getValues(this)" />&nbsp;&nbsp;&nbsp;&nbsp;<br>
		<center><input type="text"  size="40" id="test1" onclick="getValues(this)"/><br>adsfffffffff</center>
		<html:text name="test2" property="test2" value="test1,test2,test3, ,test4"/>
		<html:button name="test" value="test" onclick="test3()"/>-->
		
		<html:hidden property="MaintenanceMappingTemp/BuildingMark"/>
		<html:hidden property="MaintenanceMappingTemp/RoomIDMark"/>
		<html:hidden property="MaintenanceMappingTemp/BuildingID"/>
		<html:hidden property="MaintenanceMappingTemp/RoomTypeID"/>
		<html:hidden property="MaintenanceMappingTemp/RoomID"/>
		<html:hidden property="MaintenanceMappingTemp/DevTypeID"/>
		<html:hidden property="MaintenanceMappingTemp/DeviceID"/>
		<html:hidden property="MaintenanceMappingTemp/MaintenanceManID"/>
	</form>
</body>
<script>

	
	
	var testTable = document.getElementById("testTable");
	function testAjax(){
		var sub = new HiddenSubmit('OMM.bizDevUsingLogs.getGuestRoom');
		//sub.add("Room/RoomID/criteria/value", 1);
		sub.add("input/LayerNO",6);
		sub.add("input/BuildingID",1);
		sub.add("input/BuildingName","勤学楼");
		if(sub.submit()){
			alert("调用业务逻辑success!");
			if(sub.getValues("root/data/list[@type='Room']/Room").length<1){
				alert("have no record!");
			}else{
				//alert("record exist!");
				
				var tableBody = "";
				
				tableBody += "<table width=\"400\" align=\"center\" boder=\"1\" cellpadding=\"0\" cellspacing=\"1\"  bgcolor=\"#CAD6E8\" id=\"listdetail\">";
				for(i = 0; i < sub.getValues("root/data/list[@type='Room']/Room").length-1; i++){
					var buildingID = sub.getValues("root/data/list[@type='Room']/Room[@rowNum='"+i+"']/RoomID");
					var buildingName = sub.getValues("root/data/list[@type='Room']/Room[@rowNum='"+i+"']/RoomName");
					tableBody += "<tr><td>"+buildingID+"</td><td>"+buildingName+"</td></tr>";
				}
				tableBody += "</table>"
				testTable.innerHTML = tableBody;
				//alert(testTable.innerHTML);
			}
		}else{
			alert("调用业务逻辑失败!");
		}
	}
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////
	var frm=document.forms[0];
	var optionCounts = 0;
	//个数@一级分隔符,记录数#2级分隔符,记录值:3级分隔符
	var valueString = ",";
	//alert(valueString.charAt(0));
	var RoomTypeID = "";
	var BuildingID = "";
	var RoomID     = "";
	var DeviceID   = "";
	var DevTypeID  = "";
	
	
	function checkoption(){
		var recordSelect = document.getElementById("recordSelect");
		//alert(recordSelect.selectedIndex);
	}
	
	//返回去掉最后分隔符的数值字符串后
	function kickChar(str){
		//alert(str.length);
		return str.substring(0,str.length-1);
		//alert(str);
	}
	
	//复制给DeviceID字符值串
	function setValueToDeviceID(selIndex, str){
		var strTemp = "";
		var strList;
		if(selIndex < 0){
			alert("请选择一个维修记录!");
			return;
		}
		//有一条记录
		//if((DeviceID.indexOf(",") == DeviceID.lastIndexOf(",")) && DeviceID.indexOf(",") != -1){
		if(optionCounts == 1){
			DeviceID = str+",";
			return;
		}//选择的是最后一条记录
		else if(optionCounts == (selIndex+1)){
			strTemp = DeviceID.substring(0,kickChar(DeviceID).lastIndexOf(","))+",";
			strTemp += str+",";
			DeviceID = strTemp;
			return;
		}else{
			strTemp = kickChar(DeviceID);
			strList = strTemp.split(",");
			strList[selIndex] = str;
			strTemp = "";
			for(i = 0; i < strList.length; i++){
				strTemp += strList[i]+",";
			}
			DeviceID = strTemp;
		}
		
		
	}
	
	//复制给DevTypeID字符值串
	function setValueToDevTypeID(selIndex, str){
		var strTemp = "";
		var strList;
		if(selIndex < 0){
			alert("请选择一个维修记录!");
			return;
		}
		//有一条记录
		//if((DevTypeID.indexOf(",") == DevTypeID.lastIndexOf(",")) && DevTypeID.indexOf(",") != -1){
		if(optionCounts == 1){
			DevTypeID = str+",";
			return;
		}//选择的是最后一条记录
		else if(optionCounts == (selIndex+1)){
			//alert("optionCounts:"+optionCounts+"  selIndex:"+selIndex);
			strTemp = DevTypeID.substring(0,kickChar(DevTypeID).lastIndexOf(","))+",";
			//alert(strTemp);
			strTemp += str+",";
			DevTypeID = strTemp;
			//alert(DevTypeID);
			return;
		}else{
			strTemp = kickChar(DevTypeID);
			strList = strTemp.split(",");
			strList[selIndex] = str;
			strTemp = "";
			for(i = 0; i < strList.length; i++){
				strTemp += strList[i]+",";
			}
			DevTypeID = strTemp;
		}
		
		
	}
	
	function createDiv(vTop, vLeft, vSize){
		dd=document.createElement("select");
		dd.style.position="absolute";   
		dd.style.width=292;   
		dd.size=10;
		 // dd.style.height=115;   
		dd.style.left=vLeft;   
		dd.style.top=vTop+3;   
		//dd.innerHTML='您有   $count   条新消息。'; 
			 
		document.body.appendChild(dd);  
		for(i = 0 ; i < 15; i++){
			var dd = document.createElement("option");
			ddd.text = "测试"+i;
			ddd.value=i;
			dd.add(ddd);
			formName.recordSelect.add(dd);
		}  
	}   
	
	
	function getValues(obj){
		var select1 = document.getElementById("test1");
		//alert("offsetTop: "+select1.offsetTop+"  offsetLeft: "+select1.offsetLeft+"  clientHeight: "+select1.clientHeight);
		createDiv(select1.offsetTop+select1.clientHeight, select1.offsetLeft);
		//alert("scrollLeft: "+obj.scrollLeft +"scrollTop: "+obj.scrollTop+"clientHeight: "+obj.clientHeight);
		/*var recordSelect = document.getElementById("recordSelect");
		var splitStrings = DeviceID.split(",");
		var stringvalue = "";
		for(i = 0; i < splitStrings.length; i++){
			stringvalue += "|splitStrings["+i+"]:"+splitStrings[i];
		}*/
		
		//kickChar(RoomTypeID);
		//alert("RoomTypeID.indexOf"+RoomTypeID.indexOf(",") + "  RoomTypeID.length:"+RoomTypeID.length);
		//alert("stringvalue: "+stringvalue+"  索引值: "+recordSelect.selectedIndex+"  记录总条数: "+optionCounts+ "   RoomTypeID  "+RoomTypeID+"  BuildingID  "+BuildingID+"  RoomID  "+RoomID+" DevTypeID "+DevTypeID+" DeviceID "+DeviceID);
		//setValueToDeviceID(recordSelect.selectedIndex,"测试");
		//alert(" DeviceID "+DeviceID);
	}
	
	function deleteOption1(obj){
		if(obj.value=="" && obj.innerText=="")
			return;
		if(window.confirm("确定删除该条记录吗？")){	
			deleteValueOptions(obj.selectedIndex);
			formName.recordSelect.remove(obj.selectedIndex);
			optionCounts--;
		}
	}
	
	function deleteValueOptions(selIndex){
			var strTemp = "";
			var strList;
			if(optionCounts == 1){
				RoomTypeID = "";
				BuildingID = "";
				RoomID     = "";
				DevTypeID  = "";
				DeviceID   = "";
			}else if(optionCounts == (selIndex+1)){
				RoomTypeID = RoomTypeID.substring(0,kickChar(RoomTypeID).lastIndexOf(","))+",";
				BuildingID = BuildingID.substring(0,kickChar(BuildingID).lastIndexOf(","))+",";
				RoomID = RoomID.substring(0,kickChar(RoomID).lastIndexOf(","))+",";
				DevTypeID = DevTypeID.substring(0,kickChar(DevTypeID).lastIndexOf(","))+",";
				DeviceID = DeviceID.substring(0,kickChar(DeviceID).lastIndexOf(","))+",";
			}else{
				////////////////////////////////
				strTemp = kickChar(RoomTypeID);
				strList = strTemp.split(",");
				strTemp = "";
				for(i = 0; i < strList.length; i++){
					if(i == selIndex){
						continue;
					}
					strTemp += strList[i]+",";
				}
				RoomTypeID = strTemp;
				////////////////////////////////
				strTemp = kickChar(BuildingID);
				strList = strTemp.split(",");
				strTemp = "";
				for(i = 0; i < strList.length; i++){
					if(i == selIndex){
						continue;
					}
					strTemp += strList[i]+",";
				}
				BuildingID = strTemp;
				////////////////////////////////
				strTemp = kickChar(RoomID);
				strList = strTemp.split(",");
				strTemp = "";
				for(i = 0; i < strList.length; i++){
					if(i == selIndex){
						continue;
					}
					strTemp += strList[i]+",";
				}
				RoomID = strTemp;
				////////////////////////////////
				strTemp = kickChar(DevTypeID);
				strList = strTemp.split(",");
				strTemp = "";
				for(i = 0; i < strList.length; i++){
					if(i == selIndex){
						continue;
					}
					strTemp += strList[i]+",";
				}
				DevTypeID = strTemp;
				////////////////////////////////
				strTemp = kickChar(DeviceID);
				strList = strTemp.split(",");
				strTemp = "";
				for(i = 0; i < strList.length; i++){
					if(i == selIndex){
						continue;
					}
					strTemp += strList[i]+",";
				}
				DeviceID = strTemp;
			}
	}
	function deleteDevTypeID(selIndex){
	
	}
	function deleteDevTypeID(selIndex){
	
	}
	function deleteDevTypeID(selIndex){
	
	}
	function deleteDevTypeID(selIndex){
	
	}
	
	function areaSelect(){
		var loc = "OMM.prOMM_MaintenanceMapping.prAreaSelect.do?input/BuildingID=1&input/LayerNO=6";
		window.open(loc, "", "width=300px,height=250,status=yes,top=180,left=680,scroll=yes");
	}
	
	function deviceSelect(){
		var loc = "OMM.prOMM_MaintenanceMapping.prDeviceSelect.do?ITDeviceTemp/DeviceID=-1&ITDeviceTemp/TypeID=-1";
		window.open(loc, "", "width=250px,height=250,status=yes,top=180,left=680,scroll=yes,location=0");
	}
	
	
	
	function selectUserlist(btnName){/////////////////
		if(btnName == "btn1"){
			var loc="OMM.prOMM_MaintenanceMapping.prselectManID.do";
		    window.open(loc,"","width=250px,height=320,status=yes,top=180,left=680,scroll=yes");
		    //window.showModalDialog(loc,objectSend,"dialogHeight:380px;dialogWidth:500px;dialogTop:180px;dialogLeft:700px;scroll:no;status:no;");
	    }else if(btnName == "btn2"){
	    	var loc = "OMM.prOMM_MaintenanceMapping.prSelectDeviceID.do";
		    window.open(loc,"","width=250px,height=320,status=yes,top=180,left=680,scroll=yes");
	    }else if(btnName == "btn4"){
	    	var loc="OMM.prOMM_MaintenanceMapping.prSelectGuestRoom.do?input/BuildingID=1&input/LayerNO=6";
		    window.open(loc,"","width=250px,height=320,status=yes,top=180,left=680,scroll=yes");
	    }
	}
	
	function addOptionBtn1(CAPTNAME,CAPTID){//////////////
		frm.elements["OMM_MaintenanceMappingT/MaintenanceManID"].value=CAPTNAME;
		frm.elements["OMM_MaintenanceMapping/MaintenanceManID"].value=CAPTID;
	}
	
	function addOptionBtn2(TypeID,TypeName,DeviceID,CAPTNAME){////////////////
		frm.elements["OMM_MaintenanceMappingT/DevTypeID"].value=TypeName;
		frm.elements["OMM_MaintenanceMapping/DevTypeID"].value=TypeID;
		frm.elements["OMM_MaintenanceMappingT/DeviceID"].value=CAPTNAME;
		frm.elements["OMM_MaintenanceMapping/DeviceID"].value=DeviceID;
	}
	
	function addOptionBtn4(roomID,RoomName,BuildingID,BuildingName){//////////////
		frm.elements["OMM_MaintenanceMapping/BuildingID"].value=BuildingID;
		frm.elements["OMM_MaintenanceMappingT/BuildingID"].value=BuildingName;
		frm.elements["OMM_MaintenanceMapping/RoomID"].value=roomID;
		frm.elements["OMM_MaintenanceMappingT/RoomID"].value=RoomName;
	}
	
	function save(){
		var value = frm.elements["OMM_MaintenanceMappingT/MaintenanceManID"].value;
		if(checkInput("OMM_MaintenanceMappingT/MaintenanceManID") == 0){
			alert("请选择维修员!");
			return;	
		}
		
		var recordSelect = document.getElementById("recordSelect");
		if(recordSelect.length == 0){
			alert("请添加维修记录!");
			return;
		}
		for(i = 0; i < recordSelect.length; i++){
			if(recordSelect.options[i].value == 0){
				alert("维修记录详情不完整,请添加设备!");
				return;
			}
		}
		//value = frm.elements["OMM_MaintenanceMappingT/DeviceID"].value;
		/*if(checkInput("OMM_MaintenanceMappingT/DeviceID") == 0){
			alert("请选择设备名!");
			return;	
		}
		
		value = frm.elements["OMM_MaintenanceMappingT/BuildingID"].value;
		if(checkInput("OMM_MaintenanceMappingT/BuildingID") == 0){
			alert("请选择楼房!");
			return;	
		}*/
		
		frm["MaintenanceMappingTemp/RoomTypeID"].value = RoomTypeID;
		frm["MaintenanceMappingTemp/BuildingID"].value = BuildingID;
		frm["MaintenanceMappingTemp/RoomID"].value     = RoomID;
		frm["MaintenanceMappingTemp/DevTypeID"].value  = DevTypeID;
		frm["MaintenanceMappingTemp/DeviceID"].value   = DeviceID;
		frm["MaintenanceMappingTemp/MaintenanceManID"].value   = frm["OMM_MaintenanceMapping/MaintenanceManID"].value;
		
		frm.submit();
	}
	
	function checkInput(strValue){
		var frm = document.forms[0];
		var value = frm.elements[strValue].value;
		if(value == -1 || value == ""){
			frm.elements[strValue].focus();
			return 0;
		}
	}
	
	function setStringValue(){
	
	}
	
	function addOption(roomTypeMark,roomTypeID,buildAndRoomMark,buildingID,buildingName,roomID,roomName){
		//alert("roomTypeMark  "+roomTypeMark+"roomTypeID  "+roomTypeID+"  buildAndRoomMark  "+buildAndRoomMark+"  buildingID  "+buildingID+"  buildingName  "+buildingName+"  roomID  "+roomID+"  roomName  "+roomName);
		var oOption = document.createElement("option");
		oOption.text = "";
		oOption.value = 0;
		if(roomTypeMark == 1){
			if(roomTypeID == 0){
				if(buildAndRoomMark == -1){
					oOption.text = "党校所有房间";
					RoomTypeID += " ,";
					BuildingID += " ,";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}else if(buildAndRoomMark == 1){
					oOption.text =  buildingName+"所有房间";
					RoomTypeID += " ,";
					BuildingID += buildingID+",";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}
			}else if(roomTypeID == 1){
				if(buildAndRoomMark == -1){
					oOption.text =  "党校所有教室";
					RoomTypeID += roomTypeID+",";
					BuildingID += " ,";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}else if(buildAndRoomMark == 1){
					oOption.text =  buildingName+"所有教室";
					RoomTypeID += roomTypeID+",";
					BuildingID += buildingID+",";
					//RoomTypeID += " ,";
					//BuildingID += " ,";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}
			}else if(roomTypeID == 2){
				if(buildAndRoomMark == -1){
					oOption.text =  "党校所有客房";
					RoomTypeID += roomTypeID+",";
					BuildingID += " ,";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}else if(buildAndRoomMark == 1){
					oOption.text =  buildingName+"所有客房";
					RoomTypeID += roomTypeID+",";
					BuildingID += buildingID+",";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}
			
			}else if(roomTypeID == 3){
				if(buildAndRoomMark == -1){
					oOption.text =  "党校所有讨论室";
					RoomTypeID += roomTypeID+",";
					BuildingID += " ,";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}else if(buildAndRoomMark == 1){
					oOption.text =  buildingName+"所有讨论室";
					RoomTypeID += roomTypeID+",";
					BuildingID += buildingID+",";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}
			
			}else if(roomTypeID == 4){
				if(buildAndRoomMark == -1){
					oOption.text =  "党校所有办公室";
					RoomTypeID += roomTypeID+",";
					BuildingID += " ,";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}else if(buildAndRoomMark == 1){
					oOption.text =  buildingName+"所有办公室";
					RoomTypeID += roomTypeID+",";
					BuildingID += buildingID+",";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}
			}
		}else if(roomTypeMark == 2){
			//RoomTypeID += roomTypeID+",";
			//BuildingID += buildingID+",";
			RoomTypeID += " ,";
			BuildingID += " ,";
			RoomID += roomID+",";
			DevTypeID  += " ,";
			DeviceID   += " ,";
			//if(buildAndRoomMark == 2){
				oOption.text = ""+buildingName+roomName+"房";
			//}
		}
		optionCounts++;
		formName.recordSelect.add(oOption);
		var sel=document.getElementById('recordSelect');
		var count=sel.length;
		var index=count-1;
		sel.options[index].selected=true;
	}
	
	
	function updateOption(DevTypeMark,pointDeviceMark,DevTypeID,DevTypeName,DeviceID,DeviceIDCAPTNAME){
		//alert("DevTypeMark   "+DevTypeMark+"pointDeviceMark  "+pointDeviceMark+"DevTypeID  "+DevTypeID+"DevTypeName  "+DevTypeName+"DeviceID  "+DeviceID+"DeviceIDCAPTNAME  "+DeviceIDCAPTNAME);
		
		if(optionCounts == 0){
			alert("请先选择维修范围!");
			return;
		}
		
		var recordSelect = document.getElementById("recordSelect");
		
		
		if(recordSelect.selectedIndex == -1){
			alert("请选中一条记录来进行添加维修设备!");
			return;
		}
		var theSelectedOption = recordSelect[recordSelect.selectedIndex];
		if(theSelectedOption.value == 1){
			alert("此条记录已完整,请再添加维修范围!");
			return;
		}
		if(DevTypeMark == 1){
			theSelectedOption.text += "的所有"+DevTypeName;
			theSelectedOption.value = 1;
			setValueToDevTypeID(recordSelect.selectedIndex, DevTypeID);
			setValueToDeviceID(recordSelect.selectedIndex, " ");
		}else if(DevTypeMark == 2){
			if(pointDeviceMark == 1){
				theSelectedOption.text += "的所有设备";
				theSelectedOption.value = 1;
				setValueToDevTypeID(recordSelect.selectedIndex, " ");
				setValueToDeviceID(recordSelect.selectedIndex, " ");
			}else if(pointDeviceMark ==2){
				theSelectedOption.text += "的"+DeviceIDCAPTNAME;
				theSelectedOption.value = 1;
				setValueToDevTypeID(recordSelect.selectedIndex, DevTypeID);
				setValueToDeviceID(recordSelect.selectedIndex, DeviceID);
			}
		}
	}
	
	function test3(){
		frm.action="OMM.prOMM_MaintenanceMapping.prtest2.do";
		frm.submit();
	}
	
	
</script>