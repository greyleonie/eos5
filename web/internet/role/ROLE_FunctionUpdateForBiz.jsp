<%@ include file="/internet/eosapp/hciHead.jsp" %>
<html>
<head>
<title>修改功能</title>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>
</head>
<body>
<table width="100%" height="98%">
  <tr> 
       <td>
	 <eos:OneTab name="功能-展现逻辑设置" imagePath="/internet/images/tt.gif" >
           <table border="0" cellpadding=0 cellspacing=0  height="100%" width="80%">
              <tr>
                   <td width="50%">
    	                 <html:form name="frmFunction" action='#555' method="post"> <font size="2.5"><b>请选择包:</b></font>
		                 <html:select property="EOSFunction/unitID" style="width:150px" onchange="javascript:selectFunction()">
		    	                      <option value="9999" selected>请选择......</option>
				              <html:options property="list[@name='functionUnits']/EOSFunctionUnit/unitID" labelProperty="list[@name='functionUnits']/EOSFunctionUnit/unitName"/>
			         </html:select>
		        </html:form>
                   </td>
                   <td  width="50%" align="right">
                        <input type="button" onClick="javascripts:return1()" value="返回" name="B1" >
                   </td>
              </tr>
              <tr>
                 <td height="100%" colspan=3>
                   <table height="100%" bgcolor="#eeeeee" width="100%" border=0>
                         <tr>
                              <td width="15%">　</td>
                              <td width="19%"> <font size="2.5"><b>功能(<bean:write property="EOSBizCatalog/catalogName"/>)的展现逻辑</b></font></td>
                              <td width="14%">　</td>
                              <td  width="22%"> <font size="2.5"> <b>包的展现逻辑</b></font> </td>
                         </tr>
 
                             <html:form action="ROLE.pr_automata.ROLE_P_UpdateFunction.do" name="frmUpdateFunction" method="post">	  
	                     <html:hidden property="EOSFunction/unitID" />	  
	                     <html:hidden name="command" />
	                     <html:hidden property="EOSBizCatalog/catalogID" />  
	                  <tr>
		                 <td width="14%"></td>
		                 <td width="19%" rowspan="9" valign="top">
		                 <div style="overflow:auto;width:350px;height:300px">
		    	             <html:select name="EOSFunctionTmp[@name='left']/functionID" size="30" style="width:450px"  multiple="true" >
					<html:options property="list[@name='bizFun']/EOSVCatalogFunction/functionID" labelProperty="list[@name='bizFun']/EOSVCatalogFunction/functionName"/>
				     </html:select>
				 </div>
			         </td>

		                 <td width="15%"></td>
		                 <td width="22%" rowspan="9" valign="top">
		                 <div style="overflow:auto;width:350px;height:300px">
			            <html:select name="EOSFunctionTmp[@name='right']/functionID"  size="30" style="width:450px" multiple="true">
					<html:options property="list[@name='allFun']/EOSFunction/functionID" labelProperty="list[@name='allFun']/EOSFunction/functionName"/>
				   </html:select>
				 </div>
			         </td>
		                      </html:form>
	
	                         <td width="15%">　</td>

                         </tr>
			  <tr>
			    <td width="14%">　</td>
			    <td width="15%"align="center">&nbsp;&nbsp;<input type="button" onClick="javascripts:add()" value="<<增加" name="B1" >&nbsp;&nbsp;</td>
			    <td width="15%">　</td>

			  </tr>
			  <tr>
			    <td width="14%">　</td>
			    <td width="15%"> </td>
			    <td width="15%">　</td>

			  </tr>
			  <tr>
			    <td width="14%">　</td>
			    <td width="15%"align="center">&nbsp;&nbsp;<input type="button" onClick="javascripts:remove()" value="删除>>" name="B1" >&nbsp;&nbsp;</td>
			    <td width="15%">　</td>

			  </tr>
			  <tr>
			    <td width="14%"> </td>
			    <td width="15%">  </td>
			    <td width="15%">　</td>

			  </tr>
			  <tr>
			    <td width="14%">　</td>
			    <td width="15%">　</td>
			    <td width="15%">　</td>

			  </tr>
			  <tr>
			    <td width="14%">　</td>
			    <td width="15%">　</td>
			    <td width="15%">　</td>

			  </tr>
			  <tr>
			    <td width="14%">　</td>
			    <td width="15%">　</td>
			    <td width="15%">　</td>

			  </tr>
			  <tr>
			    <td width="14%">　</td>
			    <td width="15%">　</td>
			    <td width="15%">　</td>

			  </tr>
                   </table>
                 </td>
              </tr>                   
           </table>
         </eos:OneTab>
       </td>
   </tr>
 </table>         

</body>   

<script language="javascript">
var es = document.getElementsByName("EOSFunctionTmp[@name='left']/functionID");
if( es[0].children.length>es[0].size ) es[0].size=es[0].children.length;

var es2 = document.getElementsByName("EOSFunctionTmp[@name='right']/functionID");
if( es2[0].children.length>es2[0].size ) es2[0].size=es2[0].children.length;

function return1(){
      var frm = document.frmFunction;
      	frm.target = "_parent";
      	frm.action = "ROLE.pr_automata.ROLE_P_ShowAllFunction.do";
	frm.submit();
}

function selectFunction() {
	var frm = document.frmFunction;
	if(frm.elements["EOSFunction/unitID"].value != 9999) {
		frm.action='ROLE.pr_automata.ROLE_P_FunctionUpdateForBiz.do?EOSBizCatalog/catalogID=<bean:write property="EOSBizCatalog/catalogID"/>';
		frm.submit();
		//frm.elements["EOSFunction/unitID"].value=9999;
	}
}
</script>

<script language="JavaScript">

function GetRoleFunctions() {
  role.submit();
}

function add() {
  var frm = document.frmUpdateFunction;
  
  if ( frm.elements["EOSFunctionTmp[@name='right']/functionID"].selectedIndex==-1) {
      alert("请选择要增加的功能");
  } else {
       frm.elements["command"].value="add";
       frm.submit();
  }
}

function remove() {
  var frm = document.frmUpdateFunction;
  if(frm.elements["EOSFunctionTmp[@name='left']/functionID"].selectedIndex==-1) {
      alert("请选择要删除的功能");
  } else {
       frm.elements["command"].value="remove";
       frm.submit();
  }
}

</script>
</html>   
<%@ include file="/internet/commonTail.jsp" %> 