<%@ include file="/internet/common.jsp" %>
<!-- Insert your jsp/html code here -->
 <%
         com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);
         String USERACCOUNT=reqContext.getEntityValue("operatorName");//用户账号
         //String ArrangeMan=reqContext.getEntityValue("ArrangeMan");//日程安排人
         String id =reqContext.getEntityValue("SessionEntity/operatorID");//用户财号;
         String content=reqContext.getEntityValue("Schedule/TASKCONTENT");

%>

<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">


<body>

<form name="opeForm" method="post" action="oa.prPersonOffice.pr_ToUpdateCalendarArrange.do"> 
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
<html:hidden property="Schedule/ScheduleID"/>
  <tr>
    <td>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
       
          <table width="88%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
            <tr>
               <td align="right" class="td1" width="15%" nowrap>事务概要：</td>
              <td class="td2" colspan="3" width="29%" >&nbsp;
                <bean:write property="Schedule/TASKSUM"/>
              </td>
            </tr>
            <tr>
              <td  align="right" class="td1" nowrap >时&nbsp;&nbsp;&nbsp;&nbsp;间：</td>
              <td  class="td2" nowrap>&nbsp;
                 <bean:write property="Schedule/CALENDAR"  formatType="yyyy年MM月dd日" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />      
                <bean:write property="Schedule/beginTime"  formatType="HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
                至
                <bean:write property="Schedule/endTime"  formatType="HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
              </td>
            </tr>
            <tr>

              <td align="right" class="td1">事务详细：</td>
              <td class="td2" colspan="3" nowrap>&nbsp;
            <%
            String contentStr="";
            if(content!=null&&content!=""){
            if(content.length()<28){
                out.print(content);
              }else{
               int i= content.length()/28;
               for(int j=1;j<=i;j++){
                   contentStr+=content.substring((j-1)*28,j*28)+"<br>";
                   
                }
                contentStr=contentStr+content.substring(i*28);
                  out.print(contentStr);
              }
              }
            %>
               </td>
                </tr>

          </table> </td>
        </tr>
      </table>      
      </td>
  </tr></table>
</form>
</body>
<%@ include file="/internet/commonTail.jsp" %>
<script  language="JavaScript">
	//保存修改的记录
    function update(){
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