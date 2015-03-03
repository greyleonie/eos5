<%@include file="/internet/common.jsp"%>
<body onload="getv()">
<form action="OMM.prDevUsingLogs.prOMM_DveUsingLogsModify.do" method="post">
	<html:hidden property="OMM_DevUsingLogsTemp/entity/DevUsingLogID"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/DeviceID"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/UserID"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/RoomID"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/BeginTime"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/EndTime"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/AlterationReason"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/operatorName"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/RoomName"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/CAPTNAME"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/buildingName"/>
	<TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="24" background="/internet/image/lz_bg.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="text_wirte">运维管理—&gt;资产管理—&gt;扩展属性—&gt;修改设备使用记录</td>
					</tr>
				</table>
			</td>
		<TR>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="8"></td>
		</tr>
		<tr class="text">
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
				<tr>
					<td width="20%" align="center" nowrap class="td2">设&nbsp;&nbsp;备&nbsp;&nbsp;名:</td>
					<td width="80%" class="td1">
						<html:hidden property="fid" name="fid" />
						<html:text property="OMM_DevUsingLogs/DeviceID" name="OMM_DevUsingLogsT/DeviceID" readonly="true"/>
						
						<span class="text_red">*</span>
						<html:button name="btn1" value="选择" onclick="selectUserlist('btn1')" disabled="true"/>
						<html:hidden property="OMM_DevUsingLogs/DeviceID" name="OMM_DevUsingLogs/DeviceID"/>
						<html:hidden property="OMM_DevUsingLogs/DeviceID" name="OMM_DevUsingLogs2/DeviceID"/>
					</td>
				</tr>
				<tr>
					<td width="20%" align="center" nowrap class="td2">设备使用人:</td>
					<td width="80%" class="td1">
						<html:text property="OMM_DevUsingLogs/UserID" name="OMM_DevUsingLogsT/UserID" readonly="true"/>
						<!--<html:select  property="OMM_DevUsingLogs/UserID">
          							<html:option  value="-1">选择设备使用人标识号</html:option>
                   					<html:options property="list[@type='EOSOperator1']/EOSOperator1/operatorID" labelProperty="list[@type='EOSOperator1']/EOSOperator1/operatorID"/>
           						</html:select>--> 
           				<span class="text_red">*</span>
						<html:button name="btn" value="选择" onclick="selectUserlist('btn')" />
						<html:hidden property="OMM_DevUsingLogs/UserID" name="OMM_DevUsingLogs/UserID"/>
						<html:hidden property="OMM_DevUsingLogs/UserID" name="OMM_DevUsingLogs2/UserID" />
					</td>
				</tr>
				<tr>
					<td width="20%" align="center" nowrap class="td2">设备所在房间:</td>
					<td width="80%" class="td1">
						<html:text property="OMM_DevUsingLogs/RoomID" name="OMM_DevUsingLogsT/RoomIDTemp" readonly="true"/>
						<span class="text_red">* </span>
						<html:button name="btn2" value="选择" onclick="selectUserlist('btn2')" />
						<html:hidden property="OMM_DevUsingLogs/RoomID" name="OMM_DevUsingLogs/RoomID" />
						<html:hidden property="OMM_DevUsingLogs/RoomID" name="OMM_DevUsingLogs2/RoomID" />
					</td>
				</tr>
				<tr>
					<td width="20%" align="center" nowrap class="td2">开始使用时间:<!--<html:text property="OMM_DevUsingLogs/BeginTime" />--> </td>
					<td width="80%" class="td1">
						<html:text property="OMM_DevUsingLogs/BeginTime[@pattern='yyyy-MM-dd']" attributesText="class='input'" readonly="false"/>
						<input type="button" value="日历"
							onclick="var txt=document.getElementById(&quot;OMM_DevUsingLogs/BeginTime[@pattern='yyyy-MM-dd']&quot;),format=&quot;yyyy-MM-dd&quot;; calendar(txt,format);">
						<html:hidden property="OMM_DevUsingLogs/BeginTime" name="OMM_DevUsingLogs2/BeginTime" />
					</td>
				</tr>
				<tr>
					<td width="20%" align="center" nowrap class="td2">结束使用时间:</td>
					<td width="80%" class="td1">
						<html:text  property="OMM_DevUsingLogs/EndTime[@pattern='yyyy-MM-dd']" attributesText="class='input'"  readonly="true"/>
						<input type="button" value="日历"
							onclick="var txt=document.getElementById(&quot;OMM_DevUsingLogs/EndTime[@pattern='yyyy-MM-dd']&quot;),format=&quot;yyyy-MM-dd&quot;; calendar(txt,format);">
							<html:hidden property="OMM_DevUsingLogs/EndTime" name="OMM_DevUsingLogs2/EndTime"/>
					</td>
				</tr>
				<tr>
					<td width="20%" align="center" nowrap class="td2">变&nbsp;更&nbsp;原&nbsp;因:</td>
					<td width="80%" class="td1">
						<html:textarea property="OMM_DevUsingLogs/AlterationReason" name="OMM_DevUsingLogs/AlterationReason"/>
						<html:hidden property="OMM_DevUsingLogs/AlterationReason" name="OMM_DevUsingLogs2/AlterationReason" />
					</td>
				</tr>
			</table>
			<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center"><input name="button" type="button" class="button_02" value="保 存" onClick="save()"> <input
							name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
				</tr>
			</table>
	</table>
	<SCRIPT>
		//getv();
	</SCRIPT>
