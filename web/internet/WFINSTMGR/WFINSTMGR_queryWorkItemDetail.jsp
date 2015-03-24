<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<html>
    <head><title>workItemDetail</title>
    </head>
    <script  language="JavaScript">
		 function goClose(){
			history.go(-1);
		 }
    </script>
<display:pageHead bodyColor="#EEEEEE"/>
<display:detailHead lineClass="tb_blue"  title="工作项详细信息"/> 
      <!--详细信息显示-->   
  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEEEEE" bordercolor="#B6B5B5" style="border-collapse: collapse">
	  <tr> 
		  <td align="right" class="queryLabelTD" width="15%" nowrap>工作项ID</td>
		  <td width="25%" class="detailFieldTD"><bean:write property="WFWorkItemView/workItemID"/></td>
		  <td align="right" class="queryLabelTD" width="15%" nowrap>工作项名称</td>
		  <td width="33%" class="detailFieldTD"><bean:write property="WFWorkItemView/workItemName"/></td>
	  </tr>
	  <tr> 
			<td align="right" class="queryLabelTD" width="15%" nowrap>流程中文名称</td>
			<td width="25%" class="detailFieldTD"><bean:write property="WFWorkItemView/processChName"/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>流程版本</td>
			<td width="33%" class="detailFieldTD"><bean:write property="WFWorkItemView/versionSign"/></td>
	   </tr>
	  <tr> 
			<td align="right" class="queryLabelTD" width="15%" nowrap>当前状态</td>
			<td width="25%" class="detailFieldTD"><dict:write businTypeId="WFDICT_WorkItemState" property="WFWorkItemView/currentState"/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>参与者</td>
			<td width="33%" class="detailFieldTD"><bean:write property="WFWorkItemView/participant"/></td>
	  </tr>
	  <tr> 
			<td align="right" class="queryLabelTD" width="15%" nowrap>优先级</td>
			<td width="25%" class="detailFieldTD"><dict:write businTypeId="WFDICT_Priority" property="WFWorkItemView/priority"/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>是否超时</td>
			<td width="33%" class="detailFieldTD"><dict:write businTypeId="WFDICT_YN" property="WFWorkItemView/isTimeOut"/></td>
	  </tr>
	  <tr> 
			<td align="right" class="queryLabelTD" width="15%" nowrap>限制时间</td>
			<td width="25%" class="detailFieldTD"><bean:write property="WFWorkItemView/limitNum"/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>限制时间描述</td>
			<td width="33%" class="detailFieldTD"><bean:write property="WFWorkItemView/limitNumDesc"/></td>
	  </tr>
	  <tr>
			<td align="right" class="queryLabelTD" width="15%" nowrap>流程启动时间</td>
			<td width="33%" class="detailFieldTD"><bean:write property="WFWorkItemView/procInstCreateTime" formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>流程当前状态</td>
			<td width="33%" class="detailFieldTD"><dict:write businTypeId="WFDICT_ProcessState" property="WFWorkItemView/procInstCurrState"/></td>
	  </tr>
	  <tr>
			<td align="right" class="queryLabelTD" width="15%" nowrap>流程结束时间</td>
			<td width="25%" class="detailFieldTD"><bean:write property="WFWorkItemView/procInstEndtime" formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>活动实例名称</td>
			<td width="25%" class="detailFieldTD"><bean:write property="WFWorkItemView/activityInstName"/></td>
	  </tr>
	  <tr> 
			<td align="right" class="queryLabelTD" width="15%" nowrap>流程实例名称</td>
			<td width="25%" class="detailFieldTD"><bean:write property="WFWorkItemView/processInstName"/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>流程定义名称</td>
			<td width="33%" class="detailFieldTD"><bean:write property="WFWorkItemView/processDefName"/></td>
	  </tr>
	</table>
	<table  align="center" border="0">
		  <tr>
			<td align="center">
				<input type="button" value="返回" onClick="javascript:goClose();">
			</td>
	  </tr>
	 </table>
<display:detailTail/><display:pageTail/> 
</html>