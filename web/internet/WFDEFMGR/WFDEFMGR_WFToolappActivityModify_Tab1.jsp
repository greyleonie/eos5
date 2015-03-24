
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
      	<html:text property="WFProcessDefine/Activity/activityName"/>
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
      	调用类型
      </td>
      
      <td class="queryFieldTD">
      	<dict:select businTypeId="WFDICT_RollbackType" property="WFProcessDefine/Activity/invokeType" />
      </td>
      
      <td class="queryLabelTD">
      	是否自动返回结果
      </td>     
      
      <td class="queryFieldTD">
      	<dict:select businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefine/Activity/isReturnBizLogicResult" />
      </td>
  </tr>
  
  <tr>
      <td class="queryLabelTD">
      	调用方式
      </td> 
      	
      <td class="queryFieldTD">
      	<dict:select businTypeId="WFDICT_InvokeType" property="WFProcessDefine/Activity/syncType" />
      </td>
      
      <td class="queryLabelTD">
      	结束方式
      </td>     
      
      <td class="queryFieldTD">
      	<dict:select businTypeId="WFDICT_TerminalType" property="WFProcessDefine/Activity/terminateType" />      	
      </td>      
  </tr>    

  <tr height="30">
      <td class="queryLabelTD" width="25%" colsapn="1">
      	应用程序ID
      </td> 
      	
      <td class="queryFieldTD" width="75%" colspan="3" >
      	<html:text property="WFProcessDefine/Activity/applicationId" size="45"/>
      </td>
  </tr>    
       
</table>

<%@include file="WFDEFMGR_WFActivityDefineSave.jsp"%>  

<display:tabTail buttomSpace="20"/>