<display:tabHead topSpace="20" contentWidth="80%"/>

<table width="100%"  cellpadding="0"  cellspacing="0"  class="gridtable">

  <tr>
      <td align="right" class="queryLabelTD" width="25%">
      	活动ID
      </td>
      
      <td class="queryFieldTD" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityId"/>
      </td>
      
      <td align="right" class="queryLabelTD" width="25%">
      	活动名称
      </td>    

      <td class="queryFieldTD" width="25%">
      	<html:text property="WFProcessDefine/Activity/activityName"/>      	
      </td>
  </tr>

  <tr>
      <td align="right" class="queryLabelTD">
      	聚合模式
      </td>     
      
      <td class="queryFieldTD">
      	<bean:write property="WFProcessDefine/Activity/joinType"/>
      </td>
      
      <td align="right" class="queryLabelTD">
      	分支模式
      </td>
      
      <td class="queryFieldTD">
      	<bean:write property="WFProcessDefine/Activity/splitType"/>
      </td>
  </tr>

  <tr>
      <td align="right" class="queryLabelTD" width="25%" colspan="1">
      	优先级
      </td> 
      
      <td class="queryFieldTD" width="75%" colspan="3">
      	 <dict:select businTypeId="WFDICT_Priority" property="WFProcessDefine/Activity/priority" />
      </td>

  </tr>
  
</table>  
  
<%@include file="WFDEFMGR_WFActivityDefineSave.jsp"%>  

<display:tabTail buttomSpace="20"/>