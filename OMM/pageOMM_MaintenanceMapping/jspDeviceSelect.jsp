<%@include file="/internet/common.jsp"%>
<link rel="stylesheet" href="/internet/BNOM/style.css" type="text/css">
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>

	<table align="center" width="200">
		<tr>
			<td nowrap class="td2" align="center">
				<html:radio name="deviceType" onclick="selectType(this)" value="1"/>快速选择
				
				<html:radio name="deviceType" onclick="selectType(this)" value="2" checked="true"/>自定义选择
			</td>
		</tr>
		<tr>
			<td nowrap class="td2" align="center">
				<html:radio name="appointArea" onclick="onSelect(this)" value="1"/>所有设备
				<html:radio name="appointArea" onclick="onSelect(this)" value="2" checked="true"/>指定设备
			</td>
		</tr>
		<!--<tr>
			<td nowrap class="td2" align="center" width="50%">
				<html:radio name="addBuildOrRoom" onselect="addBuildOrRoom(this)" value="1"/>添加设备类型
			</td>
			<td nowrap class="td2" align="center" width="50%">
				<html:radio name="addBuildOrRoom" onselect="addBuildOrRoom(this)" value="2" checked="true"/>添加具体设备
			</td>
		</tr>-->
	</table>
	<table  align="center" width="200">
		<tr>
			<td nowrap class="td2" align="left" >
				设备类型:
				<select style="width:90px;" id="select1" bizAction="OMM.bizDevUsingLogs.queryAllRole" paramXML="" listXpath="list" entityName="OMM_DevType"
					valueField="TypeID" textField="TypeName" childID="select2" nullLable="true" nullLableText="请选择..." nullLableValue="-1"
					onchange="refreshChild_DS(this),getDevTypeValue(this)" class="input">
				</select>
				</td>
				</tr>
				<tr>
				<TD nowrap class="td2" align="left" >
				设备名：
				<select style="width:90px;" id="select2" bizAction="OMM.bizDevUsingLogs.selectCAPT_CAPITALINFO" paramXML="" listXpath="list" entityName="CAPT_CAPITALINFO"
					valueField="DeviceID" textField="CAPTNAME" childID=""  mainSelectID="select1"  nullLable="true"
					nullLableText="请选择..." nullLableValue="" onchange="getDeviceID(this),doChange(this) " class="input">
				</select>
				<script language="JavaScript" type="text/JavaScript">
					initSel_DS(select1);
				</script>
			</td>
		</tr>
	</table>
<form>
	<html:hidden name="DevTypeMark" property="DevTypeMark" value="2"/>
	<html:hidden name="pointDeviceMark" property="pointDeviceMark" value="2" />
	<html:hidden name="DevTypeID" property="DevTypeID" />
	<html:hidden name="DevTypeName" property="DevTypeName" />
	<html:hidden name="DeviceID" property="DeviceID"/>
	<html:hidden name="DeviceIDCAPTNAME" property="DeviceIDCAPTNAME" />
	<!----><input type="hidden" name="ITDeviceTemp/DeviceID">
	<input type="hidden" name="ITDeviceTemp/DevCode">
	<input type="hidden" name="ITDeviceTemp/CAPTNAME">
	<input type="hidden" name="ITDeviceTemp/TypeID">
	<table align="center" width="200">
		<tr>
			<td class="td2" align="left" >设备编号:<bean:write property="ITDeviceTemp/entity/DevCode"/>
			</td>
		</tr>
		<tr>
			<td class="td2" align="left">设备名:<bean:write property="ITDeviceTemp/entity/CAPTNAME"/>
			</td>
		</tr>
		<tr>
			<td class="td2" align="left" >设备类型:<bean:write property="ITDeviceTemp/entity/TypeName"/>
			</td>
		</tr>
		<tr>
			<td class="td2" align="left" >开始使用时间:<bean:write property="ITDeviceTemp/entity/BeginTime"/>
			</td>
		</tr>
		<tr >
			<td  nowrap align="center" colspan="2"> 
			<input name="B6" type="button" class="button_02" value="添 加" onclick="add()">
			<input name="B6" type="button" class="button_02" value="关 闭" onclick="cancel()">
			<!--<input type="button" value="测试" onclick="test()"/> </td>-->
		</tr>
	</table>
