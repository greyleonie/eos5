<%--
	---------------------------------------------------------------------------------
	Revision           Revision Date    Revision Man         Reason/Statement
	1.0                2004/04/24       xuyb                 create
--%>
<%@include file="/internet/common.jsp" %>

<br/>
 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="button" onClick="javascripts:del()" value="为当前角色删除菜单项" name="B1" >
<br/>


<form name="updateRoleMenu" action="ROLE.pr_automata.ROLE_P_DelRoleMenu.do" method="post">
	<html:hidden  property="EOSRole/roleID"/>	 
	<logic:iterate id="rolemenu" property="list[@name='rolemenu']">
 		<script language="JavaScript">
  			for (var i = 0; i < <bean:write id="rolemenu" property="EOSTemp/menuLevel"/>-1; i++)
    			document.write("&nbsp&nbsp")
  		</script>

		<html:checkbox indexed="true" name="list/EOSMenu/menuID" id="rolemenu" property="EOSTemp/menuID" />

 		<bean:write  id="rolemenu" property="EOSTemp/menuName"/><br/>
	</logic:iterate>
</form>
<%@include file="/internet/commonTail.jsp" %>

<script language="JavaScript">

function selectedCheckboxCount(form){
	var length =0;
	var i=0;
	var count =0;
	eles = form.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.attributes.item("type").nodeValue;
		if(type == "checkbox"){
			if(obj.checked){
				count++;
			}
		}
		i++;
	}
	return count;
}

function del()
{
	var frm = document.updateRoleMenu;
	
	if(selectedCheckboxCount(frm) < 1){
		alert("您至少选择一条记录才能执行增?咏巧说サ牟僮鳎?");
		return;
	}
	frm.submit();

}
</script>

