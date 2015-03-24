<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
   <html>
    <head><title>wfactinstList</title>
    </head>
   <%
    	String showWhich=request.getParameter("showWhich");
     %>
      <script  language="JavaScript">
      
      function reassignWorkItem(){ 
      if(document.queryForm.state.value=="7"||document.queryForm.state.value=="8"||document.queryForm.state.value=="11"||document.queryForm.state.value=="12"||document.queryForm.state.value=="13"){
      	alert("该状态下的工作项不可改派!");
      }else
       
      if(document.queryForm.state.value=="4"){
      	alert("状态为\"待接受\"的工作项不可改派!");
      }else
      if(confirm("确实要改派该工作吗？")){
     	location="WFINSTMGR.pr_automata.WFINSTMGR_P_preReassignWorkItem.do?WorkItemID=<bean:write property="list[@name='wi']/WFWorkItemView/workItemID"/>&WFActivityInstView/activityInstID=<bean:write  property="list[@name='wi']/WFWorkItemView/activityInstID"/>";
     	//document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_preReassignWorkItem.do";
     	//document.queryForm.submit(); 
     	}else{
     	
     	}
      }

     function backtoActivitylist(){
     	document.queryForm.action="<%if (showWhich.equals("0")){%>WFINSTMGR.pr_automata.WFINSTMGR_P_QueryProcessActivityInstTab.do?showWhich=0&processInstID=<bean:write property="processInstID"/><%}if(showWhich.equals("1")){%>WFINSTMGR.pr_automata.WFINSTMGR_P_QueryActivityInstances.do?showWhich=1&WFActivityInstView/activityInstID=<bean:write property="activityInstID"/>&processInstID=<bean:write property="processInstID"/><%}%>";
     	document.queryForm.target="activityList";
     	document.queryForm.submit();     	
      }
      
      function finishworkItem(id){
      	document.queryForm.workItemID.value=id;
      	document.queryForm.action="WFINSTMGR.pr_automata.finishWorkItem.do";
     	document.queryForm.target="moonpiazza";
      	document.queryForm.submit();
      
      }
    </script>
<display:pageHead bodyColor="#FFFFFF"/>
      <form name="queryForm">
<display:resultHead  />
      <!--详细信息显示-->
        <html:hidden   property="PageCond/begin"/>
        <html:hidden   property="PageCond/length"/>
        <html:hidden   property="PageCond/count"/>
        <html:hidden   property="processInstID"/>
        <html:hidden   property="activityInstID"/>
		<html:hidden   name="WFProcessInst/processInstID" property="processInstID"/>
        <html:hidden   name="WFActivityInstView/activityInstID" property="activityInstID"/>
        <input type="hidden"   name="workItemID">
        <html:hidden   name="showWhich" value="<%=showWhich%>"/>
 <!--列表信息显示-->
<script>
	var myPage = new page();
	myPage.init("queryForm", "PageCond/begin", "PageCond/length", "PageCond/count");
</script>
<table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="border-collapse: collapse">
    <tr class="tableHeadTR">        
      <td width="6%" nowrap >操作</td>
      <td width="6%" nowrap >名称</td>
      <td width="5%" nowrap  >参与者</td>
      <td width="4%" nowrap  >状态</td>
      <td width="4%" nowrap  >优先级</td>
      <td width="5%" nowrap  >是否超时</td>
      <td width="16%" nowrap  >开始时间</td>
      <td width="16%" nowrap  >结束时间</td>
 </tr>
  <% int flag =0;%>
  <logic:iterate id="ResultSet" property="list[@name='wi']"> 
  <tr class="<%=flag%2==1?"tableContentTR":"tableContentTR"%>" align="center">
      <td width="6%" nowrap >
<input type="button" value=完成工作项 onClick="javascript:finishworkItem(<bean:write id="ResultSet" property="WFWorkItemView/workItemID"/>);"  <logic:notEqual id="ResultSet"  property="WFWorkItemView/currentState" value="10">disabled</logic:notEqual> > </td>
      <td width="6%" >
      <a  href="WFINSTMGR.pr_automata.WFINSTMGR_P_queryWorkItemDetail.do?WFWorkItemView/workItemID=<bean:write id="ResultSet" property="WFWorkItemView/workItemID"/>">
      <bean:write id="ResultSet" property="WFWorkItemView/workItemName"/></a></td>
      <td width="5%" ><bean:write id="ResultSet" property="WFWorkItemView/participant"/></td>
      <td width="4%" ><html:hidden name="state" id="ResultSet" property="WFWorkItemView/currentState"/><dict:write   businTypeId="WFDICT_WorkItemState" id="ResultSet" property="WFWorkItemView/currentState"/></td>
      <td width="4%" ><dict:write id="ResultSet" businTypeId="WFDICT_Priority" property="WFWorkItemView/priority"/></td>
      <td width="5%" ><dict:write id="ResultSet" businTypeId="WFDICT_YN" property="WFWorkItemView/isTimeOut" /></td>
      <td width="16%"><bean:write id="ResultSet" property="WFWorkItemView/startTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
      <td width="16%"><bean:write id="ResultSet" property="WFWorkItemView/endTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td> 
    </tr>
  <% 	flag++;  %>
  </logic:iterate> 

</table>
<display:resultTail/>
<table border="0" width="100%">  
	<tr>
      <logic:present property="PageCond/begin">
	   <td  align="right"width="100%" class="detailLabelTD" >  
      <input type="button" class="button" value = "返回" onclick="javascript:backtoActivitylist();">
		                        <script>myPage.printPageCode(<%=flag%>)</script>
            <!--
            <a href="javascript:myPage.previousPage();"><img src="/internet/theme/style0/prevpage.gif" width="48" height="18" border="0" align="absbottom"></a> 
              <a href="javascript:myPage.nextPage();">
            <img src="/internet/theme/style0/nextpage.gif" border="0" align="absbottom" width="48" height="19"></a> 
            -->
            	          </logic:present>
         </td>
	</tr>
</table>  
<display:pageTail/>
    </form></html>
<script>
//alert(window.opener.queryForm.elements['PageCond/begin'].value);
//top.opener.location="http://www.chinaren.com";
//top.opener.location.reload(false);

</script>


