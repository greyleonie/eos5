<%@include file="/internet/common.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������鿴</td>
          </tr>
      </table></td>
    </tr>
  </table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">���������</td>
				</tr>
</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">���ţ�</td>
				<td width="24%" nowrap class="td1"> <bean:write property="EOSORG_T_Organization/orgName" /></td>
				<td width="10%" align="center" nowrap class="td1">����ˣ�</td>
				<td width="23%" nowrap class="td1"><bean:write property="BorrowRequest/UserID" formatClass="username" formatType="operatorID" /></td>
				<td width="10%" align="center" nowrap class="td1">���ڣ�</td>
				<td width="23%" nowrap class="td1">
				<bean:write property="BorrowRequest/ConsumDate[@pattern='yyyy-MM-dd']" />
				 </td>
			  </tr>
			  
			  <tr>
			    <td height="25" align="center" nowrap class="td1">������ɣ�</td>
			    <td colspan="5" nowrap class="td1"><bean:write property="BorrowRequest/Reasons" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">��֧�ʽ�������</td>
			    <td colspan="5" nowrap class="td1"><bean:write property="BorrowRequest/Channel" /></td>
		      </tr>
			  <tr> 
				<td height="25" align="center" nowrap class="td1">����</td>
				<td colspan="5" nowrap class="td1"><bean:write property="BorrowRequest/AmountBig" />����д��
				&nbsp;<bean:write property="BorrowRequest/Amount" />�����֣�</td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">Ԥ�ƻ�������ڣ�</td>
			    <td colspan="5" nowrap class="td1"><bean:write property="BorrowRequest/RepayDate[@pattern='yyyy-MM-dd']"   /></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" align="left" nowrap class="td1">
			<div class="divwf1">�������쵼ǩ����</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX2"  list="list[@type='wfdata']" /></div>				</td>
		      </tr>
		      <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">��У�쵼��ˡ�</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX4"  list="list[@type='wfdata']" /></div></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">����������ˡ�</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX3"  list="list[@type='wfdata']" /></div></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����ǩ�գ�</td>
		        <td align="center" nowrap class="td1">
					
					<bean:write property="BorrowRequest/SignName"  /> 
				
				</td>
		        <td align="center" nowrap class="td1">���ڣ�</td>
		        <td nowrap class="td1">
					<bean:write property="BorrowRequest/SignTime[@pattern='yyyy-MM-dd']"   />
			</td>
		        <td nowrap class="td1">&nbsp;</td>
		        <td nowrap class="td1">&nbsp;</td>
			  </tr>
			</table>
			
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"> <input name="ieprint" type="button" class="button_02" value="�� ��" onClick="history.back()"></td></tr>
			</table>