<%@include file="/internet/common.jsp"%>
<body onload="onLoad()">
<form method="post"  action="ICCard.prField.guestRoomCheckOutDo.do">
<html:hidden property="HousingLogs/HousingLogsID"/>
<html:hidden property="Room/BuildingID"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ -&gt; ���ع��� -&gt; �ͷ����� -&gt; �˷�</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
	  </td>
    </tr>
  </table>
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="20%" align="center" bgcolor="#4A82D1" class="textb_wirte">����һ��ס����Ϣ</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="70%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
      
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
 		 <tr> 
          <td align="right" class="td2">��    �ţ� </td>
          <td class="td1" >&nbsp;<bean:write property="Room/RoomName" /></td>
          <td align="right" class="td2">��    λ�� </td>
          <td class="td1" >&nbsp;<bean:write property="Room/SeatNum"  /></td>
                </tr>
        <tr>   
          <td align="right" class="td2">��    �� </td>
          <td class="td1"  colspan="3">&nbsp;<bean:write  property="Room/Price1"  language="zh" country="CN"/>
          <html:hidden property="Room/Price1"/>
          
          </td>
        </tr>
        <tr>
          <td align="right" class="td2" width="20%">�ա������� </td>
          <td class="td1" width="30%" >&nbsp;<bean:write property="Guest/GuestName"/> </td> 
          <td align="right" class="td2" width="20%">�ԡ����� </td> 
          <td class="td1" width="30%">&nbsp;<dict:write businTypeId="BNDICT_gender" property="Guest/Sex" />
          </td>
        </tr>
        <tr> 
          <td align="right" class="td2">�������᣺ </td>
          <td class="td1" >&nbsp;<bean:write property="Guest/OriginalPlace" /></td>
          <td align="right" class="td2">�ꡡ���䣺 </td>
          <td class="td1" >&nbsp;<bean:write property="Guest/Age"  /></td>
        </tr>
          <tr> 
          <td align="right" class="td2">ְ����ҵ�� </td>
          <td class="td1" >&nbsp;<bean:write  property="Guest/Occupation" /></td>
                    <td align="right" class="td2">������λ�� </td>
          <td class="td1" >&nbsp;<bean:write  property="Guest/WorkingOrgan" /></td>
        </tr>
          <tr> 
          <td align="right" class="td2">���ڵ�ַ��</td>
          <td class="td1" >&nbsp;<bean:write   property="Guest/RegisteredPlace"/></td>
          <td align="right" class="td2">�Ӻδ����� </td>
          <td class="td1" >&nbsp;<bean:write property="Guest/ComingFromPlace"  /></td>
        </tr>
        <tr> 
          <td align="right" class="td2">֤�����ƣ� </td>
          <td class="td1" >&nbsp;<bean:write property="Guest/Certificate"  /></td>
          <td align="right" class="td2">֤�����룺</td>
          <td class="td1" >&nbsp;<bean:write property="Guest/CertificateNO"  /></td>
        </tr>
      </table>
      
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="20%" align="center" bgcolor="#4A82D1" class="textb_wirte">�������������Ϣ</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="70%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
          
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr> 
          <td align="right" class="td2">�������ڣ� </td>
          <td class="td1" ><html:text name="HousingLogs/BeginTime[pattern='yyyy-MM-dd']"  property="HousingLogs/BeginTime" attributesText='class="input" size="12"  ValidateType="notempty" Msg="ʹ�����ڲ���Ϊ��"'  readonly="true"/> <span class="text_red">*</span>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick="onClickBeginTime();countPrice()"></td> 
          <td align="right" class="td2">�������ڣ� </td> 
          <td class="td1" ><html:text property="HousingLogs/EndTime[pattern='yyyy-MM-dd']" attributesText='class="input" size="12"  ValidateType="notempty" Msg="ʹ�����ڲ���Ϊ��"'   readonly="true"/> <span class="text_red">*</span>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick="onClickEndTime();countPrice()"  onmouseout=""></td>
        </tr>
        <tr> 
          <td align="right" class="td2">ס�������� </td>
           <td class="td1" ><html:text property="HousingDay"   attributesText='class="input" size="10" ValidateType="int" Msg="ס����������Ϊ����"' readonly="true"/></td>
           <td align="right" class="td2">�ϼƽ� </td>
          <td class="td1" ><html:text property="HousingLogs/RealWorth"   attributesText='class="input" size="10" ValidateType="money" Msg="�ϼƽ�����Ϊ����"'/>Ԫ</td>
        </tr>
      </table>  
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="window.close()"></td>
            </tr>
          </table>
          </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  </body>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
 function save(){
	var frm = document.forms[0];
 	frm .submit();

	}
 
  
  
	// ���ص���ѯҳ��
	function goBack() {
		window.location.href = "ICCard.prField.buildingList.do";
	}
	
	
	function  fillCurrentTime(){
		var curTime = new Date();
		var curDateStr = "";
		var curTimeStr = "";
		var form = document.forms[0];
		var datetime = form["HousingLogs/EndTime[pattern='yyyy-MM-dd']"].value;
		if(datetime==""){
			//����Ϊ��ǰʱ��
             var month = curTime.getMonth()+1;
			if (month<10){
					month = "0"+month;
			}
			var curDateOfMonth = curTime.getDate();
			if (curDateOfMonth<10){
				curDateOfMonth = "0"+curDateOfMonth;
			}
			curDateStr = curTime.getFullYear()+"-"+month+"-"+curDateOfMonth;

			var hours = curTime.getHours();
            if (hours<10){
				hours = "0"+hours;
			}
			var minutes = curTime.getMinutes();
			if(minutes<10){
				minutes = "0"+minutes;
			}
			var second = curTime.getSeconds();
			if(second<10){
				second ="0"+second;
			}
			curTimeStr =curDateStr+" "+ hours+":"+minutes+":"+second;
			form["HousingLogs/EndTime[pattern='yyyy-MM-dd']"].value = curDateStr;
			}
		}
/*
���˷�������Ϊ��ǰ����
����ס������
����ϼƽ��
*/		
		
function onLoad(){
var frm =document.forms[0];
fillCurrentTime()
var begin = frm["HousingLogs/BeginTime[pattern='yyyy-MM-dd']"].value;
var end = frm["HousingLogs/EndTime[pattern='yyyy-MM-dd']"].value;
var diff =(new Date(end.replace('-','/'))-new Date(begin.replace('-','/')))/1000/60/60/24;
frm["HousingDay"].value =diff;
var price = frm["Room/Price1"].value;
frm["HousingLogs/RealWorth"].value =diff*price;
}

function countPrice(){
var begin = frm["HousingLogs/BeginTime[pattern='yyyy-MM-dd']"].value;
var end = frm["HousingLogs/EndTime[pattern='yyyy-MM-dd']"].value;
var diff =(new Date(end.replace('-','/'))-new Date(begin.replace('-','/')))/1000/60/60/24;
frm["HousingDay"].value =diff;
alert(diff);
var price = frm["Room/Price1"].value;
frm["HousingLogs/RealWorth"].value =diff*price;

}

function onClickBeginTime(){
calendar(document.forms[0].elements["HousingLogs/BeginTime[pattern='yyyy-MM-dd']"],"yyyy-MM-dd");
}

function onClickEndTime(){
calendar(document.forms[0].elements["HousingLogs/EndTime[pattern='yyyy-MM-dd']"],"yyyy-MM-dd");
}
  </script>
  