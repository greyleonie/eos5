
<display:tabHead topSpace="20" contentWidth="80%"/>
<display:detailHead lineClass=""/>

<table width="100%" border="0" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" class="gridtable">
  
  <tr class="add_head"> 
    	<td align="left" colspan="4">
  		【基本属性】 
  	</td>
  </tr>
  
  <tr>
      <td class="detailLabelTD" width="25%">
      	活动ID
      </td>
      
      <td class="detailFieldTD" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityId"/>
      </td>
      
      <td class="detailLabelTD" width="25%">
      	活动名称
      </td>    
      
      <td class="detailFieldTD" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityName"/>
      </td>
  </tr>

  <tr>
      <td class="detailLabelTD">
      	聚合模式
      </td>     
      
      <td class="detailFieldTD">
      	<bean:write property="WFProcessDefine/Activity/joinType"/>
      </td>
      
      <td class="detailLabelTD">
      	分支模式
      </td>
      
      <td class="detailFieldTD">
      	<bean:write property="WFProcessDefine/Activity/splitType"/>
      </td>
  </tr>

  <tr>
      <td class="detailLabelTD" width="25%">
      	优先级
      </td> 
      
      <td class="detailFieldTD" width="75%" colspan="3">
      	<dict:write businTypeId="WFDICT_Priority" property="WFProcessDefine/Activity/priority" />
      </td>

  </tr>

  <tr class="add_head"> 
    	<td align="left" colspan="4">
  		【扩展属性】 
  	</td>
  </tr>

  <tr>
      <td class="detailLabelTD" width="25%">
      	是否自定义URL
      </td> 
      
      <td class="detailFieldTD" width="75%" colspan="3">
      <dict:write businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefine/Activity/isSpecifyURL" />
      </td>
  </tr>  

  <logic:equal  property="WFProcessDefine/Activity/isSpecifyURL" value="true">
  <tr>
      <td class="detailLabelTD" width="25%">
      	调用URL
      </td> 
      
      <td class="detailFieldTD" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/urlInfo"/>
      </td>
  </tr>  
  </logic:equal>

</table> 

<table width="100%" height="40">
  <tr >
    <td align="right">
	<input type="button" class="button" value = "修改活动定义" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>&tab=1');">
    </td>
   </tr>  
</table>

<display:detailTail/>
<display:tabTail buttomSpace="20"/>