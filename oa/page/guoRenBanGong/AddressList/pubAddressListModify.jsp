<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prPsAddressList.pubAddressListModifyDo.do">		


  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;个人办公—&gt;个人通讯录—&gt;个人通讯录修改</td>
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
            <td width="14%" align="right" class="td2">通讯录组别：</td>
            <td class="td1" colspan="3">&nbsp;
            <html:select property="AddressList/GroupID"> 
              <html:option value="-1">--请选择通讯录组别--</html:option> 
              <html:options property="list[@type='AddressListGroup']/AddressListGroup/GroupID" labelProperty="list[@type='AddressListGroup']/AddressListGroup/GroupName"/> 
            </html:select>
            <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">姓名：</td>
            <html:hidden property="AddressList/CARDID"/>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/CUSTOMER" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="姓名不能为空"'/>
            <span class="text_red">*</span></td>
            <td width="14%" align="right" class="td2">呢称：</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/NICKNAME" maxlength="50" attributesText='class="input" size="30"'/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">性别：</td>
            <td width="36%" class="td1">&nbsp;
            <dict:radio businTypeId="BNDICT_gender" property="AddressList/Sex" modifiable="true" />
            </td>
            <td width="14%" align="right" class="td2">QQ号：</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/QQID" maxlength="9" attributesText='class="input" size="30" ValidateType="numeric" Msg="QQ号不正确"'/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">工作单位：</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/COMPANY" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
            <td width="14%" align="right" class="td2">单位地址：</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/ADDRESS" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">部门：</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/Department" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
            <td width="14%" align="right" class="td2">职务：</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/DUTY" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">单位电话：</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/PHONE1" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
            <td width="14%" align="right" class="td2">家庭电话：</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/PHONE2" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">手机：</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/MOBILE" maxlength="9" attributesText='class="input" size="30" ValidateType="phone" Msg="手机不正确,如13333333333"'/>
            </td>
            <td width="14%" align="right" class="td2">传真：</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/FAX" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">邮编：</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/POST_CODE" maxlength="9" attributesText='class="input" size="30" ValidateType="postalcode" Msg="邮编不正确"'/>
            </td>
            <td width="14%" align="right" class="td2">电子邮箱：</td>
            <td width="36%" class="td1">&nbsp;
            <html:text property="AddressList/E_MAIL" maxlength="9" attributesText='class="input" size="30" ValidateType="email" Msg="E-mail不正确"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">个人主页：</td>
            <td class="td1" colspan="3">&nbsp;
            <html:text property="AddressList/HOMEPAGE" maxlength="9" attributesText='class="input" size="30"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">备注：</td>
            <td class="td1" colspan="3">&nbsp;
            <html:textarea property="AddressList/REMARK" attributesText='class="input" cols="90" rows="4"'/>
            </td>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
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
  		alert("请选择通讯录组别!");
  		return false;
  	}
	if(validater(frm)) frm.submit();
  
  }
  
  </script>
 