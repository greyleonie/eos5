<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;�������м�¼�鿴</td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="18"> </td>
    </tr>
    <tr>
      <td class="text"><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����ˣ�</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="QueryUseCarRequest/operatorName"/>			    </td>
			    <td align="center" nowrap class="td1">���벿�ţ�</td>
			    <td colspan="3" nowrap class="td1">&nbsp;<bean:write property="QueryUseCarRequest/orgName"/></td>
		      </tr>
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">Ŀ�ĵأ�</td>
				<td width="30%" nowrap class="td1"> &nbsp;<bean:write property="QueryUseCarRequest/Dest" />				</td>
				<td width="10%" align="center" nowrap class="td1">�ó������� </td>
				<td width="20%" nowrap class="td1"> &nbsp;<bean:write property="QueryUseCarRequest/Numb" />				</td>
				<td width="10%" align="center" nowrap class="td1">����ʱ�䣺</td>
				<td width="20%" nowrap class="td1"> &nbsp;<bean:write property="QueryUseCarRequest/OutTime[@pattern='yyyy-MM-dd']"/>			</td>
			  </tr>
			  
			  <tr> 
				<td height="25" align="center" nowrap class="td1">��&nbsp;&nbsp;�ɣ�</td>
				<td colspan="5" nowrap class="td1">&nbsp;<bean:write property="QueryUseCarRequest/Subject"   /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">��ʻԱ��</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="QueryUseCarRequest/Driver"/></td>
		        <td align="center" nowrap class="td1">���ƺţ�</td>
		        <td nowrap class="td1">&nbsp;<bean:write property="QueryUseCarRequest/CarNO"/></td>
		        <td align="center" nowrap class="td1">�ɳ��ˣ�</td>
		        <td nowrap class="td1">&nbsp;<bean:write property="QueryUseCarRequest/Senter"/></td>
	          </tr>
			  <tr>
			    <td height="25" colspan="6" align="left" nowrap class="td1">
					&nbsp;����ǰ��̱�����<bean:write property="QueryUseCarRequest/Odometer1"/>
					&nbsp;&nbsp;��������̱�����	<bean:write property="QueryUseCarRequest/Odometer2"/>
					&nbsp;&nbsp;��ʻ���<bean:write property="QueryUseCarRequest/Kms"/>
					&nbsp;&nbsp;�س�ʱ�䣺<bean:write property="QueryUseCarRequest/BackTime[@pattern='yyyy-MM-dd']"/>			    			</td>
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
 
 
 