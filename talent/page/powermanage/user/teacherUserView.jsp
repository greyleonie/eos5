<%@include file="/internet/common.jsp"%>
<script>
function dept(did,dname) {
	this.did = did;
	this.dname = dname;
}
var deptArray = new Array();
<logic:iterate id="resultset" property="list[@type='teacherorg']">
	deptArray[deptArray.length] = new dept('<bean:write id="resultset" property="EOSORG_T_Organization/orgID"/>','<bean:write id="resultset" property="EOSORG_T_Organization/orgName"/>');
</logic:iterate>

function getDeptName(deptID) {
	var result = "";
	for(d in deptArray) {
		if(deptArray[d].did == deptID) return deptArray[d].dname
	}
	return result;
}



</script>
<body>
<form method="post" action="">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;用户管理—&gt;教师用户查看</td>
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
		
		
		<html:hidden property="TeacherTEMP/userID"/>
		<html:hidden property="TeacherTEMP/TeacherID"/>
		<input type="hidden" name="userIDModify" value="no">
		
		
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
            <td width="35%" class="td1"><bean:write property="TeacherTEMP/operatorname" /> 
             </td>
            <td width="12%" align="right" nowrap class="td2">性　　别： </td>
            <td width="39%" class="td1"><dict:write businTypeId="BNDICT_gender" property="TeacherTEMP/Sex" /> 
            </td>
          </tr>
		  
          <tr> 
            <td align="right" nowrap class="td2">所在部门： </td>
            <td class="td1">
			<script>
				var dName = getDeptName('<bean:write property="TeacherTEMP/DepartmentID"/>');
				document.write(dName);
			</script>
            </td>
            <td align="right" nowrap class="td2">职　　务：</td>
            <td class="td1"><dict:write businTypeId="BNORG_position" property="TeacherTEMP/persition"  /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">教师类别： </td>
            <td class="td1"> <dict:write businTypeId="dx_teachertype" property="TeacherTEMP/TeacherTypeID"  /> &nbsp;&nbsp;
			
				当前状态：
				<logic:equal property="TeacherTEMP/status" value="1">
							可用
				</logic:equal>
				<logic:equal property="TeacherTEMP/status" value="0">
							不可用
				</logic:equal>
			
            </td>
            <td align="right" nowrap class="td2">职　　称： </td>
            <td class="td1"> <dict:write businTypeId="dx_positionlevel" property="TeacherTEMP/DutyTechnicalPost"  /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">是否在职： </td>
				

            <td class="td1">
				<logic:equal property="TeacherTEMP/IsRetire" value="0">
							是
				</logic:equal>
				<logic:equal property="TeacherTEMP/IsRetire" value="1">
							否
				</logic:equal>
            </td>
            <td align="right" nowrap class="td2">教师编号： </td>
            <td class="td1"><bean:write property="TeacherTEMP/code" /></td>
          </tr>
          <tr> 
            <td height="22" align="right" nowrap class="td2">卡上余额： </td>
            <td class="td1"><bean:write property="TeacherTEMP/Money" /></td>
            <td align="right" nowrap class="td2">出生日期： </td>
            <td class="td1"><bean:write property="TeacherTEMP/Birthdate" /> 
              
            </td>
          </tr>
		  <tr> 
            <td height="22" align="right" nowrap class="td2">卡　　号： </td>
            <td class="td1"><bean:write property="TeacherTEMP/cardID" /></td>
            <td align="right" nowrap class="td2">单位电话： </td>
            <td class="td1"><bean:write property="TeacherTEMP/OrganTel" /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">移动电话：</td>
            <td class="td1"><bean:write property="TeacherTEMP/MobileTel" />
            </td>
            <td align="right" nowrap class="td2">住宅电话： </td>
            <td class="td1"> <bean:write property="TeacherTEMP/HomeTel" />
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">住宅地址：</td>
            <td class="td1"><bean:write property="TeacherTEMP/ADDRESS" />  
            </td>
            <td align="right" nowrap class="td2">电子邮箱：</td>
            <td class="td1"><bean:write property="TeacherTEMP/Email" /> </td>
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
		if(frm.elements["hciPasswordTypeTeacherTEMP/password"].value!="") {
			if(frm.elements["hciPasswordTypeTeacherTEMP/password"].value.length<6){
				alert("密码长度不能少于6位！");
				return;
	    	}
			var kvalue = checkPassword(frm.elements["hciPasswordTypeTeacherTEMP/password"].value);
		   if(kvalue == 0) {
				alert("密码含有非法字符，重新输入！");
				return;
		   }
		   if(frm.elements["hciPasswordTypeTeacherTEMP/password"].value!=frm.elements["hciPasswordTypeTeacherTEMP/password0"].value){
				alert("两次输入的密码不一致");
				return;
			}
		   
		}else{
				frm.elements["hciPasswordTypeTeacherTEMP/password"].setAttribute("disabled","true");
				frm.elements["hciPasswordTypeTeacherTEMP/password0"].setAttribute("disabled","true");
		}
		
		if(frm.elements["TeacherTEMP/operatorname"].value != frm.elements["TeacherTEMP/userID"].value) {
			frm.elements["userIDModify"].value = "yes";
		}
	   
	
	 
	   
	  
	   
	  
	  frm.submit();	
	} 
  
}
  



function checkPassword(str){
	
     
    return 1;
    
      
 } 
</script>