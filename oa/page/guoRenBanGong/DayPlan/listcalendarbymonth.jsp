<%@ include file="/internet/common.jsp" %>
<%@ page  import="java.util.*,org.w3c.dom.*"%>
<%
    com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);
   String userId=base.util.TalentContext.getValue(pageContext,null,"SessionEntity/operatorID");
   int toyear = 0;
   int tomonth = 0;
    String year = reqContext.getEntityValue("year");
    String month = reqContext.getEntityValue("month");
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
    String userID = reqContext.getEntityValue("SessionEntity/userID");

%>

<head>
<SCRIPT LANGUAGE="JavaScript">
<!--
//获取本周时间范围
function doWeekQuery(){
  var vMonday = 0;
  var vSunday = 0;
   var vMonday = getMonday(new Date());
   var vSunday = getSunday(new Date());
  var vBeginTime=getDateByMar(vMonday)+" 00:00";
  var vEndTime=getDateByMar(vSunday)+" 23:59";
   
   var url="oa.prPersonOffice.prQueryByWeek.do?Schedule/USERID/criteria/value=<%=userId %>&BEGINTIME="+vBeginTime+"&ENDTIME="+vEndTime;
   
   window.location.href=url;
 }
 // 根据时间字符串组装时间，获得需要的周一时间
 function compareDate(stringDate){
  var vReturn;
  // 如果开始时间为空则返回当前时间对应的周一的时间
  if(stringDate == "" || stringDate == null){
   vReturn = getMonday(new Date());
  }else{
   var vArrDate = stringDate.split(" ")[0].split("-");
   vReturn = getMonday(new Date(vArrDate[0],parseInt(vArrDate[1])-1,vArrDate[2]));
  }
  return vReturn;
 }
 // 获得一个时间对应的周一的时间
 function getMonday(date){
  var vDateInt = date.valueOf();
  var vDayOfWeek = getDayOfWeek(date)-1;
  vDateInt = vDateInt - vDayOfWeek*24*60*60*1000;
  return vDateInt;
 }
 // 获得一个时间对应的周日的时间
 function getSunday(date){
  var vDateInt = date.valueOf();
  var vDayOfWeek = 7-getDayOfWeek(date);
  vDateInt = vDateInt + vDayOfWeek*24*60*60*1000;
  return vDateInt;
 }
 // 获得一个时间是本周的的几天，星期一：1 星期天：7
 function getDayOfWeek(date){
  // 获得一个日期是一个星期中的第几天，星期日：0 星期六：6
  var vDateOfWeek = date.getDay();
  if(vDateOfWeek == 0){
   vDateOfWeek = 7;
  }
  return vDateOfWeek;
 }
 // 根据自1970年1月1的毫秒数换算成时间
 function getDateByMar(milliseconds){
  var vNewDate = new Date(milliseconds);
  var vYear = vNewDate.getFullYear();
  var vMonth = (vNewDate.getMonth() + 1);
  if(vMonth < 10){
   vMonth = "0"+vMonth;
  }
  var vDay = vNewDate.getDate();
  if(vDay < 10){
   vDay = "0"+vDay;
  }
  return vYear + "-" + vMonth + "-" + vDay;
 }
 
///////
var z=0;
var docEle = function() 
{
    return document.getElementById(arguments[0]) || false;
}

 var newDiv = document.createElement("div");
 var i=1;
 
