<%@include file="/internet/common.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��ȡ֧Ʊ�����鿴</td>
          </tr>
      </table></td>
    </tr>
  </table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">��ȡ֧Ʊ������</td>
				</tr>
			</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">���ò��ţ�</td>
				<td width="24%" colspan="2" nowrap class="td1"> <bean:write property="EOSORG_T_Organization/orgName" /></td>
				<td width="10%" align="center" nowrap class="td1">���ڣ� </td>
				<td width="23%" nowrap class="td1"> <bean:write property="CheckRequest/ConsumDate[@pattern='yyyy-MM-dd']"   /></td>
				<td width="10%" align="center" nowrap class="td1">��ţ�</td>
				<td width="23%" nowrap class="td1">
				<bean:write property="CheckRequest/Number"/>
				
				</td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����ˣ�</td>
			    <td colspan="2" nowrap class="td1"><bean:write property="CheckRequest/UserID" formatClass="username" formatType="operatorID" /></td>
			    <td align="center" nowrap class="td1">Ԥ֧��</td>
			    <td nowrap class="td1"><bean:write property="CheckRequest/Advance" /> Ԫ</td>
			    <td align="center" nowrap class="td1">��֧�ʽ�������</td>
			    <td nowrap class="td1"><bean:write property="CheckRequest/Channel" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">֧Ʊ�����У�</td>
			    <td colspan="2" nowrap class="td1">
			    <bean:write property="CheckRequest/BankOwnership"/>
			
			    </td>
			    <td align="center" nowrap class="td1">֧Ʊ���룺</td>
			    <td nowrap class="td1">
			   <bean:write property="CheckRequest/CheckNO"/>
				
			   </td>
			    <td align="center" nowrap class="td1">�޶</td>
			    <td nowrap class="td1">
			     <bean:write property="CheckRequest/Limit"/>
				
			    Ԫ</td>
		      </tr>
			  
			  <tr> 
				<td height="25" align="center" nowrap class="td1">��;��</td>
				<td colspan="6" nowrap class="td1"><bean:write property="CheckRequest/Uses"  /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�տλ��</td>
			    <td colspan="6" nowrap class="td1"><bean:write property="CheckRequest/ReceiveOrg"   /></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="7" align="left" nowrap class="td1">
			<div class="divwf1">�����ò����쵼ǩ����</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX2"  list="list[@type='wfdata']" /></div>				</td>
		      </tr>
			  <tr>
			    <td height="25" colspan="7" nowrap class="td1"><div class="divwf1">����������ˡ�</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX3"  list="list[@type='wfdata']" /></div></td>
		      </tr>
			</table>
			
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"> <input name="ieprint" type="button" class="button_02" value="�� ��" onClick="history.back()"></td></tr>
			</table>