<%@include file="/internet/common.jsp"%>
<script>
function initFcc(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("��ʶ�Ѵ��ڣ����������룡");
		</logic:greaterThan>
	</logic:present>
}
</script>
<body onload="initFcc()">
<form method="post" action="talent.prEosMenu.eosMenuAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ϵͳ����&gt;�˵�����&gt;<bean:write property="TEOSMenu/parentName"/>��&gt;�����Ӳ˵�</td>
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
		
		<input type="hidden" name="TEOSMenuTEMP/parentsID">
		<input type="hidden" name="TEOSMenuTEMP/rootID">
		<input type="hidden" name="TEOSMenuTEMP/menuLevel">
		<input type="hidden" name="TEOSMenuTEMP/menuLabel">
		
		<html:hidden property="TEOSMenu/_order/col1/field"/>
		<html:hidden property="TEOSMenu/_order/col1/asc" />
		<html:hidden property="TEOSMenu/parentsID/criteria/value" />
		<html:hidden property="TEOSMenu/parentName" />
		<html:hidden property="TEOSMenu/parentLevel" />
		
		
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
            <td width="18%" align="right" nowrap class="td2">�˵����ƣ� </td>
            <td width="82%" class="td1"><html:text property="TEOSMenuTEMP/menuName" maxlength="20" attributesText='class="input" size="70" ValidateType="notempty" Msg="�˵����Ʋ���Ϊ��"'/> 
              <span class="text_red">*</span>
            </td>
          </tr>
		  <tr> 
            <td width="18%" align="right" nowrap class="td2">�˵���ʶ�� </td>
            <td width="82%" class="td1"><html:text property="TEOSMenuTEMP/menuID" maxlength="100" attributesText='class="input" size="70" ValidateType="notempty" Msg="�˵���ʶ����Ϊ��"'/> 
              <span class="text_red">* ʶ��ID���ԡ�DX_����ͷ</span>
            </td>
          </tr>
		  <tr> 
            <td width="18%" align="right" nowrap class="td2">�˵����ӣ� </td>
            <td width="82%" class="td1"><html:text property="TEOSMenuTEMP/menuAction" maxlength="200" attributesText='class="input" size="70" '/> 
              
            </td>
          </tr>
		  <tr> 
            <td width="18%" align="right" nowrap class="td2">�Ƿ�Ҷ���� </td>
            <td width="82%" class="td1">
			<html:radio property="TEOSMenuTEMP/isLeaf" value="Y"/>��&nbsp;<html:radio property="TEOSMenuTEMP/isLeaf" value="N"/>��
              
            </td>
          </tr>
		  <tr> 
            <td width="18%" align="right" nowrap class="td2">��ʾ˳�� </td>
            <td width="82%" class="td1"><html:text property="TEOSMenuTEMP/displayOrder" maxlength="10" attributesText='class="input" size="70" onfocus="textValidate()" onlytype="int"'/> 
             <span class="text_red">ͬһ����˵�֮�����ʾ�Ⱥ�˳��</span> 
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
		var pattern = /^(DX_)/;
		if(!pattern.test(frm.elements["TEOSMenuTEMP/menuID"].value)){
			alert("�˵���ʶҪ�ԡ�DX_����ͷ");
			frm.elements["TEOSMenuTEMP/menuID"].focus();
			return;
		}
	
		var parentLevel = frm.elements["TEOSMenu/parentLevel"].value;
		if(parentLevel!="0"){
			frm.elements["TEOSMenuTEMP/rootID"].value = frm.elements["TEOSMenu/parentsID/criteria/value"].value;
		}
	  	frm.elements["TEOSMenuTEMP/menuLevel"].value = parseInt(parentLevel,10) + 1;
		frm.elements["TEOSMenuTEMP/parentsID"].value = frm.elements["TEOSMenu/parentsID/criteria/value"].value;
		frm.elements["TEOSMenuTEMP/menuLabel"].value = frm.elements["TEOSMenuTEMP/menuName"].value;
	  	frm.submit();	
	} 
  
}
  




</script>