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
 <style type="text/css">
<!--
.tds{
    background-color: #D7E1E3;
	color: #FB6039;
	font-size: 48px;
	font-weight:bolder;
	line-height: 50px;
}
-->
</style>
<body onLoad="start()" topmargin="0" bottommargin="0" bgcolor="#A0C2FC">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" background="/talent/page/park/image/title.gif">
  <tr>
    <td width="85%" height="80" rowspan="4">&nbsp;</td>
  </tr>
</table>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#A0C2FC">

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
    <td class="tds" align="center">
	  当前卡为非本校用卡或不合格的卡！
	</td>
  </tr>
</table>
<%@ include file="/talent/page/park/zqs/errorCard.inc" %>
</body>
<script language="javascript">
                       function init()
			{
                         
                        setTimeout("forward();",1*60*1000);
			}
                        function forward()
			{
                        location.replace("/parkDispatcher"); 
             } 
             init();
</script>