<%@include file="/internet/common.jsp"%>

<body>
<form method="post" action="">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ϵͳ����&gt;�û�����&gt;<logic:equal property="sysTUser/operatorType/criteria/value" value="-1">EOS�û�</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="1">��ʦ�û�</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="0">ѧԱ�û�</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="2">�����û�</logic:equal>�鿴</td>
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
            <td width="14%" align="right" nowrap class="td2">�ʡ����ţ� </td>
            <td width="35%" class="td1"><bean:write property="sysTUser/userID"/> 
            </td>
            <td width="12%" align="right" nowrap class="td2">�ա������� </td>
            <td width="39%" class="td1"><bean:write property="sysTUser/operatorName"/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">ע�����ڣ� </td>
            <td class="td1"> <bean:write property="baseTUser/regDate"/> </td>
            <td align="right" nowrap class="td2">�Ƿ���ã� </td>
            <td class="td1"> 
			<logic:equal property="sysTUser/status" value="1">
			��
			</logic:equal>
			<logic:equal property="sysTUser/status" value="0">
			��
			</logic:equal>
			
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�������ڣ� </td>
            <td class="td1"><bean:write property="baseTUser/birthDate"/> </td>
            <td align="right" nowrap class="td2">�ԡ����� </td>
            <td class="td1"><dict:write businTypeId="BNDICT_gender" property="baseTUser/gender"  /></td>
          </tr>
          <tr> 
            <td height="22" align="right" nowrap class="td2">��ͥ�绰�� </td>
            <td class="td1"><bean:write property="baseTUser/HTel"/></td>
            <td align="right" nowrap class="td2">����״���� </td>
            <td class="td1"><dict:write businTypeId="BNDICT_marry" property="baseTUser/major"/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�����绰��</td>
            <td class="td1"><bean:write property="baseTUser/OTel1" /> 
            </td>
            <td align="right" nowrap class="td2">�ƶ��绰�� </td>
            <td class="td1"><bean:write property="baseTUser/mobileNO" /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�������䣺</td>
            <td class="td1"><bean:write property="baseTUser/OEmail" /> 
            </td>
            <td align="right" nowrap class="td2">ְ������</td>
            <td class="td1"><dict:write businTypeId="BNORG_position" property="baseTUser/positionID" /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�������棺</td>
            <td class="td1"><bean:write property="baseTUser/faxNO" /> 
            </td>
            <td align="right" nowrap class="td2">ѧ�������� </td>
            <td class="td1"><dict:write businTypeId="dx_education" property="baseTUser/degree" /> 
            </td>
          </tr>
          <tr  > 
            <td align="right" nowrap class="td2">�������룺</td>
            <td class="td1"><bean:write property="baseTUser/zipCode" /> 
            </td>
            <td align="right" nowrap class="td2">�� �� ֤��</td>
            <td class="td1"><bean:write property="baseTUser/PID" /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��ͥסַ��</td>
            <td  class="td1"><bean:write property="baseTUser/HAddress" /> 
            <td align="right" nowrap class="td2">�û���ţ�</td>
            <td  class="td1"><bean:write property="baseTUser/empCode" /> 
            </td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
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
		if(frm.elements["hciPasswordTypesysTUser/password"].value.length<6){
	       	alert("���볤�Ȳ�������6λ��");
	       	return;
	    }
	   var kvalue = checkPassword(frm.elements["hciPasswordTypesysTUser/password"].value);
	   if(kvalue == 0) {
	  		alert("���뺬�зǷ��ַ����������룡");
			return;
	   }
	
	 
	   
	  if(frm.elements["hciPasswordTypesysTUser/password"].value!=frm.elements["sysTUser/password0"].value){
	  	alert("������������벻һ��");
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