</form>
</body>
<script>
	var frm=document.forms[0];
	
	function getv(){
		frm["OMM_DevUsingLogsT/DeviceID"].value = frm["OMM_DevUsingLogsTemp/entity/CAPTNAME"].value;
		frm["OMM_DevUsingLogsT/UserID"].value = frm["OMM_DevUsingLogsTemp/entity/operatorName"].value;
		frm["OMM_DevUsingLogsT/RoomIDTemp"].value = frm["OMM_DevUsingLogsTemp/entity/buildingName"].value+'['+frm["OMM_DevUsingLogsTemp/entity/RoomName"].value+']';
		frm["OMM_DevUsingLogs/BeginTime[@pattern='yyyy-MM-dd']"].value = frm["OMM_DevUsingLogsTemp/entity/BeginTime"].value;
		//frm["OMM_DevUsingLogs/EndTime"].value = frm["OMM_DevUsingLogsTemp/entity/EndTime"].value;
		frm["OMM_DevUsingLogs/AlterationReason"].value = frm["OMM_DevUsingLogsTemp/entity/AlterationReason"].value;
	}


	function selectUserlist(btnName){
 		if(btnName == "btn"){
	        var remark=new Date().getTime();
			var loc="OMM.prDevUsingLogs.printoSelectUserTop.do?remark="+remark;
			var obj=frm.elements["mobilenums"];
		//    frm.elements["btn"].style.disabled="true";
		    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=700,scroll=yes");
	    }else if(btnName == "btn1"){
	        var remark=new Date().getTime();
	    	var loc = "OMM.prDevUsingLogs.printoSelectDeviceIDTop.do?remark="+remark;
		    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=700,scroll=yes");
	    }else if(btnName == "btn2"){
	    	var remark = new Date().getTime();
	    	var loc = "OMM.prDevUsingLogs.printoSelectGuestRootTop.do?input/BuildingID=1&input/LayerNO=6";
		    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=700,scroll=yes");
	    }
	}	
//------------------------------------------------------------------------------------------------------------
	function addOptionBtn1(CAPTID,CAPTNAME){
		
		frm.elements["OMM_DevUsingLogsT/DeviceID"].value=CAPTNAME;
		frm.elements["OMM_DevUsingLogs/DeviceID"].value=CAPTID;
	}
	
	function addOption(textval, val){
		//alert("textval:  "+textval+"val:  "+val);
		//var operatorName = textval.substring(0,textval.indexOf("["));
		frm.elements["OMM_DevUsingLogsT/UserID"].value=textval;
		frm.elements["OMM_DevUsingLogs/UserID"].value=val;
	}
	function addOptionBtn2(roomID,RoomName,BuildingName){
		frm.elements["OMM_DevUsingLogsT/RoomIDTemp"].value = BuildingName+"["+RoomName+"]";
		frm.elements["OMM_DevUsingLogs/RoomID"].value=roomID;
	}
	function save() {
		var frm = document.forms[0];
		var value=frm.elements["OMM_DevUsingLogs/BeginTime[@pattern='yyyy-MM-dd']"].value;
		//alert(value);
		if (value== -1) {
			alert("请选择开始使用时间!");
			frm.elements["OMM_DevUsingLogs/BeginTime"].focus();
			return;
		}
		
		
		value = frm.elements["OMM_DevUsingLogs/AlterationReason"].value;
		var endTimeValue = frm.elements["OMM_DevUsingLogs/EndTime[@pattern='yyyy-MM-dd']"].value;
		if(value == ""){
			alert("请填写变更原因!");
			return;
		}
		value=frm.elements["fid"].value;
		frm.action+="?fid="+value;
		frm.submit();
	}
</script>