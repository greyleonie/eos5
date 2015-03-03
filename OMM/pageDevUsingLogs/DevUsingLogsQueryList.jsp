<%@include file="/internet/common.jsp"%>
<body>
	<form method="post" action="OMM.prDevUsingLogs.prOMM_DevUsingLogsList.do">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id="printTable">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">运维管理—&gt;资产管理—&gt;设备使用记录
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5">
				<input type="hidden" name="queryaction" value="OMM.prDevUsingLogs.prOMM_DevUsingLogsList.do"> 
				<input type="hidden" name="addaction" value="OMM.prDevUsingLogs.prOMM_DevUsingLogsAdd.do"> 
				<input type="hidden" name="modifyaction" value="OMM.prDevUsingLogs.prOMM_DevUsingLogsUpdate.do"> 
				<input type="hidden" name="deleteaction" value="OMM.prDevUsingLogs.prOMM_DevUsingLogsDelete.do">
				<input type="hidden" name="viewaction" value="">
				<input type="hidden" name="modifytoSave" value="">
				<html:hidden property="OMM_DevUsingLogs/_order/col1/field" />
				<html:hidden property="OMM_DevUsingLogs/_order/col1/asc" />
				<html:hidden property="OMM_DevUsingLogs/DevUsingLogID/criteria/value" />
				<html:hidden property="OMM_DevUsingLogs/DevUsingLogID" />
				<html:hidden property="OMM_DevUsingLogs/UserID/criteria/value" />
				<html:hidden property="OMM_DevUsingLogs/RoomID/criteria/value" />
				<html:hidden property="OMM_DevUsingLogs/DeviceID/criteria/value" />
				
				<input type="hidden" name="OMM_DevUsingLogs/BeginTime/criteria/operator" value="between">	
			    <input type="hidden" name="OMM_DevUsingLogs/BeginTime/criteria/criteriaPattern" value="yyyy-MM-dd"/>
				<input type="hidden" name="OMM_DevUsingLogs/EndTime/criteria/operator" value="between">	
			    <input type="hidden" name="OMM_DevUsingLogs/EndTime/criteria/criteriaPattern" value="yyyy-MM-dd"/>
				<!--<html:hidden property="OMM_TypeExtProperty/ExtPropertyName" />-->
				<html:hidden property="PageCond/begin" />
				<html:hidden property="PageCond/count" />
				<html:hidden property="PageCond/length" />
				<!--<INPUT value="like" type="hidden" name="OMM_TypeExtProperty/ExtPropertyName/criteria/operator">
				<INPUT value="center" type="hidden" name="OMM_TypeExtProperty/ExtPropertyName/criteria/likeRule"></td>-->
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
							<a title='关键字可以是"设备"' id="keytitle">设备名</a>：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<html:text property="DeviceID" attributesText="class='input'" readonly="true"/> 
							<html:button name="btn1" value="选择" onclick="selectUserlist('btn1')"/> &nbsp;&nbsp;<html:button name="clearAllValue1" value="清空" onclick="clearAllValue()"/><br>
							<a title='关键字可以是"设备使用人"' id="keytitle">设备使用人</a>：&nbsp;&nbsp;
							<html:text property="operatorName" attributesText="class='input'" readonly="true"/> <html:button name="btn" value="选择" onclick="selectUserlist('btn')" />&nbsp;&nbsp;&nbsp;
							<a title='关键字可以是"设备所在房间"' id="keytitle">设备所在房间</a>：
							<html:text property="RoomName" attributesText="class='input'" readonly="true"/> 
							<html:button name="btn2" value="选择" onclick="selectUserlist('btn2')"/>
						</td>
						</tr>
						<tr>
						<td height="25" class="text">
							<a title='关键字可以是"开始使用时间"' id="keytitle">开始使用时间</a>：
							<html:text property="OMM_DevUsingLogs/BeginTime/criteria/min" attributesText="class='input'" readonly="true"/> 
							<!--<html:text property="OMM_DevUsingLogs/BeginTime/criteria/value" attributesText="class='input'"/>-->
							<input type="button" value="日历" onclick="var txt=document.getElementById(&quot;OMM_DevUsingLogs/BeginTime/criteria/min&quot;),format=&quot;yyyy-MM-dd&quot;; calendar(txt,format);">
							<!--<html:text property="OMM_DevUsingLogs/BeginTime" readonly="true"/>
								<span class="text_red">*</span>
								<input type="button" value="日历" onclick="var txt=document.getElementById(&quot;OMM_DevUsingLogs/BeginTime&quot;),format=&quot;yyyy-MM-dd&quot;; calendar(txt,format);">-->
							&nbsp;&nbsp;
							<a title='关键字可以是"结束使用时间"' id="keytitle">结束使用时间</a>：
							<html:text property="OMM_DevUsingLogs/EndTime/criteria/max" attributesText="class='input'" readonly="true"/>
							<input type="button" value="日历" onclick="var txt=document.getElementById(&quot;OMM_DevUsingLogs/EndTime/criteria/max&quot;),format=&quot;yyyy-MM-dd&quot;; calendar(txt,format);">
							</td>
						</tr>
						<tr>
							<td height="25" class="text">
							<!--<input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()"> -->
							<input name="query" type="button" class="button_02" value="查 询" onClick="checkInput();talentquery()"> 
							<input name="add" type="button" class="button_02" value="领用申请" onClick="DevUsingLogsAdd()"> 
							<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()"> 
							<input name="modifyandsave" type="button" class="button_02" value="变 更" onClick="talentmodify()">
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
								
			<!------------------------------------------------------------------------------------------->
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
			<tr class="td_title">
				<td width="3%" align="center" nowrap><input type="checkbox" name="checkbox" value="checkbox"onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
				<td width="8%" align="center" nowrap id="OMM_DevUsingLogs.DeviceID" >设备</td>
				<td width="8%" align="center" nowrap id="OMM_DevUsingLogs.UserID" >设备使用人</td>
				<td width="8%" align="center" nowrap id="OMM_DevUsingLogs.RoomID" >设备所在房间</td>
				<td width="8%" align="center" nowrap id="OMM_DevUsingLogs.BeginTime" >开始使用时间</td>
				<td width="8%" align="center" nowrap id="OMM_DevUsingLogs.EndTime" >结束使用时间</td>
				<td width="8%" align="center" nowrap id="OMM_DevUsingLogs.AlterationReason" >变更原因</td>
			</tr>
			<%
				int count = 0;
				String trClass = "result_content";
			 %>
			<logic:iterate id="resultset1" property="list[@type='OMM_DevUsingLogs']">
				<%
			 		if(count % 2 == 0)
			 			trClass="td1";
			 		else
			 			trClass="td2";
			 		count++;
			 	 %>
				<tr  class="<%=trClass%>">
					<td align="center">
						<html:checkbox id="resultset1" name="list[@name='update']/OMM_DevUsingLogs/DevUsingLogID" 
						property="OMM_DevUsingLogs/DevUsingLogID" indexed="true"/>
					</td>
					<td nowrap align="center">
						<logic:equal id="resultset1" property="OMM_DevUsingLogs/CAPTNAMETemp" value=""><font color="red">该设备不在固定资产范围</font></logic:equal>
						<logic:notEqual id="resultset1" property="OMM_DevUsingLogs/CAPTNAMETemp" value=""><bean:write id="resultset1" property="OMM_DevUsingLogs/CAPTNAMETemp"/></logic:notEqual>
						</td>
					<td nowrap align="center">
						<bean:write id="resultset1" property="OMM_DevUsingLogs/operatorNameTemp"/></td>
					<td nowrap align="center">
						<bean:write id="resultset1" property="OMM_DevUsingLogs/RoomNameTemp"/></td>
					<td nowrap align="center">
						<bean:write id="resultset1" property="OMM_DevUsingLogs/BeginTime" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
					<td nowrap align="center">
						<bean:write id="resultset1" property="OMM_DevUsingLogs/EndTime" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
					<td nowrap align="center">
						<bean:write id="resultset1" property="OMM_DevUsingLogs/AlterationReason"/></td>
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

	var frm=document.forms[0];
	
	function DevUsingLogsAdd(){
		window.location.href="OMM.prDevUsingLogs.prOMM_DevUsingLogsAdd.do";
	}
	
	function selectUserlist(btnName){
 		if(btnName == "btn"){
	        var remark=new Date().getTime();
			var loc="OMM.prDevUsingLogs.printoSelectUserTop.do?remark="+remark;
			var obj=frm.elements["mobilenums"];
		    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=700,scroll=yes");
	    }else if(btnName == "btn1"){
	        var remark=new Date().getTime();
	    	var loc = "OMM.prDevUsingLogs.printoSelectDeviceIDTop.do?remark="+remark;
		    window.open(loc,"","width=100,height=380,status=yes,top=180,left=850,scroll=yes");
	    }else if(btnName == "btn2"){
	    	var remark = new Date().getTime();
	    	var loc="OMM.prDevUsingLogs.printoSelectGuestRootTop.do?input/BuildingID=1&input/LayerNO=6";
		    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=700,scroll=yes");
	    }
	}
	
	function addOption(textval, val){
		//alert("textval:  "+textval+"val:  "+val);
		frm.elements["operatorName"].value=textval;
		frm.elements["OMM_DevUsingLogs/UserID/criteria/value"].value=val;
	}
	
	function addOptionBtn2(roomID,RoomName,BuildingName){
		frm.elements["RoomName"].value = BuildingName+"["+RoomName+"]";
		frm.elements["OMM_DevUsingLogs/RoomID/criteria/value"].value=roomID;
	}
	
	function addOptionBtn1(CAPTID,CAPTNAME){
		frm.elements["OMM_DevUsingLogs/DeviceID/criteria/value"].value=CAPTID;
		frm.elements["DeviceID"].value=CAPTNAME;
	}
	
	function checkInput(){
		var deviceID = frm.elements["DeviceID"].value;
		var roomName = frm.elements["RoomName"].value;
		var operatorName = frm.elements["operatorName"].value;
		var min = frm.elements["OMM_DevUsingLogs/BeginTime/criteria/min"].value;
		var max = frm.elements["OMM_DevUsingLogs/EndTime/criteria/max"].value;
		
		
		if(deviceID == "" && roomName == "" && operatorName == "" && min == "" && max == ""){
			clearAllValue();
			window.location.href="OMM.prDevUsingLogs.prOMM_DevUsingLogsList.do";
			return;
		}
		
	}
	
	function clearAllValue(){
		
		frm.elements["DeviceID"].value = "";
		frm.elements["RoomName"].value = "";
		frm.elements["operatorName"].value = "";
		frm.elements["OMM_DevUsingLogs/UserID/criteria/value"].value = "";
		frm.elements["OMM_DevUsingLogs/RoomID/criteria/value"].value = "";
		frm.elements["OMM_DevUsingLogs/DeviceID/criteria/value"].value = "";
		frm.elements["OMM_DevUsingLogs/BeginTime/criteria/min"].value = "";
		frm.elements["OMM_DevUsingLogs/EndTime/criteria/max"].value = "";
	
	}
</script>