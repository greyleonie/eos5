<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prPsAddressList.pubAddressListModifyDo.do">		


  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;���˰칫��&gt;����ͨѶ¼��&gt;����ͨѶ¼�޸�</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">ͨѶ¼���</td>
            <td class="td1" colspan="3">&nbsp;
            <html:select property="AddressList/GroupID"> 
              <html:option value="-1">--��ѡ��ͨѶ¼���--</html:option> 
              <html:options property="list[@type='AddressListGroup']/AddressListGroup/GroupID" labelProperty="list[@type='AddressListGroup']/AddressListGroup/GroupName"/> 
            </html:select>
            <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">������</td>
            <html:hidden property="AddressList/CARDID"/>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/CUSTOMER" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="��������Ϊ��"'/>
            <span class="text_red">*</span></td>
            <td width="14%" align="right" class="td2">�سƣ�</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/NICKNAME" maxlength="50" attributesText='class="input" size="30"'/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">�Ա�</td>
            <td width="36%" class="td1">&nbsp;
            <dict:radio businTypeId="BNDICT_gender" property="AddressList/Sex" modifiable="true" />
            </td>
            <td width="14%" align="right" class="td2">QQ�ţ�</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/QQID" maxlength="9" attributesText='class="input" size="30" ValidateType="numeric" Msg="QQ�Ų���ȷ"'/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">������λ��</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/COMPANY" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
            <td width="14%" align="right" class="td2">��λ��ַ��</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/ADDRESS" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">���ţ�</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/Department" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
            <td width="14%" align="right" class="td2">ְ��</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/DUTY" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">��λ�绰��</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/PHONE1" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
            <td width="14%" align="right" class="td2">��ͥ�绰��</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/PHONE2" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">�ֻ���</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/MOBILE" maxlength="9" attributesText='class="input" size="30" ValidateType="phone" Msg="�ֻ�����ȷ,��13333333333"'/>
            </td>
            <td width="14%" align="right" class="td2">���棺</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/FAX" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">�ʱࣺ</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/POST_CODE" maxlength="9" attributesText='class="input" size="30" ValidateType="postalcode" Msg="�ʱ಻��ȷ"'/>
            </td>
            <td width="14%" align="right" class="td2">�������䣺</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/E_MAIL" maxlength="9" attributesText='class="input" size="30" ValidateType="email" Msg="E-mail����ȷ"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">������ҳ��</td>
            <td class="td1" colspan="3">&nbsp;
            <html:text property="AddressList/HOMEPAGE" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">��ע��</td>
            <td class="td1" colspan="3">&nbsp;
            <html:textarea property="AddressList/REMARK" attributesText='class="input" cols="90" rows="4"'/>
            </td>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>
 
  <script>

  function save() {
  	var frm = document.forms[0];
  	if(frm.elements["AddressList/GroupID"].value == "-1") {
  		alert("��ѡ��ͨѶ¼���!");
  		return false;
  	}
	if(validater(frm)) frm.submit();
  
  }
  
  </script>
 