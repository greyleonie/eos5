<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<html>
    <head><title>JSP Page</title>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    </head>
    <script  language="JavaScript">
	
     function resume(){
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_ResumeProcessInstance.do";  
     	document.queryForm.processInstID.value = document.queryForm.elements("ID").value;  
     	if(confirm("确实要恢复该流程吗？")){
    	document.queryForm.submit();    
    	}else{}
     }
     
     function suspend(){
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_SuspendProcessInstance.do";    
     	document.queryForm.processInstID.value = document.queryForm.elements("ID").value; 
     	if(confirm("确实要挂起该流程吗?")){ 
    	document.queryForm.submit();     
    	}else{}
     }
     
     function terminate(){
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_TerminateProcessInstance.do";    
     	document.queryForm.processInstID.value = document.queryForm.elements("ID").value;  
     	if(confirm("终止的流程将不可被恢复,确实要终止该流程吗？")){
    	document.queryForm.submit();     
    	}else{}
     }
     
     function changetemplate(){  
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_UpgradeProcessInstance.do";     
     	document.queryForm.processInstID.value = document.queryForm.elements("ID").value; 
     	if(confirm("流程定义更新将会使原定义不可用,确实希望更新吗？")){ 
    	document.queryForm.submit();     
    	}else{}
     }
     
     function delProcess(){  
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_DeleteProcessInstance.do";     
     	document.queryForm.processInstID.value = document.queryForm.elements("ID").value; 
     	if(confirm("该流程实例被删除之后将不能恢复,确定删除吗？")){ 
    	document.queryForm.target="moonpiazza";     
    	document.queryForm.submit();     
    	}else{}
     }
     
     function queryPublishProcDefine(){
		document.queryForm.action="WFDEFMGR.pr_automata.WFDEFMGR_P_queryPublishedProcessDefines.do";
		document.queryForm.processInstID.value=document.queryForm.elements("ID").value;
		if(confirm("确定要更换流程实例的流程定义模板")){
			document.queryForm.submit();
		}

     }
    </script>
<display:pageHead bodyColor="#EEEEEE"/>
<form name="queryForm" method="POST">
<display:resultHead title="流程详细信息"/>

<display:queryHead />
<!--详细信息显示-->   
	<html:hidden name="PageCond" property="PageCond"/>
        <html:hidden name="WFProcessInstView/processInstID" property="WFProcessInstView/processInstID"/>
        <html:hidden name="WFProcessInstView/processDefID" property="WFProcessInstView/processDefID"/>
        <input type="hidden" name="processInstID" value="">
        <input type="hidden" name="ID" value="<bean:write  property="WFProcessInstView/processInstID"/>">
        <input type="hidden" name="processDefID" value="<bean:write  property="WFProcessInstView/processDefID"/>">
     
