
<display:tabHead topSpace="20" contentWidth="90%"/>
<display:detailHead lineClass=""/>

<table width="100%" border="0" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" class="gridtable">

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
      
      <td class="detailFieldTD" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/joinType"/>
      </td>
  </tr>      
  
  </table>

<table width="100%" height="40">
  <tr >
    <td align="right">
        <input type="button" class="button" value = "修改活动定义" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>');"> 
    </td>
   </tr>  
</table>
<display:detailTail/>
<display:tabTail buttomSpace="20"/>　　　　　　
