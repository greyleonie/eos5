<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prMonitor.monitorTaskList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;监控器管理—&gt;任务管理—&gt;任务明细
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
	   执行时间：从 <html:text property="MonitorTask/ExecuteTime/criteria/min" attributesText='class="input" size="15"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["MonitorTask/ExecuteTime/criteria/min"],"yyyy-MM-dd")>
	    	至 <html:text property="MonitorTask/ExecuteTime/criteria/max" attributesText='class="input" size="15"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["MonitorTask/ExecuteTime/criteria/max"],"yyyy-MM-dd")>
			
&nbsp; 
	  
<input name="B32" type="button" class="button_02" value="查 询" onclick="talentquery()">

<qx:talentButton property="modifyandsave" type="button" styleClass="button_02" value="修改时间" onclick="modifySave('listdetail')" title="直接点击执行时间，修改后按该按钮便可" operation="DX_CARD_MANAGE_MONITOR_TASK.DX_CARD_MANAGE_MONITOR_TASK_TIME"/>
<qx:talentButton property="tofinish0" type="button" styleClass="button_02" value="强制完成" onclick="tofinish()" title="强制完成所选任务" operation="DX_CARD_MANAGE_MONITOR_TASK.DX_CARD_MANAGE_MONITOR_TASK_FINISH"/>
<input name="mores" type="button" class="button_02" value="筛选查询" onclick="moreSelect()" title="设置筛选条件进行查询">
<input name="ieprint" type="button" class="button_02" value="打 印" onclick="iePrint()">
<input name="export" type="button" class="button_02" value="导 出" onclick="exporttoexcel()"></td>
	    </tr>
	  <tr id="moreSel" style="display: none;">
	    <td height="30" class="text">
		任务类型：
		<html:select property="MonitorTask/TaskTypeID/criteria/value" styleClass="input">
			<html:option value="-1">全部</html:option>
			<html:option value="1">采集数据</html:option>
			<html:option value="2">重采数据</html:option>
			<html:option value="3">普通下传</html:option>
			<html:option value="4">节假日加班下传</html:option>
			<html:option value="5">清除数据</html:option>
		</html:select>
		
		&nbsp;设备类型：
		<html:select property="MonitorTask/DeviceTypeID/criteria/value" styleClass="input">
			<html:option value="1">收费机</html:option>
		</html:select>
		&nbsp;设备号：
		<html:select property="MonitorTask/DeviceID/criteria/value"  attributesText='id="printTable"'  onchange="talentquery()"> 
              <html:option value="-1">全部</html:option>
              <html:options property="list[@type='POS']/POS/POSID" labelProperty="list[@type='POS']/POS/POSID"/> 
         </html:select>
		&nbsp;是否完成：
		 <html:select property="MonitorTask/Finished/criteria/value" styleClass="input">
			<html:option value="-1">不限</html:option>
			<html:option value="0">未完成</html:option>
			<html:option value="1">已完成</html:option>	
		</html:select>
		 &nbsp;完成情况：
		 <html:select property="MonitorTask/onResult" styleClass="input">
			<html:option value="-1">不限</html:option>
			<html:option value="0">失败</html:option>
			<html:option value="1">成功</html:option>	
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
            <td width="15%" align="center" nowrap id="MonitorTask.ExecuteTime" onclick="talentsort()">执行时间</td>
            <td width="9%" align="center" nowrap id="MonitorTask.TaskTypeID" onclick="talentsort()">任务类型</td>
            <td width="9%" align="center" nowrap id="MonitorTask.DeviceTypeID" onclick="talentsort()">设备类型</td>
            <td width="9%" align="center" nowrap id="MonitorTask.DeviceID" onclick="talentsort()">设备号</td>
            <td width="15%" align="center" nowrap id="MonitorTask.CreatedTime" onclick="talentsort()">创建时间</td>
            <td width="9%" align="center" nowrap id="MonitorTask.OperatorName" onclick="talentsort()">操作员</td>
            <td width="9%" align="center" nowrap id="MonitorTask.RetryTimes" onclick="talentsort()">重试次数</td>
            <td width="9%" align="center" nowrap id="MonitorTask.Finished" onclick="talentsort()">是否完成</td>
            <td width="12%" align="center" nowrap id="MonitorTask.Result" onclick="talentsort()">完成情况</td>
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
	            <logic:equal id="resultset" property="MonitorTask/DeviceTypeID" value="1">收费机</logic:equal>	            </td>
	            <td  nowrap align="center">
	            <logic:equal id="resultset" property="MonitorTask/DeviceID" value="0">全部</logic:equal>
	            <logic:notEqual id="resultset" property="MonitorTask/DeviceID" value="0">
	            	<bean:write id="resultset" property="MonitorTask/DeviceID"/>
	            </logic:notEqual>	            </td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MonitorTask/CreatedTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MonitorTask/OperatorName"/></td>
                <td  nowrap align="center"><bean:write id="resultset" property="MonitorTask/RetryTimes"/></td>
                <td  nowrap align="center">
                <logic:equal id="resultset" property="MonitorTask/Finished" value="0">
                	<font color="red">未完成</font>                </logic:equal>
                 <logic:equal id="resultset" property="MonitorTask/Finished" value="1">已完成</logic:equal>                </td>
                <td  nowrap align="center">
                <logic:equal id="resultset" property="MonitorTask/Finished" value="0">未知</logic:equal>
                <logic:equal id="resultset" property="MonitorTask/Finished" value="1">
					<logic:lessThan id="resultset" property="MonitorTask/Result" value="0">
						<font color="#FF0000">失败</font>					</logic:lessThan>
					<logic:greaterEqual id="resultset" property="MonitorTask/Result" value="0">
						<%--任务类型大于等于3表示下传任务--%>
						<logic:greaterEqual id="resultset" property="MonitorTask/TaskTypeID" value="3">
							成功						</logic:greaterEqual>
						<%--任务类型小于3表示采集任务--%>
						<logic:lessThan id="resultset" property="MonitorTask/TaskTypeID" value="3">
							采集<bean:write id="resultset" property="MonitorTask/Result"/>条记录						</logic:lessThan>
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
						alert("只能选择一条记录！");
				    	return ;
					
					}
				    var Finished = obj.getAttribute("Finished");
				    if(Finished!="0"){
				    	alert("只有未完成的任务才可以强制完成！");
				    	return ;
				    }
				}
			}
			i++;
		}
		if(j==0){
			alert("请选择一条记录");
			return "";
		}
		if(window.confirm("确定要强制完成此任务吗？")){
			var fid = getChechedValue(frm);
			frm.action = frm.elements["finishaction"].value;
			frm.action += "?fid=" + fid;
    		frm.submit();
		}
 }

</script>