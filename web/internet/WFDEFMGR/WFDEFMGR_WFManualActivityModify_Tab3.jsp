

<display:tabHead topSpace="20" contentWidth="80%"/>

<table width="100%"  cellpadding="0"  cellspacing="0"  class="gridtable">
  
  <tr >
      <td class="queryLabelTD" width="40%" colspan="1">
      	�Ƿ��趨ʱ������
      </td>     
      
      <td class="queryFieldTD" width="60%" colspan="3">
	<dict:select businTypeId="WFDICT_ProcessDefTimeLimit" name="WFProcessDefine/Activity/isTimeLimitSet" property="WFProcessDefine/Activity/isTimeLimitSet" onchange="handleChange(this.options[this.options.selectedIndex].value)"/>
      </td>
  </tr>  
    
  <tr id="hide_1">
      <td width="40%" class="queryLabelTD" colspan="1">
      <html:hidden property="WFProcessDefine/Activity/timeLimitStrategy"/>
      	�Զ���ʱ������<html:radio  name="r1" property="WFProcessDefine/Activity/timeLimitStrategy" value="limit_strategy_designate" onclick="javascript:handleFinishOK('r1');"/>
      </td>     
      
      <td id="t1" class="queryFieldTD" width="60%" colspan="3">
      	<html:text property="WFProcessDefine/Activity/day" size="5"/>
      	��
      	<html:text property="WFProcessDefine/Activity/hour" size="5"/>
      	Сʱ
      	<html:text property="WFProcessDefine/Activity/minute" size="5"/>
      	����
      </td>
  </tr>  
  
  <tr id="hide_2">
      <td class="queryLabelTD" width="40%">
        ��������ݻ�ȡʱ������<html:radio  name="r1" property="WFProcessDefine/Activity/timeLimitStrategy" value="limit_strategy_reldata" onclick="javascript:handleFinishOK('r2');"/>
      </td> 
      
      <td id="t2" class="queryFieldTD" width="60%">
        <html:text property="WFProcessDefine/Activity/relevantData" size="40"/>
      </td>       
         
  </tr>
<tr id="hide_6">
	<td class="queryLabelTD" width="40%">
	<html:checkbox name="ch2" property="WFProcessDefine/Activity/isSendMessageForOvertime" value="true" onclick="doCheck1(this);"/>
	<html:hidden property="WFProcessDefine/Activity/isSendMessageForOvertime"/>
</td>
<td class="queryFieldTD" width="60%" colspan="3">�Ƿ���г�ʱ����</td>
</tr>  
  <tr id="hide_3">
      <td class="queryLabelTD" width="40%" colspan="1">
      	���ѷ�ʽ
      </td>
      
      <td class="queryFieldTD" width="60%" colspan="3">
            	<dict:select businTypeId="WFDICT_RemindType" name="WFProcessDefine/Activity/remindType" property="WFProcessDefine/Activity/remindType" onchange=""/>
      </td>
  </tr>    

  <tr id="hide_4">      
      <td class="queryLabelTD" width="40%" colspan="1">
      	��ǰ����ʱ��
      </td>     
      <td class="queryFieldTD" width="60%" colspan="3">
      	<html:text property="WFProcessDefine/Activity/day1" size="5"/>
      	��
      	<html:text property="WFProcessDefine/Activity/hour1" size="5"/>
      	Сʱ
      	<html:text property="WFProcessDefine/Activity/minute1" size="5"/>
      	����
      </td>
  </tr>
<tr id="hide_5">
	<td class="queryLabelTD" width="40%">
	<html:checkbox name="ch1" property="WFProcessDefine/Activity/isSendMessageForRemind" value="true" onclick="doCheck(this);"/>
	<html:hidden property="WFProcessDefine/Activity/isSendMessageForRemind"/>
</td>
<td class="queryFieldTD" width="60%" colspan="3">
�Ƿ���г�ʱԤ��</td>
</tr>
</table>

<%@include file="WFDEFMGR_WFManualActivityDefineSave.jsp"%>  


<display:tabTail buttomSpace="20"/>

<script language="javascript">
function handleChange(v)
{
  if (v=="false")
  {
    hide_1.style.display="none";
    hide_2.style.display="none";
    hide_3.style.display="none";
    hide_4.style.display="none";
	hide_5.style.display="none";
	hide_6.style.display="none";
  }
  else
  {
    hide_1.style.display="";
    hide_2.style.display="";  
    hide_3.style.display="";  
    hide_4.style.display="";  
	hide_5.style.display="";  
	hide_6.style.display="";
  }  
}


function handleFinishOK(r){
	if(r=="r1"){
		t1.style.display="";	
		t2.style.display="none";
		window.ActyInfo.elements['WFProcessDefine/Activity/timeLimitStrategy'].value="limit_strategy_designate";
		}
	if(r=="r2"){
		t1.style.display="none";	
		t2.style.display="";	
		window.ActyInfo.elements['WFProcessDefine/Activity/timeLimitStrategy'].value="limit_strategy_reldata";
	}
//	alert(window.ActyInfo.elements['WFProcessDefine/Activity/timeLimitStrategy'].value);
	
//	for(i=0;i<document.forms[0].elements.length;i++){
//	    obj =document.forms[0].elements[i];
//		if(obj.name=="r1"){
//		alert(obj.value);
//		}
//	}
// var v =window.form.elements['r1'].value;
 
}
var strategy="<bean:write property="WFProcessDefine/Activity/timeLimitStrategy"/>";
if(strategy=="limit_strategy_designate") handleFinishOK("r1");
if(strategy=="limit_strategy_reldata")   handleFinishOK("r2");

if (window.ActyInfo.elements['WFProcessDefine/Activity/isTimeLimitSet'].value!="true")
{
handleChange("false");
}
</script>
