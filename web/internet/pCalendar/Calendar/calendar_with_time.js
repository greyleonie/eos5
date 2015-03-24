var gdCtrl = new Object();
var goSelectTag = new Array();
var gcGray = "#808080";
var gcToggle = "#ffff00";
var gcBG = "#99CCFF";
var previousObject = null;

var gdCurDate = new Date();
var giYear = gdCurDate.getFullYear();
var giMonth = gdCurDate.getMonth()+1;
var giDay = gdCurDate.getDate();

var gCalMode = "";
var gCalDefDate = "";

var CAL_MODE_NOBLANK = "2";

var prevHours;
var nextHours;
var prevMinute;
var nextMinutes;
var today=[];

function fSetDate(iYear, iMonth, iDay){
  //VicPopCal.style.visibility = "hidden";
  if ((iYear == 0) && (iMonth == 0) && (iDay == 0)){
  	gdCtrl.value = "";
  }else{
  	iMonth = iMonth + 100 + "";
  	iMonth = iMonth.substring(1);
  	iDay   = iDay + 100 + "";
  	iDay   = iDay.substring(1);
  	gdCtrl.value = iYear+"-"+iMonth+"-"+iDay;
  }
  
  for (i in goSelectTag)
  	goSelectTag[i].style.visibility = "visible";
  goSelectTag.length = 0;
  
  window.returnValue=gdCtrl.value+" "+TimeBody.rows[0].children[2].innerText;
  window.close();
}

function HiddenDiv()
{
	var i;
  VicPopCal.style.visibility = "hidden";
  for (i in goSelectTag)
  	goSelectTag[i].style.visibility = "visible";
  goSelectTag.length = 0;

}
function fSetSelected(aCell){
  var iOffset = 0;
  var iYear = parseInt(tbSelYear.value);
  var iMonth = parseInt(tbSelMonth.value);
  
  aCell.bgColor = gcBG;
  with (aCell.children["cellText"]){
  	var iDay = parseInt(innerText);
  	if (color==gcGray)
		iOffset = (Victor<10)?-1:1;

	/*** below temp patch by maxiang ***/
	if( color == gcGray ){
		iOffset = (iDay < 15 )?1:-1;
	}
	/*** above temp patch by maxiang ***/

	iMonth += iOffset;
	if (iMonth<1) {
		iYear--;
		iMonth = 12;
	}else if (iMonth>12){
		iYear++;
		iMonth = 1;
	}
  }
  fSetDate(iYear, iMonth, iDay);
}

function Point(iX, iY){
	this.x = iX;
	this.y = iY;
}

function fBuildCal(iYear, iMonth) {
  var aMonth=new Array();
  for(i=1;i<7;i++)
  	aMonth[i]=new Array(i);
  
  var dCalDate=new Date(iYear, iMonth-1, 1);
  var iDayOfFirst=dCalDate.getDay();
  var iDaysInMonth=new Date(iYear, iMonth, 0).getDate();
  var iOffsetLast=new Date(iYear, iMonth-1, 0).getDate()-iDayOfFirst+1;
  var iDate = 1;
  var iNext = 1;

  for (d = 0; d < 7; d++)
	aMonth[1][d] = (d<iDayOfFirst)?-(iOffsetLast+d):iDate++;
  for (w = 2; w < 7; w++)
  	for (d = 0; d < 7; d++)
		aMonth[w][d] = (iDate<=iDaysInMonth)?iDate++:-(iNext++);
  return aMonth;
}

