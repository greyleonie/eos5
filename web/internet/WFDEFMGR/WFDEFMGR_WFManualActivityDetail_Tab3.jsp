<display:tabHead topSpace="20" contentWidth="90%"/>
<display:detailHead lineClass=""/>

<table width="100%" border="0" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" class="gridtable">
    
  <tr>
      <td class="detailLabelTD" width="25%">
      	�Ƿ��趨ʱ������
      </td>     
      										
      <td class="detailFieldTD" colspan="3">
	<dict:write businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefine/Activity/isTimeLimitSet" />
      </td>
  </tr>          
    <logic:equal  property="WFProcessDefine/Activity/isTimeLimitSet" value="true">
  <tr>
  
  <logic:equal  property="WFProcessDefine/Activity/timeLimitStrategy" value="limit_strategy_designate">      	
      <td align="right" class="detailLabelTD" colspan="1" width="30%">
      	�Զ���ʱ������
      </td>           
      <td class="detailFieldTD" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/day"/>
      	��
      	<bean:write property="WFProcessDefine/Activity/hour"/>
      	Сʱ
      	<bean:write property="WFProcessDefine/Activity/minute"/>
      	����
      </td>
   </logic:equal>
   
  <logic:equal  property="WFProcessDefine/Activity/timeLimitStrategy" value="limit_strategy_reldata">     	
      <td align="right" class="detailLabelTD" colspan="1" width="30%">
       ��������ݻ�ȡʱ������
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
<td align="right" class="detailFieldTD" width="30%">�Ƿ���г�ʱ����</td>
</tr>
			
  <tr>
      <td align="right" class="detailLabelTD">
      	���ѷ�ʽ
      </td>
      
      <td class="detailFieldTD" width="10%">
      	<bean:write property="WFProcessDefine/Activity/remindType"/>
      </td>
      </tr>
	  <tr>
      <td width="25%" align="right" class="detailLabelTD">
      	��ǰ����ʱ��
      </td>     
      
      <td class="detailFieldTD" width="">
      	<bean:write property="WFProcessDefine/Activity/day1"/>��
      	<bean:write property="WFProcessDefine/Activity/hour1"/>Сʱ
      	<bean:write property="WFProcessDefine/Activity/minute1"/>����
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
�Ƿ���г�ʱԤ��</td>
		</tr>
  </logic:equal>
 
</table>

<table width="100%" height="40">
  <tr >
    <td align="right">        
        <input type="button" class="button" value = "�޸Ļ����" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>&tab=3');"> 
    </td>
  </tr>  
</table>

<display:detailTail/>
<display:tabTail buttomSpace="20"/>
