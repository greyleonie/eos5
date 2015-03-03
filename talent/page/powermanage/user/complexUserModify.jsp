<%@include file="/internet/common.jsp"%>
<script>
function initFcc(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("用户名已存在，请重新输入！");
		</logic:greaterThan>
	</logic:present>
	//document.forms[0].elements["hciPasswordTypesysTUser/password"].value = "";
}
</script>
<body onload="initFcc()">
<form method="post" action="talent.pr.complexUserModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;用户管理—&gt;<logic:equal property="mode" value="0">学员用户</logic:equal><logic:equal property="mode" value="1">教师用户</logic:equal><logic:equal property="mode" value="2">宾客用户</logic:equal>修改</td>
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
		<html:hidden name="sysTUser/userIDOld" property="sysTUser/userID"/>
		<input type="hidden" name="sysTUser/isModifed" value="0">
		
		<html:hidden property="sysTUser/_order/col1/field"/>
		<html:hidden property="sysTUser/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
		<logic:equal property="mode" value="0">
			<html:hidden name="QueryStudent/ClassID/criteria/value" property="operatorType"/>
		</logic:equal>
		<logic:equal property="mode" value="1">
			<html:hidden name="QueryTeacher/DepartmentID/criteria/value" property="operatorType"/>
		</logic:equal>
		<html:hidden property="sysTUser/operatorID" />
		<html:hidden property="mode" />  
		
		
		
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
            <td width="14%" align="right" nowrap class="td2">帐　　号： </td>
            <td width="35%" class="td1"><html:text property="sysTUser/userID" maxlength="32" attributesText='class="input" size="30" ValidateType="notempty" Msg="帐号不能为空"'/> 
			<span class="text_red">*</span>
            </td>
            <td width="12%" align="right" nowrap class="td2">姓　　名： </td>
            <td width="39%" class="td1"><bean:write property="sysTUser/operatorName" maxLength="32" /> 
               </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">密　　码： </td>
            <td class="td1"><html:password  name="sysTUser/password" maxlength="50" attributesText='class="input" size="30"'/> 
            </td>
            <td align="right" nowrap class="td2">确认密码：</td>
            <td class="td1"><html:password  property="sysTUser/password0" maxlength="50" attributesText='class="input" size="30"'/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">卡　　号： </td>
            <td class="td1"> <bean:write property="sysTUser/cardID" /> 
            </td>
            <td align="right" nowrap class="td2">是否可用： </td>
            <td class="td1"> <html:radio property="sysTUser/status" value="1"/>是&nbsp;<html:radio property="sysTUser/status" value="0"/>否 
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
	if(frm.elements["hciPasswordTypesysTUser/password"].value != "") {
			if(frm.elements["hciPasswordTypesysTUser/password"].value.length<6){
				alert("密码长度不能少于6位！");
				return;
			}
		   var kvalue = checkPassword(frm.elements["hciPasswordTypesysTUser/password"].value);
		   if(kvalue == 0) {
				alert("密码含有非法字符，重新输入！");
				return;
		   }
		
		 
		   
		  if(frm.elements["hciPasswordTypesysTUser/password"].value!=frm.elements["hciPasswordTypesysTUser/password0"].value){
			alert("两次输入的密码不一致");
			return;
		  }
	  }
	  if(frm.elements["hciPasswordTypesysTUser/password"].value=="") {
	  	//alert(frm.elements["hciPasswordTypesysTUser/password"].value)
	  	frm.elements["hciPasswordTypesysTUser/password"].setAttribute("disabled","true");
	  }
	  if(frm.elements["sysTUser/userIDOld"].value!=frm.elements["sysTUser/userID"].value) {
	  	frm.elements["sysTUser/isModifed"].value = "1";
	  }
	  
	  frm.submit();	
	} 
  
}
  



function checkPassword(str){
	var strSource="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_";    
	var ch;
	
	var temp;
	for (var i=0;i<=(str.length-1);i++){  
		ch = str.charAt(i);
        temp = strSource.indexOf(ch);
      	if (temp == -1){
         return 0;
       	}
     }
     
    return 1;
    
      
 } 
</script>