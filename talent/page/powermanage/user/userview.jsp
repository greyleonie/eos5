<%@include file="/internet/common.jsp"%>

<body>
<form method="post" action="">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;用户管理—&gt;<logic:equal property="sysTUser/operatorType/criteria/value" value="-1">EOS用户</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="1">教师用户</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="0">学员用户</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="2">宾客用户</logic:equal>查看</td>
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
		<input type="hidden" name="sysTUser/operatorType" value="-1">
		<html:hidden property="sysTUser/_order/col1/field"/>
		<html:hidden property="sysTUser/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
		<html:hidden property="sysTUser/operatorType/criteria/value" /> 
		
		
		
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
            <td width="35%" class="td1"><bean:write property="sysTUser/userID"/> 
            </td>
            <td width="12%" align="right" nowrap class="td2">姓　　名： </td>
            <td width="39%" class="td1"><bean:write property="sysTUser/operatorName"/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">注册日期： </td>
            <td class="td1"> <bean:write property="baseTUser/regDate"/> </td>
            <td align="right" nowrap class="td2">是否可用： </td>
            <td class="td1"> 
			<logic:equal property="sysTUser/status" value="1">
			是
			</logic:equal>
			<logic:equal property="sysTUser/status" value="0">
			否
			</logic:equal>
			
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">出生日期： </td>
            <td class="td1"><bean:write property="baseTUser/birthDate"/> </td>
            <td align="right" nowrap class="td2">性　　别： </td>
            <td class="td1"><dict:write businTypeId="BNDICT_gender" property="baseTUser/gender"  /></td>
          </tr>
          <tr> 
            <td height="22" align="right" nowrap class="td2">家庭电话： </td>
            <td class="td1"><bean:write property="baseTUser/HTel"/></td>
            <td align="right" nowrap class="td2">婚姻状况： </td>
            <td class="td1"><dict:write businTypeId="BNDICT_marry" property="baseTUser/major"/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">工作电话：</td>
            <td class="td1"><bean:write property="baseTUser/OTel1" /> 
            </td>
            <td align="right" nowrap class="td2">移动电话： </td>
            <td class="td1"><bean:write property="baseTUser/mobileNO" /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">电子信箱：</td>
            <td class="td1"><bean:write property="baseTUser/OEmail" /> 
            </td>
            <td align="right" nowrap class="td2">职　　务：</td>
            <td class="td1"><dict:write businTypeId="BNORG_position" property="baseTUser/positionID" /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">传　　真：</td>
            <td class="td1"><bean:write property="baseTUser/faxNO" /> 
            </td>
            <td align="right" nowrap class="td2">学　　历： </td>
            <td class="td1"><dict:write businTypeId="dx_education" property="baseTUser/degree" /> 
            </td>
          </tr>
          <tr  > 
            <td align="right" nowrap class="td2">邮政编码：</td>
            <td class="td1"><bean:write property="baseTUser/zipCode" /> 
            </td>
            <td align="right" nowrap class="td2">身 份 证：</td>
            <td class="td1"><bean:write property="baseTUser/PID" /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">家庭住址：</td>
            <td  class="td1"><bean:write property="baseTUser/HAddress" /> 
            <td align="right" nowrap class="td2">用户编号：</td>
            <td  class="td1"><bean:write property="baseTUser/empCode" /> 
            </td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
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
		if(frm.elements["hciPasswordTypesysTUser/password"].value.length<6){
	       	alert("密码长度不能少于6位！");
	       	return;
	    }
	   var kvalue = checkPassword(frm.elements["hciPasswordTypesysTUser/password"].value);
	   if(kvalue == 0) {
	  		alert("密码含有非法字符，重新输入！");
			return;
	   }
	
	 
	   
	  if(frm.elements["hciPasswordTypesysTUser/password"].value!=frm.elements["sysTUser/password0"].value){
	  	alert("两次输入的密码不一致");
		return;
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