<%@include file="/internet/common.jsp"%>
<script>
function initFcc(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("角色名已存在，请重新输入！");
		</logic:greaterThan>
	</logic:present>
}
</script>
<body onload="initFcc()">
<form method="post" action="talent.pr.roleaddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;角色管理—&gt;新增角色</td>
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
		<input type="hidden" name="EOSRole/roleClass" value="300">
		<html:hidden property="EOSRole/_order/col1/field"/>
		<html:hidden property="EOSRole/_order/col1/asc" />
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
            <td width="23%" align="right" nowrap class="td2">角色名称： </td>
            <td width="77%" class="td1"><html:text property="EOSRole/roleName" maxlength="32" attributesText='class="input" size="70" ValidateType="notempty" Msg="角色名称不能为空"'/> 
              <span class="text_red">*</span>
            </td>
          </tr>
          <!--tr> 
            <td width="23%" align="right" nowrap class="td2">分配用户： </td>
            <td class="td1"><html:text property="EOSRole/roleUsers" attributesText='class="input" size="70" '/> 
              <input name="Button" type="button" class="button_02" value="用户选择"> 
            </td>
          </tr-->
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
		
	  
	  frm.submit();	
	} 
  
}
  




</script>