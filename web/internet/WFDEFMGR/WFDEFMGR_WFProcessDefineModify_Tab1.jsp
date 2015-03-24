<!--详细信息显示-->   
<!--processDefID要继续传递-->
<display:tabHead topSpace="20" contentWidth="96%"/>

<table width="100%"  cellpadding="0"  cellspacing="0"   class="gridtable">
  
  <tr>  
    <td align="right" class="queryLabelTD" width="15%">
    流程ID
    </td>
    
    <td height="17" class="queryFieldTD" width="35%">
    	<bean:write property="WFProcessDefine/processDefID" />
    </td>
    
    <td align="right" class="queryLabelTD" width="15%">
    流程名称
    </td>
    
    <td height="17" class="queryFieldTD"  width="35%">
	<bean:write property="WFProcessDefine/processDefName" />
    </td>
  </tr>
  
  <tr>  
    <td align="right" class="queryLabelTD">
    	流程中文名称
    </td>
    
    <td class="queryFieldTD">
    	<html:text property="WFProcessDefine/processChName"/>
    </td>
    
    <td align="right" class="queryLabelTD" >
    	当前状态
    </td>
    
    <td width="32%" class="queryFieldTD">
		<dict:write businTypeId="WFDICT_ProcessDefState" property="WFProcessDefine/currentState" />
    </td>
  </tr>  
  
  <tr>  
    <td align="right" class="queryLabelTD" >
    	创建时间
    </td>
    
    <td height="17" class="queryFieldTD">
    	<bean:write property="WFProcessDefine/createTime" formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/>
    </td>
    
    <td align="right" class="queryLabelTD">
    	更新时间
    </td>
    
    <td height="17" class="queryFieldTD" >
	<bean:write property="WFProcessDefine/updateTime" formatType='yyyy年MM月dd日 HH时mm分ss秒' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/>    	    	
    </td>
  </tr>
  
  <tr>  
    <td align="right" class="queryLabelTD" >
    	创建者
    </td>
    
    <td class="queryFieldTD">
	<html:text property="WFProcessDefine/processDefOwner"/>
    </td>
    
    <td align="right" class="queryLabelTD" >
    	版本号
    </td>
    
    <td class="queryFieldTD">
	<bean:write property="WFProcessDefine/versionSign" />
    </td>
  </tr>

  <tr>  
    <td align="right" class="queryLabelTD">
    	流程包ID
    </td>
    
    <td height="17" class="queryFieldTD">
    	<bean:write property="WFProcessDefine/packageID" />
    </td>
    
    <td align="right" class="queryLabelTD" >
    	流程包名称
    </td>
    
    <td height="17" class="queryFieldTD" >
    	<bean:write property="WFProcessDefine/packageName" />
    </td>
  </tr>

  <tr>  
    <td align="right" class="queryLabelTD" colspan="1" width="15%">
    	流程描述
    </td>
    
    <td class="queryFieldTD" colspan="3" width="85%">
    	<html:textarea rows="5" cols="60" property="WFProcessDefineXML/Process/description" />
     </td>
  </tr>
  

</table>


<%@ include file="WFDEFMGR_WFProcessDefineSave.jsp" %>    

<display:tabTail buttomSpace="20"/>
