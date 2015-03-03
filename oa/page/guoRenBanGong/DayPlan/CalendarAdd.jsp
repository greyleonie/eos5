<%@ include file="/internet/common.jsp" %>
<!-- Insert your jsp/html code here -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<SCRIPT language="JavaScript" src="/internet/scripts/checkForm.js" ></SCRIPT>
<SCRIPT language="JavaScript" src="/internet/scripts/check.js" ></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
function dayPopUpCalendarDlg(){
 

   var time = document.forms[0].elements["Schedule/AWOKETIME[@pattern='yyyy-MM-dd HH:mm:ss']"].value;
			showx = event.screenX - event.offsetX+10; // + deltaX;
			showy = event.screenY - event.offsetY+10; // + deltaY;
			newWINwidth = 220 + 4 + 18;
			
			retval = window.showModalDialog("oa.prPersonOffice.prCalendar.do", "setTime", "dialogWidth:197px; dialogHeight:235px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
			if( retval!= null ){
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

 <form name="opeForm" method="post" action="oa.prPersonOffice.prDoInsertCalendar.do">
<table width="385px"  border="0" align="center" cellpadding="0" cellspacing="0">
 <input type="hidden" name="is" value="<%=request.getParameter("is")%>"/>
 <input type="hidden" name="page" value="<%=request.getParameter("page")%>"/>
 <input type="hidden" name="Schedule/USERID" value="<%=request.getParameter("USERID")%>"/>
 <input type="hidden" name="year" value="<%=request.getParameter("year")%>"/>
 <input type="hidden" name="month" value="<%=request.getParameter("month")%>"/>
 <input type="hidden" name="USERID" value="<%=request.getParameter("USERID")%>"/>
   <input type="hidden" name="OPERATORNAME" value="<%=request.getParameter("OPERATORNAME")%>"><!--要安排日程人的账号名称默认为登录者-->
   <input type="hidden" name="ARRANGE_NAME" value="<%=request.getParameter("ARRANGE_NAME")%>"/><!--日程安排人的姓名为登录者姓名-->
     <input type="hidden" name="ARRANGE" value="<%=request.getParameter("ARRANGE")%>"/><!--日程安排人的姓名为登录者姓名-->
    
  <tr>
    <td>
    
     
          <table width="385px"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
            <tr>
              <td width="50px" align="right" class="td1" nowrap>日 &nbsp; &nbsp;期</td>
              <td width="135px" class="td2">
              	<html:text property="date" value="<%=request.getParameter("date")%>" attributesText='class="input" size="10" ValidateType="notempty" Msg="时间不能为空"'/>
			<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["date"],"yyyy-MM-dd")> 			
                </td>
                    <td width="50px" align="right" class="td1" nowrap>开始时间</td>
           <td  class="td2 "  width="160px" >
           
              <html:select property="beginTime">
			      <html:option  value="01:00">01:00</html:option>
			       <html:option  value="01:30">01:30</html:option>
                   <html:option value="02:00">02:00</html:option>
                   <html:option value="02:30">02:30</html:option>
			       <html:option  value="03:00">03:00</html:option>
			       <html:option  value="03:30">03:30</html:option>
                   <html:option value="04:00">04:00</html:option>
                   <html:option value="04:30">04:30</html:option>
                   <html:option  value="05:00">05:00</html:option>
                   <html:option  value="05:30">05:30</html:option>
                   <html:option value="06:00">06:00</html:option>
                   <html:option value="06:30">06:30</html:option>	
                   <html:option  value="07:00">07:00</html:option>
                   <html:option  value="07:30">07:30</html:option>
                   <html:option value="08:00">08:00</html:option>
                   <html:option value="08:30">08:30</html:option>
                   <html:option  value="09:00">09:00</html:option>
                   <html:option  value="09:30">09:30</html:option>
                   <html:option value="10:00">10:00</html:option>
                   <html:option value="10:30">10:30</html:option>		
                   <html:option  value="11:00">11:00</html:option>
                   <html:option  value="11:30">11:30</html:option>
                   <html:option value="12:00">12:00</html:option>
                   <html:option value="12:30">12:30</html:option>
                   <html:option  value="13:00">13:00</html:option>
                   <html:option  value="13:30">13:30</html:option>
                   <html:option value="14:00">14:00</html:option>
                   <html:option value="14:30">14:30</html:option>
			       <html:option  value="15:00">15:00</html:option>
			       <html:option  value="15:30">15:30</html:option>
                   <html:option value="16:00">16:00</html:option>
                   <html:option value="16:30">16:30</html:option>
                   <html:option  value="17:00">17:00</html:option>
                   <html:option  value="17:30">17:30</html:option>
                   <html:option value="18:00">18:00</html:option>	
                   <html:option value="18:30">18:30</html:option>	
                   <html:option  value="19:00">19:00</html:option>
                   <html:option  value="19:30">19:30</html:option>
                   <html:option value="20:00">20:00</html:option>
                   <html:option value="20:30">20:30</html:option>
                   <html:option  value="21:00">21:00</html:option>
                   <html:option  value="21:30">21:30</html:option>
                   <html:option value="22:00">22:00</html:option>
                   <html:option value="22:30">22:30</html:option>		
                   <html:option  value="23:00">23:00</html:option>
                   <html:option  value="23:30">23:30</html:option>
                   <html:option value="24:00">24:00</html:option>
                   <html:option value="24:00">24:30</html:option>                		    
			    </html:select>
                <SPAN>至</SPAN>
                <html:select property="endTime">
			       <html:option  value="01:00">01:00</html:option>
			       <html:option  value="01:30">01:30</html:option>
                   <html:option value="02:00">02:00</html:option>
                   <html:option value="02:30">02:30</html:option>
			       <html:option  value="03:00">03:00</html:option>
			       <html:option  value="03:30">03:30</html:option>
                   <html:option value="04:00">04:00</html:option>
                   <html:option value="04:30">04:30</html:option>
                   <html:option  value="05:00">05:00</html:option>
                   <html:option  value="05:30">05:30</html:option>
                   <html:option value="06:00">06:00</html:option>
                   <html:option value="06:30">06:30</html:option>	
                   <html:option  value="07:00">07:00</html:option>
                   <html:option  value="07:30">07:30</html:option>
                   <html:option value="08:00">08:00</html:option>
                   <html:option value="08:30">08:30</html:option>
                   <html:option  value="09:00">09:00</html:option>
                   <html:option  value="09:30">09:30</html:option>
                   <html:option value="10:00">10:00</html:option>
                   <html:option value="10:30">10:30</html:option>		
                   <html:option  value="11:00">11:00</html:option>
                   <html:option  value="11:30">11:30</html:option>
                   <html:option value="12:00">12:00</html:option>
                   <html:option value="12:30">12:30</html:option>
                   <html:option  value="13:00">13:00</html:option>
                   <html:option  value="13:30">13:30</html:option>
                   <html:option value="14:00">14:00</html:option>
                   <html:option value="14:30">14:30</html:option>
			       <html:option  value="15:00">15:00</html:option>
			       <html:option  value="15:30">15:30</html:option>
                   <html:option value="16:00">16:00</html:option>
                   <html:option value="16:30">16:30</html:option>
                   <html:option  value="17:00">17:00</html:option>
                   <html:option  value="17:30">17:30</html:option>
                   <html:option value="18:00">18:00</html:option>	
                   <html:option value="18:30">18:30</html:option>	
                   <html:option  value="19:00">19:00</html:option>
                   <html:option  value="19:30">19:30</html:option>
                   <html:option value="20:00">20:00</html:option>
                   <html:option value="20:30">20:30</html:option>
                   <html:option  value="21:00">21:00</html:option>
                   <html:option  value="21:30">21:30</html:option>
                   <html:option value="22:00">22:00</html:option>
                   <html:option value="22:30">22:30</html:option>		
                   <html:option  value="23:00">23:00</html:option>
                   <html:option  value="23:30">23:30</html:option>
                   <html:option value="24:00">24:00</html:option>
                   <html:option value="24:00">24:30</html:option>		                   		    
			    </html:select>
                 </td>
            </tr>
          
             
           <tr>
              <td align="right" class="td1">事务概要</td>
              <td class="td2"  colspan="3">
                <input name="Schedule/TASKSUM" type="text" class="" size="45" maxlength="60" isNeed>
                </td>
           </tr>
           <tr>
         
              <td align="right" class="td1">事务详细</td>
              <td colspan="3" class="td2">
                <html:textarea  name="Schedule/TASKCONTENT" attributesText='isneed="true" msg="事务详细不能为空" cols="44" rows="4" size="40"'/>

                </td>
            </tr>
            <tr>
            <td align="right" class="td1" > <input id="Schedule/ISREMIND" name="Schedule/ISREMIND" type="checkbox" onclick="getTx()" class="" value="0" >提醒</td>
              <td class="td2" >
              <span id="txDate"></span>
             
              </td>
              <td align="right" class="td1"><input id="Schedule/IsOut" name="Schedule/IsOut" type="checkbox" onclick="getOut()" value="0">外出</td>
            <td class="td2">
           <span id="endDate"></span>
           <SPAN id="IsWt" style="display:none"><input id="Schedule/IsWt" name="Schedule/IsWt" type="button" value="委 托" class="button_02" onclick="WeiTuo()"></SPAN>
            </td>
           
           </tr>
          
          </table> </td>
        </tr>
      </table>      
 
      <table width="90%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td align="center">   
      <input name="Submit3" type="button" class="button_03" value="保存" onclick="javascript:insertReturn();"> 
     </td></tr>
      </table></td>
  </tr></table>
</form>
</body>
<%@ include file="/internet/commonTail.jsp" %>
<script  language="JavaScript">

   var oper='<%=oper%>';
    if(oper==1){
    alert("保存成功！");
    window.parent.location.href = "oa.prPersonOffice.pr_ToViewAllCalendarArrange.do?date=<%=date%>&month=<%=month1%>&rightUsers=<%=rightUsers%>&USERID=<%=USERID%>&year=<%=year%>"; 
  } 


 	//保存增加的记录
    function insertReturn(){
   	   var frm = document.forms[0];
   	   frm.target="";
   	   if(checkForm(frm) ==false) return;
   	   
   	   if (trim(document.all("Schedule/TASKSUM").value) == "") {
   	      alert("事务概要不能为空！");
   	      return;
       }
       if(document.all("Schedule/ISREMIND").checked)
       {
   	   document.all("Schedule/ISREMIND").value="1";
   	   }
   	   else{   	   
   	   document.all("Schedule/ISREMIND").value="0";
   	   }
	   if(document.all("Schedule/IsOut").checked){
		   if(document.all("Schedule/endDate[@pattern='yyyy-MM-dd']").value==''){
		   		alert("外出结束时间不能为空！");
				return;
		   }
		   
		   	var beginTime = '<%=request.getParameter("date")%>';
			var endTime = document.all("Schedule/endDate[@pattern='yyyy-MM-dd']").value;
			if(CompareDate(beginTime,endTime)){
				alert("外出结束时间不能小于日程安排日期，请重新输入！");
				return;
			}
		}
	

	   
       frm.submit();    	
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
	
	function getOut(){
		if(document.all("Schedule/IsOut").checked){
			document.all("Schedule/IsOut").value="1";
			;
			document.getElementById("endDate").innerHTML = '<html:text property="Schedule/endDate[@pattern='yyyy-MM-dd']"  readonly="true" attributesText='class="input" size="10"' /> <img src="image/date.gif"  height="20" align="absmiddle" onClick="selDate()">';
			document.getElementById("IsWt").style.display = '';
		}
		else {
			document.all("Schedule/IsOut").value="0";
	
			document.getElementById("endDate").innerHTML = '';
			document.getElementById("IsWt").style.display = 'none';
		}
	}
	function getTx(){
		if(document.all("Schedule/ISREMIND").checked){
			document.all("Schedule/ISREMIND").value="1";
			
			document.getElementById("txDate").innerHTML = '<html:text id="Schedule/AWOKETIME[@pattern='yyyy-MM-dd HH:mm:ss']" property="Schedule/AWOKETIME[@pattern='yyyy-MM-dd HH:mm:ss']" value="<%=request.getParameter("date")+" 09:00:00"%>" attributesText='class="input" size="15"' readonly="true"/> <img src="/internet/image/date.gif" height="20" align="absmiddle" onClick=dayPopUpCalendarDlg()>';
			
		}
		else {
			document.all("Schedule/ISREMIND").value="0";
			
			document.getElementById("txDate").innerHTML = '';
			
		}
	}
	function WeiTuo(){
		if(document.all("Schedule/endDate[@pattern='yyyy-MM-dd']").value==''){
			alert("外出结束时间不能为空！");
			return;
		}
		
		var beginTime = '<%=request.getParameter("date")%>';
		var endTime = document.all("Schedule/endDate[@pattern='yyyy-MM-dd']").value;
		if(CompareDate(beginTime,endTime)){
			alert("外出结束时间不能小于日程安排日期，请重新输入！");
			return
		}
		
		var url = "oa.prwfAgent.addAgent.do?IsWt=1&currentDate="+ beginTime +"&endTime="+endTime;
		var width = 800;
		var height = 400;
		var xposition = (screen.width-width)/2;
		var yposition = (screen.height-height-25)/2;
		window.open(url,'委托','height='+height+',width='+width+',left='+ xposition +',top='+ yposition +',toolbar=no,menubar=no,scrillbars=no,resizable=no,location=no,status=no');

	}
	
	function WeituoView(){
		var url = "oa.prwfAgent.agent.do?PageCond";
		var width = 800;
		var height = 400;
		var xposition = (screen.width-width)/2;
		var yposition = (screen.height-height-25)/2;
		window.open(url,'委托','height='+height+',width='+width+',left='+ xposition +',top='+ yposition +',toolbar=no,menubar=no,scrillbars=no,resizable=no,location=no,status=no');
		
	}
	
	function selDate(){
		calendar(document.forms[0].elements["Schedule/endDate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd");
	}
	
	function CompareDate(d1,d2){
   		return ((new Date(d1.replace(/-/g,"\/"))) > (new Date(d2.replace(/-/g,"\/"))));
	}
</script>