function openNewDiv(_id,pid,pd,obj,j) 
{
  
     document.all["content"+z].style.color   =   ""; 
     
    var offsetInfo = ""
    clientInfoX = window.event.clientX; 
    clientInfoY=  window.event.clientY; 
   
   // var m = "mask";
    if (docEle(_id)) document.body.removeChild(docEle(_id));
    //if (docEle(m)) document.body.removeChild(docEle(m));
   
    //mask遮罩层

    /**var newMask = document.createElement("div");
    newMask.id = m;
    newMask.style.position = "absolute";
    newMask.style.zIndex = "1";
    _scrollWidth = Math.max(document.body.scrollWidth,document.documentElement.scrollWidth);
    _scrollHeight = Math.max(document.body.scrollHeight,document.documentElement.scrollHeight);
    newMask.style.width = _scrollWidth + "px";
    newMask.style.height = _scrollHeight + "px";
    newMask.style.top = "0px";
    newMask.style.left = "0px";
    newMask.style.background = "#33393C";
    newMask.style.filter = "alpha(opacity=40)";
    newMask.style.opacity = "0.40";
    document.body.appendChild(newMask);**/
    
    //新弹出层

    var str="";
    newDiv.id = _id;
    newDiv.style.position = "absolute";
    newDiv.style.zIndex = "9999";
    if(pd=='show'){
     newDivWidth = 330;
     newDivHeight = 50;
    }else{
    newDivWidth = 390;

//347
    newDivHeight = 70;
    }
    newDiv.style.width = newDivWidth + "px";
    newDiv.style.height = newDivHeight + "px";
  //   alert(document.body.scrollLeft + document.body.clientWidth/2 - newDivWidth/2));
  if((document.documentElement.scrollTop + clientInfoX-newDivWidth/2)>(document.body.scrollLeft + document.body.clientWidth/2 - newDivWidth/2)){
    newDiv.style.posLeft =document.documentElement.scrollTop + clientInfoX-newDivWidth;
    }else{
     newDiv.style.posLeft =document.documentElement.scrollTop + clientInfoX;
    }
    newDiv.style.posTop =document.documentElement.scrollTop + clientInfoY+10;
    newDiv.style.background = "White";
    newDiv.style.border = "0";
    newDiv.style.padding = "0px";
    
     if(pd=='show'){
       z=j;
    str="查看";
    }else if(pd=='update'){
      z=j;
    str="修改";
    }else if(pd=='add'){
    str="新增";
    }
   
   
    if(pd=='show'){
 
     document.all["content"+j].style.color= "red";
      newDiv.innerHTML = "<table><tr><td align='right'><span style='top: 0px; left:5px; font-size: 12px; font-weight: bold; color:red; position: relative;' onselectstart='return false' >"+str+"</span></td><td align=\"right\" width='280px' ><a href=\"#\"   onclick=javascript:document.body.removeChild(docEle('"+_id+"')); ><image border=0  title=\"关闭\" src=\"/internet/images/attachdelete.gif\"/></a></td></tr>"; 
    newDiv.innerHTML += "<tr><td colspan=\"2\"> <iframe width='100%' height='75%' src=\"oa.prPersonOffice.pr_ToView1CalendarArrange.do?page=1&DBCLK=1&DBCLICK/Schedule/ScheduleID="+pid+"\"/></td></tr></table>";
    }else if(pd=='update'){
     z=j;
    document.all["content"+j].style.color= "red";
     newDiv.innerHTML = "<table><tr><td align='right'><span style='top: 0px; left:5px; font-size: 12px; font-weight: bold; color:red; position: relative;' onselectstart='return false' >"+str+"</span></td><td align=\"right\" width='330px' ><a href=\"#\"   onclick=javascript:document.body.removeChild(docEle('"+_id+"')); ><image border=0  title=\"关闭\" src=\"/internet/images/attachdelete.gif\"/></a></td></tr>";
    newDiv.innerHTML +="<tr><td colspan=\"2\"><iframe width='100%'  height='98%' src=\"oa.prPersonOffice.pr_ToUpdateCalendarArrange.do?page=1&Schedule/ScheduleID="+pid+"\"/></td></tr></table>";
    }else if(pd=='add'){
    obj.style.color="red",
     newDiv.innerHTML = "<table><tr><td align='right' ><span style='top: 0px; left:5px; font-size: 12px; font-weight: bold; color:red; position: relative;' onselectstart='return false' >"+str+"</span></td><td align='right' width='330px'><a href=\"#\"  onclick=javascript:document.body.removeChild(docEle('"+_id+"')); ><image border=0  title=\"关闭\" src=\"/internet/images/attachdelete.gif\"/></a></td></tr>";
     newDiv.innerHTML +="<tr><td colspan=\"2\"><iframe width='100%'  height='100%' src=\"oa.prPersonOffice.pr_ToAddCalendarArrange.do?page=1&x="+clientInfoX+"&y="+clientInfoY+"&z="+newDivHeight+"&USERID=<%=userId%>&date="+pid+"\"/></td></tr></table>";
    }
   
   
    document.body.appendChild(newDiv);
    
    
 
}


