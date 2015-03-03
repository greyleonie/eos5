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
            <td class="text_wirte">首页—&gt;监控器管理—&gt;监控器设置—&gt;监控器配置信息维护</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
	  </td>
    </tr>
  </table>

<form name="cardForm" action="/ICCard.prMonitor.configureModifyDO.do" method="POST">

<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">每日定时任务配置信息</td>
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
		<td width="20%" align="right" nowrap class="td2">任务起始时间：</td>
		<td width="80%"  class="td1" align="left"><html:text property="ConfigureTree/TaskStartTimePerDay"  styleClass="input" size="30"  attributesText='ValidateType="standardtime" Msg="任务起始时间必须为HH:mm:ss格式"'/></td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">任务结束时间：</td>
		<td  class="td1" align="left"><html:text property="ConfigureTree/TaskEndTimePerDay"  styleClass="input" size="30"  attributesText='ValidateType="standardtime" Msg="任务结束时间必须为HH:mm:ss格式"'/></td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">任务间隔时长：</td>
		<td  class="td1" align="left"><html:text property="ConfigureTree/TaskIntervalMinutes"  styleClass="input" size="30"  attributesText='ValidateType="notempty,int" Msg=""任务间隔时长不能为空;任务间隔时长必须为整数"'/>
		单位：分钟</td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">清除数据时间：</td>
		<td  class="td1" align="left"><html:text property="ConfigureTree/ClearDataTimePerDay"  styleClass="input" size="30" attributesText='ValidateType="standardtime" Msg="清除数据时间必须为HH:mm:ss格式"' /></td>
	</tr>
</table>
<br>
<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">节假日定时任务配置信息</td>
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
		<td width="20%" align="right" nowrap class="td2">起始设置时间：</td>
		<td width="80%"  class="td1" align="left">
		<html:text property="ConfigureTree/StartTimeOfConfigPOSInHoliday"  styleClass="input" size="30"  attributesText='ValidateType="standardtime" Msg="起始设置时间必须为HH:mm:ss格式"'/>
		</td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">结束设置时间：</td>
		<td  class="td1" align="left"><html:text property="ConfigureTree/EndTimeOfConfigPOSInHoliday"  styleClass="input" size="30"  attributesText='ValidateType="standardtime" Msg="结束设置时间必须为HH:mm:ss格式"'/></td>
	</tr>
</table>
<br>
<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">任务失败策略配置信息</td>
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
		<td width="20%" align="right" nowrap class="td2">最大重试次数：</td>
		<td width="80%"  class="td1" align="left"><html:text property="ConfigureTree/MaxRetryTimes"  styleClass="input" size="30"  attributesText='ValidateType="notempty,int" Msg=""最大重试次数不能为空;最大重试次数必须为整数"'/></td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">重试间隔时长：</td>
		<td  class="td1" align="left"><html:text property="ConfigureTree/RetryIntervalMinutes"  styleClass="input" size="30" attributesText='ValidateType="notempty,int" Msg="重试间隔时长不能为空;重试间隔时长必须为整数"' />
		单位：分钟</td>
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
</script>
</html:html>