function fDrawCal(iYear, iMonth, iCellHeight, sDateTextSize) {
  var WeekDay = new Array("日","一","二","三","四","五","六");
  var styleTD = " bgcolor='"+gcBG+"' bordercolor='"+gcBG+"' valign='middle' align='center' height='"+iCellHeight+"' style='font-size:12px; ";

  with (document) {
	write("<tr>");
	for(i=0; i<7; i++)
		write("<td "+styleTD+" color:#990099' >" + WeekDay[i] + "</td>");
	write("</tr>");

  	for (w = 1; w < 7; w++) {
		write("<tr>");
		for (d = 0; d < 7; d++) {
			write("<td id=calCell "+styleTD+"cursor:hand;' onMouseOver='this.bgColor=gcToggle' onMouseOut='this.bgColor=gcBG' onclick='fSetSelected(this)'>");
			write("<font id=cellText ><b> </b></font>");
			write("</td>")
		}
		write("</tr>");
	}
  }
}

function fUpdateCal(iYear, iMonth) {
  myMonth = fBuildCal(iYear, iMonth);
  var i = 0;
  for (w = 0; w < 6; w++)
	for (d = 0; d < 7; d++)
		with (cellText[(7*w)+d]) {
			Victor = i++;
			if (myMonth[w+1][d]<0) {
				color = gcGray;
				innerText = -myMonth[w+1][d];
			}else{
				// Modified by maxiang for we need 
				// Saturday displayed in blue font color.
				//color = ((d==0)||(d==6))?"red":"black";
				if( d == 0 ){
					color = "red";
				}else if( d == 6 ){
					color = "blue";
				}else{
					color = "black";
				}
				// End of above maxiang
				innerText = myMonth[w+1][d];
			}
		}
}

function fSetYearMon(iYear, iMon){
  tbSelMonth.options[iMon-1].selected = true;
  for (i = 0; i < tbSelYear.length; i++)
	if (tbSelYear.options[i].value == iYear)
		tbSelYear.options[i].selected = true;
  fUpdateCal(iYear, iMon);
}

function fPrevMonth(){
  var iMon = tbSelMonth.value;
  var iYear = tbSelYear.value;
  
  if (--iMon<1) {
	  iMon = 12;
	  iYear--;
  }
  
  fSetYearMon(iYear, iMon);
}

function fNextMonth(){
  var iMon = tbSelMonth.value;
  var iYear = tbSelYear.value;
  
  if (++iMon>12) {
	  iMon = 1;
	  iYear++;
  }
  
  fSetYearMon(iYear, iMon);
}

function fToggleTags(){
  with (document.all.tags("SELECT")){
 	for (i=0; i<length; i++)
 		if ((item(i).Victor!="Won")&&fTagInBound(item(i))){
 			item(i).style.visibility = "hidden";
 			goSelectTag[goSelectTag.length] = item(i);
 		}
  }
}

function fTagInBound(aTag){
  with (VicPopCal.style){
  	var l = parseInt(left);
  	var t = parseInt(top);
  	var r = l+parseInt(width);
  	var b = t+parseInt(height);
	var ptLT = fGetXY(aTag);
	return !((ptLT.x>r)||(ptLT.x+aTag.offsetWidth<l)||(ptLT.y>b)||(ptLT.y+aTag.offsetHeight<t));
  }
}

function fGetXY(aTag){
  var oTmp = aTag;
  var pt = new Point(0,0);
  do {
  	pt.x += oTmp.offsetLeft;
  	pt.y += oTmp.offsetTop;
  	oTmp = oTmp.offsetParent;
  } while(oTmp.tagName!="BODY");
  return pt;
}

