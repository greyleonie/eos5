<%@ include file="/internet/common.jsp" %>
<!-- Insert your jsp/html code here -->
 <%
         com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);
         String USERACCOUNT=reqContext.getEntityValue("operatorName");//�û��˺�
         //String ArrangeMan=reqContext.getEntityValue("ArrangeMan");//�ճ̰�����
         String id =reqContext.getEntityValue("SessionEntity/operatorID");//�û��ƺ�;

%>

<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0">


<body>

<form name="opeForm" method="post" action="oa.prPersonOffice.pr_ToUpdateCalendarArrange.do"> 
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
<html:hidden property="Schedule/ScheduleID"/>
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
              <td width="15%" align="right" class="td1" nowrap     >�� &nbsp; &nbsp;�ڣ�</td>
              <td width="29%" class="td2" nowrap>&nbsp;
                
                <bean:write property="Schedule/CALENDAR"  formatType="yyyy��MM��dd��" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
                </td>
              <td align="right" class="td1"  nowrap>�ճ����ˣ�</td>
              <td class="td2" nowrap>&nbsp; <%=USERACCOUNT%></td>
            </tr>
            <tr>
              <td align="right" class="td1" nowrap>�� &nbsp; &nbsp;�ѣ�</td>
              <td class="td2"  nowrap>
                <logic:equal property="Schedule/ISREMIND" value="1">&nbsp; ��Ҫ
                </logic:equal>
                <logic:equal property="Schedule/ISREMIND" value="0">&nbsp; ����Ҫ
                </logic:equal>
              </td>
              <td align="right" class="td1" nowrap>����ʱ�䣺</td>
              <td class="td2" nowrap>&nbsp;
                <bean:write property="Schedule/AWOKETIME" formatType="yyyy-MM-dd HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>
                </td>
            </tr>
            <tr>

              <td align="right" class="td1" nowrap>�����Ҫ��</td>
              <td class="td2" colspan="3" >&nbsp;
                <bean:write property="Schedule/TASKSUM"/>
              </td>
            </tr>
            <tr>

              <td align="right" class="td1">������ϸ��</td>
              <td class="td2" colspan="3" nowrap>&nbsp;
                <bean:write property="Schedule/TASKCONTENT"  /></td>
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