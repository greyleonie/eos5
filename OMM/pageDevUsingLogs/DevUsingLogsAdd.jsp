<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/internet/scripts/fccnewtab.js"></SCRIPT>
<body>
	<form method="post" action="OMM.prDevUsingLogs.prOMM_DevUsingLogsInsert.do">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">��ά����&gt;�ʲ�����&gt;�豸ʹ�ü�¼��&gt;�����豸ʹ�ü�¼</td>
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
							<td width="20%" align="center" nowrap class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;��:</td>
							<td width="80%" class="td1">
								<html:text property="OMM_DevUsingLogs/DeviceID" name="OMM_DevUsingLogsT/DeviceID" readonly="true"/>
								<span class="text_red">*</span>
								<html:button name="btn1" value="ѡ��" onclick="selectUserlist('btn1')"/>
								
								
								<html:hidden property="OMM_DevUsingLogs/DeviceID" name="OMM_DevUsingLogs/DeviceID"/>
							</td>
						</tr>
						<tr>
							<td width="20%" align="center" nowrap class="td2">�豸ʹ����:</td>
							<td width="80%" class="td1">
							<html:text property="OMM_DevUsingLogs/UserID" name="OMM_DevUsingLogsT/UserID" readonly="true"/> &nbsp;
								
								<html:button name="btn" value="ѡ��" onclick="selectUserlist('btn')" />
								<html:hidden property="OMM_DevUsingLogs/UserID" name="OMM_DevUsingLogs/UserID"/>
							
          				 <!-- <select size="1" style="width:150" name="mobilenums" ondblclick="deleteOption(this)"></select>
           					 <html:text name="mobilenums" property="mobilenums" ondblclick="deleteOption(this)"/>-->
							</td>
						</tr>
						<tr>
							<td width="20%" align="center" nowrap class="td2">�豸���ڷ���:</td>
							<td width="80%" class="td1">
							<html:text property="OMM_DevUsingLogs/RoomID" name="OMM_DevUsingLogsT/RoomIDTemp" readonly="true"/>
								<span class="text_red">*</span>
								<html:button name="btn2" value="ѡ��" onclick="selectUserlist('btn2')"/>
								<html:hidden property="OMM_DevUsingLogs/RoomID" name="OMM_DevUsingLogs/RoomID" />
							</td>
						</tr>
						<tr>
							<td width="20%" align="center" nowrap class="td2">��ʼʹ��ʱ��:</td>
							<td width="80%" class="td1">
								<html:text property="OMM_DevUsingLogs/BeginTime[@pattern='yyyy-MM-dd']" readonly="true"/>
								<span class="text_red">*</span>
								<input type="button" value="����" onclick="var txt=document.getElementById(&quot;OMM_DevUsingLogs/BeginTime[@pattern='yyyy-MM-dd']&quot;),format=&quot;yyyy-MM-dd&quot;; calendar(txt,format);">
							</td>
						</tr>
					</table>
					<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center">
							<input name="button" type="button" class="button_02" value="�� ��" onClick="save()"> 
							<input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
var frm=document.forms[0];
//ѡ��ʹ����
//----------------------------------------------------------------------------------------------------------		
 function selectNamelist(){
        var remark=new Date().getTime();
		var loc="ICCard.prMsg.selectMobile.do?remark="+remark;
		var obj=frm.elements["mobilenums"];
	    frm.elements["btn"].style.disabled="none";
	    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=180,scroll=yes");
	    }	
//------------------------------------------------------------------------------------------------------------
	function selectUserlist(btnName){
 		if(btnName == "btn"){
	        var remark=new Date().getTime();
			var loc="OMM.prDevUsingLogs.printoSelectUserTop.do?remark="+remark;
			var obj=frm.elements["mobilenums"];
		    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=700,scroll=yes");
		   // window.showModalDialog('OMM.prDevUsingLogs.printoSelectUserTop.do','title','scrollbars=no;resizable=no;help=no;status=no;dialogTop=180px; dialogLeft=700px;dialogHeight=380px;dialogwidth=500px;');
	    }else if(btnName == "btn1"){
	        var remark=new Date().getTime();
	    	var loc = "OMM.prDevUsingLogs.printoSelectDeviceIDTop.do?remark="+remark;
		    window.open(loc,"","width=500,height=380,status=yes,top=180,left=700,scroll=yes");
	    }else if(btnName == "btn2"){
	    	var remark = new Date().getTime();
	    	var loc="OMM.prDevUsingLogs.printoSelectGuestRootTop.do?input/BuildingID=1&input/LayerNO=6";
		    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=700,scroll=yes");
	    }
	}	
