<display:tabHead topSpace="20" contentWidth="90%"/>

<table width="100%"  cellpadding="0"  cellspacing="0"  class="gridtable">
  
  <tr >
      <td class="queryLabelTD" width="25%" colspan="1">
      	�Ƿ��趨ʱ������
      </td>     
      
      <td class="queryFieldTD" width="75%" colspan="3">
	<dict:select businTypeId="WFDICT_ProcessDefTimeLimit" name="WFProcessDefineXML/Process/isTimeLimitSet" property="WFProcessDefineXML/Process/isTimeLimitSet" onchange="handleChange(this.options[this.options.selectedIndex].value)"/>
      </td>
  </tr>  
    
  <tr id="hide_1">
      <td width="25%" class="queryLabelTD" colspan="1">
      <html:hidden property="WFProcessDefineXML/Process/timeLimitStrategy"/>
      	�Զ���ʱ������<html:radio  name="r1" property="WFProcessDefineXML/Process/timeLimitStrategy" value="limit_strategy_designate" onclick="javascript:handleFinish('r1');"/>
      </td>     
      
      <td id="t1" class="queryFieldTD" width="75%" colspan="3">
      	<html:text property="WFProcessDefineXML/Process/day" size="5"/>
      	��
      	<html:text property="WFProcessDefineXML/Process/hour" size="5"/>
      	Сʱ
      	<html:text property="WFProcessDefineXML/Process/minute" size="5"/>
      	����
      </td>
  </tr>  
  
  <tr id="hide_2">
      <td class="queryLabelTD" width="30%">
        ��������ݻ�ȡʱ������<html:radio  name="r1" property="WFProcessDefineXML/Process/timeLimitStrategy" value="limit_strategy_reldata" onclick="javascript:handleFinish('r2');"/>
      </td> 
      
      <td id="t2" class="queryFieldTD" width="70%">
        <html:text property="WFProcessDefineXML/Process/relevantData" size="40"/>
      </td>       
         
  </tr>
    <tr id="hide_6">
	<td width="25%" class="queryLabelTD" colspan="1">

	<html:checkbox name="ch2" property="WFProcessDefineXML/Process/isSendMessageForOvertime" value="true" onclick="doCheck1(this);"/>
	<html:hidden property="WFProcessDefineXML/Process/isSendMessageForOvertime"/>
</td>
<td class="queryFieldTD" width="75%" colspan="3">
�Ƿ���г�ʱ����
</td>
</tr>  
  <tr id="hide_3">
      <td class="queryLabelTD" width="25%" colspan="1">
      	���ѷ�ʽ
      </td>
      
      <td class="queryFieldTD" width="75%" colspan="3">
            	<dict:select businTypeId="WFDICT_RemindType" name="WFProcessDefineXML/Process/remindType" property="WFProcessDefineXML/Process/remindType" onchange=""/>
      </td>
  </tr>    

  <tr id="hide_4">      
      <td class="queryLabelTD" width="25%" colspan="1">
      	��ǰ����ʱ��
      </td>     
      <td class="queryFieldTD" width="75%" colspan="3">
      	<html:text property="WFProcessDefineXML/Process/day1" size="5"/>
      	��
      	<html:text property="WFProcessDefineXML/Process/hour1" size="5"/>
      	Сʱ
      	<html:text property="WFProcessDefineXML/Process/minute1" size="5"/>
      	����
      </td>
  </tr>

<tr id="hide_5">
	<td width="25%" class="queryLabelTD" colspan="1">

	<html:checkbox name="ch1" property="WFProcessDefineXML/Process/isSendMessageForRemind" value="true" onclick="doCheck(this);"/>
	<html:hidden property="WFProcessDefineXML/Process/isSendMessageForRemind"/>
</td>
<td class="queryFieldTD" width="75%" colspan="3">
�Ƿ���г�ʱԤ��
</td>
</tr>
</table>

<%@ include file="WFDEFMGR_WFProcessDefineSave.jsp" %> 

<display:tabTail buttomSpace="20"/>

<script language="javascript">

function doCheck(checkObj){
//alert(document.ProcInfo.elements['WFProcessDefineXML/Process/isSendMessageForRemind'].value);

	if(checkObj.checked){
		document.ProcInfo.elements['WFProcessDefineXML/Process/isSendMessageForRemind'].value=true;
	}else{
		document.ProcInfo.elements['WFProcessDefineXML/Process/isSendMessageForRemind'].value=false;
	}
}

function doCheck1(checkObj){
//alert("ok");
	if(checkObj.checked){
		document.ProcInfo.elements['WFProcessDefineXML/Process/isSendMessageForOvertime'].value=true;
	}else{
		document.ProcInfo.elements['WFProcessDefineXML/Process/isSendMessageForOvertime'].value=false;
	}
}

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

function handleFinish(r){
	if(r=="r1"){
		t1.style.display="";	
		t2.style.display="none";
		window.ProcInfo.elements['WFProcessDefineXML/Process/timeLimitStrategy'].value="limit_strategy_designate";
		}
	if(r=="r2"){
		t1.style.display="none";	
		t2.style.display="";	
		window.ProcInfo.elements['WFProcessDefineXML/Process/timeLimitStrategy'].value="limit_strategy_reldata";
	}
//	alert(window.ProcInfo.elements['WFProcessDefineXML/Process/timeLimitStrategy'].value);
	
//	for(i=0;i<document.forms[0].elements.length;i++){
//	    obj =document.forms[0].elements[i];
//		if(obj.name=="r1"){
//		alert(obj.value);
//		}
//	}
// var v =window.form.elements['r1'].value;
 
}
var strategy="<bean:write property="WFProcessDefineXML/Process/timeLimitStrategy"/>";
if(strategy=="limit_strategy_designate") handleFinish("r1");
if(strategy=="limit_strategy_reldata")   handleFinish("r2");

if (window.ProcInfo.elements['WFProcessDefineXML/Process/isTimeLimitSet'].value!="true")
{
handleChange("false");
}
</script>
