<%@include file="/internet/common.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���ñ������鿴</td>
          </tr>
      </table></td>
    </tr>
  </table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup" >
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><span id="printTable">���ñ�����</span></td>
				</tr>
</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">�������ţ�</td>
				<td width="24%" nowrap class="td1"> <bean:write property="EOSORG_T_Organization/orgName" /></td>
				<td width="10%" align="center" nowrap class="td1">���ڣ�</td>
				<td width="23%" nowrap class="td1"><bean:write property="CostClaim/ClaimDate[@pattern='yyyy-MM-dd']"    /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">������ˣ�</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX3"  list="list[@type='wfdata']" /></td>
			    <td align="center" nowrap class="td1">����ǩ����</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX2"  list="list[@type='wfdata']" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">֤���ˣ�</td>
			    <td nowrap class="td1"><bean:write property="CostClaim/Witnesses"  /></td>
			    <td align="center" nowrap class="td1">�����ǩ�գ�</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX5"  list="list[@type='wfdata']" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">��֧�ʽ�������</td>
			    <td nowrap class="td1"><bean:write property="CostClaim/fundChannel" /></td>
			    <td align="center" nowrap class="td1">�쵼������</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX4"  list="list[@type='wfdata']" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">ԭ��</td>
			    <td nowrap class="td1"><bean:write property="CostClaim/Borrowing" /> Ԫ </td>
			    <td align="center" nowrap class="td1">Ӧ����</td>
			    <td nowrap class="td1"><bean:write property="CostClaim/Refund" /> Ԫ</td>
		      </tr>
			  
			  <tr>
			    <td height="25" colspan="4" align="center" nowrap class="td1">
			    <table id="inTable" width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr class="td1">
                    <td width="70%" height="25" align="center"><strong>��;</strong></td>
                    <td width="30%" align="center"><strong>��Ԫ��</strong></td>
                  </tr>
                  <%
                  double count = 0;
                   %>
                  <logic:iterate id="resultset" property="list[@type='CostClaimDetail']"> 
                	<%
                	Double Amount = talent.core.TalentFunctions.getDouble(base.util.TalentContext.getValue(pageContext,"resultset","CostClaimDetail/Amount"));
                	 if(Amount!=null)
                	 	count += Amount.doubleValue();
                	 %>
                  <tr class="td1">
                    <td height="25" >&nbsp;<bean:write id="resultset" property="CostClaimDetail/Uses"/></td>
                    <td align="center"><%=Amount %></td>
                  </tr>
                  </logic:iterate>
              </table>
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                 
                  <tr class="td1">
                    <td width="70%" height="25" align="center">�ϼ�: </td>
                    <td width="30%" align="center"><%=count %></td>
                  </tr>
                </table></td>
		      </tr>
			</table>
			
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"> <input name="ieprint" type="button" class="button_02" value="�� ��" onClick="history.back()"></td></tr>
			</table>