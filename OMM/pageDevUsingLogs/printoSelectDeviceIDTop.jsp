<%@include file="/internet/common.jsp"%>
<link rel="stylesheet" href="/internet/BNOM/style.css" type="text/css">
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>
<body>
	<table  align="center" width="100">
		<tr>
			<td class="td1" align="center"  height="20" colspan="2">
			
			</td>
		</tr>
		<tr>
			<td  class="td2" nowrap >
				�豸����:
				<select id="select1" bizAction="OMM.bizDevUsingLogs.queryAllRole" paramXML="" listXpath="list" entityName="OMM_DevType"
					valueField="TypeID" textField="TypeName" childID="select2" nullLable="true" nullLableText="��ѡ��..." nullLableValue=""
					onchange="refreshChild_DS(this)">
				</select> 
				</td>
				</tr>
				<tr>
				<td  class="td2" nowrap >
				�豸����
				<select id="select2" bizAction="OMM.bizDevUsingLogs.selectCAPT_CAPITALINFO" paramXML="" listXpath="list" entityName="CAPT_CAPITALINFO"
					valueField="DeviceID" textField="CAPTNAME" childID=""  mainSelectID="select1"  nullLable="true"
					nullLableText="��ѡ��..." nullLableValue="" onchange="getDeviceID(this),doChange(this)">
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
	<table align="center" width="100">
		<tr>
			<td class="td2" align="left">�豸���:<bean:write property="ITDeviceTemp/entity/DevCode"/>
			</td>
		</tr>
		<tr>
			<td class="td2" align="left" >�豸��:<bean:write property="ITDeviceTemp/entity/CAPTNAME"/>
			</td>
		</tr>
		<tr>
			<td class="td2" align="left">�豸����:<bean:write property="ITDeviceTemp/entity/TypeName"/>
			</td>
		</tr>
		<tr>
			<td class="td2" align="left" >��ʼʹ��ʱ��:<bean:write property="ITDeviceTemp/entity/BeginTime"/>
			</td>
		</tr>
		<tr >
			<td  nowrap align="center" colspan="2"> 
			<input name="B6" type="button" class="button_02" value="�� ��" onclick="add()">
			<input name="B6" type="button" class="button_02" value="�� ��" onclick="cancel()">
			<!--<input type="button" value="����" onclick="test()"/> </td>-->
		</tr>
	</table>
</form>
</body>
<script type="text/javascript">
<!--
	/*function doChange(select2){
		if(trim(select2.value) == ""){
			alert("��ѡ������һ��");
		}else{
			addDeviceID(trim(select2.value),select2.options[select2.selectedIndex].innerText);
			//addDeviceID(trim(select2.value),select2.all["textField"].value);
		}
	}*/
	var frm = document.forms[0];
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
		
		
		frm.action="OMM.prDevUsingLogs.printoSelectDeviceIDTop.do?ITDeviceTemp/DeviceID="+deviceID+"&ITDeviceTemp/TypeID="+typeID
					+"&DevTypeMark="+DevTypeMark+"&pointDeviceMark="+pointDeviceMark+"&DevTypeID="+DevTypeID+"&DevTypeName="+DevTypeName+"&DeviceID="+DeviceID+"&DeviceIDCAPTNAME="+DeviceIDCAPTNAME;
		frm.submit();
	}
	
	function add(){
		var select2 = document.getElementById("select2");
		/*if(trim(select2.value) == ""){*/
		if(frm["DeviceID"].value == ""){
			alert("��ѡ������һ��");
		}else{
			//addDeviceID(trim(select2.value),select2.options[select2.selectedIndex].innerText);
			addDeviceID(frm["DeviceID"].value,frm["DevTypeName"].value);
			//addDeviceID(trim(select2.value),select2.all["textField"].value);
		}
		this.parent.window.close();
	}
	function addDeviceID(deviceID,CAPTNAME){
        this.parent.window.opener.addOptionBtn1(deviceID,CAPTNAME);
    }
    
    function cancel(){
		this.parent.window.close();
	}
	
	function getDeviceID(obj){
		var select2 = document.getElementById("select2");
		frm["DevTypeName"].value = select2.options[select2.selectedIndex].innerText;
		frm["DevTypeID"].value = select2.options[select2.selectedIndex].value;
		frm["DeviceIDCAPTNAME"].value = obj.options[obj.selectedIndex].innerText;
		frm["DeviceID"].value = obj.options[obj.selectedIndex].value;
		//alert("DevTypeName  "+frm["DevTypeName"].value+"DevTypeID  "+frm["DevTypeID"].value+"DeviceIDCAPTNAME  "+frm["DeviceIDCAPTNAME"].value+"DeviceID  "+frm["DeviceID"].value);
	}
//-->
</script>