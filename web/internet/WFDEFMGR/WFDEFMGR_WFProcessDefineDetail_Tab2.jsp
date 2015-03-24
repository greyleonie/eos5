<display:tabHead topSpace="20" contentWidth="96%"/>
<display:detailHead lineClass=""/>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" class="gridtable">
    <tr> 
      <td align="right" class="detailLabelTD" colspan="1" width="30%">
      	是否设定时间限制
      </td>     
      
      <td class="detailFieldTD" colspan="3">
	<dict:write businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefineXML/Process/isTimeLimitSet" />
      </td>
    </tr>  
      
<logic:equal  property="WFProcessDefineXML/Process/isTimeLimitSet" value="true">
  <tr>
  
  <logic:equal  property="WFProcessDefineXML/Process/timeLimitStrategy" value="limit_strategy_designate">      	
      <td align="right" class="detailLabelTD" colspan="1" width="30%">
      	自定义时间限制
      </td>           
      <td class="detailFieldTD" colspan="3">
      	<bean:write property="WFProcessDefineXML/Process/day"/>
      	天
      	<bean:write property="WFProcessDefineXML/Process/hour"/>
      	小时
      	<bean:write property="WFProcessDefineXML/Process/minute"/>
      	分钟
      </td>
   </logic:equal>
   
  <logic:equal  property="WFProcessDefineXML/Process/timeLimitStrategy" value="limit_strategy_reldata">     	
      <td align="right" class="detailLabelTD" colspan="1" width="30%">
       从相关数据获取时间限制
      </td> 
      <td class="detailFieldTD" colspan="3">
      	<bean:write property="WFProcessDefineXML/Process/relevantData"/> 
      </td>
      
   </logic:equal>
      
  </tr>  
    <tr>
<td align="right" class="detailLabelTD" colspan="1" width="30%">
<script>
var isSendMessageForRemind='<bean:write property="WFProcessDefineXML/Process/isSendMessageForOvertime"/>';

if(isSendMessageForRemind=='true'){
document.write("<input name=\"isSendMessageForRemind\" type=\"checkbox\" checked disabled>");
}else{
document.write("<input name=\"isSendMessageForRemind\" type=\"checkbox\" disabled>");
}
</script>
</td>
<td class="detailFieldTD" colspan="3">

是否进行超时提醒
</td>
</tr>
  <tr>
      <td align="right" class="detailLabelTD">
      	提醒方式
      </td>
      
      <td class="detailFieldTD" width="10%">
      	<bean:write property="WFProcessDefineXML/Process/remindType"/>
      </td>
      
      <td width="25%" align="right" class="detailLabelTD">
      	提前提醒时间
      </td>     
      
      <td class="detailFieldTD" width="">
      	<bean:write property="WFProcessDefineXML/Process/day1"/>天
      	<bean:write property="WFProcessDefineXML/Process/hour1"/>小时
      	<bean:write property="WFProcessDefineXML/Process/minute1"/>分钟
      </td>
  </tr>
  	      <tr>

<td align="right" class="detailLabelTD" colspan="1" width="30%">
<script>
var isSendMessageForRemind='<bean:write property="WFProcessDefineXML/Process/isSendMessageForRemind"/>';

if(isSendMessageForRemind=='true'){
document.write("<input name=\"isSendMessageForRemind\" type=\"checkbox\" checked disabled>");
}else{
document.write("<input name=\"isSendMessageForRemind\" type=\"checkbox\" disabled>");
}
</script>
</td>
<td class="detailFieldTD" colspan="3">

是否进行超时预警
</td>
</tr>
  </logic:equal>
</table>
<table width="100%" height="40">
  <tr>
    <td align="right">
	<input type="button" class="button" value = "修改流程定义" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyProcDef.do?processDefID=<bean:write property="processDefID"/>&tab=2');">
    </td>
   </tr>  
</table>   

<display:detailTail/>
<display:tabTail buttomSpace="20"/>