//------------------------------------------------------------------------------------------------------------
	function addOptionBtn1(CAPTID,CAPTNAME){
		frm.elements["OMM_DevUsingLogsT/DeviceID"].value=CAPTNAME;
		frm.elements["OMM_DevUsingLogs/DeviceID"].value=CAPTID;
	}
	
	function addOption(textval, val){
		//var operatorName = textval.substring(0,textval.indexOf("["));
		var operatorName = textval;
		frm.elements["OMM_DevUsingLogsT/UserID"].value=operatorName;
		frm.elements["OMM_DevUsingLogs/UserID"].value=val;
	}
	function addOptionBtn2(roomID,RoomName,BuildingName){
		frm.elements["OMM_DevUsingLogsT/RoomIDTemp"].value = BuildingName+"["+RoomName+"]";
		frm.elements["OMM_DevUsingLogs/RoomID"].value=roomID;
	}
	/*function addOption(textval,val){
		alert(textval + "   textval");
		alert(val+ "    val");
		var mobileNos = "";
		var errMobiles = "";
		textval = trim(textval)
		alert("2  "+textval);
		if (textval.indexOf(" ")>0) {
			mobileNos = textval.split(" ");
			for (var i=0;i<mobileNos.length;i++) {
				if (trim(mobileNos[i]) != "") {
					if (isPhone(trim(mobileNos[i]))) {
						var oOption = document.createElement("OPTION");
						oOption.text=mobileNos[i];
						oOption.value=mobileNos[i];
						messageForm.mobilenums.add(oOption);
						countMobile(messageForm.mobilenums);
					} else {
						errMobiles += mobileNos[i] + " ";
					}
				}
			}
		}else {
			if (textval != "") {
				if (isPhone(textval)) {
					var oOption = document.createElement("OPTION");
					oOption.text=textval;
					oOption.value=val;
					messageForm.mobilenums.add(oOption);
					countMobile(messageForm.mobilenums);
		}else{
			errMobiles += textval + " ";
		} }
		}
		
		if (errMobiles != "") {
			alert("�����ֻ�����������������룡\n" + errMobiles);
		}
	}*/
//------------------------------------------------------------------------------------------------------------

	function checkInput(strValue){
		var frm = document.forms[0];
		var value = frm.elements[strValue].value;
		if(value == -1 || value == ""){
			//frm.elements[strValue].focus();
			return 0;
		}
	}
//------------------------------------------------------------------------------------------------------------

	function save() {
		var frm = document.forms[0];
		var value=frm.elements["OMM_DevUsingLogs/DeviceID"].value;
		if(checkInput("OMM_DevUsingLogs/DeviceID") == 0){
			alert("��ѡ���豸!");
			return;
		}
		if(checkInput("OMM_DevUsingLogs/RoomID") == 0){
			alert("��ѡ�����ڷ���!");
			return;
		}
		/*
		
		if(checkInput("OMM_DevUsingLogs/UserID") == 0){
			alert("��ѡ���豸ʹ����!");
			return;
		}
		if(checkInput("OMM_DevUsingLogs/BeginTime/criteria/value") == 0){
			alert("��ѡ��ʼʹ��ʱ��!");
			return;
		}*/
		frm.submit();
		//if(checkInput("OMM_DevUsingLogs/EndTime/criteria/value") == 0){
		//	alert("��ѡ�����ʹ��ʱ��!");
		//	return;
		//}
		////////////////////////////////
		//alert(value);
		/*if (value== -1) {
			alert("��ѡ���豸��ʶ��!");
			frm.elements["OMM_DevUsingLogs/DeviceID"].focus();
			return;
		}
		value = null;
		value=frm.elements["OMM_DevUsingLogs/operatorID"].value;
		if (value=="") {
			alert("��ѡ���豸ʹ���˱�ʶ��!");
			frm.elements["OMM_DevUsingLogs/operatorID"].focus();
			return;
		}
		
		value = null;
		value=frm.elements["OMM_DevUsingLogs/RoomID"].value;
		if (value=="") {
			alert("��ѡ�����ڷ����ʶ��!");
			frm.elements["OMM_DevUsingLogs/RoomID"].focus();
			return;
		}*/
		
	}
</script>