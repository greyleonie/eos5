<display:tabHead topSpace="20" contentWidth="80%"/>

<table width="100%"  cellpadding="0"  cellspacing="0"  class="gridtable">
  
  <tr>
      <td class="queryLabelTD" width="25%">
      	回退类型
      </td>     
      
      <td class="queryFieldTD" colspan="3" >
      	<dict:select businTypeId="WFDICT_RollbackType" property="WFProcessDefine/Activity/rollbackType" />      	
      </td>
  </tr>      
  
  <tr>
      <td class="queryLabelTD" width="25%">
      	回退动作
      </td> 
      
      <td class="queryFieldTD" colspan="3">
      	<html:text property="WFProcessDefine/Activity/rollback-action" size="40" />
      </td>
  </tr>

</table>

<%@include file="WFDEFMGR_WFManualActivityDefineSave.jsp"%>  

<display:tabTail buttomSpace="20"/>