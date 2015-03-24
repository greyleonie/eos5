<display:tabHead topSpace="20" contentWidth="90%"/>
<display:detailHead lineClass=""/>

<table width="100%" border="0" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" class="gridtable">
    
  <tr>
      <td class="detailLabelTD" width="25%">
      	是否设定时间限制
      </td>     
      										
      <td class="detailFieldTD" colspan="3">
	<dict:write businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefine/Activity/isTimeLimitSet" />
      </td>
  </tr>          
    <logic:equal  property="WFProcessDefine/Activity/isTimeLimitSet" value="true">
  <tr>
  
  <logic:equal  property="WFProcessDefine/Activity/timeLimitStrategy" value="limit_strategy_designate">      	
      <td align="right" class="detailLabelTD" colspan="1" width="30%">
      	自定义时间限制
      </td>           
      <td class="detailFieldTD" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/day"/>
      	天
      	<bean:write property="WFProcessDefine/Activity/hour"/>
      	小时
      	<bean:write property="WFProcessDefine/Activity/minute"/>
      	分钟
      </td>
   </logic:equal>
   
  <logic:equal  property="WFProcessDefine/Activity/timeLimitStrategy" value="limit_strategy_reldata">     	
      <td align="right" class="detailLabelTD" colspan="1" width="30%">
       从相关数据获取时间限制
      </td> 
      <td class="detailFieldTD" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/relevantData"/> 
      </td>
      
   </logic:equal>
      
  </tr>  
<tr>
<td class="detailLabelTD" class="detailLabelTD">
<script>
var isSendMessageForRemind='<bean:write property="WFProcessDefine/Activity/isSendMessageForOvertime"/>';

if(isSendMessageForRemind=='true'){
document.write("<input name=\"isSendMessageForRemind\" type=\"checkbox\" checked disabled>");
}else{
document.write("<input name=\"isSendMessageForRemind\" type=\"checkbox\" disabled>");
}
</script>
</td>
<td align="right" class="detailFieldTD" width="30%">是否进行超时提醒</td>
</tr>
			
  <tr>
      <td align="right" class="detailLabelTD">
      	提醒方式
      </td>
      
      <td class="detailFieldTD" width="10%">
      	<bean:write property="WFProcessDefine/Activity/remindType"/>
      </td>
      </tr>
	  <tr>
      <td width="25%" align="right" class="detailLabelTD">
      	提前提醒时间
      </td>     
      
      <td class="detailFieldTD" width="">
      	<bean:write property="WFProcessDefine/Activity/day1"/>天
      	<bean:write property="WFProcessDefine/Activity/hour1"/>小时
      	<bean:write property="WFProcessDefine/Activity/minute1"/>分钟
      </td>
  </tr>
  	      <tr>
<td align="right" class="detailLabelTD" colspan="1" width="30%">

<script>
var isSendMessageForRemind='<bean:write property="WFProcessDefine/Activity/isSendMessageForRemind"/>';

if(isSendMessageForRemind=='true'){
document.write("<input name=\"isSendMessageForRemind\" type=\"checkbox\" checked disabled>");
}else{
document.write("<input name=\"isSendMessageForRemind\" type=\"checkbox\" disabled>");
}
</script>
</td>
			<td class="detailFieldTD" colspan="3">
是否进行超时预警</td>
		</tr>
  </logic:equal>
 
</table>

<table width="100%" height="40">
  <tr >
    <td align="right">        
        <input type="button" class="button" value = "修改活动定义" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>&tab=3');"> 
    </td>
  </tr>  
</table>

<display:detailTail/>
<display:tabTail buttomSpace="20"/>