var lastobj;
var toyear = <%=toyear%>;
var cellcontent = new Array();
 <%
    org.w3c.dom.Document dom = reqContext. getDocument();
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
             String work_time="";//提醒时间;
             String task_sum="";//摘要;
             String pid="";//序列号;
             String anMan="";//日程安排人;
             String createDate="";//建立日期;
             String type="";
             String imgPath="";
           for(int k = 0 ;k<ca.getLength();k++){
                if(ca.item(k).getNodeName().equals("USERID"))
                userID=ca.item(k).getFirstChild().getNodeValue();
                if(ca.item(k).getNodeName().equals("CALENDAR"))
                createDate=ca.item(k).getFirstChild().getNodeValue();
                if(ca.item(k).getNodeName().equals("AWOKETIME"))             
                    work_time=ca.item(k).getFirstChild().getNodeValue();                   
                if(ca.item(k).getNodeName().equals("ScheduleID"))
                pid=ca.item(k).getFirstChild().getNodeValue();
                if(ca.item(k).getNodeName().equals("type"))
                type=ca.item(k).getFirstChild().getNodeValue();
                if(ca.item(k).getNodeName().equals("TASKSUM"))
                  if (ca.item(k).getFirstChild() != null)
                        task_sum=ca.item(k).getFirstChild().getNodeValue();
                  else
                        task_sum="";
             }
///
	//String tempStr=((begin_time+ "－" + end_time).length()>11)?((begin_time+ "－" + end_time).substring(0,11)):((begin_time+ "－" + end_time));		
      String temp1[] = work_time.split(" ");
      String tempStr=temp1[1].substring(0,5);
	  String task=(task_sum.length()>6) ?((String)(task_sum).substring(0,6)+".."): (task_sum);
	if(type.trim()=="1"||type.trim().equals("1")){
	   imgPath="/internet/images/jiaoxue.gif";
	}else{
	   imgPath="/internet/images/rili.gif"; 
	}
	
   // out.print("\"" + "" + "\" + ");
	out.print("\""+"<a href='#' onclick=javascript:openNewDiv('newDiv','"+pid+"','update',this,'"+i+j+"')> <IMG border=0 src='"+imgPath+"' title='修改日程安排'/></a> <span title='查看日程安排' onmouseout=javascript:closeNewDiv('newDiv')   onclick=javascript:openNewDiv('newDiv','"+pid+"','show',this,'"+i+j+"') id=content"+i+j+">"+task+"</span></br>\" +");
	if(itemcount<1)	{
		itemcount++;
	}
	else {
		out.print("\"<div align='right'><a title='查看当天所有日程安排' size='2' href=javascript:getDate4('')>更多..</a></div>\" + ");
		break;
    }
