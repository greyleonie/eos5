<%@include file="/internet/common.jsp"%>
<script>
function clockon() {
var hours, minutes, seconds, year,month,day;
var intHours, intMinutes, intSeconds;
var today,theday, thetime,theweek;
today = new Date();
function initArray(){
this.length=initArray.arguments.length
for(var i=0;i<this.length;i++)
this[i+1]=initArray.arguments[i] }
var d=new initArray(
"������",
"����һ",
"���ڶ�",
"������",
"������",
"������",
"������");
year = today.getYear();
month = today.getMonth()+1;
day = today.getDate();
if (month < 10) {
month = "0"+month;
} 
if (day < 10) {
day = "0"+day;
} 
theday = year +"-" + month+"-" + day;
theweek = d[today.getDay()+1];
hours=today.getHours();
minutes=today.getMinutes();
seconds=today.getSeconds();
if (eval(hours) <10) {hours="0"+hours;}
if (eval(minutes) < 10) {minutes="0"+minutes;}
if (seconds < 10) {seconds="0"+seconds}
thetime = hours+":"+minutes+":"+seconds;
if(document.all) {
bgclocknoshade.innerHTML=thetime;
bgclockshade.innerHTML=thetime;
bgdatenoshade.innerHTML=theday + "  " + theweek;
bgdateshade.innerHTML=theday + "  " + theweek;
}

var timer= setTimeout("clockon()",200);
}

function start(){
	clockon();
	
}
</script>
<%
String state = (String)request.getAttribute("state");
talent.util.ParkUserCard puc = (talent.util.ParkUserCard)request.getAttribute("puc");
String CardTypeName = "";
String CarNO = "";
String ComeTime = "";
String LeaveTime = "";
int RecordID = 0;
if(puc!=null){
	if(puc.getCardType()==1) CardTypeName = "ѧԱ��";
	else if(puc.getCardType()==2) CardTypeName = "�̹���";
	else if(puc.getCardType()==3) CardTypeName = "���ó���";
	else if(puc.getCardType()==4) CardTypeName = "�±���";
	else if(puc.getCardType()==5) CardTypeName = "��ʱ��";
	else if(puc.getCardType()==6) CardTypeName = "�̿�";
	
	RecordID = puc.getRecordID();
	CarNO = puc.getCarNO();
	ComeTime = puc.getComeTime();
	LeaveTime = puc.getLeaveTime();
	if(CarNO==null) CarNO="";
	if(ComeTime==null) ComeTime="";
	if(LeaveTime==null) LeaveTime="";
	if(state==null) state="";
	ComeTime = ComeTime.substring(0,16);
}
String lastCarNO = (String)request.getAttribute("lastCarNO");
if(lastCarNO==null) lastCarNO = "";
if(!CarNO.equals("")) lastCarNO = CarNO;
else if(lastCarNO.equals("")) lastCarNO = "��A";
String conCode = (String)request.getAttribute("ConnectCode");  
String deviceID = (String)request.getAttribute("deviceID");  
 %>
<style type="text/css">
<!--
.tds{
    background-color: #D7E1E3;
	color: #FB6039;
	font-size: 28px;
	font-weight:bolder;
	line-height: 30px;
}

.tds1{
    background-color: #D7E1E3;
	color: #3399FF;
	font-size: 22px;
	line-height: 22px;
}
.tds2{
    background-color: #D7E1E3;
	font-size: 18px;
	line-height: 22px;
}
-->
</style>
<body onLoad="start()"  topmargin="0" bottommargin="0" bgcolor="#A0C2FC">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" background="/talent/page/park/image/title.gif">
  <tr>
    <td width="85%" height="80" rowspan="4">&nbsp;</td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#A0C2FC">

<tr align="center" >
   <td height="72">
    <div id="bgclockshade" style="position:absolute;visibility:visible;font-family:Arial;color:FF8888;font-size:52px;top:88px;left:268px"></div>
����<div id="bgclocknoshade" style="position:absolute;visibility:visible;font-family:Arial;color:DDDfff;font-size:52px;top:86px;left:266px"></div>

    <div id="bgdateshade" style="position:absolute;visibility:visible;font-family:Arial;color:FF8888;font-size:32px;top:98px;left:568px"></div>
	<div id="bgdatenoshade" style="position:absolute;visibility:visible;font-family:Arial;color:DDDfff;font-size:32px;top:96px;left:566px"></div>
   </td>
</tr>
</table>
<table width="100%" border="0" cellspacing="2" cellpadding="0" bgcolor="#A0C2FC">
  <tr>
    <td height="52"  class="tds">&nbsp;<span class="tds1">�û�����:</span> <%=CardTypeName%></td>
	<td  class="tds"><span class="tds1">&nbsp;���ƺ���:</span> <%=CarNO %></td>
  </tr>
  <tr>

    <td height="49" colspan="2"  class="tds"><span class="tds1">&nbsp;��������ʱ��:</span> <%=ComeTime %></td>
  </tr>
  <tr>
    <td class="tds" height="223" colspan="2">
	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td width="7%" class="tds1">&nbsp;����<br>
      &nbsp;����<br>&nbsp;ץ��<br>&nbsp;ͼƬ</td>
	<td width="93%" class="tds1">&nbsp;
	<img src="/common/page/viewimgdb/viewFromDB.jsp?table=ParkReadCardRecord&pkn=RecordID&field=ComeCarPic&pkv=<%=RecordID %>" height="200" width="400"></td>
  </tr>
</table>
  <form action="/parkDispatcher" name="form2" method="post">
  <input name="photoStatus" type="hidden" value="0">
  <input name="RecordID2" type="hidden" value="<%=RecordID %>">
  <input name="ConnectCode" type="hidden" value="<%=conCode %>">
  <input name="deviceID" type="hidden" value="<%=deviceID %>">
  <tr >
    <td class="tds2" colspan="3" align="right">&nbsp;<input name="photobutton" type="button" value="ץ��ͼƬ" onClick="paizhao()"/>&nbsp;
    
    </td>
  </tr>
 </form>
    </td>
  </tr>
</table>
<br>

<%if(!state.equals("comeoper")&&CarNO.equals("")){ %>
<form action="/parkDispatcher" name="form1" method="post">
<table width="100%" border="0" cellspacing="2" cellpadding="0" bgcolor="#A0C2FC">
<input name="operStatus" type="hidden" value="0">
  <tr >
    <td class="tds2" width="28%" >&nbsp;���ƺ���: 
      <input name="CarNO" type="text" value="<%=lastCarNO %>"/><input name="RecordID" type="hidden" value="<%=RecordID %>"></td>
    <td class="tds2" width="72%" >&nbsp;<input name="button" type="submit" value="ȷ ��" /></td>
  </tr>
</table>

</form>
<%} %>

<script language="javascript">
                       function init()
			{
                         
                        setTimeout("forward();",2*60*1000);
			}
                        function forward()
			{
                        location.replace("/parkDispatcher"); 
             } 
             init();
</script>
<script language="javascript">

function paizhao(){
	var conCode = '<%=conCode%>';
	//alert(conCode);
	if(conCode==1){
		parent.parkindex.photocontrol.ViewableWidth = 160;
		parent.parkindex.photocontrol.ViewableHeight = 120;
		parent.parkindex.photocontrol.SaveJPEG("D:/park.jpg","100");
	}else if(conCode==2){
		parent.parkindex.photocontrol2.ViewableWidth = 160;
		parent.parkindex.photocontrol2.ViewableHeight = 120;
		parent.parkindex.photocontrol2.SaveJPEG("D:/park.jpg","100");
	}
	form2.submit();
}
		
</script>

</body>