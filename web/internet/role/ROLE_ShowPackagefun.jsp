
<%@include file="/internet/BNOM/omappbase.jsp"%>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>
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
	window.parent.opener.document.forms(0).elements("EOSMenu/menuAction").value=selectedID+".do";
	window.parent.opener.document.forms(0).elements("EOSMenu/menuActionName").value=selectedName+".do";
	window.parent.close();
     }
  }
   function cancelSel(){
     window.parent.close();
  }
</script>
<form name="functionListFrm" action="ROLE.pr_automata.ROLE_P_ListPackageFunction.do">
 <table cellpadding=0 cellspacing=0 align="center" width="100%">
  	<html:hidden property="PageCond/begin" />
	<html:hidden property="PageCond/length" />
	<html:hidden property="PageCond/count" />
	<html:hidden property="EOSFunction/unitID" />
	<script>
	var myPage = new page();
	myPage.init("functionListFrm", "PageCond/begin", "PageCond/length", "PageCond/count");
	</script>	 
         <tr> 
	    <td colspan="2" width="100%" height="5%"><font size="2">【功能列表】</font></td>
        </tr>
	<tr valign="top">
	    <td  colspan="2"  class="tb_blue" width="100%" height="60%">
		  <table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse">
			  <tr class="tableHeadTR">
			    <td width="5%">选择</td>
			    <td>功能ID</td>
			    <td>功能名称</td>
			  </tr>
			              
			  <logic:iterate id="items" property="list[@type='EOSFunction']" >
			
			 <tr class=tableContentTR>
			    <td width="5%">
					<div align="center">
					<input type="radio" name="functionID" value="<bean:write property="EOSFunction/functionID" id="items"/>------<bean:write property="EOSFunction/functionName" id="items"/>" onclick="javascript:clickOn(this);"/>
					</div>
			    </td>
			    <td><bean:write id="items" property="EOSFunction/functionID"/></td>	
			    <td><bean:write id="items" property="EOSFunction/functionName"/></td>
			  </tr>
			  </logic:iterate>
				
		</table>
	    </td>
	</tr>	  
			  
	<tr class=queryLabelTD> 
			    <td  align="left" height="35%">
					<a href="javascript:FunctionSubmit()">【确定】</a><a href="javascript:cancelSel()">【取消】</a>
			    </td>			   
			    <td  align="right" class="result_bottom" >
			      <a href="javascript:myPage.previousPage();">上一页</a> 
			      <a href="javascript:myPage.nextPage();">下一页</a> 
			      第<script>document.write(myPage.current)</script>页/共<script>document.write(myPage.total)</script>页
			   </td>
	</tr>		  		 
</table>
</form>