// Main: popCtrl is the widget beyond which you want this calendar to appear;
//       dateCtrl is the widget into which you want to put the selected date.
// i.e.: <input type="text" name="dc" style="text-align:center" readonly><INPUT type="button" value="V" onclick="fPopCalendar(dc,dc);return false">
function fPopCalendar(popCtrl, dateCtrl, defDate,mode){
  gCalMode = mode;
  gCalDefDate = defDate;
	
  if (popCtrl == previousObject){
	  	if (VicPopCal.style.visibility == "visible"){
  		//HiddenDiv();
  		return true;
  	}  	
  }
  
  previousObject = popCtrl;
  gdCtrl = dateCtrl;
  fSetYearMon(giYear, giMonth); 
  var point = fGetXY(popCtrl);

	if( gCalMode == CAL_MODE_NOBLANK ){
		document.all.CAL_B_BLANK.style.visibility = "hidden";	
	}else{
		document.all.CAL_B_BLANK.style.visibility = "visible";
	}	

  with (VicPopCal.style) {
  	left = point.x;
	top  = point.y+popCtrl.offsetHeight;
	width = VicPopCal.offsetWidth;
	height = VicPopCal.offsetHeight;
	fToggleTags(point); 	
	visibility = 'visible';
  }
  
  addTimeBoard();	//加载时间板
  
  setDefaultTime();	//设置当前时间
  
  if(!(gCalDefDate==undefined) && !(gCalDefDate=="")){
	  var Datereg=/^\d{1,4}-\d{1,2}-\d{1,2}$/
	  var DateTimereg=/^(\d{1,4})-(\d{1,2})-(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/	
		
	  if(gCalDefDate.match(Datereg)) 
		gCalDefDate=gCalDefDate+" "+today[3]+":"+today[4]+":"+"00";
				
	  var strDateTime=gCalDefDate.match(DateTimereg);
	  today[0]=strDateTime[1];
      today[1]=strDateTime[2];
      today[2]=strDateTime[3];
      today[3]=strDateTime[4];
      today[4]=strDateTime[5];
  }
  
  var timeField=TimeBody.rows[0].children[2];
  timeField.innerText =formatTime(today[3])+":"+formatTime(today[4])+":"+"00";//显示初始时间
}

var gMonths = new Array("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月");

with (document) {
write("<Div id='VicPopCal' style='OVERFLOW:hidden;POSITION:absolute;VISIBILITY:hidden;border:0px ridge;width:100%;height:100%;top:0;left:0;z-index:100;overflow:hidden'>");
write("<table border='0' bgcolor='#0094BD'>");
write("<TR>");
write("<td valign='middle' align='center'><input class=graygobtn type='button' name='PrevMonth' value='<' style='height:20;width:20;FONT:bold' onClick='fPrevMonth()'>");
write("&nbsp;<SELECT class=graygobtn name='tbSelYear' onChange='fUpdateCal(tbSelYear.value, tbSelMonth.value)' Victor='Won'>");
/*for(i=1920;i<2016;i++) 2004-10-28 HB*/
for(i=1930;i<2060;i++)
	write("<OPTION value='"+i+"'>"+i+"年</OPTION>");
write("</SELECT>");
write("&nbsp;<select class=graygobtn name='tbSelMonth' onChange='fUpdateCal(tbSelYear.value, tbSelMonth.value)' Victor='Won'>");
for (i=0; i<12; i++)
	write("<option value='"+(i+1)+"'>"+gMonths[i]+"</option>");
write("</SELECT>");
write("&nbsp;<input type='button' class=graygobtn name='PrevMonth' value='>' style='height:20;width:20;FONT:bold' onclick='fNextMonth()'>");
write("</td>");
write("</TR><TR>");
write("<td align='center'>");
write("<DIV style='background-color:#000066'><table width='100%' border='0'>");
fDrawCal(giYear, giMonth, 8, '12');
write("</table></DIV>");
write("</td>");
write("</TR><TR><TD align='center'>");
write("<TABLE width='100%' id='TimeBody' align='center'>");
write("</TABLE>");
write("</TD></TR><TR><TD align='center'>");
write("<TABLE width='100%' align='center'><TR><TD align='center'>");
write("<B ID=\"CAL_B_BLANK\" style='color:"+gcBG+"; visibility:visible; cursor:hand; font-size:12px' onclick='fSetDate(0,0,0)' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=gcBG'>清空</B>");
write("</td><td algin='center'>");
write("<B style='color:"+gcBG+";cursor:hand; font-size:12px' onclick='fSetDate(giYear,giMonth,giDay)' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=gcBG'>选择: "+giYear+"/"+giMonth+"/"+giDay+"</B>");
write("</TD></TR></TABLE>");
write("</TD></TR>");
write("</TABLE></Div>");
}

/*********** Time Body ***************/
function addTimeBoard(){
   trRow = TimeBody.insertRow(0);
   tbCell=trRow.insertCell(0);   
   var timeField=TimeBody.rows[0].children[2];
   prevHours = insertTbCell(trRow,0,"-","center");
   prevHours.title="小时调整 快捷键:Home";
   prevHours.onmousedown=function(){
        today[3]--;
        if(today[3]==-1) today[3]=23;
        timeField.innerText=formatTime(today[3])+":"+formatTime(today[4])+":"+"00";
    }
   tbCell=trRow.insertCell(1);
   nextHours = insertTbCell(trRow,1,"+","center");
   nextHours.title="小时调整 快捷键:End";
   nextHours.onmousedown=function(){
        today[3]++;
        if(today[3]==24) today[3]=0;
        timeField.innerText=formatTime(today[3])+":"+formatTime(today[4])+":"+"00";
    }
   tbCell=trRow.insertCell(2);
   tbCell.colSpan=3;
   tbCell.bgColor=gcBG;
   tbCell.align="center";
   tbCell.style.cssText = "cursor:default;font-size:12px;";
   timeField=tbCell;
   tbCell=trRow.insertCell(3);
   prevMinutes = insertTbCell(trRow,3,"-","center");
   prevMinutes.title="分钟调整 快捷键:PageUp";
   prevMinutes.onmousedown=function(){
        today[4]--;
        if(today[4]==-1) today[4]=59;
        timeField.innerText=formatTime(today[3])+":"+formatTime(today[4])+":"+"00";
    }
   tbCell=trRow.insertCell(4);
   nextMinutes = insertTbCell(trRow,4,"+","center");
   nextMinutes.title="分钟调整 快捷键:PageDown";
   nextMinutes.onmousedown=function(){
        today[4]++;
        if(today[4]==60) today[4]=0;
        timeField.innerText=formatTime(today[3])+":"+formatTime(today[4])+":"+"00";
    }
}

/************** 加入功能按钮公共样式 *********************/
function insertTbCell(trRow,cellIndex,TXT,trAlign,tbColSpan){
   var tbCell=trRow.insertCell(cellIndex);
   if(tbColSpan!=undefined) tbCell.colSpan=tbColSpan;

   var btnCell=document.createElement("button");
   tbCell.insertAdjacentElement("beforeEnd",btnCell);
   btnCell.value=TXT;
   btnCell.style.cssText="width:20;height:20;font:bold";
   //btnCell.onmouseover=function(){
   //btnCell.style.cssText="width:20;height:20;border-top-color:#FFFFFF;borer-right-color:#333333; outset;background-color:#F0F0F0;";
   //}
   //btnCell.onmouseout=function(){
   // btnCell.style.cssText="width:20;height:20;border-top-color:#FFFFFF;borer-right-color:#333333;outset;background-color:buttonface;";
   //}
   //btnCell.onmousedown=function(){
   // btnCell.style.cssText="width:100%;border:1 inset;background-color:#F0F0F0;";
   //}
   //btnCell.onmouseup=function(){
   // btnCell.style.cssText="width:20;height:20;border-top-color:#FFFFFF; outset;background-color:#F0F0F0;";
   //}
   btnCell.onclick=function(){
    btnCell.blur();
   }
   return btnCell;
}

/************** 格式化时间 *********************/
function formatTime(str) {
  str = ("00"+str);
  return str.substr(str.length-2);
 }

/************** 获取初始时间 *********************/
function setDefaultTime(){
   var dftDate=new Date();
   today[0]=dftDate.getYear();
   today[1]=dftDate.getMonth()+1;
   today[2]=dftDate.getDate();
   today[3]=dftDate.getHours();
   today[4]=dftDate.getMinutes();
  }