<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page  import="java.util.*,org.w3c.dom.*"%>
<%@ page import="com.talent.hibernate.Eosoperator"%>
<title>中共广州市委党校</title>
<%
 String path=request.getContextPath();
%>
<link href="<%=path%>/css/css.css" rel="stylesheet" type="text/css" />
<%
   //com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);
   int toyear = 0;
   int tomonth = 0;
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    Calendar calendar = Calendar.getInstance();
    if(!"null".equalsIgnoreCase(year)&&!"null".equalsIgnoreCase(month)&&!"".equalsIgnoreCase(year)&&!"".equalsIgnoreCase(month)&&year!=null&&month!=null)
    {   calendar.set(Integer.parseInt(year),Integer.parseInt(month)-1,1);
	   toyear = new Integer(year).intValue();
	   tomonth = new Integer(month).intValue()-1;
    } else {
	   calendar.set(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH),1);//当前月
	   toyear = calendar.get(Calendar.YEAR);
	   tomonth = calendar.get(Calendar.MONTH);
	}
   int listindex=0;
   Eosoperator op = (Eosoperator)session.getAttribute("user");
    String userID = op.getUserId();

//System.out.println("***************************************************ARRANGE_NAME:"+ARRANGE_NAME);
System.out.println("***************************************************userID:"+userID);
%>

<head>
<SCRIPT LANGUAGE="JavaScript">
var lastobj;
var toyear = <%=toyear%>;
var cellcontent = new Array();
 <%
    org.w3c.dom.Element dom = (org.w3c.dom.Element) request.getAttribute("courseDom");
    NodeList   all = dom.getElementsByTagName("day");
    for(int i=0;i<all.getLength();i++){
     out.print("cellcontent[" + listindex++ + "] = \"\" + ");
     int itemcount=0;
    Node  mm = all.item(i);
    NodeList t = mm.getChildNodes() ;

    if(t.getLength()!=0);{
       for(int j= 0 ;j<t.getLength();j++){
             //取第一个实体的记录;
             NodeList   ca =  t.item(j).getChildNodes();
             String classDate="";//课程日期;
             String classTime="";//上课时间;
             String classNoon="";//午别;
             String courseTitle="";//课程题目;
             String courseRoom="";//课程地点;
             String courseName=""; //班级
           for(int k = 0 ;k<ca.getLength();k++){
                org.w3c.dom.Node tmpNode = ca.item(k);
                if(ca.item(k).getNodeName().equals("classDate"))
                classDate=ca.item(k).getFirstChild().getNodeValue();
                if(ca.item(k).getNodeName().equals("classTime"))
                classTime=ca.item(k).getFirstChild().getNodeValue().substring(0,6);
                if(ca.item(k).getNodeName().equals("classNoon"))
                classNoon=ca.item(k).getFirstChild().getNodeValue();
                if(ca.item(k).getNodeName().equals("courseTitle"))
                courseTitle=ca.item(k).getFirstChild().getNodeValue();
                if(ca.item(k).getNodeName().equals("courseRoom"))
                courseRoom=ca.item(k).getFirstChild().getNodeValue();
                
               
             }
///
      //String temp1[] = work_time.split(" ");
      //String tempStr=temp1[1].substring(0,5);
	    //String tmpTitle=(courseTitle.length()>6) ?((String)(courseTitle).substring(0,6)+".."): (courseTitle);
	
      //out.print("\"" + "<a title='查看日程安排' href='oa.prPersonOffice.pr_ToViewCalendarArrange.do?fid=" + pid + "'>" + "\" + ");
	    out.print("\""+(itemcount+1)+"."+classNoon+"&nbsp;"+classTime+"</br>&nbsp;&nbsp;"+courseRoom+"</br>&nbsp;&nbsp;"+courseTitle+"</br>\" +");
	    itemcount++;
	    if (itemcount>1)	break;
	    //else {
		    //out.print("\"<div align='right'><a title='查看当天所有日程安排' size='2' href=javascript:getDate3('"+createDate+"')>更多..</a></div>\" + ");
		    //break;
      //}           
       }
      }
  out.println("\"\";");

   
    }
     

 %>
 var months = new Array("1", "2", "3", "4", "5", "6", "7", "8", "9","10", "11", "12");

 var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31,30, 31, 30, 31);
 var days = new Array("周日", "周一", "周二","周三", "周四", "周五", "周六");
 function getDays(month, year) {
	 if (1 == month)
		 return ((0 == year % 4) && (0 != (year % 100))) || (0 == year % 400) ? 29 : 28;
	 else
	 return daysInMonth[month];
 }
 function getToday() {
	 this.now = new Date(<%=calendar.get(Calendar.YEAR)%>,<%=calendar.get(Calendar.MONTH)%>,<%=calendar.get(Calendar.DATE)%>,<%=calendar.get(Calendar.HOUR)%>,<%=calendar.get(Calendar.MINUTE)%>,<%=calendar.get(Calendar.SECOND)%>);
	 this.year = this.now.getFullYear();
	 this.month = this.now.getMonth();
	 this.day = this.now.getDate();
	 this.hour = this.now.getHours();
	 this.minute = this.now.getMinutes();
	 this.second = this.now.getSeconds();
}

