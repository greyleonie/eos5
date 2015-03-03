<%@include file="/internet/common.jsp"%>
<script>
function initFcc(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("标识已存在，请重新输入！");
		</logic:greaterThan>
	</logic:present>
}
</script>
<body onload="initFcc()">
<form method="post" action="talent.prEosMenu.eosMenuAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;菜单管理—&gt;<bean:write property="TEOSMenu/parentName"/>—&gt;新增子菜单</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		
		<input type="hidden" name="TEOSMenuTEMP/parentsID">
		<input type="hidden" name="TEOSMenuTEMP/rootID">
		<input type="hidden" name="TEOSMenuTEMP/menuLevel">
		<input type="hidden" name="TEOSMenuTEMP/menuLabel">
		
		<html:hidden property="TEOSMenu/_order/col1/field"/>
		<html:hidden property="TEOSMenu/_order/col1/asc" />
		<html:hidden property="TEOSMenu/parentsID/criteria/value" />
		<html:hidden property="TEOSMenu/parentName" />
		<html:hidden property="TEOSMenu/parentLevel" />
		
		
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
		 
		
		
		
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="18%" align="right" nowrap class="td2">菜单名称： </td>
            <td width="82%" class="td1"><html:text property="TEOSMenuTEMP/menuName" maxlength="20" attributesText='class="input" size="70" ValidateType="notempty" Msg="菜单名称不能为空"'/> 
              <span class="text_red">*</span>
            </td>
          </tr>
		  <tr> 
            <td width="18%" align="right" nowrap class="td2">菜单标识： </td>
            <td width="82%" class="td1"><html:text property="TEOSMenuTEMP/menuID" maxlength="100" attributesText='class="input" size="70" ValidateType="notempty" Msg="菜单标识不能为空"'/> 
              <span class="text_red">* 识别ID，以“DX_”开头</span>
            </td>
          </tr>
		  <tr> 
            <td width="18%" align="right" nowrap class="td2">菜单链接： </td>
            <td width="82%" class="td1"><html:text property="TEOSMenuTEMP/menuAction" maxlength="200" attributesText='class="input" size="70" '/> 
              
            </td>
          </tr>
		  <tr> 
            <td width="18%" align="right" nowrap class="td2">是否叶级： </td>
            <td width="82%" class="td1">
			<html:radio property="TEOSMenuTEMP/isLeaf" value="Y"/>是&nbsp;<html:radio property="TEOSMenuTEMP/isLeaf" value="N"/>否
              
            </td>
          </tr>
		  <tr> 
            <td width="18%" align="right" nowrap class="td2">显示顺序： </td>
            <td width="82%" class="td1"><html:text property="TEOSMenuTEMP/displayOrder" maxlength="10" attributesText='class="input" size="70" onfocus="textValidate()" onlytype="int"'/> 
             <span class="text_red">同一级别菜单之间的显示先后顺序</span> 
            </td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) {
		var pattern = /^(DX_)/;
		if(!pattern.test(frm.elements["TEOSMenuTEMP/menuID"].value)){
			alert("菜单标识要以“DX_”开头");
			frm.elements["TEOSMenuTEMP/menuID"].focus();
			return;
		}
	
		var parentLevel = frm.elements["TEOSMenu/parentLevel"].value;
		if(parentLevel!="0"){
			frm.elements["TEOSMenuTEMP/rootID"].value = frm.elements["TEOSMenu/parentsID/criteria/value"].value;
		}
	  	frm.elements["TEOSMenuTEMP/menuLevel"].value = parseInt(parentLevel,10) + 1;
		frm.elements["TEOSMenuTEMP/parentsID"].value = frm.elements["TEOSMenu/parentsID/criteria/value"].value;
		frm.elements["TEOSMenuTEMP/menuLabel"].value = frm.elements["TEOSMenuTEMP/menuName"].value;
	  	frm.submit();	
	} 
  
}
  




</script>