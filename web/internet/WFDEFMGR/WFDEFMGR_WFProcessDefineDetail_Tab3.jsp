<display:tabHead topSpace="20" contentWidth="90%"/>
<display:detailHead lineClass=""/>

<table width="100%" border="0" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5"  class="gridtable">

<tr>
<tr>
<td width="100%" colspan="4">
<html:hidden property="id" />
<html:hidden property="name" />
<html:hidden property="type" />
<html:hidden property="WFProcessDefine" />
<input type="hidden" name="tab" value="2">
</td>
</tr>

  
  <tr class="add_title" >
     <td colspan="4">��������������Ϣ�� </td>
  </tr>  

  <tr>
     <td class="detailLabelTD" colspan="1" width="25%">
     	��������������
     </td>
     <td class="detailFieldTD" colspan="3" width="75%">
     	<dict:write businTypeId="WFDICT_ProcStarterType" property="WFProcessDefineXML/Process/processStarterType" />
     </td>
  </tr>  

  <logic:equal  property="WFProcessDefineXML/Process/processStarterType" value="organization">
  <tr class="add_content" >
      <td align="center" class="detailLabelTD" colspan="1" width="25%">
      	�������б�
      </td>
      
      <td class="" colspan="3" width="100%">
      
      	    <table width="100%" border="1" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" >
		      <tr>
		        <td align="center" width="30%" height="16">����</td>
		        <td align="center" width="40%" height="16">����</td>
		        <td align="center" width="30%" height="16">ID</td>
		      </tr>
		      
		      <logic:iterate id="listResult" property="WFProcessDefineXML/Process/procStarterList">
	
		      <tr>
		        <logic:equal id="listResult" property="row/type" value="person">
		        	<td align="center">����</td>
		        </logic:equal>
		      <logic:equal id="listResult" property="row/type" value="role">
		        	<td align="center">��ɫ</td>
		      </logic:equal>
		      <logic:equal id="listResult" property="row/type" value="organization">
		        	<td align="center">����</td>
		      </logic:equal>
		        <td align="center"><bean:write id="listResult" property="row/name"/></td> 
		        <td align="center"><bean:write id="listResult" property="row/id"/></td>
		      </tr>
			</logic:iterate>
	    </table> 		      

     </td>
    </tr>
    </logic:equal>
</table>

<table width="100%" height="40">
  <tr>
    <td align="right">
	<input type="button" class="button" value = "�޸����̶���" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyProcDef.do?processDefID=<bean:write property="processDefID"/>&tab=3');">
    </td>
   </tr>  
</table>   

<display:detailTail/>
<display:tabTail buttomSpace="20"/>
