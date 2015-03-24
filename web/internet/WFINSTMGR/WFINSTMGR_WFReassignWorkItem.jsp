<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<html><head>
<title>reAssign</title>
</head>
    </head>
   <%
    	String showWhich=request.getParameter("showWhich");
     %>
      <script  language="JavaScript">
<!--
      
      function reassignWorkItem(wiid,index){
      var workItemId=wiid; 
      //当点击改派button之后执行的,
      if(queryForm.personID.length>1){
      	//多工作项情况下的改派
           if(document.queryForm.state[index].value!="6"&&document.queryForm.state[index].value!="10"){
            //除了状态为运行和已分配的工作项，其他的都不可以被改派
		      	alert("该状态下的工作项不可改派!");
		      }else if(confirm("确实要改派该工作吗？")){
		     	if (queryForm.personID[index].options.length>0)
				{
				  queryForm.personID[index].options[0].selected = true;
				  queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_ReassignWorkItem.do?personID="+queryForm.personID[index].options[0].value+"&WorkItemID="+workItemId+"&WFActivityInstView/activityInstID=<bean:write  property="list[@name='wi']/WFWorkItemView/activityInstID"/>&processInstID=<bean:write property="processInstID"/>&showWhich=<%=showWhich%>";
				  queryForm.submit();
				}
				else
				{
				  alert('请选择新参与者');
				}
	     	}else{
	     		//没有选择确实要改派该工作项
	     	}
      }else{
      //单工作项改派
        if(document.queryForm.state.value!="6"&&document.queryForm.state.value!="10"){
            //除了状态为运行和已分配的工作项，其他的都不可以被改派
	      	alert("该状态下的工作项不可改派!");
	      }else if(confirm("确实要改派该工作吗？")){
			if (queryForm.personID.options.length>0)
			{
			  queryForm.personID.options[0].selected = true;
			  queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_ReassignWorkItem.do?personID="+queryForm.personID.options[0].value+"&WorkItemID="+workItemId+"&WFActivityInstView/activityInstID=<bean:write  property="list[@name='wi']/WFWorkItemView/activityInstID"/>&processInstID=<bean:write property="processInstID"/>&showWhich=<%=showWhich%>";
			  queryForm.submit();
			}
			else
			{//没有选中参与者
			  alert('请选择新参与者');
			}
	     	}else{
	     		//没有选择确实要改派该工作项
	     	}
      
      }
      }

	function ReassignWorkItem()
	{
		if (queryForm.personID.options.length>0)
		{
		  queryForm.personID.options[0].selected = true;
		  queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_ReassignWorkItem.do?personID="+queryForm.personID.options[0].value+"&WorkItemID="+workItemId+"&WFActivityInstView/activityInstID=<bean:write  property="list[@name='wi']/WFWorkItemView/activityInstID"/>&processInstID=<bean:write property="processInstID"/>&showWhich=<%=showWhich%>";
		  alert(queryForm.action);
		  queryForm.submit();
		}
		else
		{
		  alert('请选择新参与者');
		}
	}

     function backtoActivitylist(){
     	document.queryForm.action="<%if (showWhich.equals("0")){%>WFINSTMGR.pr_automata.WFINSTMGR_P_QueryProcessActivityInstTab.do?showWhich=0&processInstID=<bean:write property="processInstID"/><%}if(showWhich.equals("1")){%>WFINSTMGR.pr_automata.WFINSTMGR_P_QueryActivityInstances.do?showWhich=1&WFActivityInstView/activityInstID=<bean:write property="activityInstID"/>&processInstID=<bean:write property="processInstID"/><%}%>";
     	document.queryForm.target="activityList";
     	document.queryForm.submit();     	
      }
      
	function MM_openBrWindow(theURL,winName,features) 
	{ 
	  window.open(theURL,winName,features);
	  //window.showModalDialog(theURL,window,features);
	}
	
	function doSubmit(selectObj)
	{
		if(selectObj != null)
		{
			alert(selectObj.options.length);
		}
		for(i=0;i<selectObj.options.length;i++)
		{
			alert(selectObj.options[i].value + '##' + selectObj.options[i].text);
		}
	}	
	
	
//	function onCancel(){
//		var tabObj = document.getElementById('table1');
//		tabObj.style.display='none';
//	}

