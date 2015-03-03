<%@include file="/internet/common.jsp"%>
<html:html locale="true">
<head>
<title>考勤数据导出</title>

</head>

<body>
<!-- 导航条 -->
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;考勤管理—&gt;考勤数据导出</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
	  </td>
    </tr>
  </table>

<form name="cardForm" action="/ICCard/page/pot/exportKaoqinData.jsp" method="POST" target="_blank">

<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">考勤数据导出</td>
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
		<td width="20%" align="right" nowrap class="td2">班 级：</td>
		<td width="80%"  class="td1" align="left">
		<html:select property="classesid"  > 
              <html:option value="-1">全部班级</html:option>
              <html:options property="list[@type='Class']/Class/ClassID" labelProperty="list[@type='Class']/Class/ClassName"/> 
         </html:select>
		</td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">开始时间：</td>
		<td  class="td1" align="left">
		<html:text property="startTime" attributesText='class="input" size="30"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["startTime"],"yyyy-MM-dd")></td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">结束时间：</td>
		<td  class="td1" align="left"><html:text property="endTime" attributesText='class="input" size="30"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["endTime"],"yyyy-MM-dd")></td>
	</tr>
</table>
<br>

<div align="center">
	<span class="text">
	<input name="ss" type="submit" class="button_02" value="数据导出" >
	&nbsp;&nbsp;
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