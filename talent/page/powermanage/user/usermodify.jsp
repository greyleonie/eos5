<%@include file="/internet/common.jsp"%>
<script>
function initFcc(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("�û����Ѵ��ڣ����������룡");
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
            <td class="text_wirte">ϵͳ����&gt;�û�����&gt;<logic:equal property="sysTUser/operatorType/criteria/value" value="-1">EOS�û�</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="1">��ʦ�û�</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="0">ѧԱ�û�</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="2">�����û�</logic:equal>�޸�</td>
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
            <td width="14%" align="right" nowrap class="td2">�ʡ����ţ� </td>
            <td width="35%" class="td1"><bean:write property="sysTUser/userID" maxLength="32"/> 
             </td>
            <td width="12%" align="right" nowrap class="td2">�ա������� </td>
            <td width="39%" class="td1"><html:text property="sysTUser/operatorName" maxlength="32" attributesText='class="input" size="30" ValidateType="notempty" Msg="��������Ϊ��"'/>
			<span class="text_red">*</span>
			</td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�ܡ����룺 </td>
            <td class="td1"><html:password  name="sysTUser/password" maxlength="50" attributesText='class="input" size="30"'/>
			
            </td>
            <td align="right" nowrap class="td2">ȷ�����룺</td>
            <td class="td1"><html:password  property="sysTUser/password0" maxlength="50" attributesText='class="input" size="30"'/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">ע�����ڣ� </td>
            <td class="td1"> <html:text property="baseTUser/regDate[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/> 
              <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["baseTUser/regDate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")></td>
            <td align="right" nowrap class="td2">�Ƿ���ã� </td>
            <td class="td1">
            <html:radio property="sysTUser/status" value="1"/>��&nbsp;<html:radio property="sysTUser/status" value="0"/>��
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�������ڣ� </td>
            <td class="td1"><html:text property="baseTUser/birthDate[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["baseTUser/birthDate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            </td>
            <td align="right" nowrap class="td2">�ԡ����� </td>
            <td class="td1"><dict:radio businTypeId="BNDICT_gender" property="baseTUser/gender" modifiable="true"/></td>
          </tr>
          <tr> 
            <td height="22" align="right" nowrap class="td2">��ͥ�绰�� </td>
            <td class="td1"><html:text property="baseTUser/HTel" maxlength="12" attributesText='class="input" size="30" ValidateType="phone" Msg="����Ϊ�绰����"'/></td>
            <td align="right" nowrap class="td2">����״���� </td>
            <td class="td1"><dict:radio businTypeId="BNDICT_marry" property="baseTUser/major" modifiable="true" value="1"/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�����绰��</td>
            <td class="td1"><html:text property="baseTUser/OTel1" maxlength="12" attributesText='class="input" size="30" ValidateType="phone" Msg="����Ϊ�绰����"'/>
            </td>
            <td align="right" nowrap class="td2">�ƶ��绰�� </td>
            <td class="td1"><html:text property="baseTUser/mobileNO" maxlength="14" attributesText='class="input" size="30" ValidateType="phone" Msg="����Ϊ�ֻ�����" onfocus="textValidate()" onlytype="int"'/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�������䣺</td>
            <td class="td1"><html:text property="baseTUser/OEmail" maxlength="64" attributesText='class="input" size="30" ValidateType="email" Msg="����Ϊ��Ч����"'/> 
            </td>
            <td align="right" nowrap class="td2">ְ������</td>
            <td class="td1"><dict:select businTypeId="BNORG_position" property="baseTUser/positionID" nullOption="true" nullLabel="---��ѡ��---" /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�������棺</td>
            <td class="td1"><html:text property="baseTUser/faxNO" maxlength="14" attributesText='class="input" size="30" ValidateType="phone" Msg="����Ϊ�绰����"'/> 
            </td>
            <td align="right" nowrap class="td2">ѧ�������� </td>
            <td class="td1"><dict:select businTypeId="dx_education" property="baseTUser/degree" nullOption="true" nullLabel="---��ѡ��---" />
            </td>
          </tr>
          <tr  > 
            <td align="right" nowrap class="td2">�������룺</td>
            <td class="td1"><html:text property="baseTUser/zipCode" maxlength="10" attributesText='class="input" size="30" ValidateType="postalcode" Msg="����Ϊ��Ч��������"'/> 
            </td>
            <td align="right" nowrap class="td2">�� �� ֤��</td>
            <td class="td1"><html:text property="baseTUser/PID" maxlength="20" attributesText='class="input" size="30"'/> </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��ͥסַ��</td>
            <td  class="td1"><html:text property="baseTUser/HAddress" maxlength="64" attributesText='class="input" size="30"'/>
			<td align="right" nowrap class="td2">�û���ţ�</td>
            <td  class="td1"><html:text property="baseTUser/empCode" maxlength="12" attributesText='class="input" size="30"'/>
			
            </td>
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
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) {
	if(frm.elements["hciPasswordTypesysTUser/password"].value != "") {
			if(frm.elements["hciPasswordTypesysTUser/password"].value.length<6){
				alert("���볤�Ȳ�������6λ��");
				return;
			}
		   var kvalue = checkPassword(frm.elements["hciPasswordTypesysTUser/password"].value);
		   if(kvalue == 0) {
				alert("���뺬�зǷ��ַ����������룡");
				return;
		   }
		
		 
		   
		  if(frm.elements["hciPasswordTypesysTUser/password"].value!=frm.elements["hciPasswordTypesysTUser/password0"].value){
			alert("������������벻һ��");
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