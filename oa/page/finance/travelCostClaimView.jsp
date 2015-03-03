<%@include file="/internet/common.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;差旅费报销查看</td>
          </tr>
      </table></td>
    </tr>
  </table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">差旅费报销单</td>
				</tr>
</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">姓 名：</td>
				<td width="24%" nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/UserID" formatClass="username" formatType="operatorID" /></td>
				<td width="10%" align="center" nowrap class="td1">职 别：</td>
				<td width="23%" nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/Post" /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">出差理由：</td>
			    <td colspan="3" nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/TravelCase"  /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">报销部门：</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="EOSORG_T_Organization/orgName" /></td>
			    <td align="center" nowrap class="td1">填报日期：</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/ClaimDate[@pattern='yyyy-MM-dd']"  /></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="4" nowrap class="td1">&nbsp;&nbsp;&nbsp;&nbsp;出差起止日期自
			    <bean:write property="TravelCostClaim/StartDate[@pattern='yyyy-MM-dd']"    />
			    起至
			    <bean:write property="TravelCostClaim/EndDate[@pattern='yyyy-MM-dd']"   />
			    止共
			    <bean:write property="TravelCostClaim/TravelDays"  /> 天</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">附单据：</td>
			    <td colspan="3" nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/Documents" /> 张</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">部门领导审批：</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX2" list="list[@type='wfdata']" /></td>
			    <td align="center" nowrap class="td1">证明人：</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/Witnesses"/></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">财务部门审批：</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX3" list="list[@type='wfdata']" /></td>
			    <td align="center" nowrap class="td1">校领导审批：</td>
			    <td nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX4"  list="list[@type='wfdata']" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">领款人签收：</td>
			    <td colspan="3" nowrap class="td1"><fcc:wfdataview name="niBanOption" wfnode="DX5" list="list[@type='wfdata']" /></td>
		      </tr>
			  
			  <tr>
			    <td height="25" colspan="4" align="center" nowrap class="td1">
			    <table id="inTable" width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr class="td1">
                    <td width="10%" height="25" align="center">日期</td>
                    <td width="10%" align="center">起讫地点</td>
                    <td width="10%" align="center">天数</td>
                    <td width="10%" align="center">机票费</td>
                    <td width="10%" align="center">车船费</td>
                    <td width="10%" align="center">市内交通费</td>
                    <td width="10%" align="center">住宿费</td>
                    <td width="10%" align="center">出差补助</td>
                    <td width="10%" align="center">其它</td>
                    <td width="10%" align="center">小计</td>
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
                    <td width="90%" height="25" align="center" colspan="9">合计: </td>
                    <td width="10%" align="center"><%=count %></td>
                  </tr>
              
			</table>
			</td>	  
		  </tr>
              
			</table>
			
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()"> <input name="ieprint" type="button" class="button_02" value="返 回" onClick="history.back()"></td></tr>
			</table>