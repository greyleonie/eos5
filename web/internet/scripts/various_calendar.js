var gdCtrl = new Object();
var gcGray = "#808080";
var gcToggle = "#ffff00";
var gcBG = "#cccccc";

var gdCurDate = new Date();
var giYear = gdCurDate.getFullYear();
var giMonth = gdCurDate.getMonth()+1;
var giDay = gdCurDate.getDate();

function gmobj1(vwin, mtxt)  /* Get object by object name */
{
  if (vwin.document.getElementById) {
      m=vwin.document.getElementById(mtxt);
  } else if (vwin.document.all) {
      m=vwin.document.all[mtxt];
  } else if (vwin.document.layers) {
      m=vwin.document.layers[mtxt];
  }
  return m;
}

//****************************************************************************
// Param: dateCtrl is the widget into which you want to put the selected date.
//        curWin is the current window object
// i.e.: <input type="text" name="dc" value="20020202" size=8><html:button value="▼" onclick="fPopCalendar('dc');return false" />
//       called in the iframe and referenced by top frame:
//          <input type="text" name="dc" value="20020202" size=8><html:button value="▼" onclick="top.fPopCalendar('dc',window);return false" />
//****************************************************************************
function fPopCalendar(dateCtrlName, curWin){
  if (curWin==null)
    curWin = window;
  var popCtrlName = dateCtrlName;
  popCtrl = gmobj1(curWin, popCtrlName);
  dateCtrl = gmobj1(curWin, dateCtrlName);
  curWin.event.cancelBubble=true;
  gdCtrl = dateCtrl;
  var dateValue = popCtrl.value;
  if (dateValue != "") {
    var selYear = dateValue.substr(0, 4) - 0;
    var selMonth = dateValue.substr(4, 2) - 0;
  	fSetYearMon(selYear,selMonth);
  }else
  	fSetYearMon(giYear, giMonth);
  var point = fGetXY(curWin, popCtrl);
  with (VicPopCal.style) {
  	left = point.x;
    top  = point.y+popCtrl.offsetHeight+1;
    width = VicPopCal.offsetWidth;
    height = VicPopCal.offsetHeight;
    visibility = 'visible';
  }
  fHiddenSelect(document, new Point(0,0));
  VicPopCal.focus();
}

function fSetDate(iYear, iMonth, iDay){
  var str = "";
  str += iYear;
  if (iMonth < 10) { str += "0"; }
  str += iMonth;
  if (iDay < 10 )  { str += "0"; }
  str += iDay;

//  gdCtrl.value = iYear+"-"+iMonth+"-"+iDay; //Here, you could modify the locale as you need !!!!
  gdCtrl.value = str;
  fHideCalendar();
}

