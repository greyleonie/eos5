<%@ include file="/internet/common.jsp" %>
<!-- Insert your jsp/html code here -->
 <%
         com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);
         String USERACCOUNT=reqContext.getEntityValue("operatorName");//�û��˺�
         //String ArrangeMan=reqContext.getEntityValue("ArrangeMan");//�ճ̰�����
         String id =reqContext.getEntityValue("SessionEntity/operatorID");//�û��ƺ�;
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
               <td align="right" class="td1" width="15%" nowrap>�����Ҫ��</td>
              <td class="td2" colspan="3" width="29%" >&nbsp;
                <bean:write property="Schedule/TASKSUM"/>
              </td>
            </tr>
            <tr>
              <td  align="right" class="td1" nowrap >ʱ&nbsp;&nbsp;&nbsp;&nbsp;�䣺</td>
              <td  class="td2" nowrap>&nbsp;
                 <bean:write property="Schedule/CALENDAR"  formatType="yyyy��MM��dd��" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />      
                <bean:write property="Schedule/beginTime"  formatType="HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
                ��
                <bean:write property="Schedule/endTime"  formatType="HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
              </td>
            </tr>
            <tr>

              <td align="right" class="td1">������ϸ��</td>
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
	//�����޸ĵļ�¼
    function update(){
   	opeForm.submit();    	
    }
     

    function resetData(){
    	opeForm.reset();    	
    }
     //�滻�����źͻس����з�
	function turnto(str)
	{
		re1=/\r\n/gi;
		re2=/'/gi;
		re3="<DIV></DIV>"

		str = str.replace(re1,"");
		str = str.replace(re2,"��");
		str = str.replace(re3,"");

		return str;
	}
	//�滻������
	function turnin(str)
	{
		while(str.indexOf("@@@@@") != -1){
			str = str.substring(0,str.indexOf("@@@@@"))+'"'+str.substring(str.indexOf("@@@@@")+5);
		}
		return str;
	}
</script>