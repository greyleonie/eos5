<%@include file="/internet/common.jsp"%>

<SCRIPT language="JavaScript" src="/internet/scripts/fccnewtab.js"></SCRIPT>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree"%>
<script language="jscript" src="/pageComponent/resources/scripts/rtree.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/string.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/eventManager.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></script>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<body onload="getv()">
<form action="OMM.prOMM_MaintenanceMapping.prFileMaintenanceMappingUpdateDo.do" method="post" name="formName">
	<!--<html:hidden property="OMM_DevUsingLogsTemp/entity/DevUsingLogID"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/DeviceID"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/UserID"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/RoomID"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/BeginTime"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/EndTime"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/AlterationReason"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/operatorName"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/RoomName"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/CAPTNAME"/>
	<html:hidden property="OMM_DevUsingLogsTemp/entity/buildingName"/>-->
	<TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="24" background="/internet/image/lz_bg.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="text_wirte">��ά����&gt;��ά����&gt;ά�޼�¼��&gt;�޸�ά�޼�¼</td>
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
					<td width="20%" align="center" nowrap class="td2">ά&nbsp;��&nbsp;Ա:</td>
					<td width="80%" class="td1">
						<html:hidden property="fid" name="fid" />
						<html:text property="EOSOperator/entity/operatorName" name="EOSOperator/entity/operatorName" readonly="true"/>
						<html:hidden property="OMM_MaintenanceMapping/entity/MaintenanceManID" name="OMM_MaintenanceMapping/entity/MaintenanceManID"/>
					</td>
				</tr>
				<tr>
					<td width="20%" align="center" nowrap class="td2">ԭ����Χ:</td>
					<td width="80%" class="td1">
						 <logic:iterate id="resultset1" property="list[@type='OMM_MaintenanceMappingTemp2']">
						<bean:write id="resultset1" property="OMM_MaintenanceMappingTemp2/BuildingAndRoomDetail"/><bean:write id="resultset1" property="OMM_MaintenanceMappingTemp2/DeviceDetail"/>
						</logic:iterate>
					</td>
				</tr>
				<tr>
					<td align="center" nowrap class="td2" colspan="2">��&nbsp;&nbsp;��</td>
				</tr>
						<tr>
							<td width="20%" align="center" nowrap class="td2">ά&nbsp;��&nbsp;Ա:</td>
							<td width="80%" class="td1">
								<html:text property="OMM_MaintenanceMapping/MaintenanceManID" name="OMM_MaintenanceMappingT/MaintenanceManID" readonly="true"/>
								<html:button name="btn1" value="ѡ ��" onclick="selectUserlist('btn1')"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="text_red">*</span>
								<html:hidden property="OMM_MaintenanceMapping/MaintenanceManID" name="OMM_MaintenanceMapping/MaintenanceManID"/>
							</td>
						</tr>
						<tr>
							<td width="20%" align="center" nowrap class="td2">�¸���Χ:</td>
							<td width="80%" class="td1">
				            <select size="2" style="width:250" id="recordSelect" name="recordSelect" ondblclick="deleteOption1(this)" ></select>
				            <input type="button" name="buttonArea" class="button_01" value="�� ��" onclick="areaSelect()">
				            <br/><font color="red">˫����ɾ��ѡ��</font>
							</td>
						</tr>
						<tr>
							<td width="20%" align="center" nowrap class="td2"></td>
							<td width="80%" class="td1">
								<input type="button" name="buttonDevice" class="button_01" value="�� ��" onclick="deviceSelect()">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				            <br/><font color="red">��ѡ������,��ѡ���豸</font>
							</td>
						</tr>
			</table>
			<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center"><input name="button" type="button" class="button_02" value="�� ��" onClick="save()"> <input
							name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
				</tr>
			</table>
	</table>
	
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
	
	var frm=document.forms[0];
	var optionCounts = 0;
	//����@һ���ָ���,��¼��#2���ָ���,��¼ֵ:3���ָ���
	var valueString = ",";
	//alert(valueString.charAt(0));
	var RoomTypeID = "";
	var BuildingID = "";
	var RoomID     = "";
	var DeviceID   = "";
	var DevTypeID  = "";
	
	
	function checkoption(){
		var recordSelect = document.getElementById("recordSelect");
		alert(recordSelect.selectedIndex);
	}
	
	//����ȥ�����ָ�������ֵ�ַ�����
	function kickChar(str){
		//alert(str.length);
		return str.substring(0,str.length-1);
		//alert(str);
	}
	
	//���Ƹ�DeviceID�ַ�ֵ��
	function setValueToDeviceID(selIndex, str){
		var strTemp = "";
		var strList;
		if(selIndex < 0){
			alert("��ѡ��һ��ά�޼�¼!");
			return;
		}
		//��һ����¼
		//if((DeviceID.indexOf(",") == DeviceID.lastIndexOf(",")) && DeviceID.indexOf(",") != -1){
		if(optionCounts == 1){
			DeviceID = str+",";
			return;
		}//ѡ��������һ����¼
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
	
	//���Ƹ�DevTypeID�ַ�ֵ��
	function setValueToDevTypeID(selIndex, str){
		var strTemp = "";
		var strList;
		if(selIndex < 0){
			alert("��ѡ��һ��ά�޼�¼!");
			return;
		}
		//��һ����¼
		//if((DevTypeID.indexOf(",") == DevTypeID.lastIndexOf(",")) && DevTypeID.indexOf(",") != -1){
		if(optionCounts == 1){
			DevTypeID = str+",";
			return;
		}//ѡ��������һ����¼
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
	
	function getValues(){
		var recordSelect = document.getElementById("recordSelect");
		var splitStrings = DeviceID.split(",");
		var stringvalue = "";
		for(i = 0; i < splitStrings.length; i++){
			stringvalue += "|splitStrings["+i+"]:"+splitStrings[i];
		}
		
		//kickChar(RoomTypeID);
		//alert("RoomTypeID.indexOf"+RoomTypeID.indexOf(",") + "  RoomTypeID.length:"+RoomTypeID.length);
		alert("stringvalue: "+stringvalue+"  ����ֵ: "+recordSelect.selectedIndex+"  ��¼������: "+optionCounts+ "   RoomTypeID  "+RoomTypeID+"  BuildingID  "+BuildingID+"  RoomID  "+RoomID+" DevTypeID "+DevTypeID+" DeviceID "+DeviceID);
		//setValueToDeviceID(recordSelect.selectedIndex,"����");
		//alert(" DeviceID "+DeviceID);
	}
	
	function deleteOption1(obj){
		if(obj.value=="" && obj.innerText=="")
			return;
		if(window.confirm("ȷ��ɾ��������¼��")){	
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
		var sel=document.getElementById('recordSelect');
	}
	
	function deviceSelect(){
		var loc = "OMM.prOMM_MaintenanceMapping.prDeviceSelect.do?ITDeviceTemp/DeviceID=-1&ITDeviceTemp/TypeID=-1";
		window.open(loc, "", "width=250px,height=250,status=yes,top=180,left=680,scroll=yes,location=0");
	}
	
	function selectUserlist(btnName){/////////////////
		if(btnName == "btn1"){
			var loc="OMM.prOMM_MaintenanceMapping.prselectManID.do";
		    window.open(loc,"","width=250px,height=320,status=yes,top=180,left=680,scroll=yes");
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
		var sel=document.getElementById('recordSelect');
		var count=sel.length;
		var index=count-1;
		sel.options[index].selected=true;
	}
	
	function save(){
		var value = frm.elements["OMM_MaintenanceMappingT/MaintenanceManID"].value;
		if(checkInput("OMM_MaintenanceMappingT/MaintenanceManID") == 0){
			alert("��ѡ��ά��Ա!");
			return;	
		}
		
		var recordSelect = document.getElementById("recordSelect");
		if(recordSelect.length == 0){
			alert("�����ά�޼�¼!");
			return;
		}
		for(i = 0; i < recordSelect.length; i++){
			if(recordSelect.options[i].value == 0){
				alert("ά�޼�¼������,������豸!");
				return;
			}
		}
		//value = frm.elements["OMM_MaintenanceMappingT/DeviceID"].value;
		/*if(checkInput("OMM_MaintenanceMappingT/DeviceID") == 0){
			alert("��ѡ���豸��!");
			return;	
		}
		
		value = frm.elements["OMM_MaintenanceMappingT/BuildingID"].value;
		if(checkInput("OMM_MaintenanceMappingT/BuildingID") == 0){
			alert("��ѡ��¥��!");
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
		if(optionCounts>=1){
			alert("�޸�ά�޼�¼�������ٴ���ӷ�Χ!");
			return;
		}
		//alert("asdfasdf");
		//alert("roomTypeMark  "+roomTypeMark+"roomTypeID  "+roomTypeID+"  buildAndRoomMark  "+buildAndRoomMark+"  buildingID  "+buildingID+"  buildingName  "+buildingName+"  roomID  "+roomID+"  roomName  "+roomName);
		//return;
		var oOption = document.createElement("option");
		oOption.text = "";
		oOption.value = 0;
		if(roomTypeMark == 1){
			if(roomTypeID == 0){
				if(buildAndRoomMark == -1){
					oOption.text = "��У���з���";
					RoomTypeID += " ,";
					BuildingID += " ,";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}else if(buildAndRoomMark == 1){
					oOption.text =  buildingName+"���з���";
					RoomTypeID += " ,";
					BuildingID += buildingID+",";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}
			}else if(roomTypeID == 1){
				if(buildAndRoomMark == -1){
					oOption.text =  "��У���н���";
					RoomTypeID += roomTypeID+",";
					BuildingID += " ,";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}else if(buildAndRoomMark == 1){
					oOption.text =  buildingName+" "+"���н���";
					RoomTypeID += roomTypeID+",";
					BuildingID += buildingID+",";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}
			}else if(roomTypeID == 2){
				if(buildAndRoomMark == -1){
					oOption.text =  "��У ���пͷ�";
					RoomTypeID += roomTypeID+",";
					BuildingID += " ,";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}else if(buildAndRoomMark == 1){
					oOption.text =  buildingName+"���пͷ�";
					RoomTypeID += roomTypeID+",";
					BuildingID += buildingID+",";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}
			
			}else if(roomTypeID == 3){
				if(buildAndRoomMark == -1){
					oOption.text =  "��У ����������";
					RoomTypeID += roomTypeID+",";
					BuildingID += " ,";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}else if(buildAndRoomMark == 1){
					oOption.text =  buildingName+"����������";
					RoomTypeID += roomTypeID+",";
					BuildingID += buildingID+",";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}
			
			}else if(roomTypeID == 4){
				if(buildAndRoomMark == -1){
					oOption.text =  "��У ���а칫��";
					RoomTypeID += roomTypeID+",";
					BuildingID += " ,";
					RoomID += " ,";
					DevTypeID  += " ,";
					DeviceID   += " ,";
				}else if(buildAndRoomMark == 1){
					oOption.text =  buildingName+" "+"���а칫��";
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
				oOption.text = ""+buildingName+roomName+"��";
				///alert("oOption.text");
				///alert(oOption.text);
			//}
		}
		/*}else if(roomTypeMark == 2){
			RoomTypeID += roomTypeID+",";
			BuildingID += buildingID+",";
			RoomID += roomID+",";
			DevTypeID  += " ,";
			DeviceID   += " ,";
			if(buildAndRoomMark == 2){
				oOption.text = buildingName+" "+roomName+"��";
			}
		}*/
		optionCounts++;
		formName.recordSelect.add(oOption);
		var sel=document.getElementById('recordSelect');
		var count=sel.length;
		var index=count-1;
		sel.options[index].selected=true;
	}
	
	
	function updateOption(DevTypeMark,pointDeviceMark,DevTypeID,DevTypeName,DeviceID,DeviceIDCAPTNAME){
		//alert("DevTypeMark   "+DevTypeMark+"pointDeviceMark  "+pointDeviceMark+"DevTypeID  "+DevTypeID+"DevTypeName  "+DevTypeName+"DeviceID  "+DeviceID+"DeviceIDCAPTNAME  "+DeviceIDCAPTNAME);
		/*var a = frm.elements["OMM_MaintenanceMappingT/DevTypeID"].value=TypeName;
		var b = frm.elements["OMM_MaintenanceMapping/DevTypeID"].value=TypeID;
		var c = frm.elements["OMM_MaintenanceMappingT/DeviceID"].value=CAPTNAME;
		var d = frm.elements["OMM_MaintenanceMapping/DeviceID"].value=DeviceID;
		var e = frm.elements["OMM_MaintenanceMappingT/MaintenanceManID"].value=CAPTNAME;
		var f = frm.elements["OMM_MaintenanceMapping/MaintenanceManID"].value=CAPTID;
		var g = frm.elements["OMM_MaintenanceMapping/BuildingID"].value=BuildingID;
		var h = frm.elements["OMM_MaintenanceMappingT/BuildingID"].value=BuildingName;
		var i = frm.elements["OMM_MaintenanceMapping/RoomID"].value=roomID;
		var j = frm.elements["OMM_MaintenanceMappingT/RoomID"].value=RoomName;
		
		
		return;*/
		if(optionCounts == 0){
			alert("����ѡ��ά�޷�Χ!");
			return;
		}
		
		var recordSelect = document.getElementById("recordSelect");
		
		
		if(recordSelect.selectedIndex == -1){
			alert("��ѡ��һ����¼���������ά���豸!");
			return;
		}
		var theSelectedOption = recordSelect[recordSelect.selectedIndex];
		if(theSelectedOption.value == 1){
			alert("������¼������,�������ά�޷�Χ!");
			return;
		}
		if(DevTypeMark == 1){
			theSelectedOption.text += "������"+DevTypeName;
			theSelectedOption.value = 1;
			setValueToDevTypeID(recordSelect.selectedIndex, DevTypeID);
			setValueToDeviceID(recordSelect.selectedIndex, " ");
		}else if(DevTypeMark == 2){
			if(pointDeviceMark == 1){
				theSelectedOption.text += "�������豸";
				theSelectedOption.value = 1;
				setValueToDevTypeID(recordSelect.selectedIndex, " ");
				setValueToDeviceID(recordSelect.selectedIndex, " ");
			}else if(pointDeviceMark ==2){
				theSelectedOption.text += "��"+DeviceIDCAPTNAME;
				theSelectedOption.value = 1;
				setValueToDevTypeID(recordSelect.selectedIndex, DevTypeID);
				setValueToDeviceID(recordSelect.selectedIndex, DeviceID);
			}
		}
		//alert('end');
		//frm["MaintenanceMappingTemp/DevTypeID"].value  = DevTypeID;
		//frm["MaintenanceMappingTemp/DeviceID"].value   = DeviceID;
	}
	
	function test3(){
		frm.action="OMM.prOMM_MaintenanceMapping.prtest2.do";
		frm.submit();
	}
</script>