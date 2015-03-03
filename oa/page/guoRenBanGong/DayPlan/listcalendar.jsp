	<%@include file="/internet/common.jsp"%>
	<%@page import="java.util.ArrayList" %>
	<%
	  com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);
	
	String userId=base.util.TalentContext.getValue(pageContext,null,"SessionEntity/operatorID");
	tools.util.DeskInfo.queryAllCaledar(request,userId);
	ArrayList calendarDateList = (ArrayList)request.getAttribute("calendarDateList");
	String OPERATORNAME = reqContext.getEntityValue("SessionEntity/userName");
	 %>
<style>
a:link {
          text-decoration: none;
          color: #31687E;
}
a:visited {
          color: #31687E;
          text-decoration: none;
}
a:hover {
          color: #FF0000;
          text-decoration: none;
}
a:active {
          color: #FF0000;
          text-decoration: none;
}
</style>
	<html> 
	  <head> 
	  <meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
	  <title>日历</title> 
	  <style type="text/css"> 
	  <!-- 
	  body { font-size: 9pt} 
	  table { font-size: 9pt} 
	  a { text-decoration: none} 
	  --> 
	  </style> 
	  <script language="JavaScript"> 
	  <!-- 
	  var Selected_Month; 
	  var Selected_Year; 
	  var Selected_Day;
	  var Current_Date = new Date(); 
	  var Current_Month = Current_Date.getMonth(); 
	  var Select_Time="";
	  var Cal_Year;
	  var Cal_Month;
	  var Cal_Day;
	   
	  var Days_in_Month = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31); 
	  var Month_Label = new Array('一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'); 
	   
	  var Current_Year = Current_Date.getYear(); 
	   
	  var Today = Current_Date.getDate(); 
	   
	  function Header(Year, Month) { 
	   
	   if (Month == 1) { 
	   if ((Year % 400 == 0) || ((Year % 4 == 0) && (Year % 100 != 0))) { 
	   Days_in_Month[1] = 29; 
	   } 
	   } 
	   var Header_String = Year + '年' + Month_Label[Month]; 
	   return Header_String; 
	  } 
	   
	   
	   
	  function Make_Calendar(Year, Month) { 
	   var First_Date = new Date(Year, Month, 1); 
	   var Heading = Header(Year, Month); 
	   var First_Day = First_Date.getDay() + 1; 
	   if (((Days_in_Month[Month] == 31) && (First_Day >= 6)) || 
	   ((Days_in_Month[Month] == 30) && (First_Day == 7))) { 
	   var Rows = 6; 
	   } 
	   else if ((Days_in_Month[Month] == 28) && (First_Day == 1)) { 
	   var Rows = 4; 
	   } 
	   else { 
	   var Rows = 5; 
	   } 
	   
	   var HTML_String = '<table border=1 cellspacing=0 cellpadding=0 width=207 height=22 bordercolor=#B8CACF bgcolor=#666FF><tr><table border=1 cellspacing=0 cellpadding=0 bgcolor=#666FF BORDERCOLORLIGHT=#B8CACF BORDERCOLORDARK=#FFFFFF width=205 height=20>'; 
	   
	   HTML_String += '<tr width=205 ><th><font color="#FFFFFF">' + Heading + '</font></th></tr>'; 
	   
	   
	   HTML_String += '</table></td></tr></table>'; 

	   HTML_String += '<table border=1 cellspacing=0 cellpadding=0 width=202 height=160 bordercolor=#B8CACF bgcolor=#666FF >';
	   HTML_String +='<tr>';
	   HTML_String += '<td width=202 height=18>';
	   HTML_String+='<table border=1 cellspacing=0 cellpadding=0 bgcolor=#666FF BORDERCOLORLIGHT=#B8CACF BORDERCOLORDARK=#FFFFFF width=200 height=20>';
	   HTML_String+='<tr align=center valign=bottom><td style="font-size:12px;color:#FFFFFF" >日</td>';
	   HTML_String+='<td style="font-size:12px;color:#FFFFFF" >一</td><td style="font-size:12px;color:#FFFFFF" >二</td>';
	   HTML_String+='<td style="font-size:12px;color:#FFFFFF" >三</td><td style="font-size:12px;color:#FFFFFF" >四</td>';
	   HTML_String+='<td style="font-size:12px;color:#FFFFFF" >五</td><td style="font-size:12px;color:#FFFFFF" >六</td></tr>';
	   HTML_String+='</table></td></tr>';
	   HTML_String+='<tr><td width=202 height=120>';
	   HTML_String+='<table border=1 cellspacing=2 cellpadding=0 borderColorLight="#FFFFFF" borderColorDark="#B8CACF" bgcolor=#fff8ec width=200 height=120 >';
       var Day_Counter1 = 1; 
	   var Loop_Counter1 = 1; 
	   for (var j = 1; j <= Rows; j++) { 
	   HTML_String += '<tr align=center>'; 
	   for (var i = 1; i < 8; i++) { 
	   if ((Loop_Counter1 >= First_Day) && (Day_Counter1 <= Days_in_Month[Month])) { 
	   if ((Day_Counter1 == Today) && (Year == Current_Year) && (Month == Current_Month)) { 
	   HTML_String += '<td width=20 height=25 BGCOLOR="FFFFFF" BORDERCOLOR="#B8CACF" valign="middle" style="cursor:hand" id='+ Day_Counter1 +' onclick=CalendarCellsClick(this) ><strong><font color="red">' + Day_Counter1 + '</font></strong></td>'; 
	   } 
	   else if((Selected_Day==Day_Counter1)&& (Year == Selected_Year) && (Month == Selected_Month)) { 
	   
	   HTML_String += '<td width=20 height=25 BGCOLOR="FFFFFF" BORDERCOLOR="#B8CACF" valign="middle" style="cursor:hand" id='+ Day_Counter1 +' onclick=CalendarCellsClick(this)  ><strong><font color="blue">' + Day_Counter1 + '</font></strong></td>'; 
	   } 
	   else { 
	     var Day_Counter2 = Day_Counter1;
	     <%
	     for(int k=0;k<calendarDateList.size();k++){ 
	        String calendarDate = (String)calendarDateList.get(k);
	        String [] calendar = calendarDate.split("-");	        
	      %>
	     
	      Cal_Year = '<%=calendar[0]%>';
	      Cal_Month = '<%=calendar[1]%>';
	      Cal_Day = '<%=calendar[2]%>';
	      if(Day_Counter2 == Day_Counter1){
          if((Selected_Year==Cal_Year)&&(Selected_Month==(parseInt(Cal_Month)-1))&&(Cal_Day==Day_Counter1)){
            Day_Counter2 = '<strong><font color="#993366">' + Day_Counter1 + '</font></strong>';
	      }}
	     <%}%>
	      HTML_String += '<td width=20 height=25 BGCOLOR="FFFFFF" BORDERCOLOR="#666FF"   valign="middle" style="cursor:hand" id='+ Day_Counter1 +' onclick=CalendarCellsClick(this)>' + Day_Counter2 + '</td>'; 
	   } 
	   Day_Counter1++; 
	   } 
	   else { 
	   HTML_String += '<td width=20 height=25 BORDERCOLOR="#666FF"> </td>'; 
	   } 
	   Loop_Counter1++; 
	   } 
	   HTML_String += '</tr>'; 
	   } 
	   HTML_String+='</table></td></tr>';
       HTML_String +='<tr><td>';
	   HTML_String+='<table border=0 cellspacing=1 cellpadding=0 width=100% bgcolor=#FFFFFF>';
	HTML_String+='<tr ><td  align=left><input  type=button style="border:1px solid #BCD0DE;background-color:#eeeeee;cursor:hand" value="<<" onclick=SkipYear("-") title="向前翻 1 年" ';
	HTML_String+='onfocus="this.blur()" style="font-size: 12px; height: 20px"><input  style="border:1px solid #BCD0DE;background-color:#eeeeee;cursor:hand" title="向前翻 1 月" type=button ';
	HTML_String+=' value="< " onclick=Skip("-") onfocus="this.blur()" style="font-size: 12px; height: 20px"></td><td ';
	HTML_String+=' align=center><input  type=button style="border:1px solid #BCD0DE;background-color:#eeeeee;cursor:hand" value=今天   onclick="CalendarToday()" ';
	HTML_String+=' onfocus="this.blur()" title="当前日期" style="font-size: 12px; height: 20px; cursor:hand"></td><td ';
	HTML_String+=' align=right><input  type=button style="border:1px solid #BCD0DE;background-color:#eeeeee;cursor:hand" value=" >" onclick=Skip("+") ';
	HTML_String+='onfocus="this.blur()" title="向后翻 1 月" style="border:1px solid #BCD0DE;background-color:#eeeeee;cursor:hand" style="font-size: 12px; height: 20px"><input ';
	HTML_String+=' type=button style="border:1px solid #BCD0DE;background-color:#eeeeee;cursor:hand" value=">>" onclick=SkipYear("+") title="向后翻 1 年"';
	HTML_String+='onfocus="this.blur()" style="font-size: 12px; height: 20px"></td></tr></table>';
	
	   HTML_String +='</td></tr></table>'
	   document.all.Calendar.innerHTML = HTML_String; 
	  } 
	   
	   
	  function Check_Nums() { 
	   if ((event.keyCode < 48) || (event.keyCode > 57)) { 
	   return false; 
	   } 
	  } 
	   
	   
	   
	  function On_Year() { 
	   var Year = document.when.year.value; 
	   if (Year.length == 4) { 
	   Selected_Month = document.when.month.selectedIndex; 
	   Selected_Year = Year; 
	   Make_Calendar(Selected_Year, Selected_Month); 
	   } 
	  } 
	   
	  function On_Month() { 
	   var Year = document.when.year.value; 
	   if (Year.length == 4) { 
	   Selected_Month = document.when.month.selectedIndex; 
	   Selected_Year = Year; 
	   Make_Calendar(Selected_Year, Selected_Month); 
	   } 
	   else { 
	   alert('Please enter a valid year.'); 
	   document.when.year.focus(); 
	   } 
	  } 
	   
	   
	  function Defaults() { 
	   if (!document.all) 
	   return 
	   var Mid_Screen = Math.round(document.body.clientWidth / 2); 
	   document.when.month.selectedIndex = Current_Month; 
	   document.when.year.value = Current_Year; 
	   Selected_Month = Current_Month; 
	   Selected_Year = Current_Year; 
	   Make_Calendar(Current_Year, Current_Month); 
	   
	   var month2=parseInt(Current_Month)+1;
	    if(parseInt(month2)<10){
	     month2="0"+month2;
	   }
	   Select_Time = Current_Year+"-"+month2+"-"+Today;
	   toCalendar();
	  } 
	   
	   
	  function Skip(Direction) { 
	   if (Direction == '+') { 
	   if (Selected_Month == 11) { 
	   Selected_Month = 0; 
	   Selected_Year++; 
	   } 
	   else { 
	   Selected_Month++; 
	   } 
	   } 
	   else { 
	   if (Selected_Month == 0) { 
	   Selected_Month = 11; 
	   Selected_Year--; 
	   } 
	   else { 
	   Selected_Month--; 
	   } 
	   } 
	   Make_Calendar(Selected_Year, Selected_Month); 
	   document.when.month.selectedIndex = Selected_Month; 
	   document.when.year.value = Selected_Year; 
	  } 
	   
	 function SkipYear(Direction) { 
	   if (Direction == '+') { 
		 Selected_Year++; 
	   } 
	   else { 
		Selected_Year--; 
	   } 
       Make_Calendar(Selected_Year, Selected_Month);
	   document.when.year.value = Selected_Year; 
	  }

	function CalendarCellsClick(obj)
	{
	    var day1=obj.id;
	    Selected_Day = day1;
	    
	    //alert(Selected_Day);	   
	    Make_Calendar(Selected_Year, Selected_Month);  
		 
	if(day1.length==1)
	day1="0"+day1;
	var year1=document.all.year.value;
	var month1=document.all.month.value;
	var month2=parseInt(month1)+1;
	if(parseInt(month2)<10){
	month2="0"+month2;
	}
	var time1=year1+'-'+month2+'-'+day1;
	Select_Time = time1;
	
	toCalendar1();
		//return Select_Time;
	}
	  
	function CalendarToday(){
		Defaults();
	}
	function showCalendar(){
     alert("45");
	
	}
	  //--> 
	  </script> 
	  </head> 
	   
	  <body onLoad="Defaults();"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;工作日历</td>
      </tr>
    </table></td>
  </tr>
  
</table>
 <table width="100%" height="20"  border="0" cellpadding="0" cellspacing="0">
         <td width="25%" align="right" class="text">&nbsp;</td>
              <td width="100%" align="right" nowrap>
        <tr>
          <td><span class="text_red"><%=OPERATORNAME%>:&nbsp;工作日历</span> </td>
        </tr>
      </table>
<tr><td>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
	   <td width="85%"> 
	   <iframe src="oa.prPersonOffice.prQueryCalendarArrange.do?year=&month=&menuID=DX_OASYS_WORK_DAYPLAN" name="calendar" frameborder="0" align="center" width="100%" height="1020" scrolling="no"></iframe>
	   </td></tr>
	   </table>
	  </body> 
	  </html> 
	  
	  <script>
	    function toCalendar(){
	        document.all.calendarFrame.src = 'oa.prDesk.calendarFrame.do?time='+Select_Time;
	    }
	    function toCalendar1(){
	        document.all.calendar.src = 'oa.prPersonOffice.pr_ToViewAllCalendarArrange.do?USERID=<%=userId %>&date='+Select_Time;
	        document.all.calendarFrame.src = 'oa.prDesk.calendarFrame.do?time='+Select_Time;
	    }
       </script>