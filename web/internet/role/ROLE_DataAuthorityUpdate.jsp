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
	
		<tr class="query_content"><td colspan="2" height="5%">【数据权限模板基本信息】</td></tr>
		

		<tr class="query_content">
			<td width="15%" height="10%">数据权限模板名称:</td>
			<td width="35%">
				<input type="text" name="EOSDataPrivilegeModel/name"  value='<bean:write property="EOSDataPrivilegeModel/name"/>' size="28%" />
			</td>
		</tr>
		
		<tr class="query_content">
		    <td width="15%"  height="10%">约 束 类 型 :</td>
		    <td width="35%">   
                                         <script>
                			var optypes = "<bean:write property="EOSDataPrivilegeModel/opType"/>";
                			var opArray = optypes.split(",");
                		
                				if(opArray[0]=="2") document.write(" <input type='checkbox' name='mulbox1' value='2' checked>查询 ")
                				   else document.write(" <input type='checkbox' name='mulbox1' value='2'>查询 ");
                				if(opArray[1]=="3") document.write(" <input type='checkbox' name='mulbox2' value='3' checked>修改 ")
                				   else document.write(" <input type='checkbox' name='mulbox2' value='3'>修改 ");
                				if(opArray[2]=="4") document.write(" <input type='checkbox' name='mulbox3' value='4' checked>删除 ")
                				    else document.write(" <input type='checkbox' name='mulbox3' value='4'>删除 ");
                			
                			</script>


		    </td>
		</tr>
		<tr class="query_content">
			<td width="15%"  height="10%">EOSEntity名称:</td>
			<td width="35%">
			 <html:select size="1" property="EOSDataPrivilegeModel/entityName" style="width:150px" >
		    	    
				<html:options property="list/EOSEntity/entityName" labelProperty="list/EOSEntity/displayName"/>
		   	</html:select>
			</td>
		</tr>
		<tr class="query_content">
			<td width="15%"  height="10%">权限表达式:</td>
			<td width="35%">
				<input type="text" name="EOSDataPrivilegeModel/filterString" value='<bean:write  property="EOSDataPrivilegeModel/filterString"/>' size="90%"/>
			</td>
		</tr>
		  <tr valign="top">
	
			      <td width="40%" height="34%" colspan="2">
	          		<div align="center">
				       <input type="button" name="button1" value="保存" onclick="javascript:submit1()"/>
				       <input type="button" name="button2" value="重置" onclick="javascript:document.frmOpAction.reset()"/>
				       <input type="button" name="button3" value="返回" onclick="javascript:return1()"/>        			

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
		alert("请添入数据权限模板ID");
		frm.elements["EOSDataPrivilegeModel/privilegeID"].focus();
		return;
	}

	

	if(frm.elements["EOSDataPrivilegeModel/name"].value == "") {
		alert("请添入数据权限模板名称");
		frm.elements["EOSDataPrivilegeModel/name"].focus();
		return;
	}
	if(getTotalBytes(frm.elements["EOSDataPrivilegeModel/name"])>60) {
			alert("数据权限模板名称输入过长，请重新输入！");
			return;
	}

       if(isChinaOrNumbOrLett(frm.elements["EOSDataPrivilegeModel/name"].value)==false) {
			alert("输入的数据权限模板名称为非法字符，请重新输入！");
	                frm.elements["EOSDataPrivilegeModel/name"].focus();
			return;
		}
		
			
	if(frm.elements["EOSDataPrivilegeModel/opType"].value == "") {
		alert("请填入约束类型");
		frm.elements["EOSDataPrivilegeModel/opType"].focus();
		return;
	}
	
	
	if(frm.elements["EOSDataPrivilegeModel/entityName"].value == "") {
		alert("请添入EOSEntity名称");
		frm.elements["EOSDataPrivilegeModel/entityName"].focus();
		return;
	}
	
	if(frm.elements["EOSDataPrivilegeModel/filterString"].value == "") {
		alert("请添入权限表达式");
		frm.elements["EOSDataPrivilegeModel/filterString"].focus();
		return;
	}
       if(getTotalBytes(frm.elements["EOSDataPrivilegeModel/filterString"])>1024) {
			alert("数据权限表达式输入过长，请重新输入！");
			return;
	}
	frm.action="ROLE.pr_automata.ROLE_P_DataPrivilegeUpdateSubmit.do";
	frm.submit();
}
</script>