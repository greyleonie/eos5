<%--
	---------------------------------------------------------------------------------
	Revision           Revision Date    Revision Man         Reason/Statement 
	1.0                2003/03/22       xuyb               create
--%>
<%@include file="/internet/common.jsp" %>
<SCRIPT language=JavaScript src="/internet/scripts/check.js"></SCRIPT>
 <link rel="stylesheet" href="/internet/css/style.css" type="text/css" />
<html:form name="addFrm" action="ROLE.pr_automata.ROLE_P_AddRoleConfirm.do" target='_top' method="post">
 <html:hidden name="auto" />
 <table width="100%" height="100%">
  <tr><td height="2%"> </td></tr>
   <tr><td>
   <eos:OneTab name="角色管理" imagePath="/internet/images/tt.gif" >
     <table border="0" bgcolor="#EEEEEE" height="80%" width="80%">

			<tr class="query_content">
				<td width="25%">角色名：</td>
				<td>
					<input type="text" class="fieldtxt" name="EOSRole/roleName" size="20"/>
				</td>
			</tr>

			 <tr class="query_content">
	                     <td ><input type="checkbox" name="box" onclick="openReadonly()">输入角色ID</td>
	                     <td>(注：如果不选择则系统自动生成角色ID)</td>
                        </tr>
		
			<tr class="query_content">
				<td width="25%">角色ID：</td>
				<td>
					<input type="text" class="fieldtxt" name="EOSRole/roleID"  maxlength="20" size="20" readonly="true">
				</td>
			</tr>						


			<tr class="query_content">
				<td width="25%">备注：</td>
				<td >
					<input type="text" class="fieldtxt" size="60" name="EOSBizCatalog/catalogRemark" value="<bean:write property="EOSBizCatalog/catalogRemark"/>"/>
				</td>
			</tr>
			<tr class="query_content">
		               
		
		      
		                <td  >
			          <a href='ROLE.pr_automata.ROLE_P_FunctionUpdateForBiz.do?EOSBizCatalog/catalogID=<bean:write property="EOSBizCatalog/catalogID"/>&EOSFunction/unitID=9999'>

			          </a>
		                 </td>		
	                </tr>
			<tr>
			  <td align="center" colspan="2">
		                <input type="button" name="button1" value="&nbsp;保存&nbsp;" onclick="javascript:submit1()"/>
		                <input type="button" name="button2" value="&nbsp;重置&nbsp;" onclick="javascript:reset1()"/>
		                <input type="button" name="button3" value="&nbsp;返回&nbsp;" onclick="javascript:return1()"/>
                               
			</td>
			</tr>
	    </form>
	</table>
   </eos:OneTab>
      </td>
   </tr> 
   </table>		

</html:form>

<script type='text/javascript' src='/internet/scripts/check.js'></script>
<script languange="javascript">

	parent.hideWaiting();
function reset1(){
       var frm = document.addFrm;
       document.addFrm.reset();
       openReadonly();
}

	function submit1() {
		var frm = document.addFrm;
	       if(frm.elements["EOSRole/roleName"].value=="") {
			alert("角色名必须输入！");
			return;
		}
		
              if(isChinaOrNumbOrLett(frm.elements["EOSRole/roleName"].value)==false) {
			alert("输入的角色名为非法字符，请重新输入！");
	                frm.elements["EOSRole/roleName"].focus();
			return;
		}
		if(getTotalBytes(frm.elements["EOSRole/roleName"])>60) {
			alert("角色名输入过长，请重新输入！");
			return;
		}
		if(frm.elements["EOSRole/roleID"].value==""&& frm.elements["EOSRole/roleID"].readOnly == false) {
			alert("角色ID必须输入！");
			return;
		}
		if(frm.elements["EOSRole/roleID"].value=="0") {
			alert("角色ID不能为0！");
			return;
		}
		if(getTotalBytes(frm.elements["EOSRole/roleID"])>60) {
			alert("角色ID输入过长，请重新输入！");
			return;
		}
		if(isNumberOrLetter(frm.elements["EOSRole/roleID"].value)==false&&frm.elements["EOSRole/roleID"].readOnly == false) {
	
			alert("角色ID必须是字母或数字！");
			return;
		}		
		

		if(frm.elements["box"].checked == true) {  				
	            frm.elements["auto"].value="N";	
	         } else {
	            frm.elements["auto"].value="Y";		
	         }
		
		frm.submit();

	}
	
function return1(){
      var frm = document.addFrm;
      	frm.action = "ROLE.pr_automata.ROLE_P_ManageRole.do";
	frm.target = "_parent";
	frm.submit();
}
	
function openReadonly() {
	var frm = document.addFrm;
	if(frm.elements["box"].checked == true) {
				
		frm.elements["EOSRole/roleID"].readOnly = false;
		frm.elements["EOSRole/roleID"].focus();	
	} else {
		frm.elements["EOSRole/roleID"].readOnly = true;
		frm.elements["EOSRole/roleName"].focus();				
		frm.elements["EOSRole/roleID"].value = "";
		
	}
}	
</script>
<%@include file="/internet/commonTail.jsp" %>
