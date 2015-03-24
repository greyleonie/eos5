<!-- saved from url=(0022)http://internet.e-mail -->

<%@ include file="/internet/common.jsp" %> 

<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" src="/internet/scripts/pagefortreetwo.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" src="/internet/scripts/treetwo.js"></SCRIPT>
 <table align="center" width="100%" height="100%" bgcolor="#EEEEEE">
    <tr> 
           <td >
<div style="height:100%;overflow:auto;background:#eeeeee">
<html:form name="updateRoleMenu" action="ROLE.pr_automata.ROLE_P_RemoveMenu.do" method="post">
  <html:hidden property="EOSMenu/menuID"/>
  <html:hidden property="EOSMenu/menuLevel"/>
  <html:hidden property="EOSMenu/parentsID"/>
    <html:hidden name="menuID" property="EOSMenu/menuID"/>
    <html:hidden name="parentsID"/>
  
  <html:hidden property="EOSMenu/menuName" />
  <html:hidden property="EOSMenu/menuAction"/>
  <html:hidden property="EOSMenu/menuLabel"/>
  <html:hidden property="EOSMenu/displayOrder"/> 
  <html:hidden name="refresh" />
 <table align="center" width="100%" height="100%" bgcolor="#EEEEEE">
    <tr> 
           <td width="50%" height="5%">【<b>移动菜单</b>】</td>
    </tr>
    <tr valign="top">
	    <td height="95%">
		    <table cellpadding=0 cellspacing=0  height="90%"width=100% style=\"border-right:1px solid #808080;border-bottom:1px solid #808080;\> 
			    <tr valign="top">
				    <td height="90%">
					<eos:removetree property="menu" multiSelected="true" expandDepth="1"/>
				    </td>
			    </tr>
			    <tr>
				     <td  align="left" height="10%">  
				             <input type="button" name="button1"  value="确认" onclick="javascript:submit1()"/>  
				      </td>
			    </tr>			    
		    </table>
	    </td>
    </tr>

</table>
</html:form>
</td>
</tr>
</table>
 </div>  
<script language="JavaScript">

function submit1() {
	var frm = document.updateRoleMenu;
	var count=0;
	var d = document.getElementsByName("treemenu_checkbox");

	for(var i=0;i<d.length;i++){
		if(d[i].checked) count++;
	}
	if (count!=1) {
		alert("请选择一个菜单！");
		return false;
	}

	for(var i=0;i<d.length;i++){
		if(d[i].checked) {
			frm.elements["parentsID"].value=d[i].value;
			frm.elements["EOSMenu/parentsID"].value=d[i].value;
		}
	}
	if(frm.elements["parentsID"].value==frm.elements["menuID"].value){
		alert("不能移到菜单自己下面!");
		return false;
	}
	if(confirm("注意:如果移动到叶子菜单下,该叶子菜单对应的功能将失效!") == true){   
		frm.elements("refresh").value="tree";	
		frm.target = "main";		
		frm.submit();
	}
 }

</script>
  
    	