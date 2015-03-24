<display:tabHead topSpace="20" contentWidth="80%"/>
<table width="100%"  cellpadding="0"  cellspacing="0"  class="gridtable">  

  
  <tr> 
    	<td align="left" colspan="4" width="100%">
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
      <td class="queryLabelTD" width="25%">
      	优先级
      </td> 
      
      <td class="queryFieldTD" colspan="3">
     	 <dict:select businTypeId="WFDICT_Priority" property="WFProcessDefine/Activity/priority" />      	
      </td>
  </tr>

  <tr> 
    	<td align="left" colspan="4" width="100%">
  		【扩展属性】 
  	</td>
  </tr>

  <tr>
      <td class="queryLabelTD" colspan="1" width="25%">
      	是否自定义URL
      </td> 
      
      <td class="queryFieldTD" colspan="3" width="75%">
	<dict:select businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefine/Activity/isSpecifyURL" onchange="handleChangeURL(this.options[this.options.selectedIndex].value)"/>
      </td>
  </tr>  

  <tr id="hide_tr">
      <td class="queryLabelTD" colspan="1" width="25%">
      	调用URL
      </td> 
      
      <td class="queryFieldTD" colspan="3" width="75%">
	<html:text property="WFProcessDefine/Activity/urlInfo" size="40"/>
      </td>
  </tr>  

</table> 

<%@include file="WFDEFMGR_WFManualActivityDefineSave.jsp"%>  
<display:tabTail buttomSpace="20"/>

<script language="javascript">
function handleChangeURL(v)
{
  if (v=="false")
  {
    hide_tr.style.display="none";
  }
  else
  {
    hide_tr.style.display="";
  }  
}


if (window.ActyInfo.elements['WFProcessDefine/Activity/isSpecifyURL'].value!="true")
{
handleChangeURL("false");
}
</script>