<html:hidden name="WFProcessInstView/isTimeOut" property="WFProcessInstView/isTimeOut"/>
        <html:hidden name="WFProcessInstView/processInstName" property="WFProcessInstView/processInstName"/>
        <html:hidden name="WFProcessInstView/timeOutNumDesc" property="WFProcessInstView/timeOutNumDesc"/>
        <html:hidden name="WFProcessInstView/creator" property="WFProcessInstView/creator"/>
        <html:hidden name="WFProcessInstView/isTimeOut" property="WFProcessInstView/currentState"/>
        <html:hidden name="WFProcessInstView/processInstName" property="WFProcessInstView/priority"/>
        <html:hidden name="WFProcessInstView/timeOutNumDesc" property="WFProcessInstView/parentProcID"/>
        <html:hidden name="WFProcessInstView/creator" property="WFProcessInstView/createTim"/>
                <html:hidden name="WFProcessInstView/timeOutNumDesc" property="WFProcessInstView/packageName"/>
        <html:hidden name="WFProcessInstView/creator" property="WFProcessInstView/startTime"/>
        <html:hidden name="WFProcessInstView/isTimeOut" property="WFProcessInstView/processChName"/>
        <html:hidden name="WFProcessInstView/processInstName" property="WFProcessInstView/endTime"/>
        <html:hidden name="WFProcessInstView/timeOutNumDesc" property="WFProcessInstView/processInstDesc"/>
   
  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse">
	<tr height="10"><td></td></tr>
  <tr> 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>流程实例ID </td>
      <td height="17" width="32%" class="detailFieldTD" nowrap> <bean:write  property="WFProcessInstView/processInstID"/></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap>是否超时 </td>
      <td height="17" width="46%" class="detailFieldTD" nowrap   > <dict:write  businTypeId="WFDICT_YN" property="WFProcessInstView/isTimeOut" /></td>
  </tr>
  <tr> 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>流程实例名称 </td>
      <td height="17" width="32%" class="detailFieldTD" nowrap> <bean:write  property="WFProcessInstView/processInstName"/></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap>超时数 </td>
      <td height="17" width="46%" class="detailFieldTD" nowrap   > <bean:write  property="WFProcessInstView/timeOutNumDesc"/></td>
  </tr>
  <tr  > 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>创建者 </td>
      <td width="32%" class="detailFieldTD" nowrap> <bean:write  property="WFProcessInstView/creator"/></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap>流程定义ID </td>
      <td width="46%" class="detailFieldTD" nowrap> <bean:write  property="WFProcessInstView/processDefID"/></td>
  </tr>
  <tr  > 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>当前状态 </td>
      <td width="32%" class="detailFieldTD" nowrap> <dict:write  businTypeId="WFDICT_ProcessState" property="WFProcessInstView/currentState" /></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap>优先级 </td>
      <td width="46%" class="detailFieldTD" nowrap > <dict:write businTypeId="WFDICT_Priority" property="WFProcessInstView/priority"/></td>
  </tr>
  <tr  > 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>父流程ID </td>
      <td width="32%" class="detailFieldTD" nowrap> <bean:write  property="WFProcessInstView/parentProcID"/></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap> 创建时间</td>
      <td width="46%" class="detailFieldTD" nowrap > <bean:write  property="WFProcessInstView/createTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
  </tr>
    <tr  > 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>包名称 </td>
      <td width="32%" class="detailFieldTD" nowrap><bean:write  property="WFProcessInstView/packageName"/></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap> 启动时间</td>
      <td width="46%" class="detailFieldTD" nowrap    >  <bean:write  property="WFProcessInstView/startTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
  </tr>
  <tr  > 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>流程定义名称 </td>
      <td width="32%" class="detailFieldTD" nowrap> <bean:write  property="WFProcessInstView/processChName" /></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap>结束时间</td>
      <td width="46%" class="detailFieldTD" nowrap><bean:write  property="WFProcessInstView/endTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
  </tr>
	<tr height="10"><td></td></tr>
  <tr  >
      <td class="queryLabelTD" width="12%" align="right" valign="top" nowrap>流程描述 </td>
  	  <td  class="queryFieldlTD" colspan="3" align="left"> 
          <textarea name="textfield" cols="60" rows="8" style="overflow:auto;background-color:#EEEEEE" readonly><bean:write  property="WFProcessInstView/processInstDesc"/>
 		  </textarea>
     </td>
  </tr>
	<tr height="10"><td></td></tr>
</table>
<display:queryTail/>
<display:resultTail/>
<table>
	<tr height="10"><td></td></tr>
	<tr height="10"><td></td></tr>
  <tr> 
      <td  colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;
      <logic:equal property="WFProcessInstView/currentState" value="2">
      	<input type="button" class="button" value = "挂起" onclick="javascript:suspend();">
      </logic:equal>
      <logic:equal property="WFProcessInstView/currentState" value="3">
      	<input type="button" class="button" value = "唤醒" onclick="javascript:resume();">
      </logic:equal>
      <logic:lessThan property="WFProcessInstView/currentState" value="7">
      	<input type="button" class="button" value = "停止" onclick="javascript:terminate();">
      </logic:lessThan>
      <logic:equal property="WFProcessInstView/currentFlag" value="0">
      	<input type="button" class="button" value = "升级" onclick="javascript:changetemplate();">
      </logic:equal>
      	<input type="button" class="button" value = "删除" onclick="javascript:delProcess();">
      	<input type="button" class="button" value = "更换模板" onclick="javascript:queryPublishProcDefine();">
      <!--
      <a href="WFINSTMGR.pr_automata.WFINSTMGR_P_SuspendProcessInstance.do?processInstID=<bean:write  property="WFProcessInstView/processInstID"/>"><img src="/internet/WFCOMMON/images/button/gq.gif" border="0"></a>
      <a href="javascript:resume();"><img src="/internet/WFCOMMON/images/button/hf.gif" border="0"></a>
      <a href="javascript:terminate();"><img src="/internet/WFCOMMON/images/button/stop.gif" border="0"></a>
      <a href="javascript:changetemplate();"><img src="/internet/WFCOMMON/images/button/gxglcsldmb.gif" border="0"></a>
      -->
     </td>
  </tr>
</table>
</form>
<display:pageTail/>
</html>       
	  