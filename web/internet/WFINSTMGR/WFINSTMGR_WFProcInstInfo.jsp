<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<html>
    <head><title>JSP Page</title>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    </head>
    <script  language="JavaScript">
	
     function resume(){
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_ResumeProcessInstance.do";  
     	document.queryForm.processInstID.value = document.queryForm.elements("ID").value;  
     	if(confirm("ȷʵҪ�ָ���������")){
    	document.queryForm.submit();    
    	}else{}
     }
     
     function suspend(){
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_SuspendProcessInstance.do";    
     	document.queryForm.processInstID.value = document.queryForm.elements("ID").value; 
     	if(confirm("ȷʵҪ�����������?")){ 
    	document.queryForm.submit();     
    	}else{}
     }
     
     function terminate(){
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_TerminateProcessInstance.do";    
     	document.queryForm.processInstID.value = document.queryForm.elements("ID").value;  
     	if(confirm("��ֹ�����̽����ɱ��ָ�,ȷʵҪ��ֹ��������")){
    	document.queryForm.submit();     
    	}else{}
     }
     
     function changetemplate(){  
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_UpgradeProcessInstance.do";     
     	document.queryForm.processInstID.value = document.queryForm.elements("ID").value; 
     	if(confirm("���̶�����½���ʹԭ���岻����,ȷʵϣ��������")){ 
    	document.queryForm.submit();     
    	}else{}
     }
     
     function delProcess(){  
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_DeleteProcessInstance.do";     
     	document.queryForm.processInstID.value = document.queryForm.elements("ID").value; 
     	if(confirm("������ʵ����ɾ��֮�󽫲��ָܻ�,ȷ��ɾ����")){ 
    	document.queryForm.target="moonpiazza";     
    	document.queryForm.submit();     
    	}else{}
     }
     
     function queryPublishProcDefine(){
		document.queryForm.action="WFDEFMGR.pr_automata.WFDEFMGR_P_queryPublishedProcessDefines.do";
		document.queryForm.processInstID.value=document.queryForm.elements("ID").value;
		if(confirm("ȷ��Ҫ��������ʵ�������̶���ģ��")){
			document.queryForm.submit();
		}

     }
    </script>
<display:pageHead bodyColor="#EEEEEE"/>
<form name="queryForm" method="POST">
<display:resultHead title="������ϸ��Ϣ"/>

<display:queryHead />
<!--��ϸ��Ϣ��ʾ-->   
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
      <td   class="queryLabelTD" width="12%" align="right" nowrap>����ʵ��ID </td>
      <td height="17" width="32%" class="detailFieldTD" nowrap> <bean:write  property="WFProcessInstView/processInstID"/></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap>�Ƿ�ʱ </td>
      <td height="17" width="46%" class="detailFieldTD" nowrap   > <dict:write  businTypeId="WFDICT_YN" property="WFProcessInstView/isTimeOut" /></td>
  </tr>
  <tr> 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>����ʵ������ </td>
      <td height="17" width="32%" class="detailFieldTD" nowrap> <bean:write  property="WFProcessInstView/processInstName"/></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap>��ʱ�� </td>
      <td height="17" width="46%" class="detailFieldTD" nowrap   > <bean:write  property="WFProcessInstView/timeOutNumDesc"/></td>
  </tr>
  <tr  > 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>������ </td>
      <td width="32%" class="detailFieldTD" nowrap> <bean:write  property="WFProcessInstView/creator"/></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap>���̶���ID </td>
      <td width="46%" class="detailFieldTD" nowrap> <bean:write  property="WFProcessInstView/processDefID"/></td>
  </tr>
  <tr  > 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>��ǰ״̬ </td>
      <td width="32%" class="detailFieldTD" nowrap> <dict:write  businTypeId="WFDICT_ProcessState" property="WFProcessInstView/currentState" /></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap>���ȼ� </td>
      <td width="46%" class="detailFieldTD" nowrap > <dict:write businTypeId="WFDICT_Priority" property="WFProcessInstView/priority"/></td>
  </tr>
  <tr  > 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>������ID </td>
      <td width="32%" class="detailFieldTD" nowrap> <bean:write  property="WFProcessInstView/parentProcID"/></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap> ����ʱ��</td>
      <td width="46%" class="detailFieldTD" nowrap > <bean:write  property="WFProcessInstView/createTime"  formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
  </tr>
    <tr  > 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>������ </td>
      <td width="32%" class="detailFieldTD" nowrap><bean:write  property="WFProcessInstView/packageName"/></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap> ����ʱ��</td>
      <td width="46%" class="detailFieldTD" nowrap    >  <bean:write  property="WFProcessInstView/startTime"  formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
  </tr>
  <tr  > 
      <td   class="queryLabelTD" width="12%" align="right" nowrap>���̶������� </td>
      <td width="32%" class="detailFieldTD" nowrap> <bean:write  property="WFProcessInstView/processChName" /></td>
      <td   class="queryLabelTD" width="10%" align="right" nowrap>����ʱ��</td>
      <td width="46%" class="detailFieldTD" nowrap><bean:write  property="WFProcessInstView/endTime"  formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
  </tr>
	<tr height="10"><td></td></tr>
  <tr  >
      <td class="queryLabelTD" width="12%" align="right" valign="top" nowrap>�������� </td>
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
      	<input type="button" class="button" value = "����" onclick="javascript:suspend();">
      </logic:equal>
      <logic:equal property="WFProcessInstView/currentState" value="3">
      	<input type="button" class="button" value = "����" onclick="javascript:resume();">
      </logic:equal>
      <logic:lessThan property="WFProcessInstView/currentState" value="7">
      	<input type="button" class="button" value = "ֹͣ" onclick="javascript:terminate();">
      </logic:lessThan>
      <logic:equal property="WFProcessInstView/currentFlag" value="0">
      	<input type="button" class="button" value = "����" onclick="javascript:changetemplate();">
      </logic:equal>
      	<input type="button" class="button" value = "ɾ��" onclick="javascript:delProcess();">
      	<input type="button" class="button" value = "����ģ��" onclick="javascript:queryPublishProcDefine();">
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
	  