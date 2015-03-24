<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %>
<html>
    <head><title>活动定义</title>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    </head>
    <body>

<!--详细信息显示-->   
<table width="68%" border="0" align="center" class="add">
  <tr class="add_title" > 
    <td colspan="4">【活动定义信息】</td>
  </tr>
  <tr class="add_content"> 
    <td align="right" class="add_head" width="21%">流程ID：</td>
    <td height="17" width="32%" class="result_head">123</td>
    <td align="right" class="add_head" width="17%">流程名称：</td>
    <td height="17" width="30%" class="result_head" align="left">请假流程</td>
  </tr>
  <tr class="add_content"> 
    <td align="right" class="add_head" width="21%">活动ID：</td>
    <td height="17" width="32%" class="result_head">123</td>
    <td align="right" class="add_head" width="17%">活动名称：
    </td>
    <td height="17" width="30%" class="result_head" align="left">
    	<input name="EOSOperator/operatorName" type="text" value="起草" >
    </td>
  </tr>
  <tr class="add_content"> 
    <td align="right" class="add_head" width="21%">参与者列表【人员】：</td>
    <td colspan="3" class="result_head" >
    	<input name="EOSOperator/operatorName" type="text" value="张三，李四，王五" >
    	<a href="WFDEFMGR_SelectPerson.jsp" target ="_blank" >选择</a> 
    </td>
  </tr>    
  <tr class="add_content"> 
    <td align="right" class="add_head" width="21%">参与者列表【机构】：</td>
    <td colspan="3" class="result_head" >
        <input name="EOSOperator/operatorName" type="text" value="运行部，管理部" >
    	<a href="WFDEFMGR_SelectOrg.jsp" target ="_blank" >选择</a> 
    </td>
  </tr>
  <tr class="add_content"> 
    <td align="right" class="add_head" width="21%">参与者列表【角色】：</td>
    <td colspan="3" class="result_head" >
        <input name="EOSOperator/operatorName" type="text" value="经理，总裁" >
    	<a href="WFDEFMGR_SelectRole.jsp"  target ="_blank" >选择</a>
    </td>
  </tr>        
  <tr class="add_content"> 
    <td align="right" class="add_head" width="21%">活动描述：</td>
    <td colspan="3" class="result_head" >测试活动</td>
  </tr>
</table>

<table width="100%" height="5%" border="0" cellspacing="1" cellpadding="1" class="query" align="center">
  <tr class="add_bottom">
    <td colspan="80%" align="center">
    </td>
    <td colspan="10%" align="center">
    	<a href="/internet/WFDEFMGR/WFDEFMGR_WFProcDefineDetailFrame.jsp">
    	<img border="0" src="/internet/WFCOMMON/images/button/save.gif"  width="36" height="19">
    	</a> 
    </td>
    <td colspan="10%" align="center">
        <a href="/internet/WFDEFMGR/WFDEFMGR_WFProcDefineDetailFrame.jsp">
          <img border="0" src="/internet/WFCOMMON/images/button/cannel.gif"  width="36" height="19">
        </a>
    </td>    
  </tr>  
</table>

</body>
</html>       
