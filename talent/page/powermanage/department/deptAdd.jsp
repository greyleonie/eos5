<%@include file="/internet/common.jsp"%>
<script>
function initFcc(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("�������Ѵ��ڣ����������룡");
		</logic:greaterThan>
	</logic:present>
}
</script>
<body onload="initFcc()">
<form method="post" action="talent.pr.deptAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ϵͳ����&gt;���Ź���&gt;<bean:write property="EOSORG_T_Organization/parentName"/>�����Ӳ���</td>
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
		<html:hidden property="EOSORG_T_Organization/_order/col1/field"/>
		<html:hidden property="EOSORG_T_Organization/_order/col1/asc" />
		<html:hidden property="EOSORG_T_Organization/parentOrgID/criteria/value" />
		
		<html:hidden property="EOSORG_T_Organization/parentName" />
		<html:hidden property="EOSORG_T_Organization/orgLevel"/>
		
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
            <td width="16%" align="right" nowrap class="td2">�������ƣ� </td>
            <td width="35%" class="td1"><html:text property="EOSORG_T_Organization/orgName" maxlength="32" attributesText='class="input" size="30" ValidateType="notempty" Msg="�������Ʋ���Ϊ��"'/> 
              <span class="text_red">*</span></td>
            <td width="12%" align="right" nowrap class="td2">�ϼ����ţ� </td>
            <td width="37%" class="td1"><bean:write property="EOSORG_T_Organization/parentName"/> 
              <html:hidden name="EOSORG_T_Organization/parentOrgID" property="EOSORG_T_Organization/parentOrgID/criteria/value" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�� �� �ˣ� </td>
            <td class="td1"><html:text property="EOSORG_T_Organization/managerName" maxlength="9" attributesText='class="input" size="30" readOnly="fcc"'/>
			<html:hidden property="EOSORG_T_Organization/managerID"/><input name="Button" type="button" class="button_02" value="ѡ ��" elname="EOSORG_T_Organization/managerID,EOSORG_T_Organization/managerName" onClick="selectManagerFromUser()"> 
            </td>
            <td align="right" nowrap class="td2">�������ˣ�</td>
            <td class="td1"><html:text property="EOSORG_T_Organization/auxiliaryManagerName" maxlength="9" attributesText='class="input" size="30" readOnly="fcc"'/> 
			<html:hidden property="EOSORG_T_Organization/auxiliaryManagerID" /> <input name="Button" type="button" class="button_02" value="ѡ ��" elname="EOSORG_T_Organization/auxiliaryManagerID,EOSORG_T_Organization/auxiliaryManagerName" onClick="selectManagerFromUser()"> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">������� </td>
            <td class="td1"> <html:select property="EOSORG_T_Organization/orgTypeID" > 
              <html:option value="1">���в���</html:option> <html:option value="2">��������</html:option> <html:option value="3">����</html:option>
              </html:select> </td>
            <td align="right" nowrap class="td2">���Ŵ��룺 </td>
            <td class="td1"> <html:text property="EOSORG_T_Organization/orgCode" maxlength="12" attributesText='class="input" size="30"'/> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�Ƿ��ѧ���ͳ�ƣ� </td>
            <td colspan="3" class="td1"><html:radio property="EOSORG_T_Organization/Teaching" value="1" />��&nbsp;<html:radio property="EOSORG_T_Organization/Teaching" value="0" attributesText='checked'/>�� 
              </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�Ƿ�����ͳ�ƣ� </td>
            <td colspan="3" class="td1"><html:radio property="EOSORG_T_Organization/IsWork" value="1" />��&nbsp;<html:radio property="EOSORG_T_Organization/IsWork" value="0" attributesText='checked'/>�� 
              </td>
          </tr>
          <tr> 
            <td height="22" align="right" nowrap class="td2">���ż�飺 </td>
            <td colspan="3" class="td1"> <html:textarea property="EOSORG_T_Organization/memo" attributesText='cols="70" rows="4"'/> 
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
		
	  
	  frm.submit();	
	} 
  
}
  



function selectManagerFromUser(){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	url = "talent.pr.deptToSelectManager.do?fccargs=" + fccargs;
	
	var name = btn.elname;
	var names = name.split(",");
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id��ֵ
	}
	values[values.length] = btn.name;
	
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	
	
	if(retArr!=null){
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
		}
	
	}
	


}
</script>