function fHideCalendar(){
  VicPopCal.style.visibility = "hidden";

  fShowSelect();
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

function fDrawCal(iYear, iMonth, iCellHeight, iDateTextSize) {
  var WeekDay = new Array("日","一","二","三","四","五","六");
  var styleTD = " bgcolor='"+gcBG+"' bordercolor='"+gcBG+"' valign='middle' align='center' height='"+iCellHeight+"' style='font:bold "+iDateTextSize+" 宋体;";

  with (document) {
	write("<tr>");
	for(i=0; i<7; i++)
		write("<td "+styleTD+"color:#990099' >" + WeekDay[i] + "</td>");
	write("</tr>");

  	for (w = 1; w < 7; w++) {
		write("<tr>");
		for (d = 0; d < 7; d++) {
			write("<td id=calCell "+styleTD+"cursor:hand;' onMouseOver='this.bgColor=gcToggle' onMouseOut='this.bgColor=gcBG' onclick='fSetSelected(this)'>");
			write("<font id=cellText Victor='Liming Weng'> </font>");
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
				color = ((d==0)||(d==6))?"red":"black";
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

function fGetXY(vWin, aTag){
  var oTmp = aTag;
  var pt = new Point(0,0);
  var cWin = vWin;
  do {
  	pt.x += oTmp.offsetLeft;
  	pt.y += oTmp.offsetTop;
  	oTmp = oTmp.offsetParent;
  	
  	if(oTmp.tagName == "BODY" && cWin != cWin.parent) {
        var doc = cWin.parent.document;
        for(var i=0; i<doc.frames.length; i++)
        	if(doc.frames[i]==cWin) {
        	  oTmp = doc.all.tags("iframe")[i];
        	  break;
        	}
		cWin = cWin.parent;
  	}
  } while(oTmp.tagName!="BODY");
  return pt;
}

var hiddenSelectList = new Array();
var hiddenSelectOp = new Array();
var hiddenSelectLength = 0;
function fHiddenSelect(Doc, offPoint){
  var selects=Doc.getElementsByTagName("select");
  for(var i=0; i<selects.length; i++)
    if(Doc==document && (selects[i].name=="tbSelYear" || selects[i].name=="tbSelMonth")) {
      hiddenSelectList[hiddenSelectLength] = selects[i];
      hiddenSelectList[hiddenSelectLength].style.visibility = "visible";
      hiddenSelectOp[hiddenSelectLength] = false;
      hiddenSelectLength++;
	} else if( offPoint.x + selects[i].offsetLeft + selects[i].offsetWidth >= VicPopCal.offsetLeft
            && offPoint.x + selects[i].offsetLeft <= VicPopCal.offsetLeft + VicPopCal.offsetWidth
            && offPoint.y + selects[i].offsetTop + selects[i].offsetHeight >= VicPopCal.offsetTop
            && offPoint.y + selects[i].offsetTop <= VicPopCal.offsetTop + VicPopCal.offsetHeight ) {
      hiddenSelectList[hiddenSelectLength] = selects[i];
      hiddenSelectList[hiddenSelectLength].style.visibility = "hidden";
      hiddenSelectOp[hiddenSelectLength] = true;
      hiddenSelectLength++;
    }

  var iframes=Doc.getElementsByTagName("iframe");
  for(var j=0; j<iframes.length; j++)
    fHiddenSelect(Doc.frames[j].document, new Point(offPoint.x + Doc.all.tags("iframe")[j].offsetLeft, offPoint.y + Doc.all.tags("iframe")[j].offsetTop));
}

function fShowSelect(){
  for(var i=0; i<hiddenSelectLength; i++)
    if(hiddenSelectList[i] != null) {
      hiddenSelectList[i].style.visibility = hiddenSelectOp[i]?"visible":"hidden";
      hiddenSelectOp[i] = null;
      hiddenSelectList[i] = null;
    }
  hiddenSelectList.length = 0;
  hiddenSelectOp.length = 0;
  hiddenSelectLength = 0;
}

var gMonths = new Array("&nbsp;一月","&nbsp;二月","&nbsp;三月","&nbsp;四月","&nbsp;五月","&nbsp;六月","&nbsp;七月","&nbsp;八月","&nbsp;九月","&nbsp;十月","十一月","十二月");

with (document) {
write("<Div id='VicPopCal' onclick='event.cancelBubble=true' style='POSITION:absolute;visibility:hidden;border:2px ridge;width:10;z-index:100;'>");
write("<table border='0' bgcolor='#6699cc'>");
write("<TR>");
write("<td valign='middle' align='center'><input type='button' name='PrevMonth' value='<' style='height:20;width:20;FONT:bold' onClick='fPrevMonth()'>");
write("&nbsp;<SELECT name='tbSelYear' onChange='fUpdateCal(tbSelYear.value, tbSelMonth.value)' Victor='Won'>");
for(i=1910;i<2030;i++)
	write("<OPTION value='"+i+"'>"+i+"年</OPTION>");
write("</SELECT>");
write("&nbsp;<select name='tbSelMonth' onChange='fUpdateCal(tbSelYear.value, tbSelMonth.value)' Victor='Won'>");
for (i=0; i<12; i++)
	write("<option value='"+(i+1)+"'>"+gMonths[i]+"</option>");
write("</SELECT>");
write("&nbsp;<input type='button' name='PrevMonth' value='>' style='height:20;width:20;FONT:bold' onclick='fNextMonth()'>");
write("</td>");
write("</TR><TR>");
write("<td align='center'>");
write("<DIV style='background-color:teal'><table width='100%' border='0' cellpadding='2'>");
fDrawCal(giYear, giMonth, 12, 12);
write("</table></DIV>");
write("</td>");
write("</TR><TR><TD align='center'>");
write("<B style='cursor:hand; font: bold 14 宋体' onclick='fSetDate(giYear,giMonth,giDay)' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=0'>今天："+giYear+"年"+giMonth+"月"+giDay+"日</B>");
write("</TD></TR>");
write("</TABLE></Div>");
write("<SCRIPT event=onclick() for=document>fHideCalendar()</SCRIPT>");
}
