
<display:tabHead topSpace="20" contentWidth="80%"/>
<display:detailHead lineClass=""/>

<table width="100%" border="0" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" class="gridtable">
  
  <tr class="add_head"> 
    	<td align="left" colspan="4">
  		���������ԡ� 
  	</td>
  </tr>
  
  <tr>
      <td class="detailLabelTD" width="25%">
      	�ID
      </td>
      
      <td class="detailFieldTD" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityId"/>
      </td>
      
      <td class="detailLabelTD" width="25%">
      	�����
      </td>    
      
      <td class="detailFieldTD" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityName"/>
      </td>
  </tr>

  <tr>
      <td class="detailLabelTD">
      	�ۺ�ģʽ
      </td>     
      
      <td class="detailFieldTD">
      	<bean:write property="WFProcessDefine/Activity/joinType"/>
      </td>
      
      <td class="detailLabelTD">
      	��֧ģʽ
      </td>
      
      <td class="detailFieldTD">
      	<bean:write property="WFProcessDefine/Activity/splitType"/>
      </td>
  </tr>

  <tr>
      <td class="detailLabelTD" width="25%">
      	���ȼ�
      </td> 
      
      <td class="detailFieldTD" width="75%" colspan="3">
      	<dict:write businTypeId="WFDICT_Priority" property="WFProcessDefine/Activity/priority" />
      </td>

  </tr>

  <tr class="add_head"> 
    	<td align="left" colspan="4">
  		����չ���ԡ� 
  	</td>
  </tr>

  <tr>
      <td class="detailLabelTD" width="25%">
      	�Ƿ��Զ���URL
      </td> 
      
      <td class="detailFieldTD" width="75%" colspan="3">
      <dict:write businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefine/Activity/isSpecifyURL" />
      </td>
  </tr>  

  <logic:equal  property="WFProcessDefine/Activity/isSpecifyURL" value="true">
  <tr>
      <td class="detailLabelTD" width="25%">
      	����URL
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
	<input type="button" class="button" value = "�޸Ļ����" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>&tab=1');">
    </td>
   </tr>  
</table>

<display:detailTail/>
<display:tabTail buttomSpace="20"/>