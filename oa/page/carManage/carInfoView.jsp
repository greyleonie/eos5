<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;������Ϣ�鿴</td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="18"> </td>
    </tr>
    <tr>
      <td class="text"><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="16%" align="right" class="td2">���ƺţ�</td>
            <td width="34%" class="td1">&nbsp;<bean:write property="CAR_CARINFO/CARNO" /></td>
            <td width="16%" align="right" class="td2">�����ͺţ�</td>
            <td width="34%" class="td1">&nbsp;<bean:write property="CAR_CARINFO/MANUNO"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">���ܺţ�</td>
            <td class="td1">&nbsp;<bean:write property="CAR_CARINFO/FRAMENO" /></td>
            <td align="right" class="td2">�������ͣ�</td>
            <td class="td1">&nbsp;<bean:write property="CAR_CARINFO/CARTYPE" /> </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">����۸�</td>
            <td class="td1">&nbsp;<bean:write property="CAR_CARINFO/PRICE" /> Ԫ(�����)</td>
            <td align="right" class="td2">��ʻԱ��</td>
            <td class="td1">&nbsp;<bean:write property="CAR_CARINFO/DRIVER"  />
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">���������룺</td>
            <td class="td1">&nbsp;<bean:write property="CAR_CARINFO/ENGINENO" /></td>
            <td align="right" class="td2">�������ڣ�</td>
            <td class="td1">&nbsp;<bean:write property="CAR_CARINFO/BUYDATE[@pattern='yyyy-MM-dd']" />
            </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��ǰ״̬��</td>
            <td colspan="3" class="td1">&nbsp;<dict:write businTypeId="dx_CARSTATE" property="CAR_CARINFO/STATE" />         </td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <br>
              
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
 
 
 