today = new getToday();
function newCalendar() {
	var datestr = new Date();
	todaydate = datestr.getFullYear() + "-" + addZero(datestr.getMonth()+1) + "-" + addZero(datestr.getDate());
	//var yearselect = document.forms[0].elements("year");
	var parseYear = document.forms[0].elements("year").value;
	var newCal = new Date(parseYear,document.forms[0].elements("month").value, 1);
	var day = -1;
	var startDay = newCal.getDay();
	var daily = 0;
	if ((today.year == newCal.getFullYear()) && (today.month == newCal.getMonth()))
		day = today.day;
	var tableCal = document.all.calendar.tBodies.dayList;
	var intDaysInMonth = getDays(newCal.getMonth(), newCal.getFullYear());
	for (var intWeek = 0; intWeek < tableCal.rows.length;intWeek++){
		for (var intDay = 0;intDay < tableCal.rows[intWeek].cells.length;intDay++) {
		var cell = tableCal.rows[intWeek].cells[intDay];
		if ((intDay == startDay) && (0 == daily))
			daily = 1;
		nowdate = today.year + "-" + addZero(today.month+1) + "-" + addZero(daily);
		var divbstr = (todaydate == nowdate) ? "<font color='red' size='2px'><strong>" : "<font color='#339933' size='2px'><strong>";
		var divestr = (todaydate == nowdate) ? "</strong></font>" : "</strong></font>";
		var content = "";
		if (cellcontent[daily-1] == undefined) content=""
		else content = cellcontent[daily-1];
		if ((daily > 0) && (daily <= intDaysInMonth)){
			cell.id = today.year + "-" + addZero(today.month+1) + "-" + addZero(daily);
			cell.innerText = daily;
			cell.innerHTML =
			"<table width='99%' border='0' cellspacing='1' cellpadding='1'>" +
			"<tr>"+
			"<td valign='top' height='1px' bgcolor='#EBEBEB' align='right' style='cursor:hand'>" +
			"<a title='新增日程安排' href=\"javascript:getDate2('"+ cell.id +"')\">" +
			divbstr + cell.innerText + divestr +
			"</a>" +
			"</td></tr>"+
			"<tr class='td2'>"+
			"<td align='left' valign='top' height='150px' bgcolor='#E8F5FF' style='cursor:hand;' onClick=\"changeBgColor(this);\">" + 
			content +
			"</td>" +
			"</tr>" +
			"</table>";
			daily++;
		}
		else
			cell.innerText = " ";
	}
	}
}
function addZero(val){
	if(parseInt(val)<10) val="0"+val;
	return val;
}
function getDate(cell) {
	var sDate;
	var celltext="";
	try{
		celltext = cell.innerText;
	} catch (e){return;}

	if ("" != celltext.replace(/(^\s*)|(\s*$)/g, "")){
		sDate = cell.id;
		document.all.ret.value = sDate;
		var form = document.forms[1];
		form.elements("listDate").value = sDate;
		form.submit();
	}
		else document.all.ret.value='';
}

