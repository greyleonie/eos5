<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prAssetsManage.vindicatorAddDo.do">
<html:hidden property="CAPT_VINDICATOR/ENABLE" value="1"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�ʲ�����&gt;<span id="printTable">�ۺ��������Ϣ����</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="CAPT_VINDICATOR/_order/col1/field"/>
		<html:hidden property="CAPT_VINDICATOR/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
      <tr>
        <td height="15"> </td>
      </tr>
  <tr>
     <td>
	<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td valign="top" class="text" >
		   <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
            <tr>
             <td nowrap="nowrap"   class="td2" width="13%" align="right">�ۺ���������ƣ�</td>
             <td nowrap="nowrap"   class="td1" colspan="3"><html:text property="CAPT_VINDICATOR/VINDNAME" maxlength="25"  attributesText='class="input" size="80" ValidateType="notempty" Msg="�ۺ���������Ʋ���Ϊ��"'/>
                <span class="text_red">*</span></td>
              </tr>
            <tr>
             <td nowrap="nowrap"   class="td2" align="right">��&nbsp;&nbsp;ϵ&nbsp;&nbsp;�ˣ�</td>
             <td nowrap="nowrap"   class="td1"><html:text property="CAPT_VINDICATOR/LINKMAN" maxlength="10"  attributesText='class="input" size="36" ValidateType="notempty" Msg="��ϵ�˲���Ϊ��"'/>
                <span class="text_red">*</span></td>
             <td nowrap="nowrap"   class="td2" align="right">��ϵ�绰��</td>
             <td nowrap="nowrap"   class="td1">
              <html:text property="CAPT_VINDICATOR/TEL" maxlength="25"  attributesText='class="input" size="20" ValidateType="notempty,phone" Msg="��ϵ�绰����Ϊ��;��ϵ�绰����Ϊ�绰��ʽ,��020-81741033"'/>
              <span class="text_red">*</span></td>
            </tr>
           <tr>
             <td nowrap="nowrap"   class="td2" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ַ��</td>
             <td nowrap="nowrap"   class="td1" width="45%"><html:text property="CAPT_VINDICATOR/ADDRESS" maxlength="25"  attributesText='class="input" size="36" '/></td>
             <td nowrap="nowrap"   class="td2" width="14%" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;�ࣺ</td>
             <td nowrap="nowrap"   class="td1" width="28%">
             <html:text maxlength="9" property="CAPT_VINDICATOR/ZIPCODE"  attributesText='class="input" size="20" ValidateType="postalcode" Msg="�ʱ಻��ȷ"' />
              </td>
            </tr>
            <tr>
             <td nowrap="nowrap"   class="td2" align="right">E-mail��</td>
             <td nowrap="nowrap"   class="td1"><html:text property="CAPT_VINDICATOR/E_MAIL" maxlength="25"  attributesText='class="input" size="36" ValidateType="email" Msg="E-mail����ȷ"'/></td>
             <td nowrap="nowrap"   class="td2" align="right">������룺</td>
             <td nowrap="nowrap"   class="td1"><html:text property="CAPT_VINDICATOR/FAX" maxlength="20"  attributesText='class="input" size="20" ValidateType="phone" Msg="������벻��ȷ,��020-81741033"'/></td>
            </tr>
           <tr>
             <td nowrap="nowrap"   class="td2" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
                 <td nowrap="nowrap"   class="td1" colspan="3"><html:textarea property="CAPT_VINDICATOR/REMARK"  cols="80" rows="5"/>
                  </td>
            </tr>
          </table> 
            <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="javascript:save()">
               <input name="Button" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
               </td>
            </tr>
          </table>
         </td>
      </tr>
</table>
         </td>
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
 </script>