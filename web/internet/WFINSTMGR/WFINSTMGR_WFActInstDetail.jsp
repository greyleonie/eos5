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
       		alert("\"<dict:write   businTypeId="WFDICT_ActivityState" property="list[@name='actInst']/WFActivityInstView/currentState" />\"״̬�µĻʵ��������ǿ����ֹ��");
       }else if(confirm("ȷʵҪǿ����ֹ��")){
     	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_TerminateActivity.do?showWhich=<%=showWhich%>";
     	document.queryForm.target="moonpiazza";
     	document.queryForm.submit(); }else{}
      }
      
       function backActivity(){
       if(document.queryForm.state.value=="7"||document.queryForm.state.value=="8"||document.queryForm.state.value=="9"){
       		alert("\"<dict:write   businTypeId="WFDICT_ActivityState" property="list[@name='actInst']/WFActivityInstView/currentState" />\"״̬�µĻʵ����������ˣ�");
       }else if(confirm("ȷʵҪ������")){
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
      	if(confirm("ȷʵҪ�쿴�����̵���ϸ��Ϣ��")){
	     	document.queryForm.action='WFINSTMGR.pr_automata.WFINSTMGR_P_ProcessInst.do';
	     	document.queryForm.target="moonpiazza";
	     	document.queryForm.submit();
	     	}else{}
      	}

		function restartActivity(){	
      	if(confirm("ȷʵҪ���������û��")){
	     	document.queryForm.action='WFINSTMGR.pr_automata.restartActInst.do';
	     	document.queryForm.target="moonpiazza";
	     	document.queryForm.submit();
	     	}else{}
		}      	

    </script>

<!--��ϸ��Ϣ��ʾ-->
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
      <td  class="queryLabelTD" width="8%" align="right" nowrap>�ID</td>
      <td width="33%" class="detailFieldTD"> <bean:write  property="list[@name='actInst']/WFActivityInstView/activityInstID"/> 
        <input type="hidden" name="WFActivityInstView/activityInstID" value="<bean:write   property="list[@name='actInst']/WFActivityInstView/activityInstID"/>"> </td>
      <td  class="queryLabelTD" width="8%" align="right" nowrap>����ʱ��</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/endTime"  formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
    </tr>
    <tr> 
      <td  class="queryLabelTD" width="8%" align="right" nowrap>�����</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/activityInstName"/></td>
      <td  class="queryLabelTD" width="8%" align="right" nowrap>�Ƿ�ʱ</td>
      <td width="33%" class="detailFieldTD"> <dict:write   businTypeId="WFDICT_YN" property="list[@name='actInst']/WFActivityInstView/isTimeOut" /></td>
    </tr>
    <tr> 
      <td  class="queryLabelTD" width="8%" align="right" nowrap>�����</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/activityInstDesc"/></td>
      <td  class="queryLabelTD" width="8%" align="right" nowrap>��ʱ��</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/timeOutNumDesc"/></td>
    </tr>
    <tr> 
      <td class="queryLabelTD" width="8%" align="right" nowrap>��ǰ״̬</td>
      <td width="33%" class="detailFieldTD"> <html:hidden name="state" property="list[@name='actInst']/WFActivityInstView/currentState"/> 
        <dict:write   businTypeId="WFDICT_ActivityState" property="list[@name='actInst']/WFActivityInstView/currentState" /> 
      </td>
            <td  class="queryLabelTD" width="8%" align="right" nowrap>����ʵ��ID</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/processInstID"/> 
        <html:hidden name="processInstID" property="list[@name='actInst']/WFActivityInstView/processInstID"/> 
      </td>
      
    </tr>
    <tr> 
      <td  class="queryLabelTD" width="8%" align="right" nowrap>����ʱ��</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/createTime"  formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
      <td class="queryLabelTD" width="8%" align="right" nowrap>���ID</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/activityDefID"/></td>
    </tr>
    <tr> 
      <td class="queryLabelTD" width="8%" align="right" nowrap>����ʱ��</td>
      <td width="33%" class="detailFieldTD"> <bean:write   property="list[@name='actInst']/WFActivityInstView/startTime"  formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
      <!--<td  class="queryLabelTD" width="8%" align="right" nowrap>���ȼ�</td>
      <td width="33%" class="detailFieldTD"> <dict:write   businTypeId="WFDICT_Priority" property="list[@name='actInst']/WFActivityInstView/priority" /></td>
   -->
    </tr>
    <tr> 
      <td  class="queryLabelTD" width="8%" align="right" nowrap>�����</td>
      <td width="33%" class="detailFieldTD"> <dict:write   businTypeId="WFDICT_ActivityType" property="list[@name='actInst']/WFActivityInstView/activityType" />
       <logic:equal property="list[@name='actInst']/WFActivityInstView/activityType" value="subflow"> 
		<html:hidden name="WFProcessInst/processInstID" property="list[@name='actInst']/WFActivityInstView/subProcessID"/>
       <input type="button" class="button" value = "��������ϸ��Ϣ" onclick="javascript:subProcessDetail();">
       <!--
        <a href="#" onClick="javascript:window.open('WFINSTMGR.pr_automata.WFINSTMGR_P_ProcessInst.do?WFProcessInst/processInstID=<bean:write  property="list[@name='actInst']/WFActivityInstView/subProcessID"/>','���ϸ��Ϣ','toolbar=no,location=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=990,height=520,left=10,top=100')">[��������ϸ��Ϣ]</a> 
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
      	<input type="button" value="����" onClick="javascript:activateActInst();">      
      </logic:equal>      

      <logic:equal property="list[@name='actInst']/WFActivityInstView/procInstCurrState" value="2">
		<logic:equal property="isLastActivity" value="true">
      		<logic:equal property="list[@name='actInst']/WFActivityInstView/currentState" value="7">
	       		<input type="button" class="button" value = "����" onclick="javascript:restartActivity();">
      		</logic:equal>       
		</logic:equal>
      </logic:equal>      

      <logic:equal property="list[@name='actInst']/WFActivityInstView/currentState" value="2">
	<input type="button" class="button" value = "����" onclick="javascript:backActivity();">
      </logic:equal>   
      <logic:notEqual property="list[@name='actInst']/WFActivityInstView/currentState" value="8">
	<input type="button" class="button" value = "ǿ����ֹ" onclick="javascript:terminateActivity();">
      </logic:notEqual>  
	<input type="button" class="button" value = "����" onclick="javascript:backtoActivitylist();">
      </td>
    </tr>
  </table>
  <!--
  <table border="0">
    <tr>
      <td align="right" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp; 
      <input type="button" class="button" value = "����" onclick="javascript:backActivity();"><input type="button" class="button" value = "ǿ����ֹ" onclick="javascript:terminateActivity();"><input type="button" class="button" value = "����" onclick="javascript:backtoActivitylist();">
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

