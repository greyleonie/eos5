<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
	<html>
    <head><title>wfactinstList</title>
    </head>
      <script  language="JavaScript">
    </script>
<display:pageHead bodyColor="#EEEEEE"/>
<eos:OneTab name="�����־���" imagePath="/internet/WFCOMMON/images/tt.gif" >	
<display:detailHead  title="�����ϸ��Ϣ"/> 
      <!--��ϸ��Ϣ��ʾ-->   
  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" style="border-collapse: collapse">
      <logic:iterate id="ResultSet" property="list"> 
      <tr>
<td align="right" class="queryLabelTD" width="15%">��־��� </td>
          <td width="25%" class="detailFieldTD">
    <bean:write id="ResultSet" property="WFAuditLog/auditID"/></td>
<td align="right" class="queryLabelTD" width="15%">������� </td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/auditType"/></td>
        </tr>
  <tr> 
    <td align="right" class="queryLabelTD" width="15%">����</td>
          <td width="25%" class="detailFieldTD">
   <dict:write id="ResultSet" businTypeId="WFDICT_ActionType" property="WFAuditLog/actionType"/></td>
    <td align="right" class="queryLabelTD" width="15%">�������</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/actionResult"/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">��������</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/occurDate"   formatType='yyyy��MM��dd��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
<td align="right" class="queryLabelTD" width="15%">����ʱ��</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/occurTime"  formatType='yyyy��MM��dd�� HHʱmm��ss��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">����ԱID</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/operatorID"/></td>
<td align="right" class="queryLabelTD" width="15%">����Ա����</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/operatorName"/></td>
        </tr>
   <tr> 
<td align="right" class="queryLabelTD" width="15%">ҵ������ID</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/processDefID"/></td>
<td align="right" class="queryLabelTD" width="15%">ҵ����������</td>
          <td width="33%" class="detailFieldTD">
          <bean:write id="ResultSet" property="WFAuditLog/processDefName"/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">����ʵ��ID </td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/processInstID"/></td>
<td align="right" class="queryLabelTD" width="15%">ҵ�������������� </td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/processChName"/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">�����ID</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/activityDefID"/></td>
<td align="right" class="queryLabelTD" width="15%">���������</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/activityDefName"/></td>
        </tr>
  <tr class="add_content"> 
<td align="right" class="queryLabelTD" width="15%">�ʵ��ID</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/activityInstID"/></td>
<td align="right" class="queryLabelTD" width="15%">�ʵ������</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/activityInstName"/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">Ӧ��ID</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/appID"/></td>
<td align="right" class="queryLabelTD" width="15%">Ӧ������</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/appName"/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">������ID</td>
          <td width="25%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/workItemID"/></td>
<td align="right" class="queryLabelTD" width="15%">����������</td>
          <td width="33%" class="detailFieldTD">
   <bean:write id="ResultSet" property="WFAuditLog/workItemName"/></td>
        </tr>
  <tr> 
<td align="right" class="queryLabelTD" width="15%">��������</td>
          <td width="25%" class="detailFieldTD" colspan="3">
      <textarea name="textfield" cols="70" rows="5" style="overflow:auto;background-color:#EEEEEE" readonly>
      <bean:write id="ResultSet" property="WFAuditLog/actionDesc"/></textarea></td>
        </tr>
  <tr > 
<td align="right" class="queryLabelTD" width="15%">���������</td>
          <td width="25%" class="detailFieldTD" colspan="3">
      <textarea name="textfield" cols="70" rows="5" style="overflow:auto;background-color:#EEEEEE" readonly>
   <bean:write id="ResultSet" property="WFAuditLog/postRelData"/></textarea></td>
        </tr>
  </logic:iterate> 
      </table>
	<table  align="center" border="0">
		  <tr>
			<td align="center">
				<input type="button" value="����" onClick="javascript:history.go(-1);"></td>
	  </tr>
	 </table>
<display:detailTail/>
</eos:OneTab><display:pageTail/> </html>
