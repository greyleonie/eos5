<%@include file="/internet/common.jsp"%>
<body>
	<form method="post" action="OMM.prOMM_MaintenanceMapping.prMaintenanceMappingList.do">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id="printTable">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">运维管理—&gt;IT设备管理—&gt;设备职责划分
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5">
				<input type="hidden" name="queryaction" value="OMM.prOMM_MaintenanceMapping.prMaintenanceMappingList.do"> 
				<input type="hidden" name="addaction" value=""> 
				<input type="hidden" name="modifyaction" value="OMM.prOMM_MaintenanceMapping.prMaintenanceMappingUpdate.do"> 
				<input type="hidden" name="deleteaction" value="OMM.prOMM_MaintenanceMapping.prOMM_MaintenanceMappingDelete.do">
				<input type="hidden" name="viewaction" value="">
				<input type="hidden" name="modifytoSave" value="">
				<html:hidden property="OMM_MaintenanceMapping/_order/col1/field" />
				<html:hidden property="OMM_MaintenanceMapping/_order/col1/asc" />
				<!--<html:hidden property="OMM_MaintenanceMapping/MaintenanceMappingID/criteria/value" />-->
				<html:hidden property="OMM_MaintenanceMapping/MaintenanceMappingID" />
				<html:hidden property="OMM_MaintenanceMapping/MaintenanceMappingID/criteria/value" />
				<html:hidden property="PageCond/begin" />
				<html:hidden property="PageCond/count" />
				<html:hidden property="PageCond/length" />
				
				
				<html:hidden property="MaintenanceMappingTemp/RoomID" />
				<html:hidden property="MaintenanceMappingTemp/RoomTypeID" />
				<html:hidden property="MaintenanceMappingTemp/MaintenanceManID" />
				<html:hidden property="MaintenanceMappingTemp/DeviceID" />
				<html:hidden property="MaintenanceMappingTemp/DevTypeID" />
				<html:hidden property="MaintenanceMappingTemp/BuildingID" />
				
				<!--<input type="hidden" name="OMM_MaintenanceMapping/BeginTime/criteria/operator" value="between">	
			    <input type="hidden" name="OMM_MaintenanceMapping/BeginTime/criteria/criteriaPattern" value="yyyy-MM-dd"/>
				<input type="hidden" name="OMM_MaintenanceMapping/EndTime/criteria/operator" value="between">	
			    <input type="hidden" name="OMM_MaintenanceMapping/EndTime/criteria/criteriaPattern" value="yyyy-MM-dd"/>-->
				
			</tr>
		</table>
		<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
			<tr>
				<td>
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="8"></td>
						</tr>
						<tr>
							<td height="25" class="text">
							<a title='关键字可以是"维修员"' id="keytitle">维修员</a>：&nbsp;
							<html:text property="/MaintenanceMappMan/MaintenanceMappManName" attributesText="class='input'" readonly="true" /> <html:button name="btn1" value="选 择" onclick="selectUserlist('btn1')" />&nbsp;&nbsp;
							<html:button name="btn1" value="清 空" onclick="clearAllValue()" />
							<!--<html:text property="OMM_MaintenanceMapping/MaintenanceMappingManID/criteria/value" attributesText="class='input'"/>&nbsp;&nbsp;-->
							<!--<a title='关键字可以是"设备名"' id="keytitle">设备名</a>：&nbsp;
							<html:text property="OMM_MaintenanceMapping/DeviceID/criteria/value" attributesText="class='input'"/>&nbsp;&nbsp;
							<a title='关键字可以是"设备类型"' id="keytitle">设备类型</a>：&nbsp;
							<html:text property="OMM_MaintenanceMapping/DevTypeID/criteria/value" attributesText="class='input'"/>
						</td>
						</tr>
						<tr>
						<td height="25" class="text">
							<a title='关键字可以是"楼房名"' id="keytitle">楼房名</a>：&nbsp;
							<html:text property="OMM_MaintenanceMapping/BuildingID/criteria/value" attributesText="class='input'"/>&nbsp;&nbsp;
							<a title='关键字可以是"房间号"' id="keytitle">房间号</a>：&nbsp;
							<html:text property="OMM_MaintenanceMapping/EndTime/criteria/value" attributesText="class='input'"/>&nbsp;&nbsp;
							<a title='关键字可以是"房间类型"' id="keytitle">房间类型</a>：&nbsp;
							<html:text property="OMM_MaintenanceMapping/RoomTypeID/criteria/value" attributesText="class='input'"/> 
							</td>-->
						</tr>
						<tr>
							<td height="25" class="text">
							<input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()"> 
							<input name="add" type="button" class="button_02" value="添加记录" onClick="maintenanceAdd()"> 
							<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()"> 
							<input name="modifyandsave" type="button" class="button_02" value="修 改" onClick="talentmodify()">
							<!--<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()"> 
							<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()"> 
							服务端排序：
							<input type="checkbox" name="checkbox" onClick="servertoorder()" marked="">-->
							</td>
						</tr>
						<tr>
							<td height="8"></td>
						</tr>
						<tr>
							<td valign="top" class="text">
								<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
									<tr class="td_title">
										<td width="5%" align="center" nowrap><input type="checkbox" name="checkbox" value="checkbox"onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
										<td width="25%" align="center" nowrap id="OMM_MaintenanceMapping.MaintenanceManName" >维修员</td>
										<td width="70%" align="center" nowrap id="OMM_MaintenanceMapping.BuildingAndRoomDetail" >负责范围</td>
										<!--<td width="8%" align="center" nowrap id="OMM_MaintenanceMapping.DeviceID" onClick="talentsort()">设备名</td>
										<td width="8%" align="center" nowrap id="OMM_MaintenanceMapping.DevTypeID" onClick="talentsort()">设备类型</td>
										<td width="8%" align="center" nowrap id="OMM_MaintenanceMapping.BuildingID" onClick="talentsort()">楼宇名</td>
										<td width="8%" align="center" nowrap id="OMM_MaintenanceMapping.RoomID" onClick="talentsort()">房间号</td>
										<td width="8%" align="center" nowrap id="OMM_MaintenanceMapping.RoomTypeID" onClick="talentsort()">房间类型</td>-->
									</tr>
									<!--
									 <logic:iterate id="resultset1" property="list[@type='OMM_MaintenanceMapping']">
										
										<tr  class="">
											<td align="center">
												<html:checkbox id="resultset1" name="list[@name='update']/OMM_MaintenanceMapping/MaintenanceMappingID" 
												property="OMM_MaintenanceMapping/MaintenanceMappingID" indexed="true"/>
											</td>
											<td nowrap align="center">
												<bean:write id="resultset1" property="OMM_MaintenanceMapping/MaintenanceManID"/></td>
											<td nowrap align="center">
												<bean:write id="resultset1" property="OMM_MaintenanceMapping/DeviceID"/></td>
											<td nowrap align="center">
												<bean:write id="resultset1" property="OMM_MaintenanceMapping/DevTypeID"/></td>
											<td nowrap align="center">
												<bean:write id="resultset1" property="OMM_MaintenanceMapping/BuildingID"/></td>
											<td nowrap align="center">
												<bean:write id="resultset1" property="OMM_MaintenanceMapping/RoomID"/></td>
											<td nowrap align="center">
												<bean:write id="resultset1" property="OMM_MaintenanceMapping/RoomTypeID"/></td>
										</tr>
									</logic:iterate>
								</table>
								<table>-->
									<%
										int count = 0;
										String trClass = "result_content";
									 %>
									 <logic:iterate id="resultset1" property="list[@type='OMM_MaintenanceMappingTemp2']">
										<%
									 		if(count % 2 == 0)
									 			trClass="td1";
									 		else
									 			trClass="td2";
									 		count++;
									 	 %>
										<tr  class="<%=trClass%>">
											<td align="center" width="5%">
												<html:checkbox id="resultset1" name="list[@name='update']/OMM_MaintenanceMapping/MaintenanceMappingID" 
												property="OMM_MaintenanceMappingTemp2/MaintenanceMappingID" indexed="true" />
											</td>
											<td nowrap align="center" width="25%">
												<bean:write id="resultset1" property="OMM_MaintenanceMappingTemp2/MaintenanceManName"/></td>
											<td nowrap align="center" width="70%">
												<bean:write id="resultset1" property="OMM_MaintenanceMappingTemp2/BuildingAndRoomDetail"/><bean:write id="resultset1" property="OMM_MaintenanceMappingTemp2/DeviceDetail"/></td>
										</tr>
									</logic:iterate>
								</table>
								<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="30" class="text">
											<script>
												PageCond(document.forms[0]);
											</script>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
