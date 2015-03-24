<table width="100%" height="40" border="0" cellspacing="1" cellpadding="1" class="query" align="center">
  <tr class="add_bottom">
    <td colspan="2" align="center" width="80%">
    </td>
    
    <td colspan="1" align="center">
	<input type="button" class="button" value = "±£´æ" onclick="javascript:save();">
    </td>
    
    <td colspan="1" align="center">
        <input type="button" class="button" value = "È¡Ïû" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ShowActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>');">
    </td>    
  </tr>    

</table> 
  
<script language="javascript">
	function save() {
		var frm = document.ActyInfo;
		frm.tab.value=<bean:write property="tab"/>
		frm.submit();
	}
function doCheck(checkObj){
alert(document.ActyInfo.elements['WFProcessDefine/Activity/isSendMessageForRemind'].value);

	if(checkObj.checked){
		document.ActyInfo.elements['WFProcessDefine/Activity/isSendMessageForRemind'].value=true;
	}else{
		document.ActyInfo.elements['WFProcessDefine/Activity/isSendMessageForRemind'].value=false;
	}
}

function doCheck1(checkObj){
	if(checkObj.checked){
		document.ActyInfo.elements['WFProcessDefine/Activity/isSendMessageForOvertime'].value=true;
	}else{
		document.ActyInfo.elements['WFProcessDefine/Activity/isSendMessageForOvertime'].value=false;
	}
}
	
</script>

