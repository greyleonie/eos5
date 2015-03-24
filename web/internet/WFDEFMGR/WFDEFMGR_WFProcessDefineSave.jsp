<table width="100%" height="40" border="0" cellspacing="1" cellpadding="1" class="query" align="center">
  <tr>
    <td colspan="2" align="center" width="80%">
    </td>
    
    <td colspan="1" align="center">
    	<input type="button" class="button" value = "保存" onclick="javascript:save();">
    </td>
    
    <td colspan="1" align="center">
        <input type="button" class="button" value = "取消" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ShowProcDef.do?processDefID=<bean:write property="processDefID"/>');">
    </td>    
  </tr>   

</table> 
  
<script language="javascript">

	function checkValid()
	{
	  if (window.ProcInfo.elements['WFProcessDefineXML/Process/isTimeLimitSet'].value=="false")
	    return true;
	  var t1,t2;
	  //alert(window.ProcInfo.elements['WFProcessDefineXML/Process/minute'].value);	  
	  if ((window.ProcInfo.elements['WFProcessDefineXML/Process/minute'].value==null)||
	      (window.ProcInfo.elements['WFProcessDefineXML/Process/minute'].value==''))
	  {
	  	window.ProcInfo.elements['WFProcessDefineXML/Process/minute'].value=0;
	  }
	  
	  if ((window.ProcInfo.elements['WFProcessDefineXML/Process/hour'].value==null)||
	      (window.ProcInfo.elements['WFProcessDefineXML/Process/hour'].value==''))
	  {
	  	window.ProcInfo.elements['WFProcessDefineXML/Process/hour'].value=0;
	  }
	  
	  if ((window.ProcInfo.elements['WFProcessDefineXML/Process/day'].value==null)||
	      (window.ProcInfo.elements['WFProcessDefineXML/Process/day'].value==''))
	  {
	  	window.ProcInfo.elements['WFProcessDefineXML/Process/day'].value=0;
	  }
	  
	  if ((window.ProcInfo.elements['WFProcessDefineXML/Process/minute1'].value==null)||
	      (window.ProcInfo.elements['WFProcessDefineXML/Process/minute1'].value==''))
	  {
	  	window.ProcInfo.elements['WFProcessDefineXML/Process/minute1'].value=0;
	  }
	  
	  if ((window.ProcInfo.elements['WFProcessDefineXML/Process/hour1'].value==null)||
	      (window.ProcInfo.elements['WFProcessDefineXML/Process/hour1'].value==''))
	  {
	  	window.ProcInfo.elements['WFProcessDefineXML/Process/hour1'].value=0;
	  }
	  
	  if ((window.ProcInfo.elements['WFProcessDefineXML/Process/day1'].value==null)||
	      (window.ProcInfo.elements['WFProcessDefineXML/Process/day1'].value==''))
	  {
	  	window.ProcInfo.elements['WFProcessDefineXML/Process/day1'].value=0;
	  }
//	  if ((window.ProcInfo.elements['WFProcessDefineXML/Process/bring-forward'].value==null)||
//	      (window.ProcInfo.elements['WFProcessDefineXML/Process/bring-forward'].value==''))
//	  {
//	  	window.ProcInfo.elements['WFProcessDefineXML/Process/bring-forward'].value=0;
//	  }	 
//	  
//	  if ((window.ProcInfo.elements['WFProcessDefineXML/Process/timeUnit'].value==null)||
//	      (window.ProcInfo.elements['WFProcessDefineXML/Process/timeUnit'].value==''))
//	  {
//	  	window.ProcInfo.elements['WFProcessDefineXML/Process/timeUnit'].value='D';
//	  	t2 = window.ProcInfo.elements['WFProcessDefineXML/Process/bring-forward'].value*24*60;	
//	  }
//	  else if (window.ProcInfo.elements['WFProcessDefineXML/Process/timeUnit'].value=='D')
//	  {
//	  	t2 = window.ProcInfo.elements['WFProcessDefineXML/Process/bring-forward'].value*24*60;	
//	  }
//	  else if (window.ProcInfo.elements['WFProcessDefineXML/Process/timeUnit'].value=='H')
//	  {
//	  	t2 = window.ProcInfo.elements['WFProcessDefineXML/Process/bring-forward'].value*60;	
//	  }	  
//	  else if (window.ProcInfo.elements['WFProcessDefineXML/Process/timeUnit'].value=='M')
//	  {
//	  	t2 = window.ProcInfo.elements['WFProcessDefineXML/Process/bring-forward'].value*1;	
//	  }
	  t1 = window.ProcInfo.elements['WFProcessDefineXML/Process/day'].value*24*60;

	  t1 = t1 + window.ProcInfo.elements['WFProcessDefineXML/Process/hour'].value*60;
	  t1= t1 + window.ProcInfo.elements['WFProcessDefineXML/Process/minute'].value*1;

	  t2 = window.ProcInfo.elements['WFProcessDefineXML/Process/day1'].value*24*60;
	  t2 = t2 + window.ProcInfo.elements['WFProcessDefineXML/Process/hour1'].value*60;
	  t2= t2 + window.ProcInfo.elements['WFProcessDefineXML/Process/minute1'].value*1;
	  
	  var strategy=window.ProcInfo.elements['WFProcessDefineXML/Process/timeLimitStrategy'].value;
	//  alert(document.ProcInfo.elements['WFProcessDefineXML/Process/timeLimitStrategy'][0].checked);
	//  alert(document.ProcInfo.elements['WFProcessDefineXML/Process/timeLimitStrategy'][1].checked);
	//  alert(window.ProcInfo.elements['WFProcessDefineXML/Process/day'].value);
	  if (strategy=="limit_strategy_designate"&&t1<=t2)
	  {
	  	showPane_test('test_2');
	  	alert('提前提醒时间应小于时间限制');
	  	return false;
	  }
	  return true;	
	}
	function save() {
		if (checkValid())
		{
			var frm = document.ProcInfo;
			frm.tab.value=<bean:write property="tab"/>
			frm.submit();
		}	
	}
</script>


