<%@ include file="/internet/common.jsp" %>
<%@ page  import="java.util.*,java.text.*"%>

<!-- Insert your jsp/html code here -->
 <%
   com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);

  %>
<%String USERACCOUNT = reqContext.getEntityValue("SessionEntity/operatorID");
  String OPERATORNAME = reqContext.getEntityValue("SessionEntity/userName");
  String year = reqContext.getEntityValue("year");
  String month = reqContext.getEntityValue("month");
  String fid=request.getParameter("fid");
  String pd=request.getParameter("pd");
%>

<SCRIPT language="JavaScript" src="/internet/scripts/checkForm.js" ></SCRIPT>
<SCRIPT language="JavaScript" src="/internet/scripts/check.js" ></SCRIPT>
<script type="text/javascript">
window.onload = function(){
 var pd="<%=pd%>";

 if(pd=="oneView")
 {
   document.all.calendarFrame.src="oa.prPersonOffice.pr_ToViewCalendarArrange.do?pd=oneView&fid=<%=fid%>";
 }else if(pd=="add"){
 prepareInsert('add','');
 }

}
//-->
</script>

<body style="overflow:auto">

<form name="queryForm" method="post" action="oa.prPersonOffice.pr_ToViewAllCalendarArrange.do">
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <input type="hidden" name="is" value="1"/>
 	    <html:hidden property="PageCond/begin" />
	    <html:hidden property="PageCond/length" />
	    <html:hidden property="PageCond/count" />
        <input type="hidden" name="date" value="<%=request.getParameter("date")%>"/>
        <input type="hidden" name="USERID" value="<%=USERACCOUNT%>"/>
        <input type="hidden" name="OPERATORNAME" value="<%=OPERATORNAME%>"><!--要安排日程人的账号名称默认为登录者-->
        <input type="hidden" name="year" value="<%=year%>"/>
        <input type="hidden" name="month" value="<%=month%>"/>
        <html:hidden property="Schedule/_order/col1/field" value="CALENDAR"/>
        <html:hidden property="Schedule/_order/col1/asc" value="desc"/>
         <%String date=request.getParameter("date"); %>
         
         <%String year1=request.getParameter("year");
           String month1=request.getParameter("month");
           String USERID=request.getParameter("USERID");
           String rightUsers=request.getParameter("rightUsers");
          
          %>
  <tr>
    <td align="right">
   
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr >
          <td align="right" class="text"><table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="25%" align="right" class="text">&nbsp;</td>
              <td width="100%" align="right" nowrap>
              <table width="293"  border="0" cellspacing="0" cellpadding="0">
                <tr nowrap>
                  <td width="9"></td>
                  <td align="center"  nowrap>
                      <input name="Submit22" type="button" class="button_02" value="新 增" onclick="javascript:prepareInsert('add','');"> 
                     <input name="Submit2" type="button" class="button_02" value="删 除"  onclick="javascript:deleteRows();">
                   <input name="Submit4" type="button" class="button_02" value="查看"  onclick="javascript:oneview();"> 
                   <input name="Submit4" type="button" class="button_02" value="切换视图"  onclick="window.location.href='oa.prPersonOffice.prQueryCalendarArrange.do?year=&month=&menuID=DX_OASYS_WORK_DAYPLAN';"> 
                 </td>
                  <td width="9"></td>
                </tr>
              </table>
              </td>
            </tr>
          </table>            </td>
        </tr>
        <tr>
          <td height="1" bgcolor="#BCBCBC"> </td>
        </tr>
      </table>
      <table width="100%" height="15"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
      <tr class="td2">教学安排：<IMG src="/internet/images/jiaoxue.gif"/>，日程安排：<IMG src="/internet/images/rili.gif"/></tr>
          <tr class="td_title">
          <td width="10%" >&nbsp;<input type="checkbox" onclick="eosCheckAll(document.queryForm,this)">选择</td>
          <td width="14%" align="center" nowrap id="dataEntity.me1" onClick="talentsort()">日期</td>
          <td width="20%" align="center" nowrap id="dataEntity.me2" onClick="talentsort()" >事务概要</td>
          <td width="8%" align="center" nowrap id="dataEntity.me3" onClick="talentsort()" >开始时间</td>
          <td width="8%" align="center" nowrap id="dataEntity.me4" onClick="talentsort()" >结束时间</td>
          
          <td width="14%" align="center" >修改</td>
          </tr>
		           <%
		             int countPage=0;
		     		 String resultShowLen = request.getParameter("PageCond/length");
		     		 String resultCount = reqContext.getEntityValue("PageCond/count");
		     		 String begin = reqContext.getEntityValue("PageCond/begin");
		     		 if(resultCount==null)
		     		    resultCount="0";//总记录数;
			         if(resultShowLen==null)
			         	resultShowLen="10";//每页记录数;
		 		
			         int count=0;
			         String trClass = "td1"; 
			         
			         int changdu = Integer.parseInt(resultShowLen);
			         int zong = Integer.parseInt(resultCount);
			         if(zong%changdu==0)
			          
			           countPage = zong/changdu;
			          else
			          countPage = zong/changdu+1;
			          if(countPage == 0)
			          countPage=1;
			          if(resultCount==null)
			          countPage=0;
			        %>
		            <logic:iterate id="ResultSet" property="list"  >
		            <%
		             
			       	if(count%2==0)
			       	    trClass = "td2";
			       	else
			       	    trClass = "td1";
			       	count++;
			       %>
			       
 		            <tr class="<%=trClass%>"  onclick="changeTRBgColor(this)" 
		             ondblclick="javascript:view('<bean:write id="ResultSet" property="Schedule/ScheduleID"/>');"
		              >        
		                <td nowrap>
		                	<logic:present  id="ResultSet" property="Schedule/ScheduleID">
		                    	&nbsp;<html:checkbox name="list[@name='update']/Schedule/ScheduleID" id="ResultSet" property="Schedule/ScheduleID" indexed="true"/>
		                    </logic:present>	
		                    <logic:equal id="ResultSet" property="Schedule/type" value="1"><IMG src="/internet/images/jiaoxue.gif"/></logic:equal>
		                    <logic:notEqual id="ResultSet" property="Schedule/type" value="1"><IMG src="/internet/images/rili.gif"/></logic:notEqual>
		                </td>     
		                <td nowrap align="center">
		                	<bean:write id="ResultSet" property="Schedule/CALENDAR" maxLength="10"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>
		                </td>  
		                <td nowrap align="center"  title="日程安排内容:<bean:write id="ResultSet" property="Schedule/TASKCONTENT" maxLength="40" />">
		                	<bean:write id="ResultSet" property="Schedule/TASKSUM" maxLength="40"  />
		                </td>
		                <td nowrap align="center">
		                	<bean:write id="ResultSet" property="Schedule/beginTime" formatType="HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>
		                </td>
		                 <td nowrap align="center">
		                	<bean:write id="ResultSet" property="Schedule/endTime" formatType="HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>
		                </td>
		               <td align="center" nowrap>

                       <a href="#" onclick="javascript:prepareInsert('xg','<bean:write id="ResultSet" property="Schedule/ScheduleID"/>');">&nbsp;修&nbsp;改&nbsp;</a>
                       </td>

		            </tr>
		          
		            </logic:iterate>
		             <logic:iterate id="ResultSet" property="list"  >
		             
		             <logic:notEqual id="ResultSet" property="Schedule/changeTime" value="">
		              <tr class="td2" > <td colspan="6" nowrap align="left" style="color: red"><bean:write id="ResultSet" property="Schedule/changeTime"/></td></tr>
		              </logic:notEqual>
		              <logic:notEqual id="ResultSet" property="Schedule/changeRoom" value="">
		            <tr class="td2" ><td colspan="6" nowrap align="left" style="color: red"><bean:write id="ResultSet" property="Schedule/changeRoom"/></td></tr>
		            </logic:notEqual>
		            </logic:iterate>
	          <%int last = countPage*changdu-changdu;
	            int top = Integer.parseInt(begin)-changdu;
	            if(top<0) top = 0;
	            int next = Integer.parseInt(begin)+changdu;
	            if(next>last)
	            next = last;
	            int isPage =(int)(Integer.parseInt(begin)/10)+1;
	          %>
	          
                  
     </table>
      
      <table width="96%" height="15"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="td2">
        <tr  nowrap>
          <td>          			  <Script language="JavaScript">
                PageCond(queryForm);
             </Script></td>
        </tr>
      </table>
      </td>
  </tr></table>
