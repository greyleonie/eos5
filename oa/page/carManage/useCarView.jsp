<%@include file="/internet/common.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�ó�����鿴</td>
          </tr>
      </table></td>
    </tr>
  </table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">�����е�У�ó�����</td>
				</tr>
			</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����ˣ�</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="UseCarRequest/UserID" formatClass="username" formatType="operatorID"/>			    </td>
			    <td align="center" nowrap class="td1">���벿�ţ�</td>
			    <td colspan="3" nowrap class="td1">&nbsp;<bean:write property="EOSORG_T_Organization/orgName"/></td>
		      </tr>
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">Ŀ�ĵأ�</td>
				<td width="30%" nowrap class="td1"> &nbsp;<bean:write property="UseCarRequest/Dest" />				</td>
				<td width="10%" align="center" nowrap class="td1">�ó������� </td>
				<td width="20%" nowrap class="td1"> &nbsp;<bean:write property="UseCarRequest/Numb" />				</td>
				<td width="10%" align="center" nowrap class="td1">����ʱ�䣺</td>
				<td width="20%" nowrap class="td1"> &nbsp;<bean:write property="UseCarRequest/OutTime[@pattern='yyyy-MM-dd']"/>			</td>
			  </tr>
			  
			  <tr> 
				<td height="25" align="center" nowrap class="td1">��&nbsp;&nbsp;�ɣ�</td>
				<td colspan="5" nowrap class="td1">&nbsp;<bean:write property="UseCarRequest/Subject"   /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">��ʻԱ��</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="UseCarRequest/Driver"/></td>
		        <td align="center" nowrap class="td1">���ƺţ�</td>
		        <td nowrap class="td1">&nbsp;<bean:write property="UseCarRequest/CarNO"/></td>
		        <td align="center" nowrap class="td1">�ɳ��ˣ�</td>
		        <td nowrap class="td1">&nbsp;<bean:write property="UseCarRequest/Senter"/></td>
	          </tr>
			  <tr>
			    <td height="25" colspan="6" align="left" nowrap class="td1">
					&nbsp;����ǰ��̱�����<bean:write property="UseCarRequest/Odometer1"/>
					&nbsp;&nbsp;��������̱�����	<bean:write property="UseCarRequest/Odometer2"/>
					&nbsp;&nbsp;��ʻ���<bean:write property="UseCarRequest/Kms"/>
					&nbsp;&nbsp;�س�ʱ�䣺<bean:write property="UseCarRequest/BackTime[@pattern='yyyy-MM-dd']"/>

			    			</td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">�����Ÿ�����ǩ�������</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX2" list="list[@type='wfdata']" /></div></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">���칫��ǩ�������</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX3" list="list[@type='wfdata']" /></div></td>
		      </tr>
			</table>
			
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"> <input name="ieprint" type="button" class="button_02" value="�� ��" onClick="history.back()"></td></tr>
			</table>