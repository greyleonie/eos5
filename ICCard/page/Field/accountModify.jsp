<%@include file="/internet/common.jsp"%>
<form method="post"  action="ICCard.prField.receptionModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;���ع���&gt;���Ӱ��޸�</td>
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
		<html:hidden property="tblReceptionChangeRec/_order/col1/field"/>
		<html:hidden property="tblReceptionChangeRec/_order/col1/asc" />
		<html:hidden property="tblReceptionChangeRec/ID" />
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"> 
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="20%" align="center" bgcolor="#4A82D1" class="textb_wirte">�޸Ľ��Ӱ�</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="70%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
      
      
       
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr>
    <td  class="td2" align="right" >�Ǽ��ˣ�</td>
    <td  class="td1">
    <bean:write property="tblReceptionChangeRec/Author"/></td>
    <td class="td2" align="right"> ��� ��</td>
    <td class="td1" colspan="2">
    	
    	<logic:equal property="tblReceptionChangeRec/Range" value="0">
    		���
    	</logic:equal>
    	<logic:equal property="tblReceptionChangeRec/Range"value="1">
    		�а�
    	</logic:equal>
    	<logic:equal property="tblReceptionChangeRec/Range"  value="2">
    		ҹ��
    	</logic:equal>
    </td>

    <td  class="td2" align="right" >ʱ�䣺</td>
    <td class="td1" >
    	
    	<bean:write property="tblReceptionChangeRec/CreatedTime"  formatType="yyyy-MM-dd HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>
    </td>
  </tr>

  <tr>
    <td class="td2" align="right" rowspan="7"> �ֽ���֧ </td>
    <td class="td2" align="right" rowspan="2"> Ѻ�� ��</td>
    <td class="td2" align="right" > ɢ��</td>
    <td class="td1" colspan="4" ><html:text property="tblReceptionChangeRec/PreGuestNum"   attributesText='class="input" size="20"  ValidateType="int" Msg="��������Ϊ����"'/>��&nbsp;
    <html:text property="tblReceptionChangeRec/PreGuestMoney"   attributesText='class="input" size="20"  ValidateType="money" Msg="Ѻ�����Ϊ����"'/>Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right"> ѧԱ</td>
	<td class="td1" colspan="4" ><html:text property="tblReceptionChangeRec/PreStuNum"   attributesText='class="input" size="20"  ValidateType="int" Msg="��������Ϊ����"'/>��&nbsp;
	<html:text property="tblReceptionChangeRec/PreStuMoney"   attributesText='class="input" size="20"  ValidateType="money" Msg="Ѻ�����Ϊ����"'/>Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right" rowspan="2">ס�޷ѣ�</td>
    <td class="td2" align="right">֧Ʊ</td>
    <td class="td1"> <html:text property="tblReceptionChangeRec/HousingCheck"   attributesText='class="input" size="20"  ValidateType="money" Msg="֧Ʊ����Ϊ����"'/>Ԫ</td>
    <td  rowspan="2" class="td2" align="right">����</td>
    <td class="td2" align="right">֧Ʊ</td>
    <td class="td1"><html:text property="tblReceptionChangeRec/SubmitCheck"   attributesText='class="input" size="20"  ValidateType="money" Msg="֧Ʊ����Ϊ����"'/>Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right">�ֽ�</td>
    <td class="td1"><html:text property="tblReceptionChangeRec/HousingCash"   attributesText='class="input" size="20"  ValidateType="money" Msg="�ֽ����Ϊ����"'/>Ԫ</td>
    <td class="td2" align="right">�ֽ�</td>
    <td class="td1"><html:text property="tblReceptionChangeRec/SubmitCash"   attributesText='class="input" size="20"  ValidateType="money" Msg="�ֽ����Ϊ����"'/>Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right"> ����� ��</td>
    <td class="td1" colspan="5"><html:text property="tblReceptionChangeRec/MeetingCost"   attributesText='class="input" size="20"  ValidateType="money" Msg="����ѱ���Ϊ����"'/>Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right"> �绰�ѡ����� ��</td>
    <td class="td1" colspan="5"><html:text property="tblReceptionChangeRec/TelecomCost"   attributesText='class="input" size="20"  ValidateType="money" Msg="�绰�Ѵ������Ϊ����"'/>Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right"> �����ӷ� ��</td>
    <td class="td1" colspan="5"><html:text property="tblReceptionChangeRec/OtherCost"   attributesText='class="input" size="20"  ValidateType="money" Msg="�����ӷѱ���Ϊ����"'/>Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right"> ���޷��ż���Ŀ ��</td>
    <td class="td1" colspan="6"><html:textarea property="tblReceptionChangeRec/WaitFixItem" cols="80" rows="4"/></td>
  </tr>
  <tr>
    <td class="td2" align="right"> ���õǼ� ��</td>
    <td class="td1" colspan="6"><html:textarea property="tblReceptionChangeRec/VisitItem" cols="80" rows="4"/></td>
  </tr>
  <tr>
    <td class="td2" align="right"> �ر�������ע ��</td>
    <td class="td1" colspan="6"><html:textarea property="tblReceptionChangeRec/SpecEvent" cols="80" rows="4"/></td>
  </tr>
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="goBack()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
	// ���ص���ѯҳ��
	function goBack() {
		window.location.href = "ICCard.prField.receptionList.do";
	}

  </script>
  