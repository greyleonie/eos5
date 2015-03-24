<%@ include file="/internet/hciHead.jsp" %>
<html>
<head>
<link rel="stylesheet" href="/internet/css/style.css" type="text/css"/>
</head>
<SCRIPT language=JavaScript src="/internet/scripts/check.js"></SCRIPT>
	<form name="queryFrm" action="#3" onSubmit="javascript:querysubmit()" method="post">
		<html:hidden property="QueryCondition[@entity='BNDICT_T_BusinType']/BNDICT_T_BusinType/businTypeID" />
		<html:hidden property="QueryCondition[@entity='BNDICT_T_BusinType']/BNDICT_T_BusinType/businTypeName" />
		<html:hidden property="queryAll" />
<table width="100%" height="100%">
  <tr valign="top">
	    <td>
	        <eos:OneTab name="业务数据字典" imagePath="/internet/images/tt.gif" >
		       <table width="90%" height="95%" bgcolor="#eeeeee">       
				 <tr  valign="top" >
				    <td height="5%">
				       <table border="0" cellpadding=0 cellspacing=0 bgcolor="#eeeeee" height="100%" width="100%">
				         <tr  class="queryLabelTD">
					    <td width="45%" align="left">
					    	业务类型名称:&nbsp;<input class="fieldtxt" type="text" name="BNDICT_T_BusinType/businTypeName" >
					    </td>
					    <td width="45%" align="left">
					        业务类型ID:&nbsp;<input class="fieldtxt" type="text" name="BNDICT_T_BusinType/businTypeID" >
					    </td>
					    <td align="right" width="10%">
					          <input type="submit" name="button1" value="查询"/>
					    </td>
					  </tr>
</form>
				       </table>
				     </td>
				   </tr>
				   <tr><td height="5%"> &nbsp;</td></tr>
			      	   <tr valign="top">
				       <td height="90%">
			                      <iframe name="paramMain" src="BNDICT.pr_automata.BNDICT_P_ShowAllBusiType.do" frameborder="0" height="100%" width="100%"  marginwidth="0" marginheight="0" scrolling="no"></iframe>
			
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
	var buniTypeName=frm.elements["BNDICT_T_BusinType/businTypeName"].value;
	var buniTypeID=frm.elements["BNDICT_T_BusinType/businTypeID"].value;
	
    frm.elements["BNDICT_T_BusinType/businTypeID"].value=cTrim(buniTypeID,0);
    frm.elements["BNDICT_T_BusinType/businTypeName"].value=cTrim(buniTypeName,0);
    
   frm.elements["QueryCondition[@entity='BNDICT_T_BusinType']/BNDICT_T_BusinType/businTypeName"].value= "%"+frm.elements["BNDICT_T_BusinType/businTypeName"].value+"%";
   frm.elements["QueryCondition[@entity='BNDICT_T_BusinType']/BNDICT_T_BusinType/businTypeID"].value="%"+frm.elements["BNDICT_T_BusinType/businTypeID"].value+"%";

	if(buniTypeName.length == 0 && frm.elements["BNDICT_T_BusinType/businTypeID"].value.length == 0) {
	        frm.elements["QueryCondition[@entity='BNDICT_T_BusinType']/BNDICT_T_BusinType/businTypeName"].value= frm.elements["BNDICT_T_BusinType/businTypeName"].value;
                frm.elements["QueryCondition[@entity='BNDICT_T_BusinType']/BNDICT_T_BusinType/businTypeID"].value=frm.elements["BNDICT_T_BusinType/businTypeID"].value;
		frm.elements["queryAll"].value = "true";
		frm.action = "BNDICT.pr_automata.BNDICT_P_ShowAllBusiType.do";
		frm.target = "paramMain";
		frm.submit();
	} else {	        
		frm.elements["queryAll"].value = "false";
		frm.action = "BNDICT.pr_automata.BNDICT_P_ShowAllBusiType.do";
		frm.target = "paramMain";
		frm.submit();		
	}
}
</script>
<%@include file="/internet/hciTail.jsp" %>