</form>
<script>

	var frm = document.forms[0];
	var appointArea = document.getElementsByName("appointArea");
	var deviceType = document.getElementsByName("deviceType");

	function doChange(obj){
		var deviceID = obj.value;
		var typeID = document.getElementById("select1").value;
		frm["ITDeviceTemp/DeviceID"].value=deviceID;
		frm["ITDeviceTemp/TypeID"].value=typeID;
		
		var DevTypeMark = frm["DevTypeMark"].value;
		var pointDeviceMark = frm["pointDeviceMark"].value;
		var DevTypeID = frm["DevTypeID"].value;
		var DevTypeName = frm["DevTypeName"].value;
		var DeviceID = frm["DeviceID"].value;
		var DeviceIDCAPTNAME = frm["DeviceIDCAPTNAME"].value;
		
		
		frm.action="OMM.prOMM_MaintenanceMapping.prDeviceSelect.do?ITDeviceTemp/DeviceID="+deviceID+"&ITDeviceTemp/TypeID="+typeID
					+"&DevTypeMark="+DevTypeMark+"&pointDeviceMark="+pointDeviceMark+"&DevTypeID="+DevTypeID+"&DevTypeName="+DevTypeName+"&DeviceID="+DeviceID+"&DeviceIDCAPTNAME="+DeviceIDCAPTNAME;
		frm.submit();
	}
	
	function $(stringName){
		return document.getElementById(stringName);
	}
	//function test(){
	//	alert("DevTypeMark  "+ frm["DevTypeMark"].value+"  pointDeviceMark  "+frm["pointDeviceMark"].value+" DevTypeID "+frm["DevTypeID"].value+" DeviceID  "+frm["DeviceID"].value+" DevTypeName  "+frm["DevTypeName"].value+" DeviceIDCAPTNAME  "+frm["DeviceIDCAPTNAME"].value);
		
	//}
	
	function getDevTypeValue(obj){
		frm["DevTypeName"].value = obj.options[obj.selectedIndex].innerText;
		frm["DevTypeID"].value = obj.options[obj.selectedIndex].value;
	}
	
	function getDeviceID(obj){
		var select1 = document.getElementById("select1");
		frm["DevTypeName"].value = select1.options[select1.selectedIndex].innerText;
		frm["DevTypeID"].value = select1.options[select1.selectedIndex].value;
		frm["DeviceIDCAPTNAME"].value = obj.options[obj.selectedIndex].innerText;
		frm["DeviceID"].value = obj.options[obj.selectedIndex].value;
		//alert("DevTypeName  "+frm["DevTypeName"].value+"DevTypeID  "+frm["DevTypeID"].value+"DeviceIDCAPTNAME  "+frm["DeviceIDCAPTNAME"].value+"DeviceID  "+frm["DeviceID"].value);
	}
	
	function selectType(obj){
		if(obj.value == 1){
			frm["DevTypeMark"].value = 1;
			$("select1").disabled = false;
			$("select2").disabled = true;
			appointArea[0].disabled = true;
			appointArea[1].disabled = true;
			appointArea[0].checked = false;
			appointArea[1].checked = false;
		}else if(obj.value == 2){
			frm["DevTypeMark"].value = 2;
			frm["pointDeviceMark"].value = 2;
			appointArea[1].checked = true;
			appointArea[0].disabled = false;
			appointArea[1].disabled = false;
			if(appointArea[0].checked == true){
				$("select1").disabled = true;
				$("select2").disabled = true;
			}else{
				$("select1").disabled = false;
				$("select2").disabled = false;
			}
		}
	}

	function onSelect(obj){
		if(obj.value == 1){
			frm["pointDeviceMark"].value = 1;
			$("select1").disabled = true;
			$("select2").disabled = true;
		}else if(obj.value == 2){
			frm["pointDeviceMark"].value = 2;
			$("select1").disabled = false;
			$("select2").disabled = false;
		}
	}
	
	function add(){
		var DevTypeMark = frm["DevTypeMark"].value;
		var pointDeviceMark = frm["pointDeviceMark"].value;
		var DevTypeID = frm["DevTypeID"].value;
		var DevTypeName = frm["DevTypeName"].value;
		var DeviceID = frm["DeviceID"].value;
		var DeviceIDCAPTNAME = frm["DeviceIDCAPTNAME"].value;
		
		//alert("DevTypeMark   "+DevTypeMark+"  pointDeviceMark  "+pointDeviceMark+"  DevTypeID  "+DevTypeID+"  DevTypeName  "+DevTypeName+"  DeviceID  "+DeviceID+"  DeviceIDCAPTNAME  "+DeviceIDCAPTNAME);
		//return;
		
		if(deviceType[0].checked == true){
			var select1 = $("select1");
			if(select1.options[select1.selectedIndex].value == -1){
				alert("请选择设备类型");
				return;
			}
		}
		
		if(appointArea[1].checked == true){
			if(DevTypeID == -1 || DevTypeName == -1 || DeviceID == -1 || DeviceIDCAPTNAME == -1 || DevTypeID == "" || DevTypeName == "" || DeviceID == "" || DeviceIDCAPTNAME == ""){
				alert("请选择设备!");
				return;
			}
		}
		//alert("DevTypeMark   "+DevTypeMark+"pointDeviceMark  "+pointDeviceMark+"DevTypeID  "+DevTypeID+"DevTypeName  "+DevTypeName+"DeviceID  "+DeviceID+"DeviceIDCAPTNAME  "+DeviceIDCAPTNAME);
		updateOption(DevTypeMark,pointDeviceMark,DevTypeID,DevTypeName,DeviceID,DeviceIDCAPTNAME);
		this.parent.window.close();
	}
	
	function updateOption(DevTypeMark,pointDeviceMark,DevTypeID,DevTypeName,DeviceID,DeviceIDCAPTNAME){
		this.parent.window.opener.updateOption(DevTypeMark,pointDeviceMark,DevTypeID,DevTypeName,DeviceID,DeviceIDCAPTNAME);
	}

	function cancel(){
		this.parent.window.close();
	}
</script>