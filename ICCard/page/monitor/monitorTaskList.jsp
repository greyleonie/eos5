<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prMonitor.monitorTaskList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;���������&gt;�������&gt;������ϸ
            </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prMonitor.monitorTaskList.do">
		<input type="hidden" name="modifytoSave" value="ICCard.prMonitor.modifyMonitorExecuteTime.do">
		<input type="hidden" name="finishaction" value="ICCard.prMonitor.finishTask.do">
		<html:hidden property="MonitorTask/_order/col1/field"/>
		<html:hidden property="MonitorTask/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
	    <td height="30" class="text">
	   ִ��ʱ�䣺�� <html:text property="MonitorTask/ExecuteTime/criteria/min" attributesText='class="input" size="15"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["MonitorTask/ExecuteTime/criteria/min"],"yyyy-MM-dd")>
	    	�� <html:text property="MonitorTask/ExecuteTime/criteria/max" attributesText='class="input" size="15"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["MonitorTask/ExecuteTime/criteria/max"],"yyyy-MM-dd")>
			
&nbsp; 
	  
<input name="B32" type="button" class="button_02" value="�� ѯ" onclick="talentquery()">

<qx:talentButton property="modifyandsave" type="button" styleClass="button_02" value="�޸�ʱ��" onclick="modifySave('listdetail')" title="ֱ�ӵ��ִ��ʱ�䣬�޸ĺ󰴸ð�ť���" operation="DX_CARD_MANAGE_MONITOR_TASK.DX_CARD_MANAGE_MONITOR_TASK_TIME"/>
<qx:talentButton property="tofinish0" type="button" styleClass="button_02" value="ǿ�����" onclick="tofinish()" title="ǿ�������ѡ����" operation="DX_CARD_MANAGE_MONITOR_TASK.DX_CARD_MANAGE_MONITOR_TASK_FINISH"/>
<input name="mores" type="button" class="button_02" value="ɸѡ��ѯ" onclick="moreSelect()" title="����ɸѡ�������в�ѯ">
<input name="ieprint" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">
<input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()"></td>
	    </tr>
	  <tr id="moreSel" style="display: none;">
	    <td height="30" class="text">
		�������ͣ�
		<html:select property="MonitorTask/TaskTypeID/criteria/value" styleClass="input">
			<html:option value="-1">ȫ��</html:option>
			<html:option value="1">�ɼ�����</html:option>
			<html:option value="2">�ز�����</html:option>
			<html:option value="3">��ͨ�´�</html:option>
			<html:option value="4">�ڼ��ռӰ��´�</html:option>
			<html:option value="5">�������</html:option>
		</html:select>
		
		&nbsp;�豸���ͣ�
		<html:select property="MonitorTask/DeviceTypeID/criteria/value" styleClass="input">
			<html:option value="1">�շѻ�</html:option>
		</html:select>
		&nbsp;�豸�ţ�
		<html:select property="MonitorTask/DeviceID/criteria/value"  attributesText='id="printTable"'  onchange="talentquery()"> 
              <html:option value="-1">ȫ��</html:option>
              <html:options property="list[@type='POS']/POS/POSID" labelProperty="list[@type='POS']/POS/POSID"/> 
         </html:select>
		&nbsp;�Ƿ���ɣ�
		 <html:select property="MonitorTask/Finished/criteria/value" styleClass="input">
			<html:option value="-1">����</html:option>
			<html:option value="0">δ���</html:option>
			<html:option value="1">�����</html:option>	
		</html:select>
		 &nbsp;��������
		 <html:select property="MonitorTask/onResult" styleClass="input">
			<html:option value="-1">����</html:option>
			<html:option value="0">ʧ��</html:option>
			<html:option value="1">�ɹ�</html:option>	
		</html:select>
		</td>
    </tr>
	  
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="15%" align="center" nowrap id="MonitorTask.ExecuteTime" onclick="talentsort()">ִ��ʱ��</td>
            <td width="9%" align="center" nowrap id="MonitorTask.TaskTypeID" onclick="talentsort()">��������</td>
            <td width="9%" align="center" nowrap id="MonitorTask.DeviceTypeID" onclick="talentsort()">�豸����</td>
            <td width="9%" align="center" nowrap id="MonitorTask.DeviceID" onclick="talentsort()">�豸��</td>
            <td width="15%" align="center" nowrap id="MonitorTask.CreatedTime" onclick="talentsort()">����ʱ��</td>
            <td width="9%" align="center" nowrap id="MonitorTask.OperatorName" onclick="talentsort()">����Ա</td>
            <td width="9%" align="center" nowrap id="MonitorTask.RetryTimes" onclick="talentsort()">���Դ���</td>
            <td width="9%" align="center" nowrap id="MonitorTask.Finished" onclick="talentsort()">�Ƿ����</td>
            <td width="12%" align="center" nowrap id="MonitorTask.Result" onclick="talentsort()">������</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='MonitorTask']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						String Finished= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","MonitorTask/Finished"));
						java.util.Hashtable h = new java.util.Hashtable();
						h.put("Finished", Finished);
			       %>
            <tr class="<%=trClass%>" onclick="changeTRBgColor(this)">
	            <td align="center">
	          
	           <html:checkbox name="list[@name='update']/MonitorTask/MonitorTaskID" id="resultset" property="MonitorTask/MonitorTaskID" indexed="true"  attributes="<%=h%>" />	                       </td>
	        	
	        	<td nowrap align="center"  <%if(Finished.equals("0")) {%>onclick="toEditable()"<%} %>>
	        	<bean:write id="resultset" property="MonitorTask/ExecuteTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yy-MM-dd HH:mm:ss"/></td>
	            <td nowrap align="center"><dict:write  id="resultset" property="MonitorTask/TaskTypeID" businTypeId="dx_TaskTypeID" />   </td>
	            <td  nowrap align="center">
	            <logic:equal id="resultset" property="MonitorTask/DeviceTypeID" value="1">�շѻ�</logic:equal>	            </td>
	            <td  nowrap align="center">
	            <logic:equal id="resultset" property="MonitorTask/DeviceID" value="0">ȫ��</logic:equal>
	            <logic:notEqual id="resultset" property="MonitorTask/DeviceID" value="0">
	            	<bean:write id="resultset" property="MonitorTask/DeviceID"/>
	            </logic:notEqual>	            </td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MonitorTask/CreatedTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MonitorTask/OperatorName"/></td>
                <td  nowrap align="center"><bean:write id="resultset" property="MonitorTask/RetryTimes"/></td>
                <td  nowrap align="center">
                <logic:equal id="resultset" property="MonitorTask/Finished" value="0">
                	<font color="red">δ���</font>                </logic:equal>
                 <logic:equal id="resultset" property="MonitorTask/Finished" value="1">�����</logic:equal>                </td>
                <td  nowrap align="center">
                <logic:equal id="resultset" property="MonitorTask/Finished" value="0">δ֪</logic:equal>
                <logic:equal id="resultset" property="MonitorTask/Finished" value="1">
					<logic:lessThan id="resultset" property="MonitorTask/Result" value="0">
						<font color="#FF0000">ʧ��</font>					</logic:lessThan>
					<logic:greaterEqual id="resultset" property="MonitorTask/Result" value="0">
						<%--�������ʹ��ڵ���3��ʾ�´�����--%>
						<logic:greaterEqual id="resultset" property="MonitorTask/TaskTypeID" value="3">
							�ɹ�						</logic:greaterEqual>
						<%--��������С��3��ʾ�ɼ�����--%>
						<logic:lessThan id="resultset" property="MonitorTask/TaskTypeID" value="3">
							�ɼ�<bean:write id="resultset" property="MonitorTask/Result"/>����¼						</logic:lessThan>
					</logic:greaterEqual>	
				</logic:equal>                </td>
            </tr>
          </logic:iterate>
        </table>
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>			  </td>
            </tr>
          </table>		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>

</body>
<script>
 function moreSelect(){
 	if(moreSel.style.display=="none"){
 		moreSel.style.display=""
 	}
 	else{
 		moreSel.style.display="none"
 		
 		}
 }
 
 function tofinish(){
 	var frm =document.forms[0];
 	var i=0;
	var j=0;
	eles = frm.elements;
	while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
					j++;
					if(j>1){
						alert("ֻ��ѡ��һ����¼��");
				    	return ;
					
					}
				    var Finished = obj.getAttribute("Finished");
				    if(Finished!="0"){
				    	alert("ֻ��δ��ɵ�����ſ���ǿ����ɣ�");
				    	return ;
				    }
				}
			}
			i++;
		}
		if(j==0){
			alert("��ѡ��һ����¼");
			return "";
		}
		if(window.confirm("ȷ��Ҫǿ����ɴ�������")){
			var fid = getChechedValue(frm);
			frm.action = frm.elements["finishaction"].value;
			frm.action += "?fid=" + fid;
    		frm.submit();
		}
 }

</script>