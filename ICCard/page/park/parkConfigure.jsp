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
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;ͣ������&gt;ͣ��������Ϣά��</td>
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
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">�±���������Ϣ</td>
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
		<td width="20%" align="right" nowrap class="td2">�±���ÿ���շѣ�</td>
		<td width="80%" align="left"  class="td1"><html:text property="ConfigureTree/MonthCardCharge"  styleClass="input" size="30"  attributesText='ValidateType="notempty,int" Msg="�±���ÿ���շѲ���Ϊ��;�±���ÿ���շѱ���Ϊ����"'/>
		��λ��Ԫ/��</td>
	</tr>
</table>
<br>
<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">ͣ������������Ϣ</td>
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
		<td width="20%" align="right" nowrap class="td2">ͣ��ÿСʱ�շѣ�</td>
		<td width="80%" align="left"  class="td1"><html:text property="ConfigureTree/TempCardOneHour"  styleClass="input" size="30"  attributesText='ValidateType="notempty,money" Msg="ͣ��ÿСʱ�շѲ���Ϊ��;ͣ��ÿСʱ�շѸ�ʽ����ȷ"'/>
		Ԫ</td>
	</tr>
	<tr>
	  <td align="right" nowrap class="td2">ͣ��<span id="id4"><bean:write  property="ConfigureTree/ParkTopChargMaxHour"/></span>Сʱ�޼ۣ�</td>
	  <td align="left"  class="td1"><html:text property="ConfigureTree/TempCardTwelveHour"  styleClass="input" size="30"  attributesText='ValidateType="notempty,money" Msg="ͣ���޼۲���Ϊ��;ͣ���޼۸�ʽ����ȷ"'/> Ԫ</td>
	  </tr>
</table>
<br>
<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">ͣ���շ�ʱ��������Ϣ</td>
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
		<td colspan="2" align="left" class="td2">&nbsp;&nbsp;&nbsp;&nbsp;����ͣ�Ų���
	    <html:text property="ConfigureTree/ParkNoChargMinute"  styleClass="input" size="4"  attributesText='ValidateType="notempty,int" Msg="ͣ�����ʱ�䲻��Ϊ��;ͣ�����ʱ�����Ϊ����"' onchange="changeTime1(this.value)"/>�����ڲ��շѡ�����<span id="id1"><bean:write  property="ConfigureTree/ParkNoChargMinute"/></span>���Ӳ���1Сʱ��1Сʱ���㡣����<html:text property="ConfigureTree/ParkTopChargMinHour"  styleClass="input" size="4"  attributesText='ValidateType="notempty,int" Msg="����޼�ʱ�����Сʱ�䲻��Ϊ��;����޼�ʱ�����Сʱ�����Ϊ����"'/>Сʱ����<html:text property="ConfigureTree/ParkTopChargMaxHour"  styleClass="input" size="4"  attributesText='ValidateType="notempty,int" Msg="����޼�ʱ������ʱ�䲻��Ϊ��;����޼�ʱ������ʱ�����Ϊ����"'  onchange="changeTime2(this.value)"/>Сʱ�İ�<span id="id2"><bean:write  property="ConfigureTree/ParkTopChargMaxHour"/></span>Сʱ����޼ۼ��㡣 ����ͣ�ų���<span id="id3"><bean:write  property="ConfigureTree/ParkTopChargMaxHour"/></span>Сʱ�İ������շѱ�׼�ۼ��շѡ�</td>
	  </tr>
</table>
<br>
<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="22%"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
                <td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">�̹����ͣ��ʱ��������Ϣ</td>
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
		<td width="20%" align="right" nowrap class="td2">���ͣ����ʼʱ�䣺</td>
		<td width="80%"  class="td1" align="left"><html:text property="ConfigureTree/TeacherParkFreeTimeStart"  styleClass="input" size="30"  attributesText='ValidateType="standardtime" Msg="���ͣ����ʼʱ�����ΪHH:mm:ss��ʽ"'/></td>
	</tr>
	<tr>
		<td align="right" nowrap class="td2">���ͣ������ʱ�䣺</td>
		<td  class="td1" align="left"><html:text property="ConfigureTree/TeacherParkFreeTimeEnd"  styleClass="input" size="30"  attributesText='ValidateType="standardtime" Msg="���ͣ����ʼʱ�����ΪHH:mm:ss��ʽ"'/></td>
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