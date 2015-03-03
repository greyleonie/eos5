<%@include file="/internet/common.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;费用报销单查看</td>
          </tr>
      </table></td>
    </tr>
  </table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup" >
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><span id="printTable">费用报销单</span></td>
				</tr>
</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">报销部门：</td>
				<td width="24%" nowrap class="td1"> <bean:write property="EOSORG_T_Organization/orgName" /></td>
				<td width="10%" align="center" nowrap class="td1">日期：</td>
				<td width="23%" nowrap class="td1"><bean:write property="CostClaim/ClaimDate[@pattern='yyyy-MM-dd']"    /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">财务审核：</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX3"  list="list[@type='wfdata']" /></td>
			    <td align="center" nowrap class="td1">部门签名：</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX2"  list="list[@type='wfdata']" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">证明人：</td>
			    <td nowrap class="td1"><bean:write property="CostClaim/Witnesses"  /></td>
			    <td align="center" nowrap class="td1">领款人签收：</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX5"  list="list[@type='wfdata']" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">开支资金渠道：</td>
			    <td nowrap class="td1"><bean:write property="CostClaim/fundChannel" /></td>
			    <td align="center" nowrap class="td1">领导审批：</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX4"  list="list[@type='wfdata']" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">原借款：</td>
			    <td nowrap class="td1"><bean:write property="CostClaim/Borrowing" /> 元 </td>
			    <td align="center" nowrap class="td1">应退余款：</td>
			    <td nowrap class="td1"><bean:write property="CostClaim/Refund" /> 元</td>
		      </tr>
			  
			  <tr>
			    <td height="25" colspan="4" align="center" nowrap class="td1">
			    <table id="inTable" width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr class="td1">
                    <td width="70%" height="25" align="center"><strong>用途</strong></td>
                    <td width="30%" align="center"><strong>金额（元）</strong></td>
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
                    <td width="70%" height="25" align="center">合计: </td>
                    <td width="30%" align="center"><%=count %></td>
                  </tr>
                </table></td>
		      </tr>
			</table>
			
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()"> <input name="ieprint" type="button" class="button_02" value="返 回" onClick="history.back()"></td></tr>
			</table>