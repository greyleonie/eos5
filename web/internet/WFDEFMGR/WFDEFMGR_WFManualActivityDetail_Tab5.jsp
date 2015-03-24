
<display:tabHead topSpace="20" contentWidth="80%"/>
<display:detailHead lineClass=""/>

<table width="100%" border="0" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" class="gridtable">
  <tr>
      <td class="detailLabelTD" width="30%">
      	是否启用多工作项设置
      </td> 
      
      <td class="detailFieldTD" width="70%" colspan="3">
      <dict:write businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefine/Activity/isMulWIValid" />
      </td>
  </tr> 
</table>


<logic:equal  property="WFProcessDefine/Activity/isMulWIValid" value="true">
<table id="mulWrokItem" width="100%" border="0" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" class="gridtable">
  
  <tr > 
    	<td class="detailFieldTD" colspan="4">
  		【工作项个数设定】 
  	</td>
  </tr>
  <tr>
      <td class="detailLabelTD">
        <dict:write businTypeId="WFDICT_WorkitemNumStrategy" property="WFProcessDefine/Activity/workitemNumStrategy" />
      </td>
      <td class="detailFieldTD" width="80%">
        <logic:equal  property="WFProcessDefine/Activity/workitemNumStrategy" value="participant-number">
        按照参与者设置个数领取
        </logic:equal>
        <logic:equal  property="WFProcessDefine/Activity/workitemNumStrategy" value="operator-number">
        根据操作员个数分配
        </logic:equal>                
      </td> 
      <td></td>
      <td></td>
  </tr>


  <tr > 
    	<td class="detailFieldTD" colspan="4">
  		【完成规则设定】 
  	</td>
  </tr>

  <tr>
      <td class="detailLabelTD" width="32%">
        <dict:write businTypeId="WFDICT_FinishRule" property="WFProcessDefine/Activity/finishRule" />
      </td> 
         
      <td class="detailFieldTD" width="68%">
        <logic:equal  property="WFProcessDefine/Activity/finishRule" value="all">
        	&nbsp;
        </logic:equal>
        <logic:equal  property="WFProcessDefine/Activity/finishRule" value="specifyNum">
        	<bean:write property="WFProcessDefine/Activity/finishRquiredNum"/>
        </logic:equal>
        <logic:equal  property="WFProcessDefine/Activity/finishRule" value="specifyPercent">
        	<bean:write property="WFProcessDefine/Activity/finishRequiredPercent"/>％
        </logic:equal>                
      </td> 
  </tr>
  
  
  <tr>
      <td class="detailLabelTD" width="32%">
	未完成活动自动终止
      </td> 
         
      <td class="detailFieldTD" width="68%">
        <dict:write businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefine/Activity/isAutoCancel" />
      </td> 
  </tr>  


</table> 
  </logic:equal>

<table width="100%" height="40">
  <tr >
    <td align="right">
	<input type="button" class="button" value = "修改活动定义" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>&tab=5');">
    </td>
   </tr>  
</table>

<display:detailTail/>
<display:tabTail buttomSpace="20"/>