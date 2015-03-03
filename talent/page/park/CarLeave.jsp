
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
"星期日",
"星期一",
"星期二",
"星期三",
"星期四",
"星期五",
"星期六");
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
int CardType=0;
String CarNO = "";
String ComeTime = "";
String LeaveTime = "";
int RecordID = 0;
int timeCount = 0;
float ParkRate = 0;
float money = 0;
int PayStyle = 0;
if(puc!=null){
    CardType = puc.getCardType();
	if(CardType==1) CardTypeName = "学员卡";
	else if(CardType==2) CardTypeName = "教工卡";
	else if(CardType==3) CardTypeName = "公用车卡";
	else if(CardType==4) CardTypeName = "月保卡";
	else if(CardType==5) CardTypeName = "临时卡";
	else if(CardType==6) CardTypeName = "绿卡";
	
	RecordID = puc.getRecordID();
	CarNO = puc.getCarNO();
	ComeTime = puc.getComeTime();
	LeaveTime = puc.getLeaveTime();
	timeCount = puc.getCountTime();
	ParkRate = puc.getParkRate();
	PayStyle = puc.getPayStyle();
	money = puc.getMoney();
	
	if(CarNO==null) CarNO="";
	if(ComeTime==null) ComeTime="";
	if(LeaveTime==null) LeaveTime="";
	
}
int parkhour = timeCount/60;
int parkminute = timeCount%60;
String parkTimeStr = "";           //时长
if(parkhour>0){
	parkTimeStr = parkhour+"小时"+parkminute+"分钟";
}else{
	parkTimeStr = parkminute+"分钟";
}
String PayStyleStr = "";
if(PayStyle==1) PayStyleStr = "刷卡付费";
else if(PayStyle==2) PayStyleStr = "现金付费";
ComeTime = ComeTime.substring(0,16);
LeaveTime = LeaveTime.substring(0,16);

String msg = "";
if(state.equals("chkReadCardok")) msg = "补刷卡成功!";
else if(state.equals("chkReadCardfail")) msg = "当前只有有效学员卡才可以补刷！";
else if(state.equals("leaveoper")) msg = "停车缴费交易结束!";
else if(state.equals("consumefail")&&(CardType==6||CardType==2)) msg = "您的卡余额不足，需要现金支付!";
else if(state.equals("consumesuccess")) msg = "刷卡付费交易成功！";
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
.tds3{
    background-color: #D7E1E3;
	color: #FB6039;
	font-size: 28px;
	font-weight:bolder;
	line-height: 40px;
}
-->
</style>
<body onLoad="start()"  topmargin="0" bottommargin="0" bgcolor="#A0C2FC">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" background="/talent/page/park/image/title.gif">
  <tr>
    <td width="85%" height="80" rowspan="4">&nbsp;</td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0">

<tr align="center" >
   <td height="72">
    <div id="bgclockshade" style="position:absolute;visibility:visible;font-family:Arial;color:FF8888;font-size:52px;top:88px;left:268px"></div>
　　<div id="bgclocknoshade" style="position:absolute;visibility:visible;font-family:Arial;color:DDDfff;font-size:52px;top:86px;left:266px"></div>

    <div id="bgdateshade" style="position:absolute;visibility:visible;font-family:Arial;color:FF8888;font-size:32px;top:98px;left:568px"></div>
	<div id="bgdatenoshade" style="position:absolute;visibility:visible;font-family:Arial;color:DDDfff;font-size:32px;top:96px;left:566px"></div>
   </td>
</tr>
</table>

