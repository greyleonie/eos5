<%@ include file="/internet/common.jsp" %>
<html>
<head>
	<script language="JavaScript" src="/internet/scripts/pagination.js"></script>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>
</head>
<form name="frmEOSDataPrivilegeModelList" action="ROLE.pr_automata.ROLE_P_ShowAllModel.do?queryAll=<bean:write property='queryAll'/>" method="POST">
	
	<!----------Hidden Param Start---------------->
        <html:hidden property="QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/name" />
	<html:hidden property="QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/entityName" />
	<html:hidden property="QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/opType" />
	<html:hidden property="queryAll" />
	
	<html:hidden name ="temp" property="EOSDataPrivilegeModel/opType"/>
	
	<html:hidden property="QueryCondition[@entity='EOSDataPrivilegeModel']/PageCond/begin" />
	<html:hidden property="QueryCondition[@entity='EOSDataPrivilegeModel']/PageCond/length" />
	<html:hidden property="QueryCondition[@entity='EOSDataPrivilegeModel']/PageCond/count" />
	<!----------Hidden Param END---------------->
	
	<script>
		var otherPage = new page();
		otherPage.init("frmEOSDataPrivilegeModelList", "QueryCondition[@entity='EOSDataPrivilegeModel']/PageCond/begin", "QueryCondition[@entity='EOSDataPrivilegeModel']/PageCond/length", "QueryCondition[@entity='EOSDataPrivilegeModel']/PageCond/count");	
	</script>
<table border="0" cellpadding=0 cellspacing=0 bgcolor="#EEEEEE" height="100%" width="100%" align="center">
<tr><td height="100%" width="100%"  align="center">	
   <table class="result" cellpadding=0 cellspacing=0 >
         <tr><td width="100%" colspan="2"><b>����Ȩ���б�</b></td></tr> 
	<tr valign="top">
	    <td colspan="2" class="tb_blue" width="100%" height="60%">
	       <table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse">
		     <tr class="tableHeadTR"> 
				<td width="4%"></td>
				<td width="18%">����Ȩ��ģ������</td>				
				<td width="20%">EOSEntity����</td>
				<td width="10%">Լ������</td>
				<td width="38%">Ȩ�ޱ��ʽ</td>

		     </tr>	    
			<logic:iterate id="cysPaper" property="QueryCondition[@entity='EOSDataPrivilegeModel']/list[@type='EOSDataPrivilegeModel']">
	             <tr class=tableContentTR>
					<td width="4%" align="center">
					<html:checkbox indexed="true" id="cysPaper" name="list[@name='EOSDataPrivilegeModels']/EOSDataPrivilegeModel/privilegeID" property="EOSDataPrivilegeModel/privilegeID" />
					</td>
					<td width="18%" align="center">
					    <bean:write id="cysPaper" property="EOSDataPrivilegeModel/name"/>
					</td>
					
				        <td width="20%" align="center">
				          <bean:write id="cysPaper" property="EOSDataPrivilegeModel/entityName"/>
				        </td>
					        
				        <td width="10%" align="center">		        
                                         <script>
                			var optypes = "<bean:write id="cysPaper" property="EOSDataPrivilegeModel/opType"/>";
                			var opArray = optypes.split(",");
                			for(var i=0; i<opArray.length; i++) {
                				if(opArray[i]=="2") document.write("��ѯ ");
                				if(opArray[i]=="3") document.write("�޸� ");
                				if(opArray[i]=="4") document.write("ɾ�� ");
                			}
                			</script>
				        </td>
					<td width="38%" align="center">
					    <bean:write id="cysPaper" property="EOSDataPrivilegeModel/filterString"/>	
					</td>
		       </tr>
			</logic:iterate>
		 </table>
	     </td>
	  </tr>		
	  <tr class=queryLabelTD> 	  
                   <td align="left" height="5%" width="50%" > 	          		                   
	
				       <input type="button" name="button2" value="&nbsp;�޸�&nbsp;" onclick="javascript:mod()"/>
				       <input type="button" name="button3" value="&nbsp;ɾ��&nbsp;" onclick="javascript:del()"/>        			
			               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			               <input type="button" name="button1" value="��������Ȩ��" onclick="javascript:add()"/>				       

	           </td>			

	           <td align="right" height="5%" width="50%" >              	   
	                         <script>
						if (otherPage.total > 1 && !otherPage.noCount) {
					                document.write('<input type="button" name="button5" value="��һҳ" onclick="javascript:otherPage.previousPage()"/>&nbsp;');
							document.write('<input type="button" name="button5" value="��һҳ" onclick="javascript:otherPage.nextPage()"/>&nbsp;&nbsp;');						
							document.write('�ܹ�' + otherPage.count + '��');
							document.write('&nbsp;&nbsp;��');
							document.write(otherPage.current + '/');
							document.write(otherPage.total + 'ҳ')
				 		}
			         </script>
		    </td>
	  </tr>
	  <tr><td colspan="2" height="1%"></td></tr>
	   <tr valign="top">	  
	       	       <td width="40%" height="34%" colspan="2">  	 </td>	
	   </tr>	
     </table>
 </td></tr></table>
</form>

<%@ include file="/internet/commonTail.jsp" %>

<script language="javascript">
function add() {
	var submitFrm = document.frmEOSDataPrivilegeModelList;
	submitFrm.action = "ROLE.pr_automata.ROLE_P_DataAuthorityAdd.do";
	submitFrm.submit();
}

function mod() {
	var frm = document.frmEOSDataPrivilegeModelList;
	if(selectedCheckboxCount(frm) != 1){
		alert("������ѡ��һ����¼����ִ���޸Ĳ�����");
		return false;
	}
	frm.action = "ROLE.pr_automata.ROLE_P_GetDataPrivilege.do";
	frm.submit();

}



function del() {
	var frm = document.frmEOSDataPrivilegeModelList;
	var selectedName="";
	if(selectedCheckboxCount(frm) < 1){
		alert("������ѡ��һ����¼����ִ��ɾ������!");
		return false;
	} else {
		if(confirm("�˶�����ɾ�������û���Ӧ�����м�¼,�����ʹ��,ȷ��ɾ����?")) {
			frm.target = "_parent";
			frm.action = "ROLE.pr_automata.ROLE_P_EOSDataPrivilegeModelDelSubmit.do";
			frm.submit();
		} else {
			return false;
		}
	}
}
	function CheckAll()	// Select all the check boies
{   
	for (var i=0;i<document.frmEOSDataPrivilegeModelList.elements.length;i++)
	{
		
		var e = document.frmEOSDataPrivilegeModelList.elements[i];
		  
		   e.checked = true;
	}
}

function UnCheckAll()	// uncheck all the check boies 
{
	for (var i=0;i<document.frmEOSDataPrivilegeModelList.elements.length;i++)
	{
		var e = document.frmEOSDataPrivilegeModelList.elements[i];
		    
		   e.checked = false;
	}
}

</script>

<script language="javascript">
function getCheckedValue(frm) {

	var length =0;
	var i=0;
	var count =0;
	eles = frm.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.type;
		if(type == "checkbox"){
			if(obj.checked){
				return obj.value;
			}
		}
		i++;
	}
	
}

function selectedCheckboxCount(frm){
	var length =0;
	var i=0;
	var count =0;
	eles = frm.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.type;
		if(type == "checkbox"){
			if(obj.checked){
				count++;
			}
		}
		i++;
	}
	return count;
}
</script>