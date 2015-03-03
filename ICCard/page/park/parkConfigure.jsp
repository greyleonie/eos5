<%@include file="/internet/common.jsp"%>
<html:html locale="true">
<head>
<title>监控器设置</title>

</head>

<body>
<!-- 导航条 -->
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;停车管理—&gt;停车配置信息维护</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
	  </td>
    </tr>
  </table>

<form name="cardForm" action="/ICCard.prPark.parkConfigureDO.do" method="POST">

<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">月保卡配置信息</td>
                <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
              </tr>
            </table></td>
            <td width="40%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
              <tr>
                <td> </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="2" colspan="2"> </td>
          </tr>
    </table>
<table width="80%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
	<tr>
		<td width="20%" align="right" nowrap class="td2">月保卡每月收费：</td>
		<td width="80%" align="left"  class="td1"><html:text property="ConfigureTree/MonthCardCharge"  styleClass="input" size="30"  attributesText='ValidateType="notempty,int" Msg="月保卡每月收费不能为空;月保卡每月收费必须为整数"'/>
		单位：元/月</td>
	</tr>
</table>
<br>
<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">停车费率配置信息</td>
                <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
              </tr>
            </table></td>
            <td width="40%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
              <tr>
                <td> </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="2" colspan="2"> </td>
          </tr>
    </table>
<table width="80%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
	<tr>
		<td width="20%" align="right" nowrap class="td2">停车每小时收费：</td>
		<td width="80%" align="left"  class="td1"><html:text property="ConfigureTree/TempCardOneHour"  styleClass="input" size="30"  attributesText='ValidateType="notempty,money" Msg="停车每小时收费不能为空;停车每小时收费格式不正确"'/>
		元</td>
	</tr>
	<tr>
	  <td align="right" nowrap class="td2">停车<span id="id4"><bean:write  property="ConfigureTree/ParkTopChargMaxHour"/></span>小时限价：</td>
	  <td align="left"  class="td1"><html:text property="ConfigureTree/TempCardTwelveHour"  styleClass="input" size="30"  attributesText='ValidateType="notempty,money" Msg="停车限价不能为空;停车限价格式不正确"'/> 元</td>
	  </tr>
</table>
<br>
<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">停车收费时间配置信息</td>
                <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
              </tr>
            </table></td>
            <td width="40%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
              <tr>
                <td> </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="2" colspan="2"> </td>
          </tr>
    </table>
<table width="80%"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#A2C4DC">
	<tr>
		<td colspan="2" align="left" class="td2">&nbsp;&nbsp;&nbsp;&nbsp;车辆停放不足
	    <html:text property="ConfigureTree/ParkNoChargMinute"  styleClass="input" size="4"  attributesText='ValidateType="notempty,int" Msg="停车免费时间不能为空;停车免费时间必须为整数"' onchange="changeTime1(this.value)"/>分钟内不收费。超过<span id="id1"><bean:write  property="ConfigureTree/ParkNoChargMinute"/></span>分钟不足1小时按1小时计算。超过<html:text property="ConfigureTree/ParkTopChargMinHour"  styleClass="input" size="4"  attributesText='ValidateType="notempty,int" Msg="最高限价时间段最小时间不能为空;最高限价时间段最小时间必须为整数"'/>小时不足<html:text property="ConfigureTree/ParkTopChargMaxHour"  styleClass="input" size="4"  attributesText='ValidateType="notempty,int" Msg="最高限价时间段最大时间不能为空;最高限价时间段最大时间必须为整数"'  onchange="changeTime2(this.value)"/>小时的按<span id="id2"><bean:write  property="ConfigureTree/ParkTopChargMaxHour"/></span>小时最高限价计算。 连续停放超过<span id="id3"><bean:write  property="ConfigureTree/ParkTopChargMaxHour"/></span>小时的按上述收费标准累加收费。</td>
	  </tr>
</table>
<br>
<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">教工免费停车时段配置信息</td>
                <td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
              </tr>
            </table></td>
            <td width="40%" valign="bottom"><table width="100%" height="4"  border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
              <tr>
                <td> </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="2" colspan="2"> </td>
          </tr>
    </table>
<table width="80%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
	
	
	<tr>
		<td width="20%" align="right" nowrap class="td2">免费停车起始时间：</td>
		<td width="80%"  class="td1" align="left"><html:text property="ConfigureTree/TeacherParkFreeTimeStart"  styleClass="input" size="30"  attributesText='ValidateType="standardtime" Msg="免费停车起始时间必须为HH:mm:ss格式"'/></td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">免费停车结束时间：</td>
		<td  class="td1" align="left"><html:text property="ConfigureTree/TeacherParkFreeTimeEnd"  styleClass="input" size="30"  attributesText='ValidateType="standardtime" Msg="免费停车起始时间必须为HH:mm:ss格式"'/></td>
	</tr>
</table>
<br>
<div align="center">
	<span class="text">
	<input name="ss" type="button" class="button_02" value="保 存" onClick="save()">&nbsp;&nbsp;
    <input name="reset" type="reset" class="button_02" value="重 置" >
	</span></div>
</form>

<!-- 注册步骤二 -->

</body>
<script>
function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
 function changeTime1(value){
 	//var value = document.forms[0].elements["ConfigureTree/ParkNoChargMinute"].value;
 	//alert(value);
 	document.getElementById("id1").innerHTML = value;
 }
 function changeTime2(value){
 	//var value = document.forms[0].elements["ConfigureTree/ParkNoChargMinute"].value;
 	//alert(value);
 	document.getElementById("id2").innerHTML = value;
 	document.getElementById("id3").innerHTML = value;
 	document.getElementById("id4").innerHTML = value;
 }
</script>
</html:html>