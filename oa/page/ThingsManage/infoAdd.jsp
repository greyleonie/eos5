<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prThingsManage.infoAddDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="5">
		<html:hidden property="COMM_COMMODITYINFO/_order/col1/field"/>
		<html:hidden property="COMM_COMMODITYINFO/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="COMM_COMMODITYINFO/ENABLE" value="1"/>
		
	  </td>
    </tr>
  </table>
  
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
            <tr >
               <td align="right" class="td2">Ʒ&nbsp;&nbsp;&nbsp;&nbsp;����</td>              
              <td class="td1"><html:text property="COMM_COMMODITYINFO/COMMNAME"  maxlength="100" attributesText="size='24' class='input' ValidateType='notempty' Msg='Ʒ������Ϊ��'"/>&nbsp;<span class="text_red">*</span></td>
              <td width="16%" align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
              <td class="td1"><html:select property="COMM_COMMODITYINFO/TYPEID" attributesText=" class='input' ValidateType='notempty' Msg='�����Ϊ��'"> 
               <html:options property="list[@type='COMM_TYPE']/COMM_TYPE/TYPEID" labelProperty="list[@type='COMM_TYPE']/COMM_TYPE/TYPENAME"/> 
              </html:select> &nbsp;<span class="text_red">*</span></td>
           
            </tr >
            <tr>
                <td align="right" class="td2">������λ��</td>              
                <td class="td1"><dict:select  businTypeId="dx_unit" property="COMM_COMMODITYINFO/UNITID"  nullOption="true" nullLabel="��ѡ��"  />&nbsp;<span class="text_red">*</span></td>
                              <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>              
                <td class="td1"><html:text property="COMM_COMMODITYINFO/SPECIA" maxlength="100"  attributesText="size='24' class='input'"/>&nbsp; </td>
                
            </tr>
            <tr>
				<td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>              
                <td class="td1" colspan="3"><html:text property="COMM_COMMODITYINFO/PRICE" maxlength="100"  attributesText="size='10' class='input' ValidateType='money' Msg='�۸�ӦΪ����'"/>Ԫ&nbsp; </td>
            </tr>
            <tr class="td2">
                <td align="right">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
                <td colspan="3" class="td1"><html:textarea property="COMM_COMMODITYINFO/REMARK" cols="50" rows="2"/></td>
            </tr>
          </table> 
              
            <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="javascript:save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)"></td>
            </tr>
          </table>
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table></td>
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
  	var unit =frm["COMM_COMMODITYINFO/UNITID"].value;
  	if(isEmpty(unit)){
  		alert("������λ����Ϊ��");
  		return;
  	}
	if(validater(frm)) frm.submit();
  
  }
  </script>