function changeCalendar(){
		var form = document.forms[0];
		form.submit();
}

function changeBgColor(obj) {
   if (lastobj != undefined) {
      lastobj.style.backgroundColor = '#E8F5FF';
      lastobj.parentNode.parentNode.firstChild.firstChild.style.backgroundColor = '#EBEBEB';
      obj.style.backgroundColor = '#FFFFCC';
      obj.parentNode.parentNode.firstChild.firstChild.style.backgroundColor = '#D4D4D4';
      lastobj = obj;
   } else {
      lastobj = obj;
      obj.style.backgroundColor = '#FFFFCC';
      obj.parentNode.parentNode.firstChild.firstChild.style.backgroundColor = '#D4D4D4';
   }
}
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
function view(month){
	var form0 = document.forms[0];
  form0.elements("month").value=month;
	form0.submit();
}
function nextYear() {
   toyear = toyear + 1;
   document.getElementById("year").value = toyear;
   document.getElementById("nextyear").innerText = (toyear+1);
   document.getElementById("lastyear").innerText = (toyear-1);
}
function lastYear() {
   toyear = toyear - 1;
   document.getElementById("year").value = toyear;
   document.getElementById("nextyear").innerText = (toyear+1);
   document.getElementById("lastyear").innerText = (toyear-1);
}
//-->
</SCRIPT>
<style>
<!--
.td1 {
	background-color: #FFFFFF;
	font-size: 12px;
	line-height: 22px;
	color: #000000;
}
.td2 {
	background-color: #E8F5FF;
	font-size: 12px;
	line-height: 22px;
	color: #000000;
}
.text_month {
	font-size: 16px;
	color: #000000;
	line-height: 18px;
	font-weight: bold;
}
.text_tomonth {
	font-size: 16px;
	color: #FF6600;
	line-height: 18px;
	font-weight: bold;
}
.text_year {
	font-size: 18px;
	color: #FF6600;
	line-height: 18px;
	font-weight: bold;
}
.text_week {
	font-size: 13px;
	color: #4A82D1;
	line-height: 15px;
	font-weight: bold;
}
-->
</style>
</head>
<BODY ONLOAD="newCalendar();" OnUnload="window.returnValue = document.all.ret.value;">
<form action="couseView.do?action=currentCourse" method="post">
<input type="hidden" name="date" id="date" value=""/>
<input type="hidden" name="year" id="year" value="<%=toyear%>"/>
<input type="hidden" name="month" id="month" value="<%=tomonth%>"/>
<input type="hidden" name="ret">
<TABLE align="center" width='100%' border="0" cellpadding="0" cellspacing="0" ID="calendar" class="MENU_line">
    <THEAD>
    <TR>
      <TD COLSPAN=7>
  	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="MENU_line">
  <tr>
    <td align="right" class="text">
