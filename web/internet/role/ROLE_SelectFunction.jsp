
<%@include file="/internet/BNOM/omappbase.jsp"%>
  <script language="JavaScript" src="/internet/scripts/pagination.js"></script>
<script  language="JavaScript">
  var selectedID="";
  var selectedName="";
  var sep="------";
  function clickOn(r){
     var v = r.value;
     var i = v.indexOf(sep);
     selectedID = v.substring(0,i);     
     selectedName=v.substring(i+sep.length);
  }

  function FunctionSubmit(){
     if(selectedID==""){
       alert("对不起，您必须选择一个Function！");
       return;
     }else{
	window.opener.document.forms(0).elements("EOSMenu/menuAction").value=selectedID;
	window.opener.document.forms(0).elements("EOSMenu/menuActionName").value=selectedName;
	window.close();
     }
  }
   function cancelSel(){
     window.close();
  }
</script>
<form name="packageListFrm" action="ROLE.pr_automata.ROLE_P_ListPackageFunction.do" method="post">
 	<html:hidden property="PageCond/begin" />
	<html:hidden property="PageCond/length" />
	<html:hidden property="PageCond/count" />
	<html:hidden property="EOSFunction/unitID" />
   <table class="result" cellpadding=0 cellspacing=0 width="100%" height="100%">
	  <tr class="add_content">
	      <td align="left" class="add_head" width="30%" height="5%"><font size="2">展现逻辑所在的包</font>：</td>
	      <td width="70%"> 
	        <html:select size="1"  property="EOSMenu/pack" onchange="javascript:selectFunction()">
	          <option value="9999" selected>请选择包......</option>
		  <logic:iterate id="rs" property="list[@type='EOSFunctionUnit']" >
		        
		  	<html:option id="rs" property="EOSFunctionUnit/unitID" labelProperty="EOSFunctionUnit/unitName"/>
		  </logic:iterate>
	        </html:select>
	      </td>
	 </tr>
      </form>
	 <tr>
	      <td colspan=2 width="100%"> <iframe name="selectfun" src="ROLE.pr_automata.ROLE_P_ListPackageFunction.do?EOSFunction/unitID=''&PageCond/begin=0&PageCond/length=10&PageCond/count=-1" frameborder="0" width="100%" height="100%" marginwidth="0" marginheight="0" scrolling="none" align="left"></iframe></td>
	 </tr>
   </table>
	
<script type="text/javascript">
 
 function selectFunction() {
	var frm = document.packageListFrm;
	var package=frm.elements("EOSMenu/pack").value;
	frm.elements("EOSFunction/unitID").value=package;
	frm.action="ROLE.pr_automata.ROLE_P_ListPackageFunction.do?PageCond/begin=0&PageCond/length=10&PageCond/count=-1";
	frm.target = "selectfun";
         frm.submit();
	}

</script>