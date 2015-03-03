<%@include file="/internet/common.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;借款审批查看</td>
          </tr>
      </table></td>
    </tr>
  </table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">借款审批单</td>
				</tr>
</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">部门：</td>
				<td width="24%" nowrap class="td1"> <bean:write property="EOSORG_T_Organization/orgName" /></td>
				<td width="10%" align="center" nowrap class="td1">借款人：</td>
				<td width="23%" nowrap class="td1"><bean:write property="BorrowRequest/UserID" formatClass="username" formatType="operatorID" /></td>
				<td width="10%" align="center" nowrap class="td1">日期：</td>
				<td width="23%" nowrap class="td1">
				<bean:write property="BorrowRequest/ConsumDate[@pattern='yyyy-MM-dd']" />
				 </td>
			  </tr>
			  
			  <tr>
			    <td height="25" align="center" nowrap class="td1">借款事由：</td>
			    <td colspan="5" nowrap class="td1"><bean:write property="BorrowRequest/Reasons" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">开支资金渠道：</td>
			    <td colspan="5" nowrap class="td1"><bean:write property="BorrowRequest/Channel" /></td>
		      </tr>
			  <tr> 
				<td height="25" align="center" nowrap class="td1">借款金额：</td>
				<td colspan="5" nowrap class="td1"><bean:write property="BorrowRequest/AmountBig" />（大写）
				&nbsp;<bean:write property="BorrowRequest/Amount" />（数字）</td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">预计还款报销日期：</td>
			    <td colspan="5" nowrap class="td1"><bean:write property="BorrowRequest/RepayDate[@pattern='yyyy-MM-dd']"   /></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" align="left" nowrap class="td1">
			<div class="divwf1">【部门领导签批】</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX2"  list="list[@type='wfdata']" /></div>				</td>
		      </tr>
		      <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【校领导审核】</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX4"  list="list[@type='wfdata']" /></div></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【财务部门审核】</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX3"  list="list[@type='wfdata']" /></div></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">领款人签收：</td>
		        <td align="center" nowrap class="td1">
					
					<bean:write property="BorrowRequest/SignName"  /> 
				
				</td>
		        <td align="center" nowrap class="td1">日期：</td>
		        <td nowrap class="td1">
					<bean:write property="BorrowRequest/SignTime[@pattern='yyyy-MM-dd']"   />
			</td>
		        <td nowrap class="td1">&nbsp;</td>
		        <td nowrap class="td1">&nbsp;</td>
			  </tr>
			</table>
			
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()"> <input name="ieprint" type="button" class="button_02" value="返 回" onClick="history.back()"></td></tr>
			</table>