///////
                   
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
		var code = "";
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
			if (todaydate == nowdate)
			code =
			"<table width='100%' border='0' cellspacing='1' cellpadding='1'>" +
			"<tr>"+
			"<td valign='top' bgcolor='#D4D4D4' align='right' style='cursor:hand' title='新增日程安排' onClick=\"openNewDiv('newDiv','"+ cell.id + "','add',,this,'0');\">" +
			"<a title='新增日程安排' href=\"#\" onClick=\"openNewDiv('newDiv','"+ cell.id + "','add',this,'0');\">" +
			divbstr + cell.innerText + divestr +
			"</a>" +
			"</td></tr>";
			else
			code =
			"<table width='100%' border='0' cellspacing='1' cellpadding='1'>" +
			"<tr>"+
			"<td valign='top' bgcolor='#EBEBEB' align='right' style='cursor:hand' onClick=\"openNewDiv('newDiv','"+ cell.id + "','add',this,'0');\">" +
			"<a title='新增日程安排' href=\"#\" onClick=\"openNewDiv('newDiv','"+ cell.id + "','add',this,'0');\">" +
			divbstr + cell.innerText + divestr +
			"</a>" +
			"</td></tr>";
			
			if (todaydate == nowdate)
			code +=
			"<tr class='td2'>"+
			"<td align='left' valign='top' height='74px' style='cursor:hand' bgColor='#FFFFCC' onClick=\"changeBgColor(this);getDate3('" + cell.id + "')\">" + 
			content +
			"</td>" +
			"</tr>" +
			"</table>";
			else
			code +=
			"<tr class='td2'>"+
			"<td align='left' valign='top' height='74px' style='cursor:hand' onClick=\"changeBgColor(this);getDate3('" + cell.id + "')\">" + 
			content +
			"</td>" +
			"</tr>" +
			"</table>";
			cell.innerHTML = code;
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
function getDate2(str) {
	var form0 = document.forms[0];
	var selectuser = document.forms[0].elements("rightUsers");

	//var calendarUserVO = selectuser.value;
	//var userarr = getValueOfArranger(calendarUserVO,"|");

	//form0.elements("USERID").value = userarr[0];
	//form0.elements("OPERATORNAME").value = userarr[1];

	var sDate;
	sDate = str;

	var form = document.forms[0];
	
	form.elements("date").value = sDate;
	document.getElementById("month").value = <%=tomonth+1%>;
	form.action="oa.prPersonOffice.pr_ToViewAllCalendarArrange.do?pd=add";
	form.submit();
}

function getDate3(str){
	var form0 = document.forms[0];
	var selectuser = document.forms[0].elements("rightUsers");

	//var calendarUserVO = selectuser.value;
	//var userarr = getValueOfArranger(calendarUserVO,"|");

	//form0.elements("USERID").value = userarr[0];
	//form0.elements("OPERATORNAME").value = userarr[1];

	var sDate;
	sDate = str;

	var form = document.forms[0];
	document.getElementById("month").value = <%=tomonth+1%>;
	form.elements("date").value = sDate;
	form.action="oa.prPersonOffice.pr_ToViewAllCalendarArrange.do";
//	form.submit();

}

