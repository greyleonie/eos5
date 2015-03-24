<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
	<html>
    <head><title>wfactinstList</title>
    </head>
      <script  language="JavaScript">
    </script>
<display:pageHead bodyColor="#EEEEEE"/>
<eos:OneTab name="审计日志监控" imagePath="/internet/WFCOMMON/images/tt.gif" >	
<display:detailHead  title="审计详细信息"/> 
      <!--详细信息显示-->   
  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" style="border-collapse: collapse">
      <logic:iterate id="ResultSet" property="list"> 
      <tr>
<td align="right" class="queryLabelTD" width="15%">日志编号 </td>
          <td width="25%" class="detailFieldTD">
    <bean:write id="ResultSet" property="WFAuditLog/auditID"/></td>
<td align="right" class="queryLabelTD" width="15%">审计类型 </td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/auditType"/></td>
        </tr>
  <tr> 
    <td align="right" class="queryLabelTD" width="15%">操作</td>
          <td width="25%" class="detailFieldTD">
   <dict:write id="ResultSet" businTypeId="WFDICT_ActionType" property="WFAuditLog/actionType"/></td>
    <td align="right" class="queryLabelTD" width="15%">操作结果</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/actionResult"/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">发生日期</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/occurDate"   formatType='yyyy年MM月dd日' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
<td align="right" class="queryLabelTD" width="15%">发生时间</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/occurTime"  formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">操作员ID</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/operatorID"/></td>
<td align="right" class="queryLabelTD" width="15%">操作员名称</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/operatorName"/></td>
        </tr>
   <tr> 
<td align="right" class="queryLabelTD" width="15%">业务流程ID</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/processDefID"/></td>
<td align="right" class="queryLabelTD" width="15%">业务流程名称</td>
          <td width="33%" class="detailFieldTD">
          <bean:write id="ResultSet" property="WFAuditLog/processDefName"/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">流程实例ID </td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/processInstID"/></td>
<td align="right" class="queryLabelTD" width="15%">业务流程中文名称 </td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/processChName"/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">活动定义ID</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/activityDefID"/></td>
<td align="right" class="queryLabelTD" width="15%">活动定义名称</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/activityDefName"/></td>
        </tr>
  <tr class="add_content"> 
<td align="right" class="queryLabelTD" width="15%">活动实例ID</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/activityInstID"/></td>
<td align="right" class="queryLabelTD" width="15%">活动实例名称</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/activityInstName"/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">应用ID</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/appID"/></td>
<td align="right" class="queryLabelTD" width="15%">应用名称</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/appName"/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">工作项ID</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/workItemID"/></td>
<td align="right" class="queryLabelTD" width="15%">工作项名称</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/workItemName"/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">操作描述</td>
          <td width="25%" class="detailFieldTD" colspan="3">
      <textarea name="textfield" cols="70" rows="5" style="overflow:auto;background-color:#EEEEEE" readonly>
      <bean:write id="ResultSet" property="WFAuditLog/actionDesc"/></textarea></td>
        </tr>
  <tr > 
<td align="right" class="queryLabelTD" width="15%">后相关数据</td>
          <td width="25%" class="detailFieldTD" colspan="3">
      <textarea name="textfield" cols="70" rows="5" style="overflow:auto;background-color:#EEEEEE" readonly>
   <bean:write id="ResultSet" property="WFAuditLog/postRelData"/></textarea></td>
        </tr>
  </logic:iterate> 
      </table>
	<table  align="center" border="0">
		  <tr>
			<td align="center">
				<input type="button" value="返回" onClick="javascript:history.go(-1);"></td>
	  </tr>
	 </table>
<display:detailTail/>
</eos:OneTab><display:pageTail/> </html>
