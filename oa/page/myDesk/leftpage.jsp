	<%@include file="/internet/common.jsp"%>
	<%@page import="java.util.ArrayList" %>
	<%
	String userId=base.util.TalentContext.getValue(pageContext,null,"SessionEntity/operatorID");
	tools.util.DeskInfo.queryAllCaledar(request,userId);
	ArrayList calendarDateList = (ArrayList)request.getAttribute("calendarDateList");
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
	   
	   var HTML_String = '<table border=1 cellspacing=0 cellpadding=0 width=147 height=22 bordercolor=#B8CACF bgcolor=#B8CACF><tr><table border=1 cellspacing=0 cellpadding=0 bgcolor=#B8CACF BORDERCOLORLIGHT=#B8CACF BORDERCOLORDARK=#FFFFFF width=145 height=20>'; 
	   
	   HTML_String += '<tr width=145 ><th><font color="#FFFFFF">' + Heading + '</font></th></tr>'; 
	   
	   
	   HTML_String += '</table></td></tr></table>'; 

	   HTML_String += '<table border=1 cellspacing=0 cellpadding=0 width=142 height=160 bordercolor=#B8CACF bgcolor=#B8CACF >';
	   HTML_String +='<tr>';
	   HTML_String += '<td width=142 height=18>';
	   HTML_String+='<table border=1 cellspacing=0 cellpadding=0 bgcolor=#B8CACF BORDERCOLORLIGHT=#B8CACF BORDERCOLORDARK=#FFFFFF width=140 height=20>';
	   HTML_String+='<tr align=center valign=bottom><td style="font-size:12px;color:#FFFFFF" >日</td>';
	   HTML_String+='<td style="font-size:12px;color:#FFFFFF" >一</td><td style="font-size:12px;color:#FFFFFF" >二</td>';
	   HTML_String+='<td style="font-size:12px;color:#FFFFFF" >三</td><td style="font-size:12px;color:#FFFFFF" >四</td>';
	   HTML_String+='<td style="font-size:12px;color:#FFFFFF" >五</td><td style="font-size:12px;color:#FFFFFF" >六</td></tr>';
	   HTML_String+='</table></td></tr>';
	   HTML_String+='<tr><td width=142 height=120>';
	   HTML_String+='<table border=1 cellspacing=2 cellpadding=0 borderColorLight="#FFFFFF" borderColorDark="#B8CACF" bgcolor=#fff8ec width=140 height=120 >';
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
	      HTML_String += '<td width=20 height=25 BGCOLOR="FFFFFF" BORDERCOLOR="#B8CACF"   valign="middle" style="cursor:hand" id='+ Day_Counter1 +' onclick=CalendarCellsClick(this)>' + Day_Counter2 + '</td>'; 
	   } 
	   Day_Counter1++; 
	   } 
	   else { 
	   HTML_String += '<td width=20 height=25 BORDERCOLOR="#B8CACF"> </td>'; 
	   } 
	   Loop_Counter1++; 
	   } 
	   HTML_String += '</tr>'; 
	   } 
	   HTML_String+='</table></td></tr>';
       HTML_String +='<tr><td>';
	   HTML_String+='<table border=0 cellspacing=1 cellpadding=0 width=100% bgcolor=#FFFFFF>';
	HTML_String+='<tr><td  align=left><input  type=button style="border:1px solid #BCD0DE;background-color:#eeeeee;cursor:hand" value="<<" onclick=SkipYear("-") title="向前翻 1 年" ';
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
	
	toCalendar();
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
	  <table width="160" border="0" cellspacing="0" cellpadding="0"> 
	   <form name="when"> 
	<tr>
    <td width="160" align="center">
    <table > 
    <tr><td bgcolor="#FFFFFF" bordercolor="#FFFFFF">
     <a href="http://192.168.0.201" target="_blank"> <img src="/internet/images/dx01.gif" width="158" height="107" border="0" title="用户名：vod 密码：vod"></a>
    <a href="file://192.168.0.254/文档交换站" target="_blank">文档交换站</a> | <a href="http://192.168.0.3/library/default.asp?id=<%=userId %>" target="_blank"> 图书馆网站</a>&nbsp;
      <a href="http://ids.gzswdx.gov.cn:8082" target="_blank">外网管理</a>  &nbsp;&nbsp;|<a href="file://192.168.0.254/软件天地" target="_blank"> 软件天地</a>
      </td></tr>
      
      </table>
    </td>
  </tr><tr align="center">
	   <td class="td1">
	      <!--<a href="http://www.gzswdx.gov.cn/adzttz/201107/t20110708_32893.htm" target="_blank"> <img src="/internet/images/dxadbner.jpg" width="158" height="107" border="0" ></a>-->
	   </td>
	   </tr>
   <tr>
   <td align="center"><font size="3" color="#E3ECEC"></font></td>
   </tr>
	   <tr> 
	   <td align="center" width="168"> 
	   <div id=NavBar style="position:relative;top:-1px;left:0px;"> 
	   
	   <select name="month" onChange="On_Month()"> 
	  <script language="JavaScript1.2"> 
	  <!-- 
	  if (document.all){ 
	   for (j=0;j<Month_Label.length;j++) { 
	   document.writeln('<option value=' + j + '>' + Month_Label[j]); 
	   } 
	  } 
	  //--> 
	  </script>
	   </select>  
	   <input type="text" name="year" size=8 maxlength=4 onKeyPress="return Check_Nums()" onKeyUp="On_Year()"><br> 

	  </div> 
	  <div id=Calendar style="position:relative;top:-3px;left:0px;"></div> 
	   </td> 
	   </tr> 
	   <tr align="center">
	   <td class="td1">
	      <iframe src="" name="calendarFrame" frameborder="0" align="center" width="150" height="200" scrolling="no"></iframe>
	      
	   </td>
	   </tr>	   
	   
	   </form> 
	   </table> 
	  </body> 
	  </html> 
	  
	  <script>
	    function toCalendar(){
	      //alert(Select_Time);
	         document.all.calendarFrame.src = 'oa.prDesk.calendarFrame.do?time='+Select_Time;
	    }
       </script>