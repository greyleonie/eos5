<display:tabHead topSpace="20" contentWidth="80%"/>
<table width="100%"  cellpadding="0"  cellspacing="0"  class="gridtable">  
  
  <tr>
      <td class="queryLabelTD" width="30%">
      	是否启用多工作项设置
      </td> 
      
      <td class="queryFieldTD" width="70%" colspan="3">
      <dict:select businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefine/Activity/isMulWIValid" 
      onchange="handleMulWorkitem(this.options[this.options.selectedIndex].value)"/>
      </td>
  </tr> 

</table>  
  
<table id="mulWorkItem" border="0" width="100%"  cellpadding="0"  cellspacing="0"  class="gridtable">    

  <tr > 
    	<td class="queryFieldTD" colspan="4">
  		【工作项个数设定】 
  	</td>
  </tr>
<!--
  <tr>
      <td class="queryLabelTD" width="30%">
        指定      
        <html:radio name="WFProcessDefine/Activity/workitemNumStrategy" property="WFProcessDefine/Activity/workitemNumStrategy" value="designate"/>
      </td> 
      
      <td id="a1" class="queryFieldTD" width="70%">
        <html:text property="WFProcessDefine/Activity/workitemNum" size="40"/>
      </td>       
         
  </tr>
  -->
  <tr>
      <td class="queryLabelTD" width="38%">
        按照参与者设置个数领取      
        <html:radio name="WFProcessDefine/Activity/workitemNumStrategy" property="WFProcessDefine/Activity/workitemNumStrategy" value="participant-number"/>
      </td> 
      
      <td id="a2" class="queryFieldTD" width="62%">
      <!--
        <html:text property="WFProcessDefine/Activity/workitemNumPath" size="40"/>
        -->
      </td>    
  </tr>  
  <tr>
      <td class="queryLabelTD" width="38%">
        根据操作员个数分配
        <html:radio name="WFProcessDefine/Activity/workitemNumStrategy" property="WFProcessDefine/Activity/workitemNumStrategy" value="operator-number"/>
        <!--
        <html:radio name="WFProcessDefine/Activity/workitemNumStrategy" property="WFProcessDefine/Activity/workitemNumStrategy" value="operator-number" onclick="javascript:handleNum()"/>
        -->
      </td> 
      <td class="queryFieldTD" width="62%"></td>       
  </tr>    
  <tr > 
    	<td class="queryFieldTD" colspan="4">
  		【完成规则设定】 
  	</td>
  </tr>
  <tr>
      <td class="queryLabelTD" width="38%">
        全部完成      
        <html:radio name="WFProcessDefine/Activity/finishRule" property="WFProcessDefine/Activity/finishRule" value="all" onclick="javascript:handleFinish()"/>
      </td> 
      <td class="queryFieldTD" width="62%">
      </td>       
         
  </tr>
  
  <tr>
      <td class="queryLabelTD" width="38%">
        完成个数
        <html:radio name="WFProcessDefine/Activity/finishRule" property="WFProcessDefine/Activity/finishRule" value="specifyNum" onclick="javascript:handleFinish()"/>
      </td> 
      
      <td id="b1" class="queryFieldTD" width="62%">要求完成个数：
        <html:text property="WFProcessDefine/Activity/finishRquiredNum" size="10"/>
      </td>       
  </tr>  
  
  <tr>
      <td class="queryLabelTD" width="38%">
        完成百分比
        <html:radio name="WFProcessDefine/Activity/finishRule" property="WFProcessDefine/Activity/finishRule" value="specifyPercent" onclick="javascript:handleFinish()"/>
      </td> 
      
      <td id="b2" class="queryFieldTD" width="62%">
      要求完成百分比：
        <html:text property="WFProcessDefine/Activity/finishRequiredPercent" size="10"/>％
      </td>       
  </tr>
  
  <tr>
      <td class="queryLabelTD" width="38%">
        未完成活动自动终止
      </td> 
      
      <td class="queryFieldTD" width="62%">
	<dict:select businTypeId="WFDICT_ProcessDefTimeLimit" property="WFProcessDefine/Activity/isAutoCancel" />
      </td>       
  </tr>  

</table> 

<%@include file="WFDEFMGR_WFManualActivityDefineSave.jsp"%>  
<display:tabTail buttomSpace="20"/>

<script language="javascript">
function handleMulWorkitem(v)
{
  if (v=="false")
  {
    mulWorkItem.style.display="none";
  }
  else
  {
    mulWorkItem.style.display="";

  }  
}


function handleNum()
{
v = window.ActyInfo.elements['WFProcessDefine/Activity/workitemNumStrategy'];
if (v[0].checked)
{
  a2.style.display="none";
  a1.style.display="";
}
else if (v[1].checked)
{
  a1.style.display="none";
  a2.style.display="";
}
else if (v[2].checked)
{
  a1.style.display="none";
  a2.style.display="none";
}
}


function handleFinish()
{
	v = window.ActyInfo.elements['WFProcessDefine/Activity/finishRule'];
	if (v[0].checked)
	{
	  b1.style.display="none";
	  b2.style.display="none";
	}else if (v[1].checked){
	  b1.style.display="";
	  b2.style.display="none";
	}else if (v[2].checked){
	  b1.style.display="none";
	  b2.style.display="";
	}
}


if (window.ActyInfo.elements['WFProcessDefine/Activity/isMulWIValid'].value!="true")
{
handleMulWorkitem("false");
}
else
{
//handleNum();
handleFinish();
}
</script>