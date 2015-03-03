<%@ include file="/internet/common.jsp" %>
<!-- Insert your jsp/html code here -->
 <%
         com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);
         String USERACCOUNT=reqContext.getEntityValue("operatorName");//用户账号
         //String ArrangeMan=reqContext.getEntityValue("ArrangeMan");//日程安排人
         //String BEGINTIME = reqContext.getEntityValue("TOOLS_CALENDARARRANGE/BEGINTIME");
         //String ENDTIME = reqContext.getEntityValue("TOOLS_CALENDARARRANGE/ENDTIME");
         String AWOKETIME = reqContext.getEntityValue("Schedule/AWOKETIME");
         String getDate=reqContext.getEntityValue("Schedule/CALENDAR");
         String begin=reqContext.getEntityValue("Schedule/beginTime");
         String end=reqContext.getEntityValue("Schedule/endTime");
         

%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
function dayPopUpCalendarDlg(){
   var time = document.forms[0].elements["Schedule/AWOKETIME[@pattern='yyyy-MM-dd HH:mm:ss']"].value;
			showx = event.screenX - event.offsetX+10; // + deltaX;
			showy = event.screenY - event.offsetY+10; // + deltaY;
			newWINwidth = 220 + 4 + 18;
			retval = window.showModalDialog("oa.prPersonOffice.prCalendar.do", "setTime", "dialogWidth:197px; dialogHeight:235px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
			if( retval!= null ){
			//alert(document.forms[0].elements["Schedule/AWOKETIME[@pattern='yyyy-MM-dd HH:mm:ss']"].value);
			document.forms[0].elements["Schedule/AWOKETIME[@pattern='yyyy-MM-dd HH:mm:ss']"].value = retval;
	        }
}
</SCRIPT>
</head>
<body>
<%String oper=base.util.TalentContext.getValue(pageContext,null,"oper"); %>
<%String date=request.getParameter("date");
  String month1=request.getParameter("month");
  String USERID=request.getParameter("USERID");
  String year=request.getParameter("year");
  String rightUsers=request.getParameter("rightUsers");
  %>
  
 <form name="opeForm" method="post" action="oa.prPersonOffice.prDoUpdateCalendar.do">
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
 <input type="hidden" name="is" value="<%=request.getParameter("is")%>"/>
  <html:hidden property="PageCond/begin" />
  <html:hidden property="Order/col1"   />
 <input type="hidden" name="Order">
 <html:hidden property="Schedule/CALENDAR"/>
 <html:hidden property="Schedule/USERID"/>
 <html:hidden property="Schedule/ScheduleID"/>
 <input type="hidden" name="page" value="<%=request.getParameter("page")%>"/>
 <input type="hidden" name="AWOKETIME" value="<bean:write property='Schedule/AWOKETIME' formatType='yyyy-MM-dd HH:mm:ss' formatClass='com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl'/>"/>
 <input type="hidden" name="date" value="<%=request.getParameter("date")%>"/>
 <input type="hidden" name="year" value="<%=request.getParameter("year")%>"/>
 <input type="hidden" name="month" value="<%=request.getParameter("month")%>"/>
 <input type="hidden" name="USERID" value="<%=request.getParameter("USERID")%>"/>
 <input type="hidden" name="USERACCOUNT" value="<%=request.getParameter("USERID")%>"/>
   <input type="hidden" name="OPERATORNAME" value="<%=request.getParameter("operatorName")%>"><!--要安排日程人的账号名称默认为登录者-->



  <tr>
    <td><table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td> </td>
      </tr>
    </table>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
       
          <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
            <tr>
              <td width="15%" align="right" class="td1" nowrap>日 &nbsp; &nbsp;期：</td>
              <td width="29%" class="td2">&nbsp;
                	
                <bean:write property="Schedule/CALENDAR"  formatType="yyyy年MM月dd日" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
                </td>
              <td align="right" class="td1">提 &nbsp; &nbsp;醒：</td>
              <td class="td2" align="left">&nbsp;
                <logic:equal property="Schedule/ISREMIND" value="1">
                <input name="Schedule/ISREMIND" type="checkbox"  checked="true">
                </logic:equal>
                <logic:equal property="Schedule/ISREMIND" value="0">
                <input name="Schedule/ISREMIND" type="checkbox">
                </logic:equal>
              </td>
            </tr>
             <tr>  
            
            <td width="15%" align="right" class="td1" nowrap>开始时间：</td>
              <td width="29%" class="td2">&nbsp;
              <logic:equal property="Schedule/type" value="1">
                 <bean:write property="Schedule/beginTime"/>
                 <html:hidden  name="beginTime" property="Schedule/beginTime"/>
              </logic:equal>
              <logic:notEqual property="Schedule/type" value="1">
			   <select name="beginTime" >
			       <option value="01:00" <%if(begin!=null&&begin.equals("01:00"))out.print("selected='selected'"); %>>01:00</option>
			       <option value="01:30" <%if(begin!=null&&begin.equals("01:30"))out.print("selected='selected'"); %>>01:30</option>
                   <option value="02:00" <%if(begin!=null&&begin.equals("02:00"))out.print("selected='selected'"); %>>02:00</option>
                   <option value="02:30" <%if(begin!=null&&begin.equals("02:30"))out.print("selected='selected'"); %>>02:30</option>
			       <option value="03:00" <%if(begin!=null&&begin.equals("03:00"))out.print("selected='selected'"); %>>03:00</option>
			       <option value="03:30" <%if(begin!=null&&begin.equals("03:30"))out.print("selected='selected'"); %>>03:30</option>
                   <option value="04:00" <%if(begin!=null&&begin.equals("04:00"))out.print("selected='selected'"); %>>04:00</option>
                   <option value="04:30" <%if(begin!=null&&begin.equals("04:30"))out.print("selected='selected'"); %>>04:30</option>
                   <option value="05:00" <%if(begin!=null&&begin.equals("05:00"))out.print("selected='selected'"); %>>05:00</option>
                   <option value="05:30" <%if(begin!=null&&begin.equals("05:30"))out.print("selected='selected'"); %>>05:30</option>
                   <option value="06:00" <%if(begin!=null&&begin.equals("06:00"))out.print("selected='selected'"); %>>06:00</option>
                   <option value="06:30" <%if(begin!=null&&begin.equals("06:30"))out.print("selected='selected'"); %>>06:30</option>	
                   <option value="07:00" <%if(begin!=null&&begin.equals("07:00"))out.print("selected='selected'"); %>>07:00</option>
                   <option value="07:30" <%if(begin!=null&&begin.equals("07:30"))out.print("selected='selected'"); %>>07:30</option>
                   <option value="08:00" <%if(begin!=null&&begin.equals("08:00"))out.print("selected='selected'"); %>>08:00</option>
                   <option value="08:30" <%if(begin!=null&&begin.equals("08:30"))out.print("selected='selected'"); %>>08:30</option>
                   <option value="09:00" <%if(begin!=null&&begin.equals("09:00"))out.print("selected='selected'"); %>>09:00</option>
                   <option value="09:30" <%if(begin!=null&&begin.equals("09:30"))out.print("selected='selected'"); %>>09:30</option>
                   <option value="10:00" <%if(begin!=null&&begin.equals("10:00"))out.print("selected='selected'"); %>>10:00</option>
                   <option value="10:30" <%if(begin!=null&&begin.equals("10:30"))out.print("selected='selected'"); %>>10:30</option>		
                   <option value="11:00" <%if(begin!=null&&begin.equals("11:00"))out.print("selected='selected'"); %>>11:00</option>
                   <option value="11:30" <%if(begin!=null&&begin.equals("11:30"))out.print("selected='selected'"); %>>11:30</option>
                   <option value="12:00" <%if(begin!=null&&begin.equals("12:00"))out.print("selected='selected'"); %>>12:00</option>
                   <option value="12:30" <%if(begin!=null&&begin.equals("12:30"))out.print("selected='selected'"); %>>12:30</option>
                   <option value="13:00" <%if(begin!=null&&begin.equals("13:00"))out.print("selected='selected'"); %>>13:00</option>
                   <option value="13:30" <%if(begin!=null&&begin.equals("13:30"))out.print("selected='selected'"); %>>13:30</option>
                   <option value="14:00" <%if(begin!=null&&begin.equals("14:00"))out.print("selected='selected'"); %>>14:00</option>
                   <option value="14:30" <%if(begin!=null&&begin.equals("14:30"))out.print("selected='selected'"); %>>14:30</option>
			       <option value="15:00" <%if(begin!=null&&begin.equals("15:00"))out.print("selected='selected'"); %>>15:00</option>
			       <option value="15:30" <%if(begin!=null&&begin.equals("15:30"))out.print("selected='selected'"); %>>15:30</option>
                   <option value="16:00" <%if(begin!=null&&begin.equals("16:00"))out.print("selected='selected'"); %>>16:00</option>
                   <option value="16:30" <%if(begin!=null&&begin.equals("16:30"))out.print("selected='selected'"); %>>16:30</option>
                   <option value="17:00" <%if(begin!=null&&begin.equals("17:00"))out.print("selected='selected'"); %>>17:00</option>
                   <option value="17:30" <%if(begin!=null&&begin.equals("17:30"))out.print("selected='selected'"); %>>17:30</option>
                   <option value="18:00" <%if(begin!=null&&begin.equals("18:00"))out.print("selected='selected'"); %>>18:00</option>	
                   <option value="18:30" <%if(begin!=null&&begin.equals("18:30"))out.print("selected='selected'"); %>>18:30</option>	
                   <option value="19:00" <%if(begin!=null&&begin.equals("19:00"))out.print("selected='selected'"); %>>19:00</option>
                   <option value="19:30" <%if(begin!=null&&begin.equals("19:30"))out.print("selected='selected'"); %>>19:30</option>
                   <option value="20:00" <%if(begin!=null&&begin.equals("20:00"))out.print("selected='selected'"); %>>20:00</option>
                   <option value="20:30" <%if(begin!=null&&begin.equals("20:30"))out.print("selected='selected'"); %>>20:30</option>
                   <option value="21:00" <%if(begin!=null&&begin.equals("21:00"))out.print("selected='selected'"); %>>21:00</option>
                   <option value="21:30" <%if(begin!=null&&begin.equals("21:30"))out.print("selected='selected'"); %>>21:30</option>
                   <option value="22:00" <%if(begin!=null&&begin.equals("22:00"))out.print("selected='selected'"); %>>22:00</option>
                   <option value="22:30" <%if(begin!=null&&begin.equals("22:30"))out.print("selected='selected'"); %>>22:30</option>		
                   <option value="23:00" <%if(begin!=null&&begin.equals("23:00"))out.print("selected='selected'"); %>>23:00</option>
                   <option value="23:30" <%if(begin!=null&&begin.equals("23:30"))out.print("selected='selected'"); %>>23:30</option>
                   <option value="24:00" <%if(begin!=null&&begin.equals("24:00"))out.print("selected='selected'"); %>>24:00</option>
                   <option value="24:00" <%if(begin!=null&&begin.equals("24:30"))out.print("selected='selected'"); %>>24:30</option>
                   </select>
                   </logic:notEqual>
                </td>
                 <td width="15%" align="right" class="td1" nowrap>结束时间：</td>
              <td width="29%" class="td2">&nbsp; 
              <logic:equal property="Schedule/type" value="1">
                 <bean:write property="Schedule/endTime"/>
                   <html:hidden  name="endTime" property="Schedule/endTime"/>
              </logic:equal>         
               <logic:notEqual property="Schedule/type" value="1">   
			    <html:select property="endTime">
			       <option value="01:00" <%if(end!=null&&end.equals("01:00"))out.print("selected='selected'"); %>>01:00</option>
			       <option value="01:30" <%if(end!=null&&end.equals("01:30"))out.print("selected='selected'"); %>>01:30</option>
                   <option value="02:00" <%if(end!=null&&end.equals("02:00"))out.print("selected='selected'"); %>>02:00</option>
                   <option value="02:30" <%if(end!=null&&end.equals("02:30"))out.print("selected='selected'"); %>>02:30</option>
			       <option value="03:00" <%if(end!=null&&end.equals("03:00"))out.print("selected='selected'"); %>>03:00</option>
			       <option value="03:30" <%if(end!=null&&end.equals("03:30"))out.print("selected='selected'"); %>>03:30</option>
                   <option value="04:00" <%if(end!=null&&end.equals("04:00"))out.print("selected='selected'"); %>>04:00</option>
                   <option value="04:30" <%if(end!=null&&end.equals("04:30"))out.print("selected='selected'"); %>>04:30</option>
                   <option value="05:00" <%if(end!=null&&end.equals("05:00"))out.print("selected='selected'"); %>>05:00</option>
                   <option value="05:30" <%if(end!=null&&end.equals("05:30"))out.print("selected='selected'"); %>>05:30</option>
                   <option value="06:00" <%if(end!=null&&end.equals("06:00"))out.print("selected='selected'"); %>>06:00</option>
                   <option value="06:30" <%if(end!=null&&end.equals("06:30"))out.print("selected='selected'"); %>>06:30</option>	
                   <option value="07:00" <%if(end!=null&&end.equals("07:00"))out.print("selected='selected'"); %>>07:00</option>
                   <option value="07:30" <%if(end!=null&&end.equals("07:30"))out.print("selected='selected'"); %>>07:30</option>
                   <option value="08:00" <%if(end!=null&&end.equals("08:00"))out.print("selected='selected'"); %>>08:00</option>
                   <option value="08:30" <%if(end!=null&&end.equals("08:30"))out.print("selected='selected'"); %>>08:30</option>
                   <option value="09:00" <%if(end!=null&&end.equals("09:00"))out.print("selected='selected'"); %>>09:00</option>
                   <option value="09:30" <%if(end!=null&&end.equals("09:30"))out.print("selected='selected'"); %>>09:30</option>
                   <option value="10:00" <%if(end!=null&&end.equals("10:00"))out.print("selected='selected'"); %>>10:00</option>
                   <option value="10:30" <%if(end!=null&&end.equals("10:30"))out.print("selected='selected'"); %>>10:30</option>		
                   <option value="11:00" <%if(end!=null&&end.equals("11:00"))out.print("selected='selected'"); %>>11:00</option>
                   <option value="11:30" <%if(end!=null&&end.equals("11:30"))out.print("selected='selected'"); %>>11:30</option>
                   <option value="12:00" <%if(end!=null&&end.equals("12:00"))out.print("selected='selected'"); %>>12:00</option>
                   <option value="12:30" <%if(end!=null&&end.equals("12:30"))out.print("selected='selected'"); %>>12:30</option>
                   <option value="13:00" <%if(end!=null&&end.equals("13:00"))out.print("selected='selected'"); %>>13:00</option>
                   <option value="13:30" <%if(end!=null&&end.equals("13:30"))out.print("selected='selected'"); %>>13:30</option>
                   <option value="14:00" <%if(end!=null&&end.equals("14:00"))out.print("selected='selected'"); %>>14:00</option>
                   <option value="14:30" <%if(end!=null&&end.equals("14:30"))out.print("selected='selected'"); %>>14:30</option>
			       <option value="15:00" <%if(end!=null&&end.equals("15:00"))out.print("selected='selected'"); %>>15:00</option>
			       <option value="15:30" <%if(end!=null&&end.equals("15:30"))out.print("selected='selected'"); %>>15:30</option>
                   <option value="16:00" <%if(end!=null&&end.equals("16:00"))out.print("selected='selected'"); %>>16:00</option>
                   <option value="16:30" <%if(end!=null&&end.equals("16:30"))out.print("selected='selected'"); %>>16:30</option>
                   <option value="17:00" <%if(end!=null&&end.equals("17:00"))out.print("selected='selected'"); %>>17:00</option>
                   <option value="17:30" <%if(end!=null&&end.equals("17:30"))out.print("selected='selected'"); %>>17:30</option>
                   <option value="18:00" <%if(end!=null&&end.equals("18:00"))out.print("selected='selected'"); %>>18:00</option>	
                   <option value="18:30" <%if(end!=null&&end.equals("18:30"))out.print("selected='selected'"); %>>18:30</option>	
                   <option value="19:00" <%if(end!=null&&end.equals("19:00"))out.print("selected='selected'"); %>>19:00</option>
                   <option value="19:30" <%if(end!=null&&end.equals("19:30"))out.print("selected='selected'"); %>>19:30</option>
                   <option value="20:00" <%if(end!=null&&end.equals("20:00"))out.print("selected='selected'"); %>>20:00</option>
                   <option value="20:30" <%if(end!=null&&end.equals("20:30"))out.print("selected='selected'"); %>>20:30</option>
                   <option value="21:00" <%if(end!=null&&end.equals("21:00"))out.print("selected='selected'"); %>>21:00</option>
                   <option value="21:30" <%if(end!=null&&end.equals("21:30"))out.print("selected='selected'"); %>>21:30</option>
                   <option value="22:00" <%if(end!=null&&end.equals("22:00"))out.print("selected='selected'"); %>>22:00</option>
                   <option value="22:30" <%if(end!=null&&end.equals("22:30"))out.print("selected='selected'"); %>>22:30</option>		
                   <option value="23:00" <%if(end!=null&&end.equals("23:00"))out.print("selected='selected'"); %>>23:00</option>
                   <option value="23:30" <%if(end!=null&&end.equals("23:30"))out.print("selected='selected'"); %>>23:30</option>
                   <option value="24:00" <%if(end!=null&&end.equals("24:00"))out.print("selected='selected'"); %>>24:00</option>
                   <option value="24:00" <%if(end!=null&&end.equals("24:30"))out.print("selected='selected'"); %>>24:30</option>                   		    
			    </html:select>
			    </logic:notEqual>
                </td>
              </tr>
            <tr>
              <td align="right" class="td1">事务概要：</td>
              <td class="td2" >&nbsp;
               <html:text property="Schedule/TASKSUM" maxlength="60"/>*
                </td>
              <td align="right" class="td1">提醒时间：</td>
              <td class="td2">&nbsp;
               <html:text id="Schedule/AWOKETIME[@pattern='yyyy-MM-dd HH:mm:ss']" property="Schedule/AWOKETIME[@pattern='yyyy-MM-dd HH:mm:ss']" value="" attributesText='class="input" size="15"' readonly="true"/>
               <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=dayPopUpCalendarDlg()>
                </td>
            </tr>
            
            <tr>
              <td align="right" class="td1">事务详细：</td>
              <td class="td2"  colspan="3" >&nbsp;
               <textarea name="Schedule/TASKCONTENT" cols="70" maxlength="100"  rows="7"><bean:write property="Schedule/TASKCONTENT"/></textarea> 
                </td>
            </tr>

          </table> </td>
        </tr>
      </table>      
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> </td>
        </tr>
      </table>
      <table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td align="center">   
      <input name="Submit3" type="button" class="button_02" value="修改" onclick="javascript:update();"> 
    </td>
</td></tr>
      </table></td>
  </tr></table>
  <p><font color="#C0C0C0">说明：教学计划时间不能修改</font></p>
</form>
</body>
</html>
<%@ include file="/internet/commonTail.jsp" %>
<script  language="JavaScript">
 var oper='<%=oper%>';
    if(oper==3){
    alert("修改成功！");
    window.parent.location.href = "oa.prPersonOffice.pr_ToViewAllCalendarArrange.do?date=<%=date%>&month=<%=month1%>&rightUsers=<%=rightUsers%>&USERID=<%=USERID%>&year=<%=year%>"; 
  } 
document.forms[0].elements["Schedule/AWOKETIME[@pattern='yyyy-MM-dd HH:mm:ss']"].value = document.forms[0].elements["AWOKETIME"].value
	//保存修改的记录
    function update(){
      if (trim(document.all("Schedule/TASKSUM").value) == "") {
   	      alert("事务概要不能为空！");
   	      return;
      }
      
   	  if(document.all("Schedule/ISREMIND").checked)
   	     document.all("Schedule/ISREMIND").value="1";
   	  else
   	     document.all("Schedule/ISREMIND").value="0";
         opeForm.submit();    	
    }
     

    function resetData(){
    	opeForm.reset();    	
    }
     //替换掉引号和回车换行符
	function turnto(str)
	{
		re1=/\r\n/gi;
		re2=/'/gi;
		re3="<DIV></DIV>"

		str = str.replace(re1,"");
		str = str.replace(re2,"’");
		str = str.replace(re3,"");

		return str;
	}
	//替换回引号
	function turnin(str)
	{
		while(str.indexOf("@@@@@") != -1){
			str = str.substring(0,str.indexOf("@@@@@"))+'"'+str.substring(str.indexOf("@@@@@")+5);
		}
		return str;
	}
</script>