<%@include file="/internet/common.jsp"%>
<body>
	<form method="post" action="OMM.prTypeExt.prAddTypeExtPropertyByTypeId.do">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">��ά����&gt;�ʲ�����&gt;��չ���ԡ�&gt;������չ����</td>
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
							<td width="30%" align="right" nowrap class="td2">����:</td>
							<td width="70%" class="td1">
								<bean:write property="OMM_DevType/TypeName" />
								<input type="hidden" name="OMM_TypeExtProperty/TypeID" value='<bean:write property="OMM_DevType/TypeID" />'/>
								<input type="hidden" name="OMM_DevType/TypeID" value='<bean:write property="OMM_DevType/TypeID" />'/>
							</td>
						</tr>
						<tr>
							<td width="30%" align="right" nowrap class="td2">��չ��������:</td>
							<td width="70%" class="td1">
								<html:text property="OMM_TypeExtProperty/ExtPropertyName" 
								attributesText='class="input" ValidateType="notempty" Msg="���ͱ�ʶ�Ų���Ϊ��"'/>
								<span class="text_red">*</span>
							</td>
						</tr>
						<tr>
							<td width="30%" align="right" nowrap class="td2">��չ����ģʽ:</td>
							<td width="70%" class="td1">
								<!--<html:hidden property="OMM_TypeExtProperty/TypeID" value="0"/>-->
								<html:radio property="OMM_TypeExtProperty/ExtPropertyMode" value="1" checked="true"/>�ı�ģʽ
								<html:radio property="OMM_TypeExtProperty/ExtPropertyMode" value="2" />������ģʽ
								<!--<span class="text_red">* 1:, ģʽ2:</span>-->
							</td>
						</tr>
						<tr>
							<td width="30%" align="right" nowrap class="td2">��չ����ֵѡ��:</td>
							<td width="70%" class="td1">
								<html:text property="OMM_TypeExtProperty/ExtPropertyOptions"/>
								<span class="text_red">* �����ʽ��:***|***|***</span>
							</td>
						</tr>
					</table>
					<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center"><input name="button" type="button" class="button_02" value="�� ��" onClick="save()"> <input
									name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="text">&nbsp;</td>
			</tr>
		</table>
	</form>
</body>
<script>
	 function save() {
		var frm = document.forms[0];
		var value=frm.elements["OMM_TypeExtProperty/TypeID"].value;
		//alert(value);
		if (value== -1) {
			alert("��ѡ�����ͱ�ʶ��!");
			frm.elements["OMM_TypeExtProperty/TypeID"].focus();
			return;
		}
		value = null;
		value=frm.elements["OMM_TypeExtProperty/ExtPropertyName"].value;
		if (value=="") {
			alert("��չ�������Ʋ���Ϊ��!");
			frm.elements["OMM_TypeExtProperty/ExtPropertyName"].focus();
			return;
		}
		value=frm.elements["OMM_TypeExtProperty/ExtPropertyOptions"].value;
		if (value=="") {
			alert("��չ����ֵѡ���Ϊ��!");
			frm.elements["OMM_TypeExtProperty/ExtPropertyOptions"].focus();
			return;
		}
		frm.submit();
	}
	
	function getElementById(id){
		return document.getElementById(id);
	}

	function getElementByTagName(name){
		return document.ElementByTagName(name);
	}
</script>