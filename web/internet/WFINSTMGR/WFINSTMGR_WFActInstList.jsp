<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<html>
    <head><title>wfactinstList</title>
<script language="JavaScript">
<!--
function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}
//-->
</script>
<%
String showWhich=request.getParameter("showWhich");
    	//System.out.println("showWhich in actinstList is:"+showWhich);
    if(showWhich==null)
    	 showWhich="1";
%>
</head>
<display:pageHead bodyColor="#EEEEEE"/>

<form name="queryForm"  method="post">
<display:resultHead  title="��б�"/>
<!--�б���Ϣ��ʾ-->       

        <html:hidden   property="PageCond/begin"/>
        <html:hidden   property="PageCond/length"/>
        <html:hidden   property="PageCond/count"/>
<script>
	var myPage = new page();
	myPage.init("queryForm", "PageCond/begin", "PageCond/length", "PageCond/count");
</script>
<table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="border-collapse: collapse">
   <tr class="tableHeadTR">                    	
    <td width="4%" nowrap >�ID</td>            	
    <td width="6%" nowrap >���� </td>       	
    <td width="5%" nowrap >���� </td>          	
    <td width="4%" nowrap >״̬</td>           	
    <td width="4%" nowrap>�Ƿ�ʱ</td>      
    <!--     	
    <td width="4%" nowrap >���ȼ�</td>     
    -->	    	
    <td width="4%" nowrap >����ʵ��ID</td>     	   	
    <td width="16%" nowrap>��ʼʱ��</td>       	
    <td width="16%" nowrap>���ʱ��</td>   	
   </tr>
     <% int flag =0;%>
     <logic:iterate id="ResultSet" property="list[@name='actInst2']">
   <tr class="<%=flag%2==1?"tableContentTR":"tableContentTR"%>" align="center">    
    <td width="4%" nowrap ><bean:write id="ResultSet" property="WFActivityInstView/activityInstID"/></td>  
    <td width="6%" nowrap>        
   	<a href="WFINSTMGR.pr_automata.WFINSTMGR_P_preShowActivityDetial.do?<%if (showWhich!=null){%>&WFActivityInstView/showWhich=<%=showWhich%><%}%>&WFActivityInstView/activityInstID=<bean:write id="ResultSet" property="WFActivityInstView/activityInstID"/>&WFActivityInstView/processInstID=<bean:write id="ResultSet" property="WFActivityInstView/processInstID"/>" ><bean:write id="ResultSet" property="WFActivityInstView/activityInstName"/></a>
    </td>
    <td width="5%"><dict:write id="ResultSet" businTypeId="WFDICT_ActivityType" property="WFActivityInstView/activityType" /></td>
    <td width="4%"><dict:write id="ResultSet" businTypeId="WFDICT_ActivityState" property="WFActivityInstView/currentState" /></td>
    <td width="4%"><dict:write id="ResultSet" businTypeId="WFDICT_YN" property="WFActivityInstView/isTimeOut" /></td>
    <!--
    <td width="4%"><dict:write id="ResultSet" businTypeId="WFDICT_Priority" property="WFActivityInstView/priority"/></td>
    -->
    <td width="4%"><bean:write id="ResultSet" property="WFActivityInstView/processInstID"/></td> 
    <td width="16%"><bean:write id="ResultSet" property="WFActivityInstView/startTime"  formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td> 
    <td width="16%"><bean:write id="ResultSet" property="WFActivityInstView/endTime"   formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>                         
   </tr>
    <% 	flag++;  %>
    </logic:iterate>
</table>

<display:resultTail/>
</form>
<table border="0" width="100%">    
       <tr>                          
	   <td colspan="10" align="right" class="detailLabelTD">  
           <logic:present property="PageCond/begin">
           <!--
            <a href="javascript:myPage.previousPage();"><img src="/internet/theme/style0/prevpage.gif" width="48" height="18" border="0" align="absbottom"></a> 
              <a href="javascript:myPage.nextPage();">
            <img src="/internet/theme/style0/nextpage.gif" border="0" align="absbottom" width="48" height="19"></a> 
              ��<script>document.write(myPage.current)</script>ҳ/��<script>document.write(myPage.total)</script>ҳ
              -->
              <script>myPage.printPageCode(<%=flag%>)</script>
           </logic:present>
         </td>
      </tr>
	  </table>  
<display:pageTail/></HTML>
