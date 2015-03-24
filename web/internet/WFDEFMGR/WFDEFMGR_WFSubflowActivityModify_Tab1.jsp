<display:tabHead topSpace="20" contentWidth="80%"/>

<table width="100%"  cellpadding="0"  cellspacing="0"  class="gridtable">

  
  <tr class="add_head"> 
    	<td align="left" colspan="4">
  		【基本属性】 
  	</td>
  </tr>
  
  <tr>
      <td class="queryLabelTD" width="25%">
      	活动ID
      </td>
      
      <td class="queryFieldTD" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityId"/>
      </td>
      
      <td class="queryLabelTD" width="25%">
      	活动名称
      </td>    
      
      <td class="queryFieldTD" width="25%">
      	<html:text property="WFProcessDefine/Activity/activityName" />
      </td>
  </tr>

  <tr>
      <td class="queryLabelTD">
      	聚合模式
      </td>     
      
      <td class="queryFieldTD">
      	<bean:write property="WFProcessDefine/Activity/joinType"/>
      </td>
      
      <td class="queryLabelTD">
      	分支模式
      </td>
      
      <td class="queryFieldTD">
      	<bean:write property="WFProcessDefine/Activity/splitType"/>
      </td>
  </tr>

  <tr>
      <td class="queryLabelTD" width="25%" colspan="1">
      	优先级
      </td> 
      
      <td class="queryFieldTD" width="75%" colspan="3">
      	 <dict:select businTypeId="WFDICT_Priority" property="WFProcessDefine/Activity/priority" />
      </td>
  </tr>

  <tr class="add_head"> 
    	<td align="left" colspan="4">
  		【扩展属性】 
  	</td>
  </tr>

  <tr>
      <td class="queryLabelTD">
      	调用方式
      </td> 
      
      <td class="queryFieldTD" colspan="3">
      	<dict:select businTypeId="WFDICT_InvokeType" property="WFProcessDefine/Activity/syncType" />
      </td>
  </tr>  
  
  <tr>
      <td class="queryLabelTD">
      	子流程
      </td> 
      
      <td class="queryFieldTD" colspan="3">
      	<html:text property="WFProcessDefine/Activity/subProcess" size="40"/>
      </td>
  </tr>    

</table> 


<%@include file="WFDEFMGR_WFSubflowActivityDefineSave.jsp"%>  

<display:tabTail buttomSpace="20"/>