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
<form method="post" action="talent.pr.usermodifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;用户管理—&gt;<logic:equal property="sysTUser/operatorType/criteria/value" value="-1">EOS用户</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="1">教师用户</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="0">学员用户</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="2">宾客用户</logic:equal>修改</td>
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
		
		<html:hidden property="sysTUser/_order/col1/field"/>
		<html:hidden property="sysTUser/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
		<html:hidden name="sysTUser/operatorType/criteria/value" property="operatorType"/>
		<html:hidden property="sysTUser/operatorID" />
		<html:hidden property="baseTUser/operatorID" />  
		
		
		
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
            <td width="35%" class="td1"><bean:write property="sysTUser/userID" maxLength="32"/> 
             </td>
            <td width="12%" align="right" nowrap class="td2">姓　　名： </td>
            <td width="39%" class="td1"><html:text property="sysTUser/operatorName" maxlength="32" attributesText='class="input" size="30" ValidateType="notempty" Msg="姓名不能为空"'/>
			<span class="text_red">*</span>
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
            <td align="right" nowrap class="td2">注册日期： </td>
            <td class="td1"> <html:text property="baseTUser/regDate[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/> 
              <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["baseTUser/regDate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")></td>
            <td align="right" nowrap class="td2">是否可用： </td>
            <td class="td1">
            <html:radio property="sysTUser/status" value="1"/>是&nbsp;<html:radio property="sysTUser/status" value="0"/>否
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">出生日期： </td>
            <td class="td1"><html:text property="baseTUser/birthDate[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["baseTUser/birthDate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            </td>
            <td align="right" nowrap class="td2">性　　别： </td>
            <td class="td1"><dict:radio businTypeId="BNDICT_gender" property="baseTUser/gender" modifiable="true"/></td>
          </tr>
          <tr> 
            <td height="22" align="right" nowrap class="td2">家庭电话： </td>
            <td class="td1"><html:text property="baseTUser/HTel" maxlength="12" attributesText='class="input" size="30" ValidateType="phone" Msg="必须为电话号码"'/></td>
            <td align="right" nowrap class="td2">婚姻状况： </td>
            <td class="td1"><dict:radio businTypeId="BNDICT_marry" property="baseTUser/major" modifiable="true" value="1"/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">工作电话：</td>
            <td class="td1"><html:text property="baseTUser/OTel1" maxlength="12" attributesText='class="input" size="30" ValidateType="phone" Msg="必须为电话号码"'/>
            </td>
            <td align="right" nowrap class="td2">移动电话： </td>
            <td class="td1"><html:text property="baseTUser/mobileNO" maxlength="14" attributesText='class="input" size="30" ValidateType="phone" Msg="必须为手机号码" onfocus="textValidate()" onlytype="int"'/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">电子信箱：</td>
            <td class="td1"><html:text property="baseTUser/OEmail" maxlength="64" attributesText='class="input" size="30" ValidateType="email" Msg="必须为有效邮箱"'/> 
            </td>
            <td align="right" nowrap class="td2">职　　务：</td>
            <td class="td1"><dict:select businTypeId="BNORG_position" property="baseTUser/positionID" nullOption="true" nullLabel="---请选择---" /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">传　　真：</td>
            <td class="td1"><html:text property="baseTUser/faxNO" maxlength="14" attributesText='class="input" size="30" ValidateType="phone" Msg="必须为电话号码"'/> 
            </td>
            <td align="right" nowrap class="td2">学　　历： </td>
            <td class="td1"><dict:select businTypeId="dx_education" property="baseTUser/degree" nullOption="true" nullLabel="---请选择---" />
            </td>
          </tr>
          <tr  > 
            <td align="right" nowrap class="td2">邮政编码：</td>
            <td class="td1"><html:text property="baseTUser/zipCode" maxlength="10" attributesText='class="input" size="30" ValidateType="postalcode" Msg="必须为有效邮政编码"'/> 
            </td>
            <td align="right" nowrap class="td2">身 份 证：</td>
            <td class="td1"><html:text property="baseTUser/PID" maxlength="20" attributesText='class="input" size="30"'/> </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">家庭住址：</td>
            <td  class="td1"><html:text property="baseTUser/HAddress" maxlength="64" attributesText='class="input" size="30"'/>
			<td align="right" nowrap class="td2">用户编号：</td>
            <td  class="td1"><html:text property="baseTUser/empCode" maxlength="12" attributesText='class="input" size="30"'/>
			
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