<%@ include file="/internet/common.jsp" %>
<html>
<head>
	 <LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>
</head>
<body>
<form name="frmOpAction" action="#333" method="post">	

        <html:hidden property="QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/name" />
	<html:hidden property="QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/entityName" />
	<html:hidden property="QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/opType" />
	<html:hidden property="queryAll" />
  
	<html:hidden property="QueryCondition[@entity='EOSDataPrivilegeModel']/PageCond/begin" />
	<html:hidden property="QueryCondition[@entity='EOSDataPrivilegeModel']/PageCond/length" />
	<html:hidden property="QueryCondition[@entity='EOSDataPrivilegeModel']/PageCond/count" />
         
         <html:hidden property="EOSDataPrivilegeModel/privilegeID" />
         <html:hidden name="EOSDataPrivilegeModel/opType"/>
<table border="0" cellpadding=0 cellspacing=0 bgcolor="#EEEEEE" height="100%" width="100%" align="center">
<tr><td height="50%" width="80%"  align="center">
	<table border="0" cellpadding=0 cellspacing=0 bgcolor="#EEEEEE" height="80%" width="80%">
	
		<tr class="query_content"><td colspan="2" height="5%">������Ȩ��ģ�������Ϣ��</td></tr>
		

		<tr class="query_content">
			<td width="15%" height="10%">����Ȩ��ģ������:</td>
			<td width="35%">
				<input type="text" name="EOSDataPrivilegeModel/name"  value='<bean:write property="EOSDataPrivilegeModel/name"/>' size="28%" />
			</td>
		</tr>
		
		<tr class="query_content">
		    <td width="15%"  height="10%">Լ �� �� �� :</td>
		    <td width="35%">   
                                         <script>
                			var optypes = "<bean:write property="EOSDataPrivilegeModel/opType"/>";
                			var opArray = optypes.split(",");
                		
                				if(opArray[0]=="2") document.write(" <input type='checkbox' name='mulbox1' value='2' checked>��ѯ ")
                				   else document.write(" <input type='checkbox' name='mulbox1' value='2'>��ѯ ");
                				if(opArray[1]=="3") document.write(" <input type='checkbox' name='mulbox2' value='3' checked>�޸� ")
                				   else document.write(" <input type='checkbox' name='mulbox2' value='3'>�޸� ");
                				if(opArray[2]=="4") document.write(" <input type='checkbox' name='mulbox3' value='4' checked>ɾ�� ")
                				    else document.write(" <input type='checkbox' name='mulbox3' value='4'>ɾ�� ");
                			
                			</script>


		    </td>
		</tr>
		<tr class="query_content">
			<td width="15%"  height="10%">EOSEntity����:</td>
			<td width="35%">
			 <html:select size="1" property="EOSDataPrivilegeModel/entityName" style="width:150px" >
		    	    
				<html:options property="list/EOSEntity/entityName" labelProperty="list/EOSEntity/displayName"/>
		   	</html:select>
			</td>
		</tr>
		<tr class="query_content">
			<td width="15%"  height="10%">Ȩ�ޱ��ʽ:</td>
			<td width="35%">
				<input type="text" name="EOSDataPrivilegeModel/filterString" value='<bean:write  property="EOSDataPrivilegeModel/filterString"/>' size="90%"/>
			</td>
		</tr>
		  <tr valign="top">
	
			      <td width="40%" height="34%" colspan="2">
	          		<div align="center">
				       <input type="button" name="button1" value="����" onclick="javascript:submit1()"/>
				       <input type="button" name="button2" value="����" onclick="javascript:document.frmOpAction.reset()"/>
				       <input type="button" name="button3" value="����" onclick="javascript:return1()"/>        			

	          		</div>
	          	 </td>
		</tr>
	</table>
</form>
</td></tr></table>
</form>

</body>
</html>
<%@ include file="/internet/commonTail.jsp" %> 

<script type='text/javascript' src='/internet/scripts/check.js'></script>
<script languange="javascript">
function return1(){
      var frm = document.frmOpAction;
      	frm.target = "_parent";
      	frm.action = "ROLE.pr_automata.ROLE_P_MenuDataAuthority.do";
	frm.submit();
}

function submit1(){
	var frm = document.frmOpAction;
	frm.target="_parent";
	
     var box1="";
     var box2="";
     var box3="";
     if (frm.elements["mulbox1"].checked) box1=frm.elements["mulbox1"].value;
     if (frm.elements["mulbox2"].checked) box2=frm.elements["mulbox2"].value;
     if (frm.elements["mulbox3"].checked) box3=frm.elements["mulbox3"].value;
      frm.elements["EOSDataPrivilegeModel/opType"].value = box1+","+box2+","+box3;  
	


	if(frm.elements["EOSDataPrivilegeModel/privilegeID"].value == "") {
		alert("����������Ȩ��ģ��ID");
		frm.elements["EOSDataPrivilegeModel/privilegeID"].focus();
		return;
	}

	

	if(frm.elements["EOSDataPrivilegeModel/name"].value == "") {
		alert("����������Ȩ��ģ������");
		frm.elements["EOSDataPrivilegeModel/name"].focus();
		return;
	}
	if(getTotalBytes(frm.elements["EOSDataPrivilegeModel/name"])>60) {
			alert("����Ȩ��ģ������������������������룡");
			return;
	}

       if(isChinaOrNumbOrLett(frm.elements["EOSDataPrivilegeModel/name"].value)==false) {
			alert("���������Ȩ��ģ������Ϊ�Ƿ��ַ������������룡");
	                frm.elements["EOSDataPrivilegeModel/name"].focus();
			return;
		}
		
			
	if(frm.elements["EOSDataPrivilegeModel/opType"].value == "") {
		alert("������Լ������");
		frm.elements["EOSDataPrivilegeModel/opType"].focus();
		return;
	}
	
	
	if(frm.elements["EOSDataPrivilegeModel/entityName"].value == "") {
		alert("������EOSEntity����");
		frm.elements["EOSDataPrivilegeModel/entityName"].focus();
		return;
	}
	
	if(frm.elements["EOSDataPrivilegeModel/filterString"].value == "") {
		alert("������Ȩ�ޱ��ʽ");
		frm.elements["EOSDataPrivilegeModel/filterString"].focus();
		return;
	}
       if(getTotalBytes(frm.elements["EOSDataPrivilegeModel/filterString"])>1024) {
			alert("����Ȩ�ޱ��ʽ������������������룡");
			return;
	}
	frm.action="ROLE.pr_automata.ROLE_P_DataPrivilegeUpdateSubmit.do";
	frm.submit();
}
</script>