<%@include file="/internet/common.jsp"%>
<html:html locale="true">
<head>
<title>���������</title>

</head>

<body>
<!-- ������ -->
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;���������&gt;��������á�&gt;�����������Ϣά��</td>
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
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">ÿ�ն�ʱ����������Ϣ</td>
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
		<td width="20%" align="right" nowrap class="td2">������ʼʱ�䣺</td>
		<td width="80%"  class="td1" align="left"><html:text property="ConfigureTree/TaskStartTimePerDay"  styleClass="input" size="30"  attributesText='ValidateType="standardtime" Msg="������ʼʱ�����ΪHH:mm:ss��ʽ"'/></td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">�������ʱ�䣺</td>
		<td  class="td1" align="left"><html:text property="ConfigureTree/TaskEndTimePerDay"  styleClass="input" size="30"  attributesText='ValidateType="standardtime" Msg="�������ʱ�����ΪHH:mm:ss��ʽ"'/></td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">������ʱ����</td>
		<td  class="td1" align="left"><html:text property="ConfigureTree/TaskIntervalMinutes"  styleClass="input" size="30"  attributesText='ValidateType="notempty,int" Msg=""������ʱ������Ϊ��;������ʱ������Ϊ����"'/>
		��λ������</td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">�������ʱ�䣺</td>
		<td  class="td1" align="left"><html:text property="ConfigureTree/ClearDataTimePerDay"  styleClass="input" size="30" attributesText='ValidateType="standardtime" Msg="�������ʱ�����ΪHH:mm:ss��ʽ"' /></td>
	</tr>
</table>
<br>
<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">�ڼ��ն�ʱ����������Ϣ</td>
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
		<td width="20%" align="right" nowrap class="td2">��ʼ����ʱ�䣺</td>
		<td width="80%"  class="td1" align="left">
		<html:text property="ConfigureTree/StartTimeOfConfigPOSInHoliday"  styleClass="input" size="30"  attributesText='ValidateType="standardtime" Msg="��ʼ����ʱ�����ΪHH:mm:ss��ʽ"'/>
		</td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">��������ʱ�䣺</td>
		<td  class="td1" align="left"><html:text property="ConfigureTree/EndTimeOfConfigPOSInHoliday"  styleClass="input" size="30"  attributesText='ValidateType="standardtime" Msg="��������ʱ�����ΪHH:mm:ss��ʽ"'/></td>
	</tr>
</table>
<br>
<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">����ʧ�ܲ���������Ϣ</td>
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
		<td width="20%" align="right" nowrap class="td2">������Դ�����</td>
		<td width="80%"  class="td1" align="left"><html:text property="ConfigureTree/MaxRetryTimes"  styleClass="input" size="30"  attributesText='ValidateType="notempty,int" Msg=""������Դ�������Ϊ��;������Դ�������Ϊ����"'/></td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">���Լ��ʱ����</td>
		<td  class="td1" align="left"><html:text property="ConfigureTree/RetryIntervalMinutes"  styleClass="input" size="30" attributesText='ValidateType="notempty,int" Msg="���Լ��ʱ������Ϊ��;���Լ��ʱ������Ϊ����"' />
		��λ������</td>
	</tr>
</table>
<br>
<div align="center">
	<span class="text">
	<input name="ss" type="button" class="button_02" value="�� ��" onClick="save()">&nbsp;&nbsp;
    <input name="reset" type="reset" class="button_02" value="�� ��" >
	</span></div>
</form>

<!-- ע�Ჽ��� -->

</body>
<script>
function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
</script>
</html:html>