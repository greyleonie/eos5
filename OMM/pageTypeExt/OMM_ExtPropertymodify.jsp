<%@include file="/internet/common.jsp"%>
<body>
	<form method="post" action="OMM.prTypeExt.prOMM_TypeExtPropertyUpdateSubmit.do">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">运维管理—&gt;资产管理—&gt;扩展属性—&gt;修改扩展属性</td>
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
							<td width="30%" align="right" nowrap class="td2">类型标识号:</td>
							<td width="70%" class="td1">
								<html:select  property="OMM_TypeExtProperty/TypeID" >
          						<html:option  value="-1">选择类型标号</html:option>
                   				<html:options property="list[@type='OMM_DevType']/OMM_DevType/TypeID" labelProperty="list[@type='OMM_DevType']/OMM_DevType/TypeName"/>
           						</html:select>
								<span class="text_red">*</span></td>
						</tr>
						<tr>
							<td width="30%" align="right" nowrap class="td2">扩展属性名称:</td>
							<td width="70%" class="td1">
								<html:text property="OMM_TypeExtProperty/ExtPropertyName" 
								attributesText='class="input" ValidateType="notempty" Msg="类型标识号不能为空"'/>
								<span class="text_red">*</span>
							</td>
						</tr>
						<tr>
							<td width="30%" align="right" nowrap class="td2">扩展属性模式:</td>
							<td width="70%" class="td1">
								<html:hidden property="fid" name="fid"/>
								<!--<html:hidden property="OMM_TypeExtProperty/TypeExtPropertyID" value=""/><bean:write property="OMM_TypeExtProperty/TypeExtPropertyID"/>-->
								<!--<html:hidden property="OMM_TypeExtProperty/TypeID" value="0"/>-->
								<logic:equal property="OMM_TypeExtProperty/ExtPropertyMode" value="1">
									<html:radio property="OMM_TypeExtProperty/radioValue" value="1" checked="true"/>文本模式
									<html:radio property="OMM_TypeExtProperty/radioValue" value="2" />下拉框模式
								</logic:equal>
								<logic:notEqual property="OMM_TypeExtProperty/ExtPropertyMode" value="1">
									<html:radio property="OMM_TypeExtProperty/radioValue" value="1" />文本模式
									<html:radio property="OMM_TypeExtProperty/radioValue" value="2" checked="true"/>下拉框模式
								</logic:notEqual>
								<span class="text_red">*</span>
							</td>
						</tr>
						<tr>
							<td width="30%" align="right" nowrap class="td2">扩展属性值选项:</td>
							<td width="70%" class="td1">
								<html:text property="OMM_TypeExtProperty/ExtPropertyOptions"/>
								<span class="text_red">* 输入格式如:***|***|***</span>
							</td>
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
	
	 function save() {
		var frm = document.forms[0];
		var value=frm.elements["OMM_TypeExtProperty/TypeID"].value;
		//alert(value);
		if (value== -1) {
			alert("请选择类型标识号!");
			frm.elements["OMM_TypeExtProperty/TypeID"].focus();
			return;
		}
		value = null;
		value=frm.elements["OMM_TypeExtProperty/ExtPropertyName"].value;
		if (value=="") {
			alert("扩展属性名称不能为空!");
			frm.elements["OMM_TypeExtProperty/ExtPropertyName"].focus();
			return;
		}
		value=frm.elements["OMM_TypeExtProperty/ExtPropertyOptions"].value;
		if (value=="") {
			alert("扩展属性值选项不能为空!");
			frm.elements["OMM_TypeExtProperty/ExtPropertyOptions"].focus();
			return;
		}
		value=frm.elements["fid"].value;
		frm.action+="?fid"+value;
		frm.submit();
	}
	
	function getElementById(id){
		return document.getElementById(id);
	}

	function getElementByTagName(name){
		return document.ElementByTagName(name);
	}
</script>