<table width="100%" border="0" cellspacing="2" cellpadding="0" bgcolor="#A0C2FC">
  <tr>
    <td colspan="4" class="tds3" align="center">
	  <%=msg%>
	</td>
  </tr>
  <tr>
    <td class="tds" colspan="2">&nbsp;<span class="tds1">用户类型:</span> <%=CardTypeName%></td>
    <td class="tds" colspan="2">&nbsp;<span class="tds1">车牌号码:</span> <%=CarNO %></td>
  </tr>
  <tr>
    <td class="tds" colspan="2">&nbsp;<span class="tds1">车辆进入时间:</span> <%=ComeTime %></td>
    <td class="tds" colspan="2">&nbsp;<span class="tds1">车辆离开时间:</span> <%=LeaveTime %></td>
  </tr>
  <tr>
  <td class="tds" height="223" colspan="4">
  <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td width="6%" class="tds1">&nbsp;进入<br>
      &nbsp;车辆<br>&nbsp;抓拍<br>&nbsp;图片</td>
	<td width="43%" class="tds1">&nbsp;
	<img src="/common/page/viewimgdb/viewFromDB.jsp?table=ParkReadCardRecord&pkn=RecordID&field=ComeCarPic&pkv=<%=RecordID %>" height="200" width="400"></td>
	<td width="6%" class="tds1">&nbsp;离开<br>
      &nbsp;车辆<br>&nbsp;抓拍<br>&nbsp;图片</td>
	<td width="45%" class="tds1">&nbsp;
	<img src="/common/page/viewimgdb/viewFromDB.jsp?table=ParkReadCardRecord&pkn=RecordID&field=LeaveCarPic&pkv=<%=RecordID %>" height="200" width="400"></td>
  </tr>
</table>
</td>
  </tr>
  <tr>
    <td width="32%" class="tds"><span class="tds1">&nbsp;停车时长:</span> <%=parkTimeStr %></td>
    <td width="17%" class="tds"><span class="tds1">&nbsp;费率:</span> <%=ParkRate %>元</td>
    <td width="26%" class="tds"><span class="tds1">&nbsp;收费方式:</span> <%=PayStyleStr %></td>
    <td width="25%" class="tds"><span class="tds1">&nbsp;收费金额:</span> <%=money %>元</td>
  </tr>
    <form action="/parkDispatcher" name="form2" method="post">
  <input name="photoStatus" type="hidden" value="1">
  <input name="RecordID2" type="hidden" value="<%=RecordID %>">
    <input name="ConnectCode" type="hidden" value="<%=conCode %>">
  <input name="deviceID" type="hidden" value="<%=deviceID %>">
  <tr >
    <td class="tds2" colspan="4" align="right">&nbsp;<input name="photobutton" type="button" value="抓拍图片" onClick="paizhao()" />&nbsp;</td>
  </tr>
  </form>
</table>
<%if((CardType==5||CardType==6||CardType==2)&&money>0&&(state.equals("leave")||state.equals("chkReadCardfail"))&&PayStyle==2) {%>
<table width="100%" border="0" cellspacing="2" cellpadding="0" bgcolor="#A0C2FC">
<form action="/parkDispatcher" name="form1" method="post">
<input name="RecordID" type="hidden" value="<%=RecordID %>">
<input name="operStatus" type="hidden" value="1">
  <tr>
    <td class="tds2">&nbsp;应收金额: 
      <input type="text" name="ShouldMoney" size="10" value="<%=money%>"/>元</td>
    <td class="tds2">&nbsp;实收金额: 
      <input type="text" name="ArtualMoney" size="10" value="<%=money%>"/>元</td>
	<td class="tds2">&nbsp;备注:
	  <input type="text" name="Remark"/></td>

    <td class="tds2"><%if(CardTypeName.equals("临时卡")){ %>&nbsp;是否补刷:
      <input type="checkbox" name="IsChkRead" value="1" /><%} %></td>
    <td align="center" class="tds2"><input name="button1" type="submit" value="确 定"/></td>

  </tr></form>
</table>

<%}else if(state.equals("chkCard")){ %>
<table width="100%" border="0" cellspacing="2" cellpadding="0" bgcolor="#A0C2FC">
  <tr>
    <td class="tds1">&nbsp;&nbsp;&nbsp;&nbsp;请刷可以补刷的卡...</td>
  </tr>
</table>
<%}else{%>

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

<%} %>
<script language="javascript">

function paizhao(){
	var conCode = '<%=conCode%>';
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
<%//语音提示金额
if(money>0 && !state.equals("chkCard"))
	talent.util.SoundDisplay.playSound(money);
 %>
 <!--embed src="talent/page/park/SoundDisplay.jsp?money=<%=money %>"></embed-->
 <%
 
 //java.util.List list = (java.util.List)request.getAttribute("newCardDataList");
 
  %>
  

</body>