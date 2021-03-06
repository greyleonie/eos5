<%@include file="/internet/common.jsp"%>
<script>
function initFcc(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("用户名已存在，请重新输入！");
		</logic:greaterThan>
	</logic:present>
}
</script>
<body onload="initFcc()">
<form method="post" action="talent.pr.teacherUserAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;用户管理—&gt;教师用户新增</td>
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
		<input type="hidden" name="Teacher/operatorType" value="0">
		<input type="hidden" name="Teacher/userID">
		<html:hidden property="QueryTeacher/_order/col1/field"/>
		<html:hidden property="QueryTeacher/_order/col1/asc" />
		<html:hidden property="QueryTeacher/DepartmentID/criteria/value"/>
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
            <td width="14%" align="right" nowrap class="td2">教师姓名： </td>
            <td width="35%" class="td1"><html:text property="Teacher/name" maxlength="16" attributesText='class="input" size="30" ValidateType="notempty" Msg="教师姓名不能为空"'/> 
              <span class="text_red">*</span></td>
            <td width="12%" align="right" nowrap class="td2">性　　别： </td>
            <td width="39%" class="td1"><dict:radio businTypeId="BNDICT_gender" property="Teacher/Sex" modifiable="true" /> 
            </td>
          </tr>
		  <tr> 
            <td width="14%" align="right" nowrap class="td2">密　　码： </td>
            <td width="35%" class="td1"><input type="hidden" name="Teacher/pwd"/><html:password  property="Teacher/password"  onblur="setPwd(this,'Teacher/pwd')" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="密码不能为空"'/>
              <span class="text_red">*</span></td>
            <td width="12%" align="right" nowrap class="td2">确认密码： </td>
            <td width="39%" class="td1"><html:password  property="Teacher/password0" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="确认密码不能为空"'/>
			<span class="text_red">*</span> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">所在部门： </td>
            <td class="td1"><html:text property="Teacher/DepartmentName" maxlength="9" attributesText='class="input" size="30" readOnly="fcc" ValidateType="notempty" Msg="所在部门不能为空"'/> 
              <html:hidden property="Teacher/DepartmentID" /> <input name="Button" type="button" class="button_02" value="选 择" elname="Teacher/DepartmentID,Teacher/DepartmentName" onClick="selectSysOrg('yes')">
			  <span class="text_red">*</span> 
            </td>
            <td align="right" nowrap class="td2">职　　务：</td>
            <td class="td1"><dict:select businTypeId="BNORG_position" property="Teacher/persition"  /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">教师类别： </td>
            <td class="td1"> <dict:select businTypeId="dx_teachertype" property="Teacher/TeacherTypeID"  /> 
			&nbsp;<input name="Teacher/status" type="radio" value="1" checked>可用<input name="Teacher/status" type="radio" value="0">不可用
            </td>
            <td align="right" nowrap class="td2">职　　称： </td>
            <td class="td1"> <dict:select businTypeId="dx_positionlevel" property="Teacher/DutyTechnicalPost"  /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">是否在职： </td>
            <td class="td1"><html:radio property="Teacher/IsRetire" value="0" attributesText='checked'/>是&nbsp;<html:radio property="Teacher/IsRetire" value="1"/>否 
            </td>
            <td align="right" nowrap class="td2">教师编号： </td>
            <td class="td1"><html:text property="Teacher/code" maxlength="25" attributesText='class="input" size="30"'/></td>
          </tr>
          <tr> 
            <td height="22" align="right" nowrap class="td2">卡上余额： </td>
            <td class="td1"><html:text property="Teacher/Money" maxlength="12" attributesText='class="input" size="30"'/></td>
            <td align="right" nowrap class="td2">出生日期： </td>
            <td class="td1"><html:text property="Teacher/Birthdate[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/> 
              <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Teacher/Birthdate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")> 
            </td>
          </tr>
		  <tr> 
            <td height="22" align="right" nowrap class="td2">卡　　号： </td>
            <td class="td1"><html:text property="Teacher/cardID" maxlength="12" attributesText='class="input" size="30"'/></td>
            <td align="right" nowrap class="td2">单位电话： </td>
            <td class="td1"><html:text property="Teacher/OrganTel" maxlength="12" attributesText='class="input" size="30" '/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">移动电话：</td>
            <td class="td1"><html:text property="Teacher/MobileTel" maxlength="14" attributesText='class="input" size="30" ValidateType="phone" Msg="必须为手机号码" onfocus="textValidate()" onlytype="int"'/>
            </td>
            <td align="right" nowrap class="td2">住宅电话： </td>
            <td class="td1"> <html:text property="Teacher/HomeTel" maxlength="12" attributesText='class="input" size="30" '/>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">住宅地址：</td>
            <td class="td1"><html:text property="Teacher/ADDRESS" maxlength="100" attributesText='class="input" size="30" '/>  
            </td>
            <td align="right" nowrap class="td2">电子邮箱：</td>
            <td class="td1"><html:text property="Teacher/Email" attributesText='class="input" size="30" ValidateType="email" Msg="必须为有效邮箱"'/> </td>
          </tr>
           <tr style="display: none"> 
            <td align="right" nowrap class="td2">是否已调离： </td>
            <td class="td1"><html:radio property="Teacher/isLeave" value="1" />是&nbsp;<html:radio property="Teacher/isLeave" value="0" attributesText='checked'/>否 
            </td>
            <td align="right" nowrap class="td2">是否已故： </td>
            <td class="td1"><html:radio property="Teacher/isDead" value="1" />是&nbsp;<html:radio property="Teacher/isDead" value="0" attributesText='checked'/>否 </td>
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
  
  function setPwd(obj,id){
	document.getElementById(id).value=obj.value;
}
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) {
		if(frm.elements["hciPasswordTypeTeacher/password"].value.length<6){
	       	alert("密码长度不能少于6位！");
	       	return;
	    }
	   var kvalue = checkPassword(frm.elements["hciPasswordTypeTeacher/password"].value);
	   if(kvalue == 0) {
	  		alert("密码含有非法字符，重新输入！");
			return;
	   }
	
	 
	   
	  if(frm.elements["hciPasswordTypeTeacher/password"].value!=frm.elements["hciPasswordTypeTeacher/password0"].value){
	  	alert("两次输入的密码不一致");
		return;
	  }
	  frm.elements["Teacher/userID"].value = frm.elements["Teacher/name"].value;
	  
	  frm.submit();	
	} 
  
}
  



function checkPassword(str){
	
     
    return 1;
    
      
 } 
</script>