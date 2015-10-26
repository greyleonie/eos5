<%@include file="/internet/common.jsp"%>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<html>
	<head>
		<title>
			收费机修改
		</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<script language="JavaScript">
			var flag=false;
			function IsExist(obj){
				var sn=document.getElementById('POS/POSSN').value.trim();
				var ip=document.getElementById('POS/IP_COM').value.trim();
				if(sn.length==0||ip.length==0){
					
				}else{
					var sub = new HiddenSubmit('ICCard.bizDevice.posIsExist');
					sub.add("POSSN", sn);
					sub.add("IP_COM", ip);
					if (sub.submit()) {
						if(sub.getProperty("exist")>0){
							document.getElementById(obj).innerHTML="&nbsp;*数据已存在重复";
						}else{
							document.getElementById(obj).innerHTML="";
							flag=true;
						}
					}
				}
				
			}
		
			var count;
			var countSpecial;
			
			function init(){
			
			count=document.forms["POSForm"].elements["POS/AllowCardType"].value;
			if((count&64)>0){
				document.forms["POSForm"].cardtype7.checked=true;
			}else{
				document.forms["POSForm"].elements["POS/OneDayConsumeMaxTimes7"].readonly="true";	
				document.forms["POSForm"].elements["POS/OneDayConsumeMaxSum7"].readonly="true";	
				document.forms["POSForm"].elements["POS/Discount7"].readonly="true";	
			}
				
			if((count&32)>0)
				document.forms["POSForm"].cardtype6.checked=true;
				
			if((count&16)>0)
				document.forms["POSForm"].cardtype5.checked=true;
				
			if((count&8)>0)
				document.forms["POSForm"].cardtype4.checked=true;
				
			if((count&4)>0)
				document.forms["POSForm"].cardtype3.checked=true;
				
			if((count&2)>0)
				document.forms["POSForm"].cardtype2.checked=true;
				
			if((count&1)>0){
				document.forms["POSForm"].cardtype1.checked=true;
			}else{
				document.forms["POSForm"].elements["POS/OneDayConsumeMaxTimes1"].readonly="true";	
				document.forms["POSForm"].elements["POS/OneDayConsumeMaxSum1"].readonly="true";	
				document.forms["POSForm"].elements["POS/Discount1"].readonly="true";	
			}
			
			//
			countSpecial=document.forms["POSForm"].elements["POS/AllowSpecialCardType"].value;
			
			if((countSpecial&64)>0)
				document.forms["POSForm"].specialcardtype7.checked=true;
				
			if((countSpecial&32)>0)
				document.forms["POSForm"].specialcardtype6.checked=true;
				
			if((countSpecial&16)>0)
				document.forms["POSForm"].specialcardtype5.checked=true;
				
			if((countSpecial&8)>0)
				document.forms["POSForm"].specialcardtype4.checked=true;
				
			if((countSpecial&4)>0)
				document.forms["POSForm"].specialcardtype3.checked=true;
				
			if((countSpecial&2)>0)
				document.forms["POSForm"].specialcardtype2.checked=true;
				
			if((countSpecial&1)>0)
				document.forms["POSForm"].specialcardtype1.checked=true;				
							
			}			
						
			function ClickSave()
			{
			POSForm.elements["POS/AllowCardType"].value=count*1;
			POSForm.elements["POS/AllowSpecialCardType"].value=countSpecial*1;
			POSForm.submit();
			}

			function ClickRevert()
			{

			POSForm.reset();
			}


			function ClickClose()
			{
			window.close();
			}
			
			function countCardType(obj,i)
			{
			if(obj.checked){
				var k=1;
				for(j=0;j<i-1;j++)
					k=k*2;
				count=count|k;
			}else{ 
				var k=1;
				for(j=0;j<i-1;j++)
					k=k*2;
				count=count&(~k);
			}
			}
			
			function countSpecialCardType(obj,i)
			{
			if(obj.checked){
				var k=1;
				for(j=0;j<i-1;j++)
					k=k*2;
				countSpecial=countSpecial|k;
			}else{ 
				var k=1;
				for(j=0;j<i-1;j++)
					k=k*2;
				countSpecial=countSpecial&(~k);
			}
			}
		</script>
	</head>	
	
	<body  onLoad="init();">
		
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;刷卡终端管理—&gt;收费机修改              </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
	  </td>
    </tr>
  </table>
		
		<!-- 表头 -->
		<html:form name="POSForm" action="ICCard.prDevice.posModifyDO.do" method="POST">
			<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">收费机信息</td>
                <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
              </tr>
            </table></td>
            <td width="60%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
              <tr>
                <td> </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="2" colspan="2"> </td>
          </tr>
        </table>
			
			<logic:equal property="action" value="create">
				&nbsp;
			</logic:equal>
			<logic:equal property="action" value="edit">
				<html:hidden property="POS/POSID"/>
			</logic:equal>
			
			<html:hidden property="POS/AllowCardType"/>
			<html:hidden property="POS/AllowSpecialCardType"/>		
			<html:hidden property="POS/POSID"/>	
			
			<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
				<tr>
					<td colspan="6" class="td1"><strong>设备基本信息</strong></td>
				</tr>
				<tr>
					<td width="8%" class="td2" nowrap align="center">收费机编号：</td>
				  <td width="25%" class="td1"><html:text property="POS/POSSN" styleClass="input" size="20" onblur="IsExist('snTips');"/><span id="snTips" style="color: red;"></span></td>
					<td width="8%" class="td2" nowrap align="center">收费机模式：</td>
				  <td width="25%" class="td1">
				 	<dict:select property="POS/ConsumeType" businTypeId="dx_ConsumeType" styleClass="input"></dict:select> 
				  </td>
					<td width="8%" class="td2" nowrap align="center">单次最高消费：</td>
				  <td width="25%" class="td1"><html:text property="POS/OneTimeConsumeMaxSum" styleClass="input" size="20"/></td>
				</tr>
				<tr>
				<td width="8%" class="td2" nowrap align="center">说　　　明：</td>
				<td class="td1"><html:text property="POS/Remark" styleClass="input" size="20"/></td>				
				<td width="8%" class="td2" nowrap align="center">是否有效：</td>
				<td class="td1">
				
				<html:radio property="POS/Enable" value="1" />有效 <html:radio
					property="POS/Enable" value="0" />无效			
				</td>
				<td width="8%" class="td2" nowrap align="center">连接编码：</td>
					<td class="td1"><html:text property="POS/IP_COM" styleClass="input" size="20" onblur="IsExist('ipTips');"/><span id="ipTips" style="color: red;"></span></td>
				</tr>
				<tr>
					<td colspan="4" class="td1"></td>
					<td colspan="2" class="td1"><input type="checkbox" name="POS/rebuild" value="1">重新生成黑名单</td>
				</tr>
				<tr>
					<td colspan="6" class="td1"><strong>消费时段信息</strong></td>
				</tr>
				<tr>
					<td class="td2" nowrap align="center">第一时段：</td>
					<td class="td1">
					<html:text property="POS/FirstBeginTime" styleClass="input" size="4"/>至
					<html:text property="POS/FirstEndTime" styleClass="input" size="4"/>定值:
				  <html:text property="POS/FirstFixedSum" styleClass="input" size="3"/>				  </td>
					<td class="td2" nowrap align="center">第二时段：</td>
					<td class="td1">
					<html:text property="POS/SecondBeginTime" styleClass="input" size="4"/>至
					<html:text property="POS/SecondEndTime" styleClass="input" size="4"/>定值:
				  <html:text property="POS/SecondFixedSum" styleClass="input" size="3"/>				  </td>
					<td class="td2" nowrap align="center">第三时段：</td>
					<td class="td1">
					<html:text property="POS/ThirdBeginTime" styleClass="input" size="4"/>至
					<html:text property="POS/ThirdEndTime" styleClass="input" size="4"/>定值:
					<html:text property="POS/ThirdFixedSum" styleClass="input" size="3"/>
				  </td>
				</tr>
				<tr>
					<td class="td2" nowrap align="center">第四时段：</td>
					<td class="td1">
					<html:text property="POS/FourthBeginTime" styleClass="input" size="4"/>至
					<html:text property="POS/FourthEndTime" styleClass="input" size="4"/>定值:
				  <html:text property="POS/FourthFixedSum" styleClass="input" size="3"/>				  </td>
					<td class="td2" nowrap align="center">第五时段：</td>
					<td class="td1">
					<html:text property="POS/FifthBeginTime" styleClass="input" size="4"/>至
					<html:text property="POS/FifthEndTime" styleClass="input" size="4"/>定值:
				  <html:text property="POS/FifthFixedSum" styleClass="input" size="3"/>				  </td>
					<td class="td2" nowrap align="center">填写范例：</td>
					<td class="td1">
						<input type="text" value="0830" size="4" readonly/>至
						<input type="text" value="0950" size="4" readonly/>定值:
						<input type="text" value="2.5" size="3"/>
				  </td>
				</tr>
			</table> 
			
			
			<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
				<tr>
					<td colspan="8" class="td1"><strong>卡类消费信息</strong></td>
				</tr>
				<tr>
					<td width="10%" class="td2" nowrap align="center">允许消费的卡类：</td>
					<td class="td1">
						<input type="checkbox" name="cardtype1" onClick="countCardType(this,'1')"/>在职教工卡</td>
					
					<td class="td1">
						<input type="checkbox" name="cardtype2" onClick="countCardType(this,'2')"/>退休教工卡</td>
					
					<td class="td1">
						<input type="checkbox" name="cardtype3" onClick="countCardType(this,'3')"/>常规主体班学员卡</td>
					
					<td class="td1">
						<input type="checkbox" name="cardtype4" onClick="countCardType(this,'4')"/>非常规主体班学员卡</td>
					
					<td class="td1">
						<input type="checkbox" name="cardtype5" onClick="countCardType(this,'5')"/>委托办班学员卡</td>
					
					<td class="td1">
						<input type="checkbox" name="cardtype6" onClick="countCardType(this,'6')"/>校外人员卡</td>
					
					<td class="td1">
						<input type="checkbox" name="cardtype7" onClick="countCardType(this,'7')"/>合约工卡</td>
				<td class="td1"> </td></tr>
				<tr>
					<td width="10%" class="td2" nowrap align="center">允许定额消费的卡类：</td >
					<td class="td1">
						<input type="checkbox" name="specialcardtype1" onClick="countSpecialCardType(this,'1')"/>在职教工卡</td>
					
					<td class="td1">
						<input type="checkbox" name="specialcardtype2" onClick="countSpecialCardType(this,'2')"/>退休教工卡</td>
					
					<td class="td1">
						<input type="checkbox" name="specialcardtype3" onClick="countSpecialCardType(this,'3')"/>常规主体班学员卡</td>
					
					<td class="td1">
						<input type="checkbox" name="specialcardtype4" onClick="countSpecialCardType(this,'4')"/>非常规主体班学员卡</td>
					
					<td class="td1">
						<input type="checkbox" name="specialcardtype5" onClick="countSpecialCardType(this,'5')"/>委托办班学员卡</td>
					
					<td class="td1">
						<input type="checkbox" name="specialcardtype6" onClick="countSpecialCardType(this,'6')"/>校外人员卡</td>
					
					<td class="td1">
						<input type="checkbox" name="specialcardtype7" onClick="countSpecialCardType(this,'7')"/>合约工卡</td>
					<td class="td1"> </td>
				</tr>
				<tr>
					<td width="10%" class="td2" nowrap align="center">每天最高消费次数：</td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxTimes1" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxTimes2" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxTimes3" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxTimes4" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxTimes5" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxTimes6" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxTimes7" styleClass="input" size="8"/></td>
				</tr>
				<tr>
					<td width="10%" class="td2" nowrap align="center">每天最高消费金额：</td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxSum1" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxSum2" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxSum3" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxSum4" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxSum5" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxSum6" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/OneDayConsumeMaxSum7" styleClass="input" size="8"/></td>
				</tr>
				<tr>
					<td width="10%" class="td2" nowrap align="center">费　　率：</td>
					<td class="td1"><html:text property="POS/Discount1" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/Discount2" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/Discount3" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/Discount4" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/Discount5" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/Discount6" styleClass="input" size="8"/></td>
					<td class="td1"><html:text property="POS/Discount7" styleClass="input" size="8"/></td>
				</tr>
				<tr>
				  <td height="30" colspan="8" align="center" nowrap class="td2"><span class="td1">
				    <input name="add2" type="button" class="button_02" value="保 存" onClick="ClickSave();">
&nbsp;
<input name="add2" type="reset" class="button_02" value="清 空" >
&nbsp;
<input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
				  </span></td>
			  </tr>
			</table>
			
		</html:form> 
	</body>
</html>