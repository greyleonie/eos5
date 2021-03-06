
<display:tabHead topSpace="20" contentWidth="90%"/>
<display:detailHead lineClass=""/>

<table width="100%" border="0" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" class="gridtable">

  <tr class="add_head">   
  	<td align="left" colspan="4">
  		【基本属性】 
  	</td>
  </tr>
  
  <tr>
      <td align="right" class="detailLabelTD" width="25%">
      	活动ID
      </td>
      
      <td class="detailFieldTD" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityId"/>
      </td>
      
      <td align="right" class="detailLabelTD" width="25%">
      	活动名称
      </td>    
      
      <td class="detailFieldTD" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityName"/>
      </td>
  </tr>


  <tr>
      <td align="right" class="detailLabelTD">
      	聚合模式
      </td>     
      
      <td class="detailFieldTD">
      	<bean:write property="WFProcessDefine/Activity/joinType"/>
      </td>
      
      <td align="right" class="detailLabelTD">
      	分支模式
      </td>
      
      <td class="detailFieldTD">
      	<bean:write property="WFProcessDefine/Activity/splitType"/>
      </td>
  </tr>

  <tr>
      <td align="right" class="detailLabelTD" colspan="1" width="25%">
      	优先级
      </td> 
      
      <td class="detailFieldTD"  colspan="3" width="75%">
      	 <dict:write businTypeId="WFDICT_Priority" property="WFProcessDefine/Activity/priority" /> 	
      </td>
  </tr>
       
  <tr class="add_head">
  	<td align="left" colspan="4">
  		【扩展属性】
  	</td>
  </tr>
  
  <tr>
      <td align="right" class="detailLabelTD">
      	调用类型
      </td>
      
      <td class="detailFieldTD">
      	<dict:write businTypeId="WFDICT_RollbackType" property="WFProcessDefine/Activity/invokeType" />
      </td>
      
      <td align="right" class="detailLabelTD">
      	是否自动返回结果
      </td>     
      
      <td class="detailFieldTD">
        <dict:write businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefine/Activity/isReturnBizLogicResult" />
      </td>
  </tr>
  
  <tr>
      <td align="right" class="detailLabelTD">
      	调用方式
      </td> 
      	
      <td class="detailFieldTD">
      	<dict:write businTypeId="WFDICT_InvokeType" property="WFProcessDefine/Activity/syncType" />
      </td>
      
      <td align="right" class="detailLabelTD">
      	结束方式
      </td>     
      
      <td class="detailFieldTD">
      	<dict:write businTypeId="WFDICT_TerminalType" property="WFProcessDefine/Activity/terminateType" />
      </td>      
  </tr>    

  <tr>
      <td align="right" class="detailLabelTD">
      	应用程序ID
      </td> 
      	
      <td class="detailFieldTD" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/applicationId"/>
      </td>
  </tr>    
       
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

