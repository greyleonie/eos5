
<script  language="JavaScript">
	function deleteProcInst(){
	if(confirm("删除后将不能被恢复,确定删除吗?")){
		resultForm.submit();	
    	}else{}
	}
	
	function deleteProcDefine(){
	if(confirm("删除后将不能被恢复,确定删除吗?")){
	location.href="WFINSTMGR.pr_automata.WFINSTMGR_P_preDelProcDef.do?processDefID=<bean:write property='WFProcessDefine/processDefID'/>";
//		window.showModalDialog('WFINSTMGR.pr_automata.WFINSTMGR_P_preDelProcDef.do?processDefID=<bean:write property="WFProcessDefine/processDefID"/>',window,'dialogHeight:200px;dialogWidth:400px;center:yes')
    	}else{}
	}
</script>
<display:tabHead topSpace="20" contentWidth="96%"/>
<!--详细信息显示-->
<display:detailHead lineClass=""/>
<form name="resultForm" action="WFDEFMGR.pr_automata.WFDEFMGR_P_DelProcessInstByDefID.do" target="moonpiazza" method="POST">
        <input type="hidden" name="processDefID" value="<bean:write  property="WFProcessDefine/processDefID"/>">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" >
  <tr> 
    <td align="right" class="detailLabelTD" width="15%">
    	流程ID
    </td>
    
    <td height="17" width="35%" class="detailFieldTD">
    	<bean:write property="WFProcessDefine/processDefID" />
    </td>
    
    <td align="right" class="detailLabelTD" width="15%">
    	流程名称
    </td>
    
    <td height="17" width="35%" class="detailFieldTD" align="left">
    	<bean:write property="WFProcessDefine/processDefName" />
    </td>
  </tr>

  <tr> 
    <td align="right" class="detailLabelTD" width="15%">
    	流程中文名称
    </td>
    
    <td width="35%" class="detailFieldTD" align="left">
    	<bean:write property="WFProcessDefine/processChName" />
    </td>
    
    <td align="right" class="detailLabelTD" width="15%">
    	当前状态
    </td>
    
    <td width="35%" class="detailFieldTD">
    	<dict:write businTypeId="WFDICT_ProcessDefState" property="WFProcessDefine/currentState" />
    </td>    
  </tr>  
  
  <tr> 
    <td align="right" class="detailLabelTD" width="15%">
    	创建时间
    </td>
    
    <td height="17" width="35%" class="detailFieldTD">
    	<bean:write property="WFProcessDefine/createTime" formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/>
    </td>
    
    <td align="right" class="detailLabelTD" width="15%">
    	更新时间
    </td>
    
    <td height="17" width="35%" class="detailFieldTD" align="left">
    	<bean:write property="WFProcessDefine/updateTime" formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/>    	
    </td>
  </tr>
  
  <tr> 
    <td align="right" class="detailLabelTD" width="15%">
    	创建者
    </td>
    
    <td width="35%" class="detailFieldTD">
    	<bean:write property="WFProcessDefine/processDefOwner" />
    </td>
    
    <td align="right" class="detailLabelTD" width="15%">
    	版本号
    </td>
    
    <td width="35%" class="detailFieldTD" align="left">
    	<bean:write property="WFProcessDefine/versionSign" />
    </td>
  </tr>

  <tr> 
    <td align="right" class="detailLabelTD" width="15%">
    	流程包ID
    </td>
    
    <td height="17" width="35%" class="detailFieldTD">
    	<bean:write property="WFProcessDefine/packageID" />
    </td>
    
    <td align="right" class="detailLabelTD" width="15%">
    	流程包名称
    </td>
    
    <td height="17" width="35%" class="detailFieldTD" align="left">
    	<bean:write property="WFProcessDefine/packageName" />
    </td>
  </tr>
  
  <tr> 
    <td align="right" class="detailLabelTD" width="15%">
    	流程描述
    </td>
    
    <td colspan="3" class="detailFieldTD" >
    	<bean:write property="WFProcessDefineXML/Process/description" />
    </td>
  </tr>
</table>
<table width="100%" height="40">
  <tr>
    <td align="right">
    <input type="button" class="button" value="删除该定义下的所有流程实例" onClick="javascript:deleteProcInst();">
	<input type="button" class="button" value = "删除流程定义" onClick="javascript:deleteProcDefine();">         
	<!--
	<input type="button" class="button" value = "删除流程定义" onclick="javascript:goURL('WFCOMMON.pr_automata.next.do?nextPage=/internet/WFDEFMGR/WFDEFMGR_WFDeleteProcessDef.jsp&processDefID=<bean:write property="WFProcessDefine/processDefID"/>',window,'dialogHeight:200px;dialogWidth:400px;center:yes')">         
	-->
    <input type="button" class="button" value = "修改流程定义" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyProcDef.do?processDefID=<bean:write property="processDefID"/>&tab=1');">         
    </td>
   </tr>  
</table>   
</form>
<display:detailTail/>
<display:tabTail buttomSpace="20"/>
