<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>�޸�ElockServer</title>
<SCRIPT type="text/javascript" language="javascript">
function StartModify(){
			var frm =document.forms[0];
			var ip=frm.elements["ElockServer/IP"].value;
			if(!validater(document.forms[0])){
				return;
			} else if(!ip.match("(2[5][0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})")){
				alert("IP��ַ���Ϸ�,����������");
				return;
			}
    		elockServerForm.submit();
}
</SCRIPT>
</head>

<body class="Standard-BodyStyle" topmargin="0" leftmargin="0">
<form method="post" action="ICCard.prDevice.elockServerModifyDo.do" name="elockServerForm">
<table width="101%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td width="642" class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;ˢ���ն˹���&gt;�޸ĵ�������������           </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="ElockServer/ElockServerID"/>
		<html:hidden property="fid"/>
	  </td>
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
		<tr>
			<td width="12%" align="right" nowrap class="td2"></td>
			<td class="td1">
				<input name="saveButton" type="button" class="button_02" value="�� ��" onClick="StartModify()">
	            <input name="return" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
			</td>
		</tr>
  </table>
</form>
</body>
</html>