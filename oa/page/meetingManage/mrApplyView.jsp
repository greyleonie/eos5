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
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"  id="printTable">�����е�У��������</td>
				</tr>
			</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">�����ˣ�</td>
				<td width="40%" nowrap class="td1"> <bean:write property="MR_APPLY/UserID" formatClass="username"  formatType="operatorID"/>			</td>
				<td width="10%" align="center" nowrap class="td1">����ʱ�䣺 </td>
				<td width="40%" nowrap class="td1"> <bean:write property="MR_APPLY/APPLYDATE[@pattern='yyyy-MM-dd']"    />				 			</td>
			  </tr>
			  
			  <tr> 
				<td height="25" align="center" nowrap class="td1">�������ƣ�</td>
				<td colspan="3" nowrap class="td1"><bean:write property="MR_APPLY/MeetingName"   /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�������⣺</td>
			    <td colspan="3" nowrap class="td1"><bean:write property="MR_APPLY/TOPIC"   /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">����������</td>
			    <td colspan="3" nowrap class="td1"><bean:write property="MR_APPLY/CENTRALTOPIC"   /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����ˣ�</td>
			    <td colspan="3" nowrap class="td1"><bean:write property="MR_APPLY/Moderator"   />
			    </td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">��ϯ��Ա��</td>
			    <td colspan="3" nowrap class="td1"><bean:write property="MR_APPLY/MRParticipants"   /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">��ʼʱ�䣺</td>
			    <td nowrap class="td1"><bean:write property="MR_APPLY/STARTDATE[@pattern='yyyy-MM-dd HH:mm']"    /></td>
		        <td align="center" nowrap class="td1">����ʱ�䣺</td>
		        <td nowrap class="td1"><bean:write property="MR_APPLY/ENDDATE[@pattern='yyyy-MM-dd HH:mm']"   /></td>
	          </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����ң�</td>
			    <td colspan="3" nowrap class="td1">
			    
			    <bean:write property="MR_APPLY/MRNAME"  />
			     </td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�쵼���������</td>
			    <td colspan="3" nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX2" list="list[@type='wfdata']" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�칫�Ұ��������</td>
			    <td colspan="3" nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX3" list="list[@type='wfdata']" /></td>
		      </tr>
			</table>
			
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"> <input name="ieprint" type="button" class="button_02" value="�� ��" onClick="history.back()"></td></tr>
			</table>