</form>
 <iframe src="#" name="calendarFrame" frameborder="0" align="center" width="100%" height="100%" scrolling="no"></iframe>
 
</body>


<!------------------------------------>
<script  language="JavaScript">
//................................
    function goToUrl(url) {
       window.location.href = url;
    }

    function checkNumber(){
   
    var num="0123456789";
    
    var la = "<%=last%>";
    
    var tex = document.all["textfield2"].value;
    for(var i = 0 ;i<tex.length;i++){
    if(num.indexOf(tex.charAt(i))==-1){
      alert("请输入数字");
      document.all["textfield2"].value="";
      return;
     }
    }
    
    var frm = document.queryForm;
    document.all["PageCond/begin"].value= tex*10-10;
    if(document.all["PageCond/begin"].value>la)
    document.all["PageCond/begin"].value=la;
    
    
    frm.submit();
    
    }
 //.......................................
    function first(){
    var frm = document.queryForm;
    document.all["PageCond/begin"].value="0";
    frm.submit();
    
    }
    function last(){
    var frm = document.queryForm;
    document.all["PageCond/begin"].value ="<%=last%>";
    frm.submit();
    
    }
    function top(){
    var frm = document.queryForm;
    document.all["PageCond/begin"].value ="<%=top%>";
    frm.submit();
    
    }
     
   function next(){
    var frm = document.queryForm;
    document.all["PageCond/begin"].value ="<%=next%>";
    frm.submit();
    
    }
    

	function query(){
	    
    	var frm = document.queryForm;
    	if(checkForm(frm)==false) return;
    	frm.elements["TOOLS_CALENDARARRANGE/CUSTOMER[@criteria='like']"].value="";
    	frm.elements["TOOLS_CALENDARARRANGE/CUSTOMER[@criteria='like']"].value=frm.elements["CUSTOMER"].value;
    	if(frm.elements["TOOLS_CALENDARARRANGE/CUSTOMER[@criteria='like']"].value!="")
		frm.elements["TOOLS_CALENDARARRANGE/CUSTOMER[@criteria='like']"].value="%"+cTrim(frm.elements["TOOLS_CALENDARARRANGE/CUSTOMER[@criteria='like']"].value,0)+"%";

     	frm.action="oa.prPersonOffice.CardQuery.do";
     	document.all["PageCond/begin"].value ="0";	
    	frm.submit();    	
    }
    function prepareInsert(obj,id){
    	
    	if(obj=="add"){    	
    	
    	<%String date1=null;
    	if(date=="0"||date.equals("0")){
    	        
                date1=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
             }
    	%>
    	document.all.calendarFrame.src="oa.prPersonOffice.pr_ToAddCalendarArrange.do?date=<%if(date=="0"||date.equals("0"))out.print(date1);else out.print(date);%>&year=<%=year1 %>&month=<%=month1 %>&USERID=<%=USERID %>&rightUsers=<%=rightUsers %>";
    	}
    	else if(obj=="xg"){
    
    	var frm = document.queryForm;
    	document.all.calendarFrame.src="oa.prPersonOffice.pr_ToUpdateCalendarArrange.do?date=<%=date%>&year=<%=year1 %>&month=<%=month1 %>&USERID=<%=USERID %>&rightUsers=<%=rightUsers %>&Schedule/ScheduleID="+id;
    	}

    	
    }
    


    
    function prepareUpdateRow(){
    	var frm =document.queryForm;
    	if(selectedCheckboxCount(frm) < 1){
    		alert("必须选择一行！");
    		return ;
    	}else if(selectedCheckboxCount(frm) > 1){
    	    alert("只能选择一行, 不允许多选！");
    	    return ;
    	}
    	

    	frm.action="oa.prPersonOffice.pr_ToUpdateCalendarArrange.do";
    	frm.submit();    
    } 
    
      function view(id){
    
    	document.all.calendarFrame.src="oa.prPersonOffice.pr_ToView1CalendarArrange.do?DBCLK=1&DBCLICK/Schedule/ScheduleID="+id;
    	   
    } 
       
      function oneview(){
        var frm =document.queryForm;
    	if(selectedCheckboxCount(frm) < 1){
    		alert("必须选择一行！");
    		return ;
    	}else if(selectedCheckboxCount(frm) > 1){
    	    alert("只能选择一行, 不允许多选！");
    	    return ;
    	}
    	var i=0;
    	
    	while(document.forms[0].elements["list[@name='update']/Schedule[@hciTagIndex='"+i+"']/ScheduleID"]!=null){
    	  var s=document.forms[0].elements["list[@name='update']/Schedule[@hciTagIndex='"+i+"']/ScheduleID"]
    	  if(s.checked==true){
    	    document.all.calendarFrame.src="oa.prPersonOffice.pr_ToView1CalendarArrange.do?DBCLK=1&DBCLICK/Schedule/ScheduleID="+s.value;
    	  }
    		i++;
    	}
 
      }

    
    function deleteRows(){
      
    	var frm = document.queryForm;
   		if(selectedCheckboxCount(frm)<1){
    		alert("至少必须选择一行！");
    		return ;
    	}
    	
    	if(confirm("是否确定删除指定记录？")==false){
			return ;
		}    	 
    	frm.action="oa.prPersonOffice.prDoDeleteCalendar.do";
    	
    	frm.submit();
    }
    
    
	//1.清除表格中的数据(0.0、0)
	//2.如果cell中没有数据，则自动加上一个空格(对列排序有用)
   	//clear_table(false);
   	function loadOrderPic(theform,dowpic,uppic){
		var myForm = theform;
		 if(myForm.elements["Order/col1"].value==null||myForm.elements["Order/col1"].value=="") myForm.elements["Order/col1"].value = "ENDTIME";
		 if(myForm.elements["Order/col1/@order"].value==null||myForm.elements["Order/col1/@order"].value=="") myForm.elements["Order/col1/@order"].value="ASC";
		 var curObj = eval(myForm.elements["Order/col1"].value);
		 var orderType = myForm.elements["Order/col1/@order"].value;
		
		if(document.all){
		  
		   
			if(orderType=="ASC"||orderType=="asc"){
				curObj.innerHTML+= "<img src='"+dowpic+"'>";
			}else{
				curObj.innerHTML+= "<img src='"+uppic+"'>";
			}
		
		}
	
	
	
	}
    
	//loadOrderPic(queryForm,"/internet/images/orderup.gif","/internet/images/orderdown.gif");
</script>