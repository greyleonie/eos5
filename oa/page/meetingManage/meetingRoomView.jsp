<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
  <html:hidden property="MR_REGISTER/MRCODE"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�������&gt;�����Ҳ鿴</td>
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
            <td width="15%" align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�ƣ�</td>
            <td width="35%" class="td1">&nbsp;<bean:write property="MR_REGISTER/MRNAME" /></td>
            <td width="15%" align="right" class="td2">����������</td>
            <td width="35%" class="td1">&nbsp;<bean:write property="MR_REGISTER/PERSON" /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�ͣ�</td>
            <td class="td1">&nbsp;<bean:write property="MR_REGISTER/MRTYPE" /></td>
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�㣺</td>
            <td class="td1">&nbsp;<bean:write property="MR_REGISTER/ADDRESS" /></td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�豸�����</td>
            <td colspan="3" class="td1">&nbsp;<bean:write property="MR_REGISTER/Equipment" />			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td colspan="3" class="td1">&nbsp;<bean:write property="MR_REGISTER/REMARK" />
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">����Ա��</td>
            <td colspan="3" class="td1">&nbsp;<bean:write property="MR_REGISTER/ManagerID" formatClass="username" formatType="operatorID"/></td>
          </tr><!--
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">ʹ��״̬��</td>
            <td colspan="3" class="td1">&nbsp;<dict:write property="MR_REGISTER/STATECODE" businTypeId="dx_MR_STATECODE"></dict:write>
            </td>
          </tr>
          
        --></table>
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
 

 