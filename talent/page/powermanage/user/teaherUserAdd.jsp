<%@include file="/internet/common.jsp"%>
<script>
function initFcc(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("�û����Ѵ��ڣ����������룡");
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
            <td class="text_wirte">ϵͳ����&gt;�û�����&gt;��ʦ�û�����</td>
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
            <td width="14%" align="right" nowrap class="td2">��ʦ������ </td>
            <td width="35%" class="td1"><html:text property="Teacher/name" maxlength="16" attributesText='class="input" size="30" ValidateType="notempty" Msg="��ʦ��������Ϊ��"'/> 
              <span class="text_red">*</span></td>
            <td width="12%" align="right" nowrap class="td2">�ԡ����� </td>
            <td width="39%" class="td1"><dict:radio businTypeId="BNDICT_gender" property="Teacher/Sex" modifiable="true" /> 
            </td>
          </tr>
		  <tr> 
            <td width="14%" align="right" nowrap class="td2">�ܡ����룺 </td>
            <td width="35%" class="td1"><input type="hidden" name="Teacher/pwd"/><html:password  property="Teacher/password"  onblur="setPwd(this,'Teacher/pwd')" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="���벻��Ϊ��"'/>
              <span class="text_red">*</span></td>
            <td width="12%" align="right" nowrap class="td2">ȷ�����룺 </td>
            <td width="39%" class="td1"><html:password  property="Teacher/password0" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="ȷ�����벻��Ϊ��"'/>
			<span class="text_red">*</span> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">���ڲ��ţ� </td>
            <td class="td1"><html:text property="Teacher/DepartmentName" maxlength="9" attributesText='class="input" size="30" readOnly="fcc" ValidateType="notempty" Msg="���ڲ��Ų���Ϊ��"'/> 
              <html:hidden property="Teacher/DepartmentID" /> <input name="Button" type="button" class="button_02" value="ѡ ��" elname="Teacher/DepartmentID,Teacher/DepartmentName" onClick="selectSysOrg('yes')">
			  <span class="text_red">*</span> 
            </td>
            <td align="right" nowrap class="td2">ְ������</td>
            <td class="td1"><dict:select businTypeId="BNORG_position" property="Teacher/persition"  /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��ʦ��� </td>
            <td class="td1"> <dict:select businTypeId="dx_teachertype" property="Teacher/TeacherTypeID"  /> 
			&nbsp;<input name="Teacher/status" type="radio" value="1" checked>����<input name="Teacher/status" type="radio" value="0">������
            </td>
            <td align="right" nowrap class="td2">ְ�����ƣ� </td>
            <td class="td1"> <dict:select businTypeId="dx_positionlevel" property="Teacher/DutyTechnicalPost"  /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�Ƿ���ְ�� </td>
            <td class="td1"><html:radio property="Teacher/IsRetire" value="0" attributesText='checked'/>��&nbsp;<html:radio property="Teacher/IsRetire" value="1"/>�� 
            </td>
            <td align="right" nowrap class="td2">��ʦ��ţ� </td>
            <td class="td1"><html:text property="Teacher/code" maxlength="25" attributesText='class="input" size="30"'/></td>
          </tr>
          <tr> 
            <td height="22" align="right" nowrap class="td2">������ </td>
            <td class="td1"><html:text property="Teacher/Money" maxlength="12" attributesText='class="input" size="30"'/></td>
            <td align="right" nowrap class="td2">�������ڣ� </td>
            <td class="td1"><html:text property="Teacher/Birthdate[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/> 
              <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Teacher/Birthdate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")> 
            </td>
          </tr>
		  <tr> 
            <td height="22" align="right" nowrap class="td2">�������ţ� </td>
            <td class="td1"><html:text property="Teacher/cardID" maxlength="12" attributesText='class="input" size="30"'/></td>
            <td align="right" nowrap class="td2">��λ�绰�� </td>
            <td class="td1"><html:text property="Teacher/OrganTel" maxlength="12" attributesText='class="input" size="30" '/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�ƶ��绰��</td>
            <td class="td1"><html:text property="Teacher/MobileTel" maxlength="14" attributesText='class="input" size="30" ValidateType="phone" Msg="����Ϊ�ֻ�����" onfocus="textValidate()" onlytype="int"'/>
            </td>
            <td align="right" nowrap class="td2">סլ�绰�� </td>
            <td class="td1"> <html:text property="Teacher/HomeTel" maxlength="12" attributesText='class="input" size="30" '/>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">סլ��ַ��</td>
            <td class="td1"><html:text property="Teacher/ADDRESS" maxlength="100" attributesText='class="input" size="30" '/>  
            </td>
            <td align="right" nowrap class="td2">�������䣺</td>
            <td class="td1"><html:text property="Teacher/Email" attributesText='class="input" size="30" ValidateType="email" Msg="����Ϊ��Ч����"'/> </td>
          </tr>
           <tr style="display: none"> 
            <td align="right" nowrap class="td2">�Ƿ��ѵ��룺 </td>
            <td class="td1"><html:radio property="Teacher/isLeave" value="1" />��&nbsp;<html:radio property="Teacher/isLeave" value="0" attributesText='checked'/>�� 
            </td>
            <td align="right" nowrap class="td2">�Ƿ��ѹʣ� </td>
            <td class="td1"><html:radio property="Teacher/isDead" value="1" />��&nbsp;<html:radio property="Teacher/isDead" value="0" attributesText='checked'/>�� </td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
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
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) {
		if(frm.elements["hciPasswordTypeTeacher/password"].value.length<6){
	       	alert("���볤�Ȳ�������6λ��");
	       	return;
	    }
	   var kvalue = checkPassword(frm.elements["hciPasswordTypeTeacher/password"].value);
	   if(kvalue == 0) {
	  		alert("���뺬�зǷ��ַ����������룡");
			return;
	   }
	
	 
	   
	  if(frm.elements["hciPasswordTypeTeacher/password"].value!=frm.elements["hciPasswordTypeTeacher/password0"].value){
	  	alert("������������벻һ��");
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