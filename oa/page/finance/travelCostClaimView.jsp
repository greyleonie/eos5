<%@include file="/internet/common.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���÷ѱ����鿴</td>
          </tr>
      </table></td>
    </tr>
  </table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">���÷ѱ�����</td>
				</tr>
</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">�� ����</td>
				<td width="24%" nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/UserID" formatClass="username" formatType="operatorID" /></td>
				<td width="10%" align="center" nowrap class="td1">ְ ��</td>
				<td width="23%" nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/Post" /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�������ɣ�</td>
			    <td colspan="3" nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/TravelCase"  /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�������ţ�</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="EOSORG_T_Organization/orgName" /></td>
			    <td align="center" nowrap class="td1">����ڣ�</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/ClaimDate[@pattern='yyyy-MM-dd']"  /></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="4" nowrap class="td1">&nbsp;&nbsp;&nbsp;&nbsp;������ֹ������
			    <bean:write property="TravelCostClaim/StartDate[@pattern='yyyy-MM-dd']"    />
			    ����
			    <bean:write property="TravelCostClaim/EndDate[@pattern='yyyy-MM-dd']"   />
			    ֹ��
			    <bean:write property="TravelCostClaim/TravelDays"  /> ��</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����ݣ�</td>
			    <td colspan="3" nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/Documents" /> ��</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����쵼������</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX2" list="list[@type='wfdata']" /></td>
			    <td align="center" nowrap class="td1">֤���ˣ�</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/Witnesses"/></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">������������</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX3" list="list[@type='wfdata']" /></td>
			    <td align="center" nowrap class="td1">У�쵼������</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX4"  list="list[@type='wfdata']" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����ǩ�գ�</td>
			    <td colspan="3" nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX5" list="list[@type='wfdata']" /></td>
		      </tr>
			  
			  <tr>
			    <td height="25" colspan="4" align="center" nowrap class="td1">
			    <table id="inTable" width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr class="td1">
                    <td width="10%" height="25" align="center">����</td>
                    <td width="10%" align="center">�����ص�</td>
                    <td width="10%" align="center">����</td>
                    <td width="10%" align="center">��Ʊ��</td>
                    <td width="10%" align="center">������</td>
                    <td width="10%" align="center">���ڽ�ͨ��</td>
                    <td width="10%" align="center">ס�޷�</td>
                    <td width="10%" align="center">�����</td>
                    <td width="10%" align="center">����</td>
                    <td width="10%" align="center">С��</td>
                  </tr>
                    <%
                  double count = 0;
                   %>
                  <logic:iterate id="resultset" property="list[@type='TravelClaimDetail']"> 
                	<%
                	Double Subtotal = talent.core.TalentFunctions.getDouble(base.util.TalentContext.getValue(pageContext,"resultset","TravelClaimDetail/Subtotal"));
                	 if(Subtotal!=null)
                	 	count += Subtotal.doubleValue();
                	 %>
                  <tr class="td1">
                  <td height="25" align="center"><bean:write id="resultset" property="TravelClaimDetail/travelDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/locations"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/travelDays"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/Airfares"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/Travelcosts"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/Transport"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/Accommodation"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/Subsidy"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/Other"/></td>
                    <td align="center"><%=Subtotal %></td>
                  </tr>
                  </logic:iterate>
                  
                  
             <tr class="td1">
                    <td width="90%" height="25" align="center" colspan="9">�ϼ�: </td>
                    <td width="10%" align="center"><%=count %></td>
                  </tr>
              
			</table>
			</td>	  
		  </tr>
              
			</table>
			
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"> <input name="ieprint" type="button" class="button_02" value="�� ��" onClick="history.back()"></td></tr>
			</table>