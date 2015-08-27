<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>修改IC卡</title>
<SCRIPT type="text/javascript" language="javascript">
		function toquery(){
			var frm =document.forms[0];
			frm.action=frm.elements["modifyaction"].value;
			frm.submit();
		}
		function StartModify(){
					document.forms["elockForm"].submit();
		}
</SCRIPT>
</head>

<body class="Standard-BodyStyle" topmargin="0" leftmargin="0">
<form method="post" action="ICCard.prDevice.elockModifyDo.do" name="elockForm">
<table width="101%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td width="642" class="text_wirte">首页—&gt;一卡通—&gt;卡库管理—&gt;修改IC卡             </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
     	<input type="hidden" name="modifyaction" value="ICCard.prDevice.elockModify.do">
		<html:hidden property="Elock/ElockID"/>
		<html:hidden property="fid"/>
	  </td>
    </tr>
  </table>

	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
		<tr>
		  <td width="12%" align="right" nowrap class="td2">服务器IP：</a></td>
		  <td class="td1">
				<html:select property="Elock/ElockServerID"  > 
					<html:option  value="-1">---请选择---</html:option> 
					<html:options property="list[@type='ElockServer']/ElockServer/ElockServerID" labelProperty="list[@type='ElockServer']/ElockServer/IP"/> 
				</html:select>
		  </td>
		</tr>
		<tr>
		  <td width="12%" align="right" nowrap class="td2">设备号：</a></td>
		  <td width="88%" align="left" class="td1"><html:text property="Elock/ReaderID"
				styleClass="input" size="20" /></td>
		</tr>
		<tr >
			<td width="12%" align="right" nowrap class="td2">楼房号：</td>
			<td class="td1">
				<html:select property="Elock/BuildingID/criteria/value" onchange="toquery()" > 
					<html:option  value="-1">---请选择---</html:option> 
					<html:options property="list[@type='Building']/Building/BuildingID" labelProperty="list[@type='Building']/Building/BuildingName"/> 
				</html:select>
			</td>
		</tr>
		<tr >
			<td width="12%" align="right" nowrap class="td2">楼层：  </td>
			<td class="td1">
				<html:select property="Elock/LayerID/criteria/value" onchange="toquery()" >
					<option value="-1">---请选择---</option>
					<html:options property="list[@type='Layer']/Layer/LayerNO" labelProperty="list[@type='Layer']/Layer/LayerNO" />
				</html:select>
			</td>
		</tr>
		<tr >
			<td width="12%" align="right" nowrap class="td2">房间号：</td>
			<td class="td1">
				<html:select property="Elock/RoomID"  > 
					<html:option  value="-1">---请选择---</html:option> 
					<html:options property="list[@type='Room']/Room/RoomID" labelProperty="list[@type='Room']/Room/RoomName"/> 
				</html:select>
			</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">备 注：</td>
			<td class="td1"><html:text property="Elock/Remark" styleClass="input"
				size="30" /></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td class="td1">
				<input name="saveButton" type="button" class="button_02" value="保 存" onClick="StartModify()">
	            <input name="return" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
			</td>
		</tr>
  </table>
</form>
</body>
</html>