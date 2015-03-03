<%@include file="/internet/common.jsp"%>
	
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;公共事务—&gt;公共通讯录查看</td>
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
            <bean:write property="AddressListGroup/GroupName"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">姓名：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/CUSTOMER"/>
            </td>
            <td width="14%" align="right" class="td2">呢称：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/NICKNAME"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">性别：</td>
            <td width="36%" class="td1">&nbsp;
            <logic:equal property="AddressList/Sex" value="0">女</logic:equal>
            <logic:equal property="AddressList/Sex" value="1">男</logic:equal>
            </td>
            <td width="14%" align="right" class="td2">QQ号：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/QQID"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">工作单位：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/COMPANY"/>
            </td>
            <td width="14%" align="right" class="td2">单位地址：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/ADDRESS"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">部门：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/Department"/>
            </td>
            <td width="14%" align="right" class="td2">职务：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/DUTY"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">单位电话：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/PHONE1"/>
            </td>
            <td width="14%" align="right" class="td2">家庭电话：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/PHONE2"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">手机：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/MOBILE"/>
            </td>
            <td width="14%" align="right" class="td2">传真：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/FAX"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">邮编：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/POST_CODE"/>
            </td>
            <td width="14%" align="right" class="td2">电子邮箱：</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressList/E_MAIL"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">个人主页：</td>
            <td class="td1" colspan="3">&nbsp;
            <bean:write property="AddressList/HOMEPAGE"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">备注：</td>
            <td class="td1" colspan="3">&nbsp;
            <bean:write property="AddressList/REMARK"/>
            </td>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
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

 