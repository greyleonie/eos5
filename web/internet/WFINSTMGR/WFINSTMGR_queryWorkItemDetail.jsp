<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<html>
    <head><title>workItemDetail</title>
    </head>
    <script  language="JavaScript">
		 function goClose(){
			history.go(-1);
		 }
    </script>
<display:pageHead bodyColor="#EEEEEE"/>
<display:detailHead lineClass="tb_blue"  title="��������ϸ��Ϣ"/> 
      <!--��ϸ��Ϣ��ʾ-->   
  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEEEEE" bordercolor="#B6B5B5" style="border-collapse: collapse">
	  <tr> 
		  <td align="right" class="queryLabelTD" width="15%" nowrap>������ID</td>
		  <td width="25%" class="detailFieldTD"><bean:write property="WFWorkItemView/workItemID"/></td>
		  <td align="right" class="queryLabelTD" width="15%" nowrap>����������</td>
		  <td width="33%" class="detailFieldTD"><bean:write property="WFWorkItemView/workItemName"/></td>
	  </tr>
	  <tr> 
			<td align="right" class="queryLabelTD" width="15%" nowrap>������������</td>
			<td width="25%" class="detailFieldTD"><bean:write property="WFWorkItemView/processChName"/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>���̰汾</td>
			<td width="33%" class="detailFieldTD"><bean:write property="WFWorkItemView/versionSign"/></td>
	   </tr>
	  <tr> 
			<td align="right" class="queryLabelTD" width="15%" nowrap>��ǰ״̬</td>
			<td width="25%" class="detailFieldTD"><dict:write businTypeId="WFDICT_WorkItemState" property="WFWorkItemView/currentState"/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>������</td>
			<td width="33%" class="detailFieldTD"><bean:write property="WFWorkItemView/participant"/></td>
	  </tr>
	  <tr> 
			<td align="right" class="queryLabelTD" width="15%" nowrap>���ȼ�</td>
			<td width="25%" class="detailFieldTD"><dict:write businTypeId="WFDICT_Priority" property="WFWorkItemView/priority"/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>�Ƿ�ʱ</td>
			<td width="33%" class="detailFieldTD"><dict:write businTypeId="WFDICT_YN" property="WFWorkItemView/isTimeOut"/></td>
	  </tr>
	  <tr> 
			<td align="right" class="queryLabelTD" width="15%" nowrap>����ʱ��</td>
			<td width="25%" class="detailFieldTD"><bean:write property="WFWorkItemView/limitNum"/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>����ʱ������</td>
			<td width="33%" class="detailFieldTD"><bean:write property="WFWorkItemView/limitNumDesc"/></td>
	  </tr>
	  <tr>
			<td align="right" class="queryLabelTD" width="15%" nowrap>��������ʱ��</td>
			<td width="33%" class="detailFieldTD"><bean:write property="WFWorkItemView/procInstCreateTime" formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>���̵�ǰ״̬</td>
			<td width="33%" class="detailFieldTD"><dict:write businTypeId="WFDICT_ProcessState" property="WFWorkItemView/procInstCurrState"/></td>
	  </tr>
	  <tr>
			<td align="right" class="queryLabelTD" width="15%" nowrap>���̽���ʱ��</td>
			<td width="25%" class="detailFieldTD"><bean:write property="WFWorkItemView/procInstEndtime" formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>�ʵ������</td>
			<td width="25%" class="detailFieldTD"><bean:write property="WFWorkItemView/activityInstName"/></td>
	  </tr>
	  <tr> 
			<td align="right" class="queryLabelTD" width="15%" nowrap>����ʵ������</td>
			<td width="25%" class="detailFieldTD"><bean:write property="WFWorkItemView/processInstName"/></td>
			<td align="right" class="queryLabelTD" width="15%" nowrap>���̶�������</td>
			<td width="33%" class="detailFieldTD"><bean:write property="WFWorkItemView/processDefName"/></td>
	  </tr>
	</table>
	<table  align="center" border="0">
		  <tr>
			<td align="center">
				<input type="button" value="����" onClick="javascript:goClose();">
			</td>
	  </tr>
	 </table>
<display:detailTail/><display:pageTail/> 
</html>