<%@include file="/internet/common.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;领取支票审批查看</td>
          </tr>
      </table></td>
    </tr>
  </table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">领取支票审批单</td>
				</tr>
			</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">领用部门：</td>
				<td width="24%" colspan="2" nowrap class="td1"> <bean:write property="EOSORG_T_Organization/orgName" /></td>
				<td width="10%" align="center" nowrap class="td1">日期： </td>
				<td width="23%" nowrap class="td1"> <bean:write property="CheckRequest/ConsumDate[@pattern='yyyy-MM-dd']"   /></td>
				<td width="10%" align="center" nowrap class="td1">编号：</td>
				<td width="23%" nowrap class="td1">
				<bean:write property="CheckRequest/Number"/>
				
				</td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">领用人：</td>
			    <td colspan="2" nowrap class="td1"><bean:write property="CheckRequest/UserID" formatClass="username" formatType="operatorID" /></td>
			    <td align="center" nowrap class="td1">预支金额：</td>
			    <td nowrap class="td1"><bean:write property="CheckRequest/Advance" /> 元</td>
			    <td align="center" nowrap class="td1">开支资金渠道：</td>
			    <td nowrap class="td1"><bean:write property="CheckRequest/Channel" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">支票归属行：</td>
			    <td colspan="2" nowrap class="td1">
			    <bean:write property="CheckRequest/BankOwnership"/>
			
			    </td>
			    <td align="center" nowrap class="td1">支票号码：</td>
			    <td nowrap class="td1">
			   <bean:write property="CheckRequest/CheckNO"/>
				
			   </td>
			    <td align="center" nowrap class="td1">限额：</td>
			    <td nowrap class="td1">
			     <bean:write property="CheckRequest/Limit"/>
				
			    元</td>
		      </tr>
			  
			  <tr> 
				<td height="25" align="center" nowrap class="td1">用途：</td>
				<td colspan="6" nowrap class="td1"><bean:write property="CheckRequest/Uses"  /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">收款单位：</td>
			    <td colspan="6" nowrap class="td1"><bean:write property="CheckRequest/ReceiveOrg"   /></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="7" align="left" nowrap class="td1">
			<div class="divwf1">【领用部门领导签批】</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX2"  list="list[@type='wfdata']" /></div>				</td>
		      </tr>
			  <tr>
			    <td height="25" colspan="7" nowrap class="td1"><div class="divwf1">【财务部门审核】</div>
		        <div class="divwf2">
				<fcc:wfdataview name="niBanOption" wfnode="DX3"  list="list[@type='wfdata']" /></div></td>
		      </tr>
			</table>
			
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()"> <input name="ieprint" type="button" class="button_02" value="返 回" onClick="history.back()"></td></tr>
			</table>