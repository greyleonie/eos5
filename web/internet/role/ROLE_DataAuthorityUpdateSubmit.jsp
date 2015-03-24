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
	  <table class="result" border="0" width="100%">
		  <tr class="result_content_">
		  	<td align="center">【查询数据权限模板】</td>
		    <td>
		    	数据权限模板名称:&nbsp;<input type="text" name="EOSDataPrivilegeModel/name" >
		    </td>
		    <td>
		        EOSEntity名称:&nbsp;<input type="text" name="EOSDataPrivilegeModel/entityName" >
		    </td>


		   </tr>
		   <tr class="result_content_">
		  	<td align="center"></td>
		    <td>
		    	约 束 类 型 :		   
			<select size="1" name="EOSDataPrivilegeModel/opType" style="width:150px" >
		    	        <option value="" selected>--请选择类型--&nbsp;&nbsp;&nbsp;</option>
				<option value="2">查询</option>
				<option value="3">修改</option>
				<option value="3">删除</option>
				<option value="1">全部</option>
		 	</select>
		    </td>


		    <td>
			    <a href="#1" onclick="javascript:querysubmit()">
			    	<img src="/internet/theme/style0/query.gif" border="0"/> 
			    </a>
			    <a href="#2" onclick="javascript:document.queryFrm.reset();">
			    	<img src="/internet/theme/style0/reset.gif" border="0"/> 
			    </a>
		    </td>
		   </tr>
	  </table>
	</form>
</body>
<iframe name="param" src="ROLE.pr_automata.ROLE_P_GetDataPrivilege.do"  frameborder="0" width="100%" height="400" marginwidth="0" marginheight="0" scrolling="none" align="left"></iframe>
</html>

<script language="JavaScript">
function querysubmit(){
	var frm = document.queryFrm;
	var buniTypeName=frm.elements["EOSDataPrivilegeModel/name"].value;
	var buniTypeID=frm.elements["EOSDataPrivilegeModel/entityName"].value;
		
        frm.elements["EOSDataPrivilegeModel/entityName"].value=cTrim(buniTypeID,0);
        frm.elements["EOSDataPrivilegeModel/name"].value=cTrim(buniTypeName,0);

	frm.elements["QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/name"].value="%"+frm.elements["EOSDataPrivilegeModel/name"].value+"%";
	frm.elements["QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/entityName"].value="%"+frm.elements["EOSDataPrivilegeModel/entityName"].value+"%";
	frm.elements["QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/opType"].value=frm.elements["EOSDataPrivilegeModel/opType"].value;

	if(frm.elements["EOSDataPrivilegeModel/name"].value.length == 0 && frm.elements["EOSDataPrivilegeModel/entityName"].value.length == 0) {
		frm.elements["QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/name"].value=frm.elements["EOSDataPrivilegeModel/name"].value;
	        frm.elements["QueryCondition[@entity='EOSDataPrivilegeModel']/EOSDataPrivilegeModel/entityName"].value=frm.elements["EOSDataPrivilegeModel/entityName"].value;
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