//-->
</script>
<display:pageHead bodyColor="#FFFFFF"/>
<form  name="queryForm" method="post">     
        <html:hidden   property="PageCond/begin"/>
        <html:hidden   property="PageCond/length"/>
        <html:hidden   property="PageCond/count"/>
        <html:hidden   property="processInstID"/>
        <html:hidden   property="activityInstID"/>
        <html:hidden   name="WFActivityInstView/activityInstID" property="activityInstID"/>
        <html:hidden   name="showWhich" value="<%=showWhich%>"/>
<script>
	var myPage = new page();
	myPage.init("queryForm", "PageCond/begin", "PageCond/length", "PageCond/count");
</script>
<display:resultHead  />
<table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="border-collapse: collapse">
    <tr class="tableHeadTR">        
      <td width="5%" nowrap >序号</td>
      <td width="9%" nowrap >名称</td>
      <td width="8%" nowrap  >执行者</td>
      <td width="5%" nowrap  >状态</td>
      <td  width="13%" nowrap>操作</td>
 </tr>
  <% int flag =0;%>
  <logic:iterate id="ResultSet" property="list[@name='wi']"> 
  <tr class="<%=flag%2==1?"tableContentTR":"tableContentTR"%>" align="center">
      <td width="5%" nowrap ><%=flag+1%></td>
      <td width="9%" >
      <!--
      <a  href="WFINSTMGR.pr_automata.WFINSTMGR_P_queryWorkItemDetail.do?WFWorkItemView/workItemID=<bean:write id="ResultSet" property="WFWorkItemView/workItemID"/>">
      -->
      <bean:write id="ResultSet" property="WFWorkItemView/workItemName"/>
      <!--
      </a>
      -->
      </td>
      <td width="8%" nowrap><bean:write id="ResultSet" property="WFWorkItemView/participant"/></td>
      <td width="5%" nowrap><html:hidden name="state" id="ResultSet" property="WFWorkItemView/currentState"/><dict:write   businTypeId="WFDICT_WorkItemState" id="ResultSet" property="WFWorkItemView/currentState"/></td>
	  

	  <td width="16%" nowrap>
		<logic:equal id="ResultSet" property="WFWorkItemView/currentState" value="4">
			<input type="button" value="改派" disabled>
		</logic:equal>
		<logic:notEqual id="ResultSet" property="WFWorkItemView/currentState" value="4">
			<workflow:ReassignWorkItem  id="ResultSet" workItemID="@WFWorkItemView/workItemID"/>
		</logic:notEqual>
	  </td>
<!--
	  <td width="13%"nowrap>
        <select name="personID" multiple style="width:80px" size="1">
	</select>
							 
        <input type="button" value="请选择" onClick="javascript:window.showModalDialog('WFCOMMON.pr_automata.WFCOMMON_P_OpenUserSel.do?formName=queryForm&selectName=personID&needMultiple=false&tabIndex=<%=flag%>',window,'dialogHeight:530px;dialogWidth:600px;center:yes')"> </td>
      <td  width="13%">
	<input type="button" class="button" value = "改派" onclick="javascript:reassignWorkItem(<bean:write id="ResultSet" property="WFWorkItemView/workItemID"/>,<%=flag%>);">
      </td>
-->
    </tr>
  <% 	flag++;  %>
  </logic:iterate> 

</table>
<display:resultTail/>
<table border="0" width="100%">  
	<tr>
      <logic:present property="PageCond/begin">
	   <td  align="right"width="100%"  class="detailLabelTD">  
      <input type="button" class="button" value = "返回" onclick="javascript:backtoActivitylist();">
       <!--
            <a href="javascript:myPage.previousPage();"><img src="/internet/theme/style0/prevpage.gif" width="48" height="18" border="0" align="absbottom"></a> 
              <a href="javascript:myPage.nextPage();">
            <img src="/internet/theme/style0/nextpage.gif" border="0" align="absbottom" width="48" height="19"></a> 
            -->
            	<script>myPage.printPageCode(<%=flag%>)</script>  </td>       </logic:present>
	</tr>
</table>  
	<html:hidden property="WorkItemID" />
	<html:hidden property="WFActivityInstView/activityInstID" />
 
</form>
<display:resultTail />
<display:pageTail/>
</html>
