<display:tabHead topSpace="20" contentWidth="96%"/>
<display:detailHead lineClass=""/>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" class="gridtable">
    <tr> 
      <td align="right" class="detailLabelTD" colspan="1" width="30%">
      	�Ƿ��趨ʱ������
      </td>     
      
      <td class="detailFieldTD" colspan="3">
	<dict:write businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefineXML/Process/isTimeLimitSet" />
      </td>
    </tr>  
      
<logic:equal  property="WFProcessDefineXML/Process/isTimeLimitSet" value="true">
  <tr>
  
  <logic:equal  property="WFProcessDefineXML/Process/timeLimitStrategy" value="limit_strategy_designate">      	
      <td align="right" class="detailLabelTD" colspan="1" width="30%">
      	�Զ���ʱ������
      </td>           
      <td class="detailFieldTD" colspan="3">
      	<bean:write property="WFProcessDefineXML/Process/day"/>
      	��
      	<bean:write property="WFProcessDefineXML/Process/hour"/>
      	Сʱ
      	<bean:write property="WFProcessDefineXML/Process/minute"/>
      	����
      </td>
   </logic:equal>
   
  <logic:equal  property="WFProcessDefineXML/Process/timeLimitStrategy" value="limit_strategy_reldata">     	
      <td align="right" class="detailLabelTD" colspan="1" width="30%">
       ��������ݻ�ȡʱ������
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

�Ƿ���г�ʱ����
</td>
</tr>
  <tr>
      <td align="right" class="detailLabelTD">
      	���ѷ�ʽ
      </td>
      
      <td class="detailFieldTD" width="10%">
      	<bean:write property="WFProcessDefineXML/Process/remindType"/>
      </td>
      
      <td width="25%" align="right" class="detailLabelTD">
      	��ǰ����ʱ��
      </td>     
      
      <td class="detailFieldTD" width="">
      	<bean:write property="WFProcessDefineXML/Process/day1"/>��
      	<bean:write property="WFProcessDefineXML/Process/hour1"/>Сʱ
      	<bean:write property="WFProcessDefineXML/Process/minute1"/>����
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

�Ƿ���г�ʱԤ��
</td>
</tr>
  </logic:equal>
</table>
<table width="100%" height="40">
  <tr>
    <td align="right">
	<input type="button" class="button" value = "�޸����̶���" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyProcDef.do?processDefID=<bean:write property="processDefID"/>&tab=2');">
    </td>
   </tr>  
</table>   

<display:detailTail/>
<display:tabTail buttomSpace="20"/>