<table id=tblHeader align="center" width="96%" border="0" cellspacing="0" cellpadding="0" class="Standard-LabelTableTdStyle">
  <tr height="20" class="td1">
    <td width="6%" align="center" valign="top" nowrap>
    <IMG src="/image/_calprevyr.gif" border="0" onclick="lastYear()" style="cursor: hand"> <a id="lastyear" style="font-size:18px;color:#FF6600;line-height:18px;font-weight:bold;" title="上一年度" href="javascript:lastYear();"><%=toyear-1%></a></td>
    <td width="4%" align="center"  valign="bottom" nowrap background="/images/functionframe/active_background.gif" bgcolor="" id=01>
    <a href="javascript:view(1)"><div class="<%=tomonth==0?"text_tomonth":"text_month"%>">1月</div></a></td>
    <td width="4%" align="center" valign="bottom" nowrap background="/images/functionframe/active_background.gif" id=02>
    <a href="javascript:view(2)"><div class="<%=tomonth==1?"text_tomonth":"text_month"%>">2月</div></a></td>
    <td width="4%" align="center" valign="bottom" nowrap background="/images/functionframe/active_background.gif" id=03>
    <a href="javascript:view(3)"><div class="<%=tomonth==2?"text_tomonth":"text_month"%>">3月</div></a></td>
    <td width="4%" align="center" valign="bottom" nowrap background="/images/functionframe/active_background.gif" id=04>
    <a href="javascript:view(4)"><div class="<%=tomonth==3?"text_tomonth":"text_month"%>">4月</div></a></td>
    <td width="4%" align="center" valign="bottom" nowrap background="/images/functionframe/active_background.gif" id=05>
    <a href="javascript:view(5)"><div class="<%=tomonth==4?"text_tomonth":"text_month"%>">5月</div></a></td>
    <td width="4%" align="center" valign="bottom" nowrap background="/images/functionframe/active_background.gif" id=06>
    <a href="javascript:view(6)"><div class="<%=tomonth==5?"text_tomonth":"text_month"%>">6月</div></a></td>
    <td width="4%" align="center" valign="bottom" nowrap background="/images/functionframe/active_background.gif" id=07>
    <a href="javascript:view(7)"><div class="<%=tomonth==6?"text_tomonth":"text_month"%>">7月</div></a></td>
    <td width="4%" align="center" valign="bottom" nowrap background="/images/functionframe/active_background.gif"  id=08>
    <a href="javascript:view(8)"><div class="<%=tomonth==7?"text_tomonth":"text_month"%>">8月</div></a></td>
    <td width="4%" align="center"  valign="bottom" nowrap background="/images/functionframe/active_background.gif" id=09>
    <a href="javascript:view(9)"><div class="<%=tomonth==8?"text_tomonth":"text_month"%>">9月</div></a></td>
    <td width="4%" align="center" valign="bottom" nowrap background="/images/functionframe/active_background.gif"  id=10>
    <a href="javascript:view(10)"><div class="<%=tomonth==9?"text_tomonth":"text_month"%>">10月</div></a></td>
    <td width="4%" align="center" valign="bottom" nowrap background="/images/functionframe/active_background.gif"  id=11>
    <a href="javascript:view(11)"><div class="<%=tomonth==10?"text_tomonth":"text_month"%>">11月</div></a></td>
    <td width="4%" align="center" valign="bottom" nowrap background="/images/functionframe/active_background.gif"  id=12>
    <a href="javascript:view(12)"><div class="<%=tomonth==11?"text_tomonth":"text_month"%>">12月</div></a></td>
    <td width="6%" align="center" valign="bottom" nowrap background="/images/functionframe/active_background.gif">
    <a title="下一年度" id="nextyear" style="font-size:18px;color:#FF6600;line-height:18px;font-weight:bold;" href="javascript:nextYear();"><%=toyear+1%></a> <IMG src="/image/_calnextyr.gif" border="0" onclick="nextYear()" style="cursor: hand"></td>
  </tr>
</table>
</td>
  </tr>
<tr><td height="10"></td></tr>
</table>
      </TD>
    </TR>
    <TR align='center' class="td2">
      <!-- Generate column for each day. -->
      <SCRIPT LANGUAGE="JavaScript">
       // Output days.
       for (var intLoop = 0; intLoop < days.length;intLoop++)
         document.write("<TD bgcolor='#E8F5FF' class='text_week'>" + days[intLoop]+"</TD>");
    </SCRIPT>
    </TR>
    </THEAD>
	<TBODY ID="dayList" ALIGN=CENTER>
    <!-- Generate grid for individual days. -->
    <SCRIPT LANGUAGE="JavaScript">
		for (var intWeeks = 0; intWeeks < 6; intWeeks++) {
			document.write("<TR>");
			for (var intDays = 0; intDays < days.length;intDays++){
				document.write("<TD width='12%' height='150px' align='center'></TD>");
			}
			document.write("</TR>");
		}
	</SCRIPT>
    </TBODY>
  </TABLE>
</form>
</BODY>