<script language="javascript">
	function maintenanceAdd(){
		window.location.href="OMM.prOMM_MaintenanceMapping.prMaintenanceMappingAdd.do";
	}
	function talentmodify1(){
		var frm =document.forms[0];
		if(chechedCount(frm)<1){
    		alert("至少必须选择一行！");
    		return ;
    	}
		if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
    	}
    	if(chechedCount(frm)==1){
			id = getChechedValue(frm);
			alert(id);
			return;
    		frm.action = frm.elements["modifyaction"].value;
    		frm.action += "?fid=" + id;
			frm.submit();		
    	}
	}
	
	function selectUserlist(btnName){
		if(btnName == "btn1"){
			var loc="OMM.prOMM_MaintenanceMapping.prselectManID.do";
		    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=700,scroll=yes");
	    }
	}
	
	function addOptionBtn1(CAPTNAME,CAPTID){//////////////
		frm.elements["/MaintenanceMappMan/MaintenanceMappManName"].value=CAPTNAME;
		frm.elements["OMM_MaintenanceMapping/MaintenanceMappingID/criteria/value"].value=CAPTID;
	}
	
	function clearAllValue(){
		
		frm.elements["/MaintenanceMappMan/MaintenanceMappManName"].value = "";
		frm.elements["OMM_MaintenanceMapping/MaintenanceMappingID/criteria/value"].value = "";
	
	}
</script>