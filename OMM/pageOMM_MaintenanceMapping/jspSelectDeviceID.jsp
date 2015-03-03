
<link rel="stylesheet" href="/internet/BNOM/style.css" type="text/css">
<SCRIPT language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/pageComponent/resources/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/pageComponent/resources/scripts/dynamicSelect.js"></SCRIPT>
<style type="text/css">
#layout, #layout td {
	text-align: center;
	background-color: #F7F6F6;
	height: 25px;
	font-family: "??";
	font-size: 12px;
	color: #000000;
}
</style>
<body>
	<table  align="center">
		<tr>
			<td nowrap  id="layout">
				设备类型:
				<select id="select1" bizAction="OMM.bizOMM_MaintenanceMapping.bizQueryAllDevType" paramXML="" listXpath="list" entityName="OMM_DevType"
					valueField="TypeID" textField="TypeName" childID="select2" nullLable="true" nullLableText="请选择..." nullLableValue=""
					onchange="refreshChild_DS(this)">
				</select> 
				资产信息：
				<select id="select2" bizAction="OMM.bizOMM_MaintenanceMapping.bizQueryAllITDevice" paramXML="" listXpath="list" entityName="CAPT_CAPITALINFO"
					valueField="DeviceID" textField="CAPTNAME" childID=""  mainSelectID="select1"  nullLable="true"
					nullLableText="请选择..." nullLableValue="" onchange="doChange(this)">
				</select>
				<script language="JavaScript" type="text/JavaScript">
					initSel_DS(select1);
				</script>
			</td>
		</tr>
		<tr >
			<td  nowrap align="center"> 
			<input name="B6" type="button" class="button_02" value="关闭" onclick="cancel()"></td>
		</tr>
	</table>
</body>
<script type="text/javascript">
<!--
	function doChange(select2){
		if(trim(select2.value) == ""){
			alert("请选择其中一项");
		}else{
			var select1 = document.getElementById("select1");
			//alert(obj.value);
			//alert(select1.value);
			//alert(select1.options[select1.selectedIndex].innerText);
			//alert(trim(select2.value));
			//alert(select2.options[select2.selectedIndex].innerText);
			addDeviceID(select1.value,select1.options[select1.selectedIndex].innerText,trim(select2.value),select2.options[select2.selectedIndex].innerText);
			//addDeviceID(obj.value,obj.value);
			//addDeviceID(trim(select2.value),select2.all["textField"].value);
		}
	}
	function addDeviceID(TypeID,TypeName,DeviceID,CAPTNAME){
        this.parent.window.opener.addOptionBtn2(TypeID,TypeName,DeviceID,CAPTNAME);
    }
    
    function cancel(){
		this.parent.window.close();
	}
//-->
</script>