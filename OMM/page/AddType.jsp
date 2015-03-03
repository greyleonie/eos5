<%@include file="/internet/common.jsp"%>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<script>

	function initFcc() {
		<logic:present property="only">
		<logic:greaterThan value="0" property="only">
		alert("类型已存在，请重新输入！");
		</logic:greaterThan>
		</logic:present>
	}
</script>
<body onload="initFcc()">
	<form method="post" action="OMM.pr.prAddType.do"><INPUT type="hidden" name="only" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">运维管理—&gt;IT设备管理—&gt;资产类型—&gt;新增类型</td>
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
							<td width="18%" align="right" nowrap class="td2">类型名称</td>
							<td width="82%" class="td1">
								<html:text property="OMM_DevType/TypeName" maxlength="20"
									attributesText='class="input" size="70" ValidateType="notempty" Msg="类型名称不能为空"' onblur="checkTypeName(this);" />
								<span class="text_red">*</span></td>
						</tr>
						<tr>
							<td width="18%" align="right" nowrap class="td2">类型编号</td>
							<td width="82%" class="td1">
								<html:text property="OMM_DevType/TypeCode" maxlength="2"
									attributesText='class="input" size="2" ValidateType="notempty" Msg="类型编号不能为空"' onblur="checkTypeCode(this);" />
								<span class="text_red">*</span></td>
						</tr>
					</table>
					<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center"><input name="button" type="button" class="button_02" value="保 存" onClick="save()"> <input
									name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
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

	function checkTypeCode(obj){
		var typeCode=obj.value;
		if(typeCode.length==0){
			
		}else{
			var sub = new HiddenSubmit('OMM.biz.bizTypeIsExits');
			sub.add("TypeCode", typeCode);
			if (sub.submit()) {
				if(sub.getProperty("exist")>0){
					obj.value="";
					alert("该类型编号已存在，请重新输入!");
				}
			}
		}
		
	}
	
	function checkTypeName(obj){
		var typeName=obj.value;
		if(typeName.length==0){}else{
			var sub = new HiddenSubmit('OMM.biz.bizTypeOlny');
			sub.add("TypeName", typeName);
			if (sub.submit()) {
				if(sub.getProperty("only")>0){
					obj.value="";
					alert("该类型名称已存在，请重新输入!");
				}
			}
		}
		
	}

	function save() {
		var frm = document.forms[0];
		var value=frm.elements["OMM_DevType/TypeName"].value;
		if (value=="") {
			alert("类型名称不能为空!");
			frm.elements["OMM_DevType/TypeName"].focus();
			return;
		}
		var code=frm.elements["OMM_DevType/TypeCode"].value;
		if (code=="") {
			alert("类型编号不能为空!");
			frm.elements["OMM_DevType/TypeCode"].focus();
			return;
		}
		if (code.length!=2) {
			alert("类型编号只能为2位数字!");
			frm.elements["OMM_DevType/TypeCode"].focus();
			return;
		}
		if (isNaN(code)) {
			alert("类型编号只能为数字!");
			frm.elements["OMM_DevType/TypeCode"].focus();
			return;
		}
		frm.submit();
	}
</script>