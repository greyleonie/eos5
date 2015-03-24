
<%@include file="/internet/WFCOMMON/wfappbase.jsp" %>
<SCRIPT language=JavaScript src="/internet/scripts/check.js"></SCRIPT>

<html>
    <head><title>JSP Page</title>
    <link type="text/css" href="/internet/theme/style0/style.css" rel="stylesheet"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>
    <script language="javascript" src="/internet/scripts/tab.js" type="text/javascript"></script>
    </head>
    <body>
<table cellpadding=0 cellspacing=0  height="100%" width="102%" bordercolor="#B6B5B5" style="border-collapse: collapse" >
        <tr >
        <td width="98%">
      <html:form name="addFrm" action="ROLE.pr_automata.ROLE_P_UpdateRoleConfirm.do" target='_top' method="post">
	    <html:hidden name="EOSRole/roleID" property="EOSRole/roleID" />
	    <html:hidden name="list/EOSRole/roleID" property="EOSRole/roleID" />
			 <table border="0" bgcolor="#eeeeee" height="100%" width="100%" bordercolor="#B6B5B5" style="border-collapse: collapse" class="tab">
			    <tr>
			    <td>
			     <table border="0" bgcolor="#eeeeee" height="80%" width="100%" >
			    <tr>
			       <td>&nbsp;</td> <td>&nbsp;</td><td width="70%">&nbsp;</td>
			    </tr>
			    <tr>
			      <td></td>
			      <td  align="right" width="20%">角色ID:&nbsp;</td>
			      <td align="left" width="70%"><bean:write property="EOSRole/roleID"/></td>
			    </tr>
			    <tr >
			      <td></td>
			      
                <td  width="20%" align="right" >角色名:&nbsp;</td>
			      <td align="left"width="70%"><html:text name="EOSRole/roleName"  property="EOSRole/roleName" size="40"/></td>
			    </tr>
			      
			    <!--
			    <tr class="add_content">
			      <td align="right" class="add_head">角色级别：</td>
			      <td>
			        <html:text name="EOSRole/roleClass" property="EOSRole/roleClass"  size="20"/>
			      </td>
			    </tr>
			    -->
			    <tr>
			      <td colspan="3" align="center">
				<input type="button" name="button1" value="&nbsp;保存&nbsp;" onclick="javascript:submit1()"/>
		                <input type="button" name="button2" value="&nbsp;重置&nbsp;" onclick="javascript:document.addFrm.reset()"/>			      
		                <input type="button" name="button3" value="&nbsp;删除&nbsp;" onclick="javascript:del()"/>
			    </td>
			    </tr>
			  </table>
			</td><td width="2%"></td>
			</tr>
			</table>
			</html:form>
        </td>
      </tr>

    </table>
    </body>
</html>
<SCRIPT language=JavaScript src="/internet/scripts/check.js"></SCRIPT>
<script languange="javascript">

	function submit1() {
		var frm = document.addFrm;
		if(frm.elements["EOSRole/roleID"].value=="") {
			alert("角色ID必须输入！");
			return;
		}
		if(getTotalBytes(frm.elements["EOSRole/roleID"])>20) {
			alert("角色ID输入过长！");
			return;
		}
		if(frm.elements["EOSRole/roleName"].value=="") {
			alert("角色名必须输入！");
			return;
		}
		if(getTotalBytes(frm.elements["EOSRole/roleName"])>40) {
			alert("角色名输入过长！");
			return;
		}
	        if(isChinaOrNumbOrLett(frm.elements["EOSRole/roleName"].value)==false) {
			alert("输入的角色名为非法字符，请重新输入！");
	                frm.elements["EOSRole/roleName"].focus();
			return;
		}		
		frm.submit();
	}
function del(){
	var frm = document.addFrm;
	frm.action = "ROLE.pr_automata.ROLE_P_DeleteRole.do";
	frm.target = "_top";
	if(confirm("确定要删除此角色?") == true){
	frm.submit();
	}
}	
</script>
<%@include file="/internet/commonTail.jsp" %>