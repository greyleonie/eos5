<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>��ӵ�������������</title>
</head>

<body class="Standard-BodyStyle" topmargin="0" leftmargin="0">
<script language="JavaScript">
			var count=0,totalcount=0,id=0,oldid=0;
		</script>
<!-- ������ -->
<form method="post" action="ICCard.prDevice.elockServerAddDO.do" name="elockForm">
<table width="101%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td width="642" class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;������������&gt;��ӵ�������������             </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
      	<input type="hidden" name="addaction" value="ICCard.prDevice.elockServerAdd.do">
      	<html:hidden  name="Elock" property="Elock/ElockID"/>
		<html:hidden  name="ElockServer" property="ElockServer/ElockServerID"/>
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
	  </td>
    </tr>
  </table>


	<!-- ����������������Ϣ -->
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">��д����������������Ϣ</td>
                <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
              </tr>
            </table></td>
            <td width="60%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
              <tr>
                <td> </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="2" colspan="2"> </td>
          </tr>
  </table>

	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
		<tr>
		  <td width="12%" align="right" nowrap class="td2">IP��</a></td>
		  <td width="88%" align="left" class="td1"><html:text property="ElockServer/IP"
				styleClass="input" size="30" attributesText='class="input" size="50" ValidateType="notempty" Msg="IP��ַ����Ϊ��"'  />
				<span class="text_red">*</span></td>
		</tr>
		<tr >
			<td width="12%" align="right" nowrap class="td2">�������룺</td>
			<td class="td1"><html:text property="ElockServer/Mask"
				styleClass="input" size="30"  value="255.255.255.0" /></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">���أ�</td>
			<td class="td1"><html:text property="ElockServer/Gateway" styleClass="input"
				size="30" value="192.168.1.254"/></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�豸���ͣ�</td>
			<td class="td1">
				<html:select property="ElockServer/DeviceTypeID" styleClass="input">
					<html:option value="1">M3000�¼�������</html:option>
					<html:option value="2">�����м̷�����</html:option>
					<html:option value="3">Э��ת����</html:option>
					<html:option value="4">���⴮���豸</html:option>
				</html:select>
		    </td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">��С�豸�ţ�</td>
			<td class="td1"><html:text property="ElockServer/MinReaderID" styleClass="input"
				size="30" value="0"/></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">����豸�ţ�</td>
			<td class="td1"><html:text property="ElockServer/MaxReaderID" styleClass="input"
				size="30" value="255"/></td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">��ʱ��ѯ�����</td>
			<td class="td1"><html:text property="ElockServer/IntervalSecond" styleClass="input"
				size="30" value="5"/>��</td>
		</tr>
		<tr>
			<td width="12%" align="right" nowrap class="td2">�� ע��</td>
			<td class="td1"><html:text property="ElockServer/Remark" styleClass="input"
				size="30" /></td>
		</tr>
  </table>
	<br>
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="">
		<tr>
			<td width="30%" class="td1" nowrap></td>
			<td class="td1">
			<input name="Submit1" type="button" class="button_02" value="�� ��" onclick="ClickSave()"/>
			<input name="Submit2" type="button" class="button_02" value="�� ��" onClick="goBack()">
<!--			<input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">-->
			</td>
		</tr>
	</table>
</form>
<object id=MIDIPlayer
	codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701
	type=application/x-oleobject height=0
	standby="?? Microsoft Windows Media Player ??..." width=0
	classid=CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95 name=wmplayer
	VIEWASTEXT>
	<param name="FileName" value="//internet//ActiveX//ding.wav">
	<param name="AutoStart" value="true">
	<param name="AutoRewind" value="-1">
	<param name="AnimationAtStart" value="true">
	<param name="ShowControls" value="false">
	<param name="ClickToPlay" value="false">
	<param name="EnableContextMenu" value="true">
	<param name="EnablePositionControls" value="false">
	<param name="Balance" value="0">
	<param name="ShowStatusBar" value="false">
	<param name="AutoSize" value="0">
	<embed type="application/x-mplayer2"
		pluginspage="http://www.microsoft.com/Windows/Downloads/Contents/Products/MediaPlayer/"
		filename src autostart="false" enablecontextmenu="false"
		clicktoplay="false" enablepositioncontrols="false" showcontrols="0"
		showstatusbar="1" showdisplay="0">
	</embed> </object>

</body>
</html>
<script language="javascript">
		function toquery(){
			var frm =document.forms[0];
			frm.action=frm.elements["addaction"].value;
			frm.submit();
		}
		
		function goBack() {
			window.navigate("ICCard.prDevice.elockServerList.do");
		}
		

		function ClickSave(){
			var frm =document.forms[0];
			var ip=frm.elements["ElockServer/IP"].value;
			if(!validater(document.forms[0])){
				return;
			} else if(!ip.match("(2[5][0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})")){
				alert("IP��ַ���Ϸ�,����������");
				return;
			}
    		elockForm.submit();
		}
			
			function ClickRevert()
			{
			elockForm.reset();
			}
			
			function ClickClose()
			{
			window.close();
			}
</script>