<%@include file="/internet/common.jsp"%>


  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;���˰칫��&gt;����ͨѶ¼��&gt;������鿴</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="80%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">������ƣ�</td>
            <td width="36%" class="td1">&nbsp;
            <bean:write property="AddressListGroup/GroupName" />
            </td>
          </tr>
		  
          <tr  onClick="changeTRBgColor(this)">
            <td width="14%" align="right" class="td2">��ע��</td>
            <td class="td1">&nbsp;
            <bean:write property="AddressListGroup/Remark"/>
            </td>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
            <td align="center">
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

 