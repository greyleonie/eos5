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


</script>
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
<%
String devCardID = (String)request.getAttribute("devCardID");
String conCode = (String)request.getAttribute("ConnectCode");
String deviceID = (String)request.getAttribute("deviceID");
%>


<body bottommargin="0" bgcolor="#A0C2FC">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" background="/talent/page/park/image/title.gif">
  <tr>
    <td width="85%" height="150" rowspan="4">&nbsp;</td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#A0C2FC">

<tr align="center" >
   <td height="72">
    <div id="bgclockshade" style="position:absolute;visibility:visible;font-family:Arial;color:FF8888;font-size:52px;top:158px;left:268px"></div>
　　<div id="bgclocknoshade" style="position:absolute;visibility:visible;font-family:Arial;color:DDDfff;font-size:52px;top:156px;left:266px"></div>

    <div id="bgdateshade" style="position:absolute;visibility:visible;font-family:Arial;color:FF8888;font-size:32px;top:168px;left:568px"></div>
	<div id="bgdatenoshade" style="position:absolute;visibility:visible;font-family:Arial;color:DDDfff;font-size:32px;top:166px;left:566px"></div>
   </td>
</tr>
</table>
<div style="display:none">
<table width="95%" align=right>
<tbody>
<tr>
	<td align="center"><OBJECT ID="Card Control" WIDTH="300" HEIGHT="240" CLASSID="CLSID:EA4C7953-BDF0-11D7-84AE-444553540000"
	codebase="/talent/page/park/ActiveID.ocx" name="photocontrol"> </OBJECT></td>
</tr>
</tbody>
</table>
</div>
</body>
<script>
     var devCardID='<%=devCardID%>';
     var conCode = <%=conCode%>;
     var deviceID = <%=deviceID%>;
     
function init(){
    clockon();
    paizhao();
    forward();
}

function paizhao(){
    var photostart = photocontrol.PreviewStart(conCode);
    //alert(photostart);
    var count = photocontrol.DriverCount();
    //if(count!=2){
    //	alert("摄像设备安装不完备！");
    //}
    //var driverName = photocontrol.DriverName();
    photocontrol.ViewableWidth = 160;
	photocontrol.ViewableHeight = 120;
	if(photostart){
		photocontrol.SaveJPEG("D:/park.jpg","100");	
	}
	photocontrol.PreviewStop();
}

//function Quit(){
//	photocontrol.PreviewStop();
//}

function forward()
{    

     //alert(cardid);
     var url = "/parkDispatcher?devCardID="+devCardID+"&ConnectCode="+conCode+"&deviceID="+deviceID;
     location.replace(url); 
} 

init()
</script>