<%@taglib uri="/WEB-INF/i18n.tld" prefix="i18n" %>
<%@page import="com.primeton.eos.i18n.WebPageMessage"%>
<i18n:bundle baseName="message"/>
<HTML>
<HEAD>
<TITLE><i18n:message key="Calendar_jsp.Titel"/></TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<META NAME="Author" CONTENT="liubin">
<style type="text/css">
*{
font-family:tahoma;
font-size:12px;
color:#000000;
}
.TrOut{
background-color:#FFEE99;
height:21;
}
.TdOver{
background-color:#EFEFEF;
border:1 solid #808080;
}
.TdOut{
background-color:#FFFFFF;
border:1 solid #FFFFFF;
}
.TdToday{
background-color:#FFEE99;
border:1 solid #808080;
}
.button{
background:url("img/button_bg.gif");
border:1px solid #89570E;
letter-spacing:2px;
padding-left:5;
padding-right:5;
}
</style>
<script language="JScript">
var argu=window.dialogArguments;
var d=argu[0] ? new Date(argu[0]):new Date,mask=argu[1],toMax=argu[2],tt=d.getDate();
var sday,srow=[];

function overDay(p) {
	if (p.innerText!=" ")
		p.className="TdOver";
}
function outDay(p) {
	if (p.innerText!=" ")
		p.className=p.innerText==tt?"TdToday":"TdOut";
}
function GetDateStr(y,m){
	var DayArray=[];
	for(var i=0;i<42;i++)DayArray[i]="&nbsp;";
	var tday1=new Date(y,m,0).getDate();
	var tday2=new Date(y,m-1,1).getDay();
	for(var i=0;i<tday1;i++)DayArray[i+tday2]=i+1;
	return DayArray;
}
function GetTableStr(y,m){
	var DateArray=["<i18n:message key="Calendar_jsp.Sunday"/>","<i18n:message key="Calendar_jsp.Monday"/>","<i18n:message key="Calendar_jsp.Tuesday"/>","<i18n:message key="Calendar_jsp.Wednesday"/>","<i18n:message key="Calendar_jsp.Thursday"/>","<i18n:message key="Calendar_jsp.Friday"/>","<i18n:message key="Calendar_jsp.Saturday"/>"];
	var DStr="<table id=\"mainTable\" style='width:160;border:1px solid #808080' border='0' cellpadding='0' cellspacing='0'><tr><td colspan='7' class='TrOut'><table width='100%' height='100%'border='0' cellpadding='0' cellspacing='0'><tr align='center'><td width='20' onclick='JumpToRun(\"b\")' onmouseover='this.style.color=\"#ff9900\"' onmouseout='this.style.color=\"\"'><</td><td><SELECT id='select1' onchange='RewriteTableStr(Number(this.value),Number(select2.value))'>";
	var strArr=[];
	for (var i=2010,j=0;i>1940;i--,j++) {
		strArr[j]="<option value='"+i+"' "+(i==y?"selected":"")+">"+i+"<i18n:message key="Calendar_jsp.Year"/>"+"</option>";
	}
	DStr+=strArr.join("")+"</SELECT></td><td><select id='select2' onchange='RewriteTableStr(Number(select1.value),Number(this.value))'>";
	var strArr=[];
	for (var i=1,j=0;i<13;i++,j++) {
		strArr[j]="<option value='"+i+"' "+(i==m?"selected":"")+">"+i+"<i18n:message key="Calendar_jsp.Month"/>"+"</option>";
	}
	DStr+=strArr.join("")+"</SELECT></td><td width='20' onclick='JumpToRun(\"n\")' onmouseover='this.style.color=\"#ff9900\"' onmouseout='this.style.color=\"\"'>></td></tr></table></td></tr><tr align='center'>";
	for(var i=0;i<7;i++)
		DStr+="<td class='TrOut' style='border-bottom:1 solid #808080;'>"+DateArray[i]+"</td>";
	DStr+="</tr>";
	var arr=GetDateStr(y,m);
	for(var i=0;i<6;i++){
		DStr+="<tr align='center'>";
		for(var j=0;j<7;j++){
			var k=i*7+j;
			if (tt==arr[k]) {
				var CS="TdToday";
				srow=[i,j];
			} else {
				var CS="TdOut";
			}
			DStr+="<td id='TD' class='"+CS+"' onmouseover='overDay(this)' onmouseout='outDay(this)' onclick='setDay(this)' ondblclick=commit()>"+arr[k]+"</td>";
		}
		DStr+="</tr>";
	}
	if ((/[h]+/).exec(mask)) {
		DStr+="<tr class='TrOut'><TD colspan=7 align=center style='border-top:1 solid #808080;'><select id=select3>";
		for (var i=0;i<24;i++) {
			DStr+="<option value='"+i+"' "+(i==d.getHours() ? "selected":"")+">"+i+"</option>";
		}
		if (/[m]+/.exec(mask)) {
			DStr+="</select>"+"<i18n:message key="Calendar_jsp.Hour"/>"+"<select id=select4>";
			for (var i=0;i<60;i++) {
				DStr+="<option value='"+i+"' "+(i==d.getMinutes() ? "selected":"")+">"+i+"</option>";
			}
			if (/[s]+/.exec(mask)) {
				DStr+="</select>"+"<i18n:message key="Calendar_jsp.Minute"/>"+"<select id=select5>";
				for (var i=0;i<60;i++) {
					DStr+="<option value='"+i+"' "+(i==d.getSeconds() ? "selected":"")+">"+i+"</option>";
				}
			}
		}
		DStr+="</select></TD></tr>";
	}
	DStr+="</table><DIV style=\"padding:5\" align=center><INPUT type=\"button\" class=button onclick=\"commit()\" value=\""+"<i18n:message key="Calendar_jsp.OK"/>"+"\"> <INPUT type=\"button\" class=button onclick=\"window.close()\" value=\""+"<i18n:message key="Calendar_jsp.Cancel"/>"+"\"> <INPUT type=\"button\" class=button onclick=\"clearData()\" value=\""+"<i18n:message key="Calendar_jsp.Clean"/>"+"\"></DIV>";
	return DStr;
}
function RewriteTableStr(y,m){
	var maxDay=getMonthLen(y)[m-1];
	if (tt>maxDay)
		tt=maxDay;
	var TArray=GetDateStr(y,m);
	var len=TArray.length;
	for(var i=0;i<len;i++){
		var td=TD[i];
		td.innerHTML=TArray[i];
		td.className="TdOut";
		if(tt==TArray[i])
		{
			sday=td;
			td.className="TdToday";
		}
	}
}
function JumpToRun(action){
	var YearNO=Number(select1.value);
	var MonthNO=Number(select2.value);
	if(action=="b"){
		if(MonthNO=="1"){
			MonthNO=13;
			YearNO=YearNO-1;
		}
		select1.value=YearNO;
		select2.value=MonthNO-1;
		RewriteTableStr(YearNO,MonthNO-1);
	}
	if(action=="n"){
		if(MonthNO=="12"){
			MonthNO=0;
			YearNO=YearNO+1;
		}
		select1.value=YearNO;
		select2.value=MonthNO+1;
		RewriteTableStr(YearNO,MonthNO+1);
	}
}
function setDay(p){
	if(p.innerText!=" ") {
		tt=p.innerText;
		p.className="TdToday";
		sday.className="TdOut";
		sday=p;
	}
}
function commit() {
	var tmp = "";
	var y=Number(select1.value);
	tmp=y;
	var m=Number(select2.value);
	var day=toMax ? getMonthLen(y)[m-1]:tt;
	var dayNum = Number(day);
	if(m <=9){
	  tmp = tmp + "0" + m;
	}else {
	  tmp = tmp + "" + m;
	}
	if(day <=9){
	  tmp = tmp + "0" + dayNum;
	}else {
	  tmp = tmp + "" + dayNum;
	}
	//var tmp=y+""+m+""+(toMax ? getMonthLen(y)[m-1]:tt);
	if (typeof select3!="undefined")
		tmp+=" "+select3.value;
	if (typeof select4!="undefined")
		tmp+=":"+select4.value;
	if (typeof select5!="undefined")
		tmp+=":"+select5.value;
	window.returnValue=tmp;
	window.close();
}
function checkLeapYear(p) {
	return ((p%4==0 && p%100 != 0) || p%400==0) ? 29:28;
}
function getMonthLen(p) {
	return [31,checkLeapYear(p),31,30,31,30,31,31,30,31,30,31];
}
function clearData(){
	window.returnValue="#";
	window.close();
}
</script>
</HEAD>
<BODY oncontextmenu='return false' onselectstart='return false' style='cursor:default;overflow:hidden;padding:10px'>
<SCRIPT LANGUAGE="JavaScript">
<!--
var year=d.getYear();
if (year>2100)
	year=2100;
else if (year<1941)
	year=1941;
document.write(GetTableStr(year,d.getMonth()+1));
sday=document.getElementById("mainTable").rows[srow[0]+2].cells[srow[1]];
//-->
</SCRIPT>
</BODY>
</HTML>
