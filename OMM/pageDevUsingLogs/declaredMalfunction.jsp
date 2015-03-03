<%@include file="/internet/common.jsp"%>
<body>
	<form method="post" action="">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">运维管理—&gt;资产管理—&gt;设备使用记录—&gt;故障申报</td>
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
							<td width="30%" align="right" nowrap class="td2">所在房间标识号:</td>
							<td width="70%" class="td1">
								<html:text property="OMM_DevUsingLogs/DeviceID" name="OMM_DevUsingLogs/DeviceID" readonly="true"/>
								<span class="text_red">*</span>
								<html:button name="btn2" value="选择所在房间标识号" onclick="selectUserlist('btn2')"/>
							</td>
						</tr>
						<tr>
							<td width="30%" align="right" nowrap class="td2">设备故障情况:</td>
							<td width="70%" class="td1">
								<html:text property="OMM_DevUsingLogs/UserID" name="OMM_DevUsingLogs/UserID" readonly="true"/>
								<span class="text_red">*</span>
								<!--<html:button name="btn" value="选择使用人" onclick="selectUserlist('btn')" />
							
          				  <select size="1" style="width:150" name="mobilenums" ondblclick="deleteOption(this)"></select>
           					 <html:text name="mobilenums" property="mobilenums" ondblclick="deleteOption(this)"/>-->
							</td>
						</tr>
						<tr>
							<td width="30%" align="right" nowrap class="td2">申报时间:</td>
							<td width="70%" class="td1">
								<html:text property="OMM_DevUsingLogs/BeginTime" attributesText="class='input'"/> 
								<input type="button" value="日历" onclick="var txt=document.getElementById(&quot;OMM_DevUsingLogs/BeginTime&quot;),format=&quot;yyyyMMdd&quot;; calendar(txt,format);">
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
	</form>
</body>
<script>
//------------------------------------------------------------------------------------------------------------
	function selectUserlist(btnName){
 		if(btnName == "btn"){
	        var remark=new Date().getTime();
			var loc="OMM.prDevUsingLogs.printoSelectUserTop.do?remark="+remark;
			var obj=frm.elements["mobilenums"];
		//    frm.elements["btn"].style.disabled="true";
		    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=180,scroll=yes");
	    }else if(btnName == "btn1"){
	    	
	    }else if(btnName == "btn2"){
	    	var remark = new Date().getTime();
	    	var loc="OMM.prDevUsingLogs.printoSelectGuestRootTop.do?input/BuildingID=1&input/LayerNO=6";
		    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=180,scroll=yes");
	    }
	}	
</script>