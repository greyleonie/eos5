<display:tabHead topSpace="20" contentWidth="80%"/>

<table width="100%"  cellpadding="0"  cellspacing="0"  class="gridtable">

  <tr>
      <td align="right" class="queryLabelTD" width="25%">
      	�ID
      </td>
      
      <td class="queryFieldTD" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityId"/>
      </td>
      
      <td align="right" class="queryLabelTD" width="25%">
      	�����
      </td>    
      
      <td class="queryFieldTD" width="25%">
      	<html:text property="WFProcessDefine/Activity/activityName"/>
      </td>
  </tr>

  <tr>
      <td align="right" class="queryLabelTD">
      	�ۺ�ģʽ
      </td>
      
      <td class="queryFieldTD" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/joinType"/>
      </td>
  </tr>      
  
  </table>  
  
<%@include file="WFDEFMGR_WFActivityDefineSave.jsp"%>  

<display:tabTail buttomSpace="20"/>