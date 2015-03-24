<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
   <html>
<head>
<title>wfactinstList</title>
</head>
<%  
    	String showWhich=request.getParameter("showWhich");
    if(showWhich==null)
    	 showWhich="1";
    %>
<script  language="JavaScript">      
      function activateActInst(){
     	document.queryForm.action="WFINSTMGR.pr_automata.activateActInst.do?activityInstID=<bean:write  property="list[@name='actInst']/WFActivityInstView/activityInstID"/>";
     	document.queryForm.target="moonpiazza";
     	document.queryForm.submit(); 

      }
      
       function terminateActivity(){
       if(document.queryForm.state.value=="7"||document.queryForm.state.value=="8"||document.queryForm.state.value=="9"){
       		alert("\"<dict:write   businTypeId="WFDICT_ActivityState" property="list[@name='actInst']/WFActivityInstView/currentState" />\"状态下的活动实例不允许强行终止！");
       }else if(confirm("确实要强行中止吗？")){
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_TerminateActivity.do?showWhich=<%=showWhich%>";
     	document.queryForm.target="moonpiazza";
     	document.queryForm.submit(); }else{}
      }
      
       function backActivity(){
       if(document.queryForm.state.value=="7"||document.queryForm.state.value=="8"||document.queryForm.state.value=="9"){
       		alert("\"<dict:write   businTypeId="WFDICT_ActivityState" property="list[@name='actInst']/WFActivityInstView/currentState" />\"状态下的活动实例不允许回退！");
       }else if(confirm("确实要回退吗？")){
	//		window.showModalDialog('WFWEBCOMP.prRollback.RollBack.do?WFActivityInstView/activityInstID=<bean:write  property="list[@name='actInst']/WFActivityInstView/activityInstID"/> ',window,'dialogHeight:300px;dialogWidth:550px;center:yes');
	//		window.open('WFWEBCOMP.prRollback.RollBack.do?WFActivityInstView/activityInstID=<bean:write  property="list[@name='actInst']/WFActivityInstView/activityInstID"/> ','');
	//		window.showModalDialog('WFWEBCOMP.prRollback.RollBack.do?WFActivityInstView/activityInstID=<bean:write  property="list[@name='actInst']/WFActivityInstView/activityInstID"/> ','','height=300, width=550,  toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,center=ture');
		location.href = "WFWEBCOMP.prRollback.RollBack.do?WFActivityInstView/activityInstID=<bean:write  property="list[@name='actInst']/WFActivityInstView/activityInstID"/>&isMgr=true";
		}else parent.location.reload();
     	}
     	
     	function backtoActivitylist(){
     	document.queryForm.action="<%if (showWhich.equals("0")){%>WFINSTMGR.pr_automata.WFINSTMGR_P_QueryProcessActivityInstTab.do?showWhich=0&processInstID=<bean:write property="processInstID"/><%}if(showWhich.equals("1")){%>WFINSTMGR.pr_automata.WFINSTMGR_P_QueryActivityInstances.do?showWhich=1&WFActivityInstView/activityInstID=<bean:write property="activityInstID"/>&processInstID=<bean:write property="processInstID"/><%}%>";
     	document.queryForm.target="activityList";
     	document.queryForm.submit();     	
      	}
      	
      	function subProcessDetail(){
      	if(confirm("确实要察看子流程的详细信息吗？")){
	     	document.queryForm.action='WFINSTMGR.pr_automata.WFINSTMGR_P_ProcessInst.do';
	     	document.queryForm.target="moonpiazza";
	     	document.queryForm.submit();
	     	}else{}
      	}

		function restartActivity(){	
      	if(confirm("确实要重新启动该活动吗？")){
	     	document.queryForm.action='WFINSTMGR.pr_automata.restartActInst.do';
	     	document.queryForm.target="moonpiazza";
	     	document.queryForm.submit();
	     	}else{}
		}      	

    </script>

<!--详细信息显示-->
<display:pageHead bodyColor="#FFFFFF"/>
<form name="queryForm" action="">
<display:detailHead lineClass="tb_blue"/> 
  <html:hidden name="PageCond"  property="PageCond"/>
  <html:hidden   property="PageCond/begin"/> 
  <html:hidden   property="PageCond/length"/>
  <html:hidden   property="PageCond/count"/>
  <html:hidden   name="showWhich" value="<%=showWhich%>"/>

  <table width="100%" height="100%" class="wfTable" border="0" bordercolor="#B6B5B5" style="border-collapse: collapse" bgColor="#EEEEEE">
    <tr> 
      <td  class="queryLabelTD" width="8%" align="right" nowrap></td>
      <td width="33%" class="detailFieldTD"> </td>
      <td  class="queryLabelTD" width="8%" align="right"></td>
      <td width="33%" class="detailFieldTD"></td>
    </tr>
    <tr> 
      <td  class="queryLabelTD" width="8%" align="right" nowrap>活动ID</td>
      <td width="33%" class="detailFieldTD"> <bean:write  property="list[@name='actInst']/WFActivityInstView/activityInstID"/> 
        <input type="hidden" name="WFActivityInstView/activityInstID" value="<bean:write   property="list[@name='actInst']/WFActivityInstView/activityInstID"/>"> </td>
      <td  class="queryLabelTD" width="8%" align="right" nowrap>结束时间</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/endTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
    </tr>
    <tr> 
      <td  class="queryLabelTD" width="8%" align="right" nowrap>活动名称</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/activityInstName"/></td>
      <td  class="queryLabelTD" width="8%" align="right" nowrap>是否超时</td>
      <td width="33%" class="detailFieldTD"> <dict:write   businTypeId="WFDICT_YN" property="list[@name='actInst']/WFActivityInstView/isTimeOut" /></td>
    </tr>
    <tr> 
      <td  class="queryLabelTD" width="8%" align="right" nowrap>活动描述</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/activityInstDesc"/></td>
      <td  class="queryLabelTD" width="8%" align="right" nowrap>超时数</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/timeOutNumDesc"/></td>
    </tr>
    <tr> 
      <td class="queryLabelTD" width="8%" align="right" nowrap>当前状态</td>
      <td width="33%" class="detailFieldTD"> <html:hidden name="state" property="list[@name='actInst']/WFActivityInstView/currentState"/> 
        <dict:write   businTypeId="WFDICT_ActivityState" property="list[@name='actInst']/WFActivityInstView/currentState" /> 
      </td>
            <td  class="queryLabelTD" width="8%" align="right" nowrap>流程实例ID</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/processInstID"/> 
        <html:hidden name="processInstID" property="list[@name='actInst']/WFActivityInstView/processInstID"/> 
      </td>
      
    </tr>
    <tr> 
      <td  class="queryLabelTD" width="8%" align="right" nowrap>创建时间</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/createTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
      <td class="queryLabelTD" width="8%" align="right" nowrap>活动项ID</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/activityDefID"/></td>
    </tr>
    <tr> 
      <td class="queryLabelTD" width="8%" align="right" nowrap>启动时间</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/startTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
      <!--<td  class="queryLabelTD" width="8%" align="right" nowrap>优先级</td>
      <td width="33%" class="detailFieldTD"> <dict:write   businTypeId="WFDICT_Priority" property="list[@name='actInst']/WFActivityInstView/priority" /></td>
   -->
    </tr>
    <tr> 
      <td  class="queryLabelTD" width="8%" align="right" nowrap>活动类型</td>
      <td width="33%" class="detailFieldTD"> <dict:write   businTypeId="WFDICT_ActivityType" property="list[@name='actInst']/WFActivityInstView/activityType" />
       <logic:equal property="list[@name='actInst']/WFActivityInstView/activityType" value="subflow"> 
		<html:hidden name="WFProcessInst/processInstID" property="list[@name='actInst']/WFActivityInstView/subProcessID"/>
       <input type="button" class="button" value = "子流程详细信息" onclick="javascript:subProcessDetail();">
       <!--
        <a href="#" onClick="javascript:window.open('WFINSTMGR.pr_automata.WFINSTMGR_P_ProcessInst.do?WFProcessInst/processInstID=<bean:write  property="list[@name='actInst']/WFActivityInstView/subProcessID"/>','活动详细信息','toolbar=no,location=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=990,height=520,left=10,top=100')">[子流程详细信息]</a> 
        -->
        </logic:equal>     
      </td>
      <td  class="queryLabelTD" width="8%" align="right"></td>
      <td width="33%" class="detailFieldTD"></td>
    </tr>
    <tr> 
      <td  class="queryLabelTD" width="8%" align="right" nowrap></td>
      <td width="33%" class="detailFieldTD"> </td>
      <td align="center" colspan="2">&nbsp;&nbsp;&nbsp;
      <logic:equal property="list[@name='actInst']/WFActivityInstView/currentState" value="10">
		<html:hidden name="activityInstID" property="list[@name='actInst']/WFActivityInstView/activityInstID"/>
      	<input type="button" value="激活" onClick="javascript:activateActInst();">      
      </logic:equal>      

      <logic:equal property="list[@name='actInst']/WFActivityInstView/procInstCurrState" value="2">
		<logic:equal property="isLastActivity" value="true">
      		<logic:equal property="list[@name='actInst']/WFActivityInstView/currentState" value="7">
	       		<input type="button" class="button" value = "重启" onclick="javascript:restartActivity();">
      		</logic:equal>       
		</logic:equal>
      </logic:equal>      

      <logic:equal property="list[@name='actInst']/WFActivityInstView/currentState" value="2">
	<input type="button" class="button" value = "回退" onclick="javascript:backActivity();">
      </logic:equal>   
      <logic:notEqual property="list[@name='actInst']/WFActivityInstView/currentState" value="8">
	<input type="button" class="button" value = "强行中止" onclick="javascript:terminateActivity();">
      </logic:notEqual>  
	<input type="button" class="button" value = "返回" onclick="javascript:backtoActivitylist();">
      </td>
    </tr>
  </table>
  <!--
  <table border="0">
    <tr>
      <td align="right" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
      <input type="button" class="button" value = "回退" onclick="javascript:backActivity();"><input type="button" class="button" value = "强行中止" onclick="javascript:terminateActivity();"><input type="button" class="button" value = "返回" onclick="javascript:backtoActivitylist();">
      </td>
    </tr>
  </table>
  -->
<display:detailTail/>
</form>
<display:pageTail/>
</html>
<script>
<!--
//alert(window.opener.queryForm.elements['PageCond/begin'].value);
//top.opener.location="http://www.chinaren.com";
//top.opener.location.reload(false);
-->
</script>

