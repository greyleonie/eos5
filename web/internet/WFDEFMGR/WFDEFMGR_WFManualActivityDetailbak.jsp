

<table class="add" align="center" border="0">

  <tr class="add_title" > 
     <td colspan="2">【人工活动详细信息】</td>
  </tr>
  
  <tr class="add_head"> 
    	<td align="left" colspan="4">
  		【基本属性】 
  	</td>
  </tr>
  
  <tr class="add_content">
      <td align="right" class="add_head" width="25%">
      	活动ID
      </td>
      
      <td class="result_head" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityId"/>
      </td>
      
      <td align="right" class="add_head" width="25%">
      	活动名称
      </td>    
      
      <td class="result_head" width="25%">
      	<bean:write property="WFProcessDefine/Activity/activityName"/>
      </td>
  </tr>

  <tr class="add_content">
      <td align="right" class="add_head">
      	聚合模式
      </td>     
      
      <td class="result_head">
      	<bean:write property="WFProcessDefine/Activity/joinType"/>
      </td>
      
      <td align="right" class="add_head">
      	分支?Ｊ?
      </td>
      
      <td class="result_head">
      	<bean:write property="WFProcessDefine/Activity/splitType"/>
      </td>
  </tr>

  <tr class="add_content">
      <td align="right" class="add_head">
      	优先级
      </td> 
      
      <td class="result_head" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/priority"/>
      </td>
  </tr>

  <tr class="add_head"> 
    	<td align="left" colspan="4">
  		【扩展属性】 
  	</td>
  </tr>

  <tr class="add_content">
      <td align="right" class="add_head">
      	调用URL
      </td> 
      
      <td class="result_head" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/urlInfo"/>
      </td>
  </tr>  

  <tr class="add_head">   
  	<td align="left" colspan="4">
  		【活动参与者信息】 
  	</td>
  </tr>

  <tr class="add_content">
      <td align="right" class="add_head">
      	参与者类型
      </td>
      
      <td class="result_head" colspan="3">
      	<bean:write property="WFProcessDefine/Activity/organization"/>
      </td>
  </tr>    
      
  <tr class="add_content">
      <td align="right" class="add_head">
      	参与者列表
      </td>   
      
      <td class="result_head" colspan="3">
      
      	    <table border="0" cellspacing="1" cellpadding="1" class="result" align="center" width="30%">

		      <tr class="result_head"> 
		        <td width="10%" height="16">类型</td>
		        <td width="25%" height="16">名称</td>
		        <td width="25%" height="16">ID</td>
		      </tr>
		      
		      <tr class="result_content">      
		        <td>角色</td>
		        <td>系统管理员</td> 
		        <td>1001</td>         
		      </tr>
		  
		      <tr class="result_content">      
		        <td>角色</td>
		        <td>系统管理员</td> 
		        <td>1001</td>         
		      </tr>
		  
		      <tr class="result_content">      
		        <td>角色</td>
		        <td>系统管理员</td> 
		        <td>1001</td>         
		      </tr>
		      
		      <tr class="result_content">      
		        <td>角色</td>
		        <td>系统管理员</td> 
		        <td>1001</td>         
		      </tr>

	</table> 

      </td>
     
  </tr>
 
  <tr class="add_head">   
  	<td align="left" colspan="4">【时间限制信息】 </td>
  </tr>
    
  <tr class="add_content">
      <td align="right" class="add_head">时间限制</td>     
      <td colspan="3" >3 天 2 小时 30 分钟</td>
  </tr>  
  
  <tr class="add_content">
      <td align="right" class="add_head">提醒方式</td>     
      <td >电子邮件</td>
      <td align="right" class="add_head">提前提醒时间</td>     
      <td >1 天</td>
  </tr>
  
  <tr class="add_head">
  	<td align="left" colspan="4">
  		【回退属性】 
  	</td>
  </tr>
  
  <tr class="add_content">
      <td align="right" class="add_head">
      	回退类型
      </td>     
      
      <td class="result_head">
      	<bean:write property="WFProcessDefine/Activity/rollbackType"/>
      </td>
      
      <td align="right" class="add_head">
      	回退动作
      </td> 
      
      <td class="result_head">
      	<bean:write property="WFProcessDefine/Activity/rollback-action"/>
      </td>
  </tr>      

</table>

<table width="100%" border="0" cellspacing="1" cellpadding="1" class="query" align="center">
  <tr class="add_bottom">
    <td colspan="3" align="center" width="75%">
    </td>
    
    <td colspan="1" align="center">
        <a href="WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>">
          <img border="0" src="/internet/WFCOMMON/images/button/xghddy.gif"  width="90" height="19">
        </a> 
    </td>
   </tr>  
</table> 

