<table width="100%" height="5%" border="0" cellspacing="1" cellpadding="1" class="query" align="center">
  <tr class="add_bottom">
    <td colspan="2" align="center" width="80%">
    </td>
    
    <td colspan="1" align="center">
    	<input type="button" class="button" value = "保存" onclick="javascript:save();">
    </td>
    
    <td colspan="1" align="center">
        <input type="button" class="button" value = "取消" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ShowActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>');">
    </td>    
  </tr>    

</table> 
  
<script language="javascript">
	function checkValid()
	{
	  if (window.ActyInfo.elements['WFProcessDefine/Activity/isTimeLimitSet'].value=="false")
	    return true;	
	  var t1,t2;
	  //alert(window.ActyInfo.elements['WFProcessDefine/Activity/minute'].value);	  
	  if ((window.ActyInfo.elements['WFProcessDefine/Activity/minute'].value==null)||
	      (window.ActyInfo.elements['WFProcessDefine/Activity/minute'].value==''))
	  {
	  	window.ActyInfo.elements['WFProcessDefine/Activity/minute'].value=0;
	  }
	  
	  if ((window.ActyInfo.elements['WFProcessDefine/Activity/hour'].value==null)||
	      (window.ActyInfo.elements['WFProcessDefine/Activity/hour'].value==''))
	  {
	  	window.ActyInfo.elements['WFProcessDefine/Activity/hour'].value=0;
	  }
	  
	  if ((window.ActyInfo.elements['WFProcessDefine/Activity/day'].value==null)||
	      (window.ActyInfo.elements['WFProcessDefine/Activity/day'].value==''))
	  {
	  	window.ActyInfo.elements['WFProcessDefine/Activity/day'].value=0;
	  }
	  
	  
	  if ((window.ActyInfo.elements['WFProcessDefine/Activity/day1'].value==null)||
	      (window.ActyInfo.elements['WFProcessDefine/Activity/day1'].value==''))
	  {
	  	window.ActyInfo.elements['WFProcessDefine/Activity/day1'].value=0;
	  }
	  
	  if ((window.ActyInfo.elements['WFProcessDefine/Activity/minute1'].value==null)||
	      (window.ActyInfo.elements['WFProcessDefine/Activity/minute1'].value==''))
	  {
	  	window.ActyInfo.elements['WFProcessDefine/Activity/minute1'].value=0;
	  }
	  
	  if ((window.ActyInfo.elements['WFProcessDefine/Activity/hour1'].value==null)||
	      (window.ActyInfo.elements['WFProcessDefine/Activity/hour1'].value==''))
	  {
	  	window.ActyInfo.elements['WFProcessDefine/Activity/hour1'].value=0;
	  }
	  
	  if ((window.ActyInfo.elements['WFProcessDefine/Activity/day1'].value==null)||
	      (window.ActyInfo.elements['WFProcessDefine/Activity/day1'].value==''))
	  {
	  	window.ActyInfo.elements['WFProcessDefine/Activity/day1'].value=0;
	  }
	  
//	  if ((window.ActyInfo.elements['WFProcessDefine/Activity/bring-forward'].value==null)||
//	      (window.ActyInfo.elements['WFProcessDefine/Activity/bring-forward'].value==''))
//	  {
//	  	window.ActyInfo.elements['WFProcessDefine/Activity/bring-forward'].value=0;
//	  }	 
//	  
//	  if ((window.ActyInfo.elements['WFProcessDefine/Activity/timeUnit'].value==null)||
//	      (window.ActyInfo.elements['WFProcessDefine/Activity/timeUnit'].value==''))
//	  {
//	  	window.ActyInfo.elements['WFProcessDefine/Activity/timeUnit'].value='D';
//	  	t2 = window.ActyInfo.elements['WFProcessDefine/Activity/bring-forward'].value*24*60;	
//	  }
//	  else if (window.ActyInfo.elements['WFProcessDefine/Activity/timeUnit'].value=='D')
//	  {
//	  	t2 = window.ActyInfo.elements['WFProcessDefine/Activity/bring-forward'].value*24*60;	
//	  }
//	  else if (window.ActyInfo.elements['WFProcessDefine/Activity/timeUnit'].value=='H')
//	  {
//	  	t2 = window.ActyInfo.elements['WFProcessDefine/Activity/bring-forward'].value*60;	
//	  }	  
//	  else if (window.ActyInfo.elements['WFProcessDefine/Activity/timeUnit'].value=='M')
//	  {
//	  	t2 = window.ActyInfo.elements['WFProcessDefine/Activity/bring-forward'].value*1;	
//	  }
	  t1 = window.ActyInfo.elements['WFProcessDefine/Activity/day'].value*24*60;
	  t1 = t1 + window.ActyInfo.elements['WFProcessDefine/Activity/hour'].value*60;
	  t1= t1 + window.ActyInfo.elements['WFProcessDefine/Activity/minute'].value*1;

	  t2 = window.ActyInfo.elements['WFProcessDefine/Activity/day1'].value*24*60;
	  t2 = t2 + window.ActyInfo.elements['WFProcessDefine/Activity/hour1'].value*60;
	  t2= t2 + window.ActyInfo.elements['WFProcessDefine/Activity/minute1'].value*1;
	  
	  var strategy=window.ActyInfo.elements['WFProcessDefine/Activity/timeLimitStrategy'].value;
	  
//	  alert("strategy="+strategy);
	  if (strategy=="limit_strategy_designate"&&t1<=t2)
	  {
	  	showPane_test('test_3');
	  	alert('提前提醒时间应小于时间限制');
	  	return false;
	  }
	  return true;	
	}
	
function doCheck(checkObj){
//alert(document.ActyInfo.elements['WFProcessDefine/Activity/isSendMessageForRemind'].value);

	if(checkObj.checked){
		document.ActyInfo.elements['WFProcessDefine/Activity/isSendMessageForRemind'].value=true;
	}else{
		document.ActyInfo.elements['WFProcessDefine/Activity/isSendMessageForRemind'].value=false;
	}
}

function doCheck1(checkObj){
//alert("ok");
	if(checkObj.checked){
		document.ActyInfo.elements['WFProcessDefine/Activity/isSendMessageForOvertime'].value=true;
	}else{
		document.ActyInfo.elements['WFProcessDefine/Activity/isSendMessageForOvertime'].value=false;
	}
}
	function save() 
	{
		if (checkValid())
		{
			var frm = document.ActyInfo;
			frm.tab.value=<bean:write property="tab"/>
			frm.submit();
		}
	}
	
</script>
