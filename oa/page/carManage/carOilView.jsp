<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;�������ͼ�¼�鿴</td>
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
            <td width="34%" class="td1">&nbsp;<bean:write property="CAR_OIL/CARNO"/>
             </td>
            <td width="16%" align="right" class="td2">�� �ڣ�</td>
            <td class="td1">&nbsp;<bean:write property="CAR_OIL/USEDATE"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��������</td>
            <td class="td1">&nbsp;<bean:write property="CAR_OIL/USEAMOUNT"/>
             ��</td>
            <td align="right" class="td2">���ͺţ�</td>
            <td class="td1">&nbsp;<bean:write property="CAR_OIL/OILTYPE"/>
             </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�� �ۣ�</td>
            <td class="td1">&nbsp;<bean:write property="CAR_OIL/PRICE"/>
            ��/Ԫ </td>
            <td align="right" class="td2">�����ˣ�</td>
            <td class="td1">&nbsp;<bean:write property="CAR_OIL/OPERATORID" formatClass="username" formatType="operatorID"/>
             </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�� �</td>
            <td colspan="3" class="td1">&nbsp;<bean:write property="CAR_OIL/SUMPRICE"/>
            Ԫ</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�� ע��</td>
            <td colspan="3" class="td1">&nbsp;<bean:write property="CAR_OIL/Remark"/>
            </td>
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
 
  