<%@ include file="/internet/eosapp/hciHead.jsp" %>
<html>
<head>
<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css"/>
</head>
<SCRIPT language=JavaScript src="/internet/scripts/check.js"></SCRIPT>
<body>
	<form name="queryFrm" action="#3" method="post">
	<html:hidden name="QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/name" property="EOSDataPrivilegeModel/name"/>
	<html:hidden name="QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/entityName" property="EOSDataPrivilegeModel/entityName"/>
	<html:hidden name="QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/opType" property="EOSDataPrivilegeModelRole/opType"/>
		<html:hidden property="queryAll" />
<table width="100%" height="100%"  border=0>
  <tr>
    <td width="99%" height="95%">
     <eos:OneTab name="����Ȩ�޹���" imagePath="/internet/images/tt.gif" >
       <table width="100%" height="100%">       
	 <tr  valign="top">
	    <td height="5%">
	       <table class="result" cellpadding="0"  cellspacing="0"> 
		  <tr class=queryLabelTD> 	  	
		     <td width="30%">
		    	����Ȩ��ģ������:&nbsp;<input class="fieldtxt" type="text" name="EOSDataPrivilegeModel/name" >
		     </td>
		     <td width="30%">
		        EOSEntity����:
		       <html:select size="1" property="EOSDataPrivilegeModel/entityName" style="width:150px" >
		    	        <option value="" selected>--��ѡ��EOSEntity--&nbsp;&nbsp;&nbsp;</option>
				<html:options property="list/EOSEntity/entityName" labelProperty="list/EOSEntity/displayName"/>
		   	</html:select>
		    
		      </td>		  	
		            <td width="30%"> Լ �� �� �� : 
                      <select size="1" name="EOSDataPrivilegeModel/opType" style="width:150px" >
		    	        <option value="" selected>--��ѡ������--&nbsp;&nbsp;&nbsp;</option>
				<option value="2">��ѯ</option>
				<option value="3">�޸�</option>
				<option value="4">ɾ��</option>	
		 	</select>
                    </td>      
                    <td width="10%" align="center"> <input type="button" name="submit1" value="��ѯ" onClick="javascript:querysubmit()"></td>
		   </tr>
		   <tr><td colspan="4"> </td></tr>
		   <tr><td colspan="4"> </td></tr>
		   <tr><td colspan="4"> </td></tr>
	       </table>
	     </td>
	   </tr>
	  </form>
	   <tr><td height="5%"> </td></tr>
      	   <tr>
	       <td height="90%" width=100%>
                      <iframe name="param" src="ROLE.pr_automata.ROLE_P_ShowAllModel.do?queryAll=true" frameborder="0" width="100%" height="100%" marginwidth="0" marginheight="0" scrolling="none" align="left"></iframe>
	       </td>
	    </tr>
       </table>
    </eos:OneTab>
   </td>
  </tr>
</table>
<script language="JavaScript">
function querysubmit(){
	var frm = document.queryFrm;
	var buniTypeName=frm.elements["EOSDataPrivilegeModel/name"].value;
	var buniTypeID=frm.elements["EOSDataPrivilegeModel/entityName"].value;
		
        frm.elements["EOSDataPrivilegeModel/entityName"].value=cTrim(buniTypeID,0);
        frm.elements["EOSDataPrivilegeModel/name"].value=cTrim(buniTypeName,0);

	frm.elements["QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/name"].value="%"+frm.elements["EOSDataPrivilegeModel/name"].value+"%";
	frm.elements["QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/entityName"].value="%"+frm.elements["EOSDataPrivilegeModel/entityName"].value+"%";
	frm.elements["QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/opType"].value="%"+frm.elements["EOSDataPrivilegeModel/opType"].value+"%";

	if(frm.elements["EOSDataPrivilegeModel/name"].value.length == 0 && frm.elements["EOSDataPrivilegeModel/entityName"].value.length == 0&&frm.elements["EOSDataPrivilegeModel/opType"].value.length == 0) {
		frm.elements["QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/name"].value=frm.elements["EOSDataPrivilegeModel/name"].value;
	        frm.elements["QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/entityName"].value=frm.elements["EOSDataPrivilegeModel/entityName"].value;
	        frm.elements["QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/opType"].value=frm.elements["EOSDataPrivilegeModel/entityName"].value;
		frm.elements["queryAll"].value = "true";
	      } else {
		frm.elements["queryAll"].value = "false";

		     }
	frm.action = "ROLE.pr_automata.ROLE_P_ShowAllModel.do";
	frm.target = "param";
	frm.submit();
}
</script>
<%@include file="/internet/hciTail.jsp" %>