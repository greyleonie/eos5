<%@include file="/internet/common.jsp"%>
<style>
	.f12{display:none}
	.f13{display:block}
</style>
<%
String test = request.getParameter("rolemark");

 com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);
 String rightlist = reqContext.getEntityValue("rolemark"); 

%>
<SCRIPT language="JavaScript" src="/internet/scripts/fccauthorDistribute.js" ></SCRIPT>
<script language="JavaScript" src="/internet/scripts/fccresource.js"></script>


<script language="JavaScript">
var tempResource = new FccResources("fcc",'<bean:write property="secondright"/>');
<logic:iterate id="allfcc" property="list[@type='allfcc']">
tempResource.add('<bean:write id="allfcc" property="entity/MENUID"/>','<bean:write id="allfcc" property="entity/PARENTSID"/>','<bean:write id="allfcc" property="entity/MENUNAME"/>','<bean:write id="allfcc" property="entity/REMARK"/>');
</logic:iterate>

var tempOperator = [];
<logic:iterate id="alllzy" property="list[@type='alllzy']">
tempOperator[tempOperator.length] = new operatorObj('<bean:write id="alllzy" property="entity/RESOPID"/>','<bean:write id="alllzy" property="entity/MENUID"/>','<bean:write id="alllzy" property="entity/RESOPNAME"/>');
</logic:iterate>

for(var k = 0; k < tempResource.resourceObjs.length; k++) {
	var reToOperator = new resourcetoOperators(tempResource.resourceObjs[k].id);
	var operators = [];
	var i = 0;
	for(var t = 0; t < tempOperator.length; t++) {
		if(tempOperator[t].rid == tempResource.resourceObjs[k].id) {
			operators[i] = tempOperator[t];
			i++;
		}
	}
	reToOperator.operators = operators;
	tempResource.allOperator[tempResource.allOperator.length] = reToOperator;
	
}

var userresource = [];
var useroperator = [];
<logic:iterate id="userresource" property="list[@type='userresource']">
	userresource[userresource.length] = '<bean:write id="userresource" property="ENTITY/MENUID"/>';
</logic:iterate>

<logic:iterate id="useroperator" property="list[@type='useroperator']">
	useroperator[useroperator.length] = '<bean:write id="useroperator" property="ENTITY/OPERATORID"/>';
</logic:iterate>
tempResource.existResourceIds = userresource;
tempResource.existOperatorIds = useroperator;


</script>
<body>
<form method="post" action="talent.pr.roleRightSave.do" >
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;角色管理—&gt;角色分配权限—&gt;当前被分配权限角色为：<bean:write property="roleNick"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">&nbsp;</td>
	</tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8">
		<input name="rolemark" type="hidden" value="<%=test%>">
		<input name="list/no" type="hidden" value="<%=test%>">
		<html:hidden property="mode"/>
		
		</td>
      </tr>
      <tr>
            <td class="text">
            
			<script>
			
	  			document.write(tempResource);
	  		</script> 
			</td>
      </tr>
	  <tr>
            <td height="30" align="center" class="text">
				
				<input name="ieprint" type="submit" class="button_02" value="保 存">
				<input name="export" type="button" class="button_02" value="返 回" onClick="history.back()">
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>