function getDate4(id){
  
	var form0 = document.forms[0];
	var selectuser = document.forms[0].elements("rightUsers");

	

   var form = document.forms[0];
	document.getElementById("month").value = <%=tomonth+1%>;
    
    if(id!=""){
	form.action="oa.prPersonOffice.pr_ToViewAllCalendarArrange.do?pd=oneView&fid="+id;
	}
	else{
		form.action="oa.prPersonOffice.pr_ToViewAllCalendarArrange.do";
	}
	form.submit();

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
--></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
function changeArranger(){
	var form0 = document.forms[0];
	var selectuser = document.forms[0].elements("rightUsers");
	form0.action="oa.prPersonOffice.prQueryCalendarArrange.do";
	var calendarUserVO = selectuser.value;
	var userarr = getValueOfArranger(calendarUserVO,"|");

	form0.elements("USERID").value = userarr[0];
	form0.elements("OPERATORNAME").value = userarr[1];

    form0.elements("liu").value=1;
	form0.submit();
}

function getValueOfArranger(objvalue,str){
	var userarr = objvalue.split(str);
	return userarr;
}
function setPower(){
	var form0 = document.forms[0];
	form0.action="oa.prPersonOffice.pr_ToSetPower.do";
	form0.submit();
}
function lastMonth(toyear,tomonth){
	var form0 = document.forms[0];
    form0.elements("liu").value=1;
    
    if (tomonth == 0) {
       form0.elements("year").value = toyear-1;
       form0.elements("month").value=12;
    } else {
       form0.elements("month").value=tomonth;
    }
    //alert(form0.elements("year").value +","+form0.elements("month").value);
	form0.submit();
}
function nextMonth(toyear,tomonth){
	var form0 = document.forms[0];
    form0.elements("liu").value=1;
    
    if (tomonth == 11) {
       form0.elements("year").value = toyear+1;
       form0.elements("month").value=1;
    } else {
       form0.elements("month").value=tomonth+2;
    }
    //alert(form0.elements("year").value +","+form0.elements("month").value);
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
<BODY ONLOAD="newCalendar();" OnUnload="window.returnValue = document.all.ret.value;" id="lm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="200px" height="12" colspan="2">
        <input name="Submit4" type="button" class="button_02" value="切换视图"  onclick="window.location.href='oa.prPersonOffice.pr_ToViewAllCalendarArrange.do?date=0&USERID=<%=userId %>'">
        <input name="Submit5" type="button" class="button_03" value="周任务视图"  onclick="doWeekQuery();">
        </td>
        <td class="text_wirte"></td>
        <td width="15" height="12">
         </td>
        <td class="text_wirte"></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100%" height="5"></td>
      </tr>
    </table>
<TABLE align="left" width='100%' border="0" cellpadding="0" cellspacing="2" ID="calendar" class="MENU_line">
<form action="oa.prPersonOffice.prQueryCalendarArrange.do" method="post">
<html:hidden property="liu" />
<input type="hidden" name="ret">
<input type="hidden" name="content0">
<input type="hidden" name="date" id="date" value=""/>
<input type="hidden" name="year" id="year" value="<%=toyear%>"/>
<input type="hidden" name="month" id="month" value="<%=tomonth%>"/>
<html:hidden property="Schedule/_order/col1/asc" value="desc"/>
<html:hidden property="Schedule/_order/col1/field" value="CALENDAR"/>
<input type="hidden" name="USERID" value="<bean:write property="sysTUser/operatorID"/>"><!--要安排日程人的账号默认为登录者-->
<input type="hidden" name="OPERATORNAME" value="<bean:write property="sysTUser/operatorName"/>"><!--要安排日程人的账号名称默认为登录者-->
<!--<html:hidden name="CalendarArrangeForm" property="listDate"/>-->
    <THEAD> 
     
    <TR>
      
      <TD COLSPAN=7 align="left" valign="middle" >
      <IMG src="/internet/image/btn_prev.gif" border="0" onclick="lastMonth(<%=toyear%>,<%=tomonth%>)" style="cursor: hand"> <IMG src="/internet/image/btn_next.gif" border="0" onclick="nextMonth(<%=toyear%>,<%=tomonth%>)" style="cursor: hand"> 
      <font size="4" family="幼圆"><%=toyear%>年<%=tomonth+1%>月</font>
      </TD>
     
    </TR>
    <TR align='center' class="td2" >
      <!-- Generate column for each day. -->
      <SCRIPT LANGUAGE="JavaScript">
       // Output days.
       for (var intLoop = 0; intLoop < days.length;intLoop++) {
         if (intLoop==0 || intLoop%6==0)
            document.write("<TD class='text_week' align='center' valign='middle' bgcolor='#FF6633' height='23'>" + days[intLoop]+"</TD>");
         else
            document.write("<TD class='text_week' align='center' valign='middle' height='23'>" + days[intLoop]+"</TD>");
       }
    </SCRIPT>
    </TR>
    </THEAD>
	<TBODY ID="dayList" ALIGN=CENTER>
    <!-- Generate grid for individual days. -->
    <SCRIPT LANGUAGE="JavaScript">
		for (var intWeeks = 0; intWeeks < 6; intWeeks++) {
			document.write("<TR>");
			for (var intDays = 0; intDays < days.length;intDays++){
				document.write("<TD width='14%' height='74' align='center'></TD>");
			}
			document.write("</TR>");
		}
	</SCRIPT>
    </TBODY>
  </form>
</TABLE>
<!--<html:form action="oa.prPersonOffice.prQueryCalendarArrange.do" method="post">
<html:hidden name="CalendarArrangeForm" property="listDate"/>
</html:form>-->
</BODY>