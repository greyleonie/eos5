<%@include file="/internet/common.jsp"%>
<body>
	<form method="post" action="">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">��ά����&gt;�ʲ�����&gt;�豸ʹ�ü�¼��&gt;�����걨</td>
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
							<td width="30%" align="right" nowrap class="td2">���ڷ����ʶ��:</td>
							<td width="70%" class="td1">
								<html:text property="OMM_DevUsingLogs/DeviceID" name="OMM_DevUsingLogs/DeviceID" readonly="true"/>
								<span class="text_red">*</span>
								<html:button name="btn2" value="ѡ�����ڷ����ʶ��" onclick="selectUserlist('btn2')"/>
							</td>
						</tr>
						<tr>
							<td width="30%" align="right" nowrap class="td2">�豸�������:</td>
							<td width="70%" class="td1">
								<html:text property="OMM_DevUsingLogs/UserID" name="OMM_DevUsingLogs/UserID" readonly="true"/>
								<span class="text_red">*</span>
								<!--<html:button name="btn" value="ѡ��ʹ����" onclick="selectUserlist('btn')" />
							
          				  <select size="1" style="width:150" name="mobilenums" ondblclick="deleteOption(this)"></select>
           					 <html:text name="mobilenums" property="mobilenums" ondblclick="deleteOption(this)"/>-->
							</td>
						</tr>
						<tr>
							<td width="30%" align="right" nowrap class="td2">�걨ʱ��:</td>
							<td width="70%" class="td1">
								<html:text property="OMM_DevUsingLogs/BeginTime" attributesText="class='input'"/> 
								<input type="button" value="����" onclick="var txt=document.getElementById(&quot;OMM_DevUsingLogs/BeginTime&quot;),format=&quot;yyyyMMdd&quot;; calendar(txt,format);">
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