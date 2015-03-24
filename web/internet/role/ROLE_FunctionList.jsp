<%--
	---------------------------------------------------------------------------------
	Revision           Revision Date    Revision Man         Reason/Statement
	1.0                2004/04/26       liuhang                 create
	
--%>
<%@include file="/internet/common.jsp" %><eos:css/>
<script type="text/javascript" src="/internet/scripts/pagination.js"></SCRIPT>
	 <link rel="stylesheet" href="/internet/css/style.css" type="text/css" />
  <form name="functionListFrm" action="ROLE.pr_automata.ROLE_P_QueryFunction.do" method="post">
	<html:hidden property="PageCond/begin" />
	<html:hidden property="PageCond/length" />
	<html:hidden property="PageCond/count" />
	<script>
	var myPage = new page();
	myPage.init("functionListFrm", "PageCond/begin", "PageCond/length", "PageCond/count");
	</script>
        <html:hidden property="EOSFunction/unitID"/>
<table width="100%" height="100%">
  <tr><td height="100%">	
	<eos:OneTab name="展现逻辑设置" imagePath="/internet/images/tt.gif" >
			   <table  class="result"  cellpadding=0 cellspacing=0>
			               <tr><td width="100%" colspan="2"><b>展现逻辑列表</b></td></tr> 
				       <tr valign="top">
				             <td colspan="2" class="tb_blue" height="60%" width="100%">
					          <table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse" >
							  <tr class="tableHeadTR">
								    <td nowrap width="5%">选择</td>
								    <td width="42%">展现逻辑ID</td>
								    <td width="43%">展现逻辑名称</td>
								    <td nowrap width="10%">校验权限</td>
							  </tr>	        
							  <logic:iterate id="items" property="list[@type='EOSFunction']" >	
							  <tr class="tableContentTR">
								    <td nowrap width="5%">
										<div align="center">
										<html:checkbox indexed="true" name="list/EOSFunction/functionID" id="items" property="EOSFunction/functionID" />
										</div>
								    </td>
								    <td width="42%"><bean:write id="items" property="EOSFunction/functionID"/></td>	
								    <td width="43%"><bean:write id="items" property="EOSFunction/functionName"/></td>
								    <td nowrap width="10%">
									    <logic:equal id="items" property="EOSFunction/isCheck" value="1">
									    校验
									    </logic:equal>
									    <logic:equal id="items"  property="EOSFunction/isCheck" value="0">
									    不校验
									    </logic:equal>	    
								    </td>
							  </tr>
							  </logic:iterate>	  
						  </table>
		                              </td>
		                       </tr>
				       <tr class=queryLabelTD valign="top"> 		  		  
				 
					  <input type="hidden" name="isCheck" ></input>
					  <input type="hidden" name="command" ></input>
					  <input type="hidden" name="list/@name"/>
					
					  
					    <td  align="left" height="40%">
						      <input type="button" name="button3" value="校验" onclick="javascript:setChecked()"/> 
						      <input type="button" name="button4" value="不校验" onclick="javascript:setUnChecked()"/>
						      
						     
						  <logic:present property="EOSFunction/unitID">
						           <logic:notEqual property="EOSFunction/unitID" value="">   
						    	<input type="button" name="button5" value="全校验" onclick="javascript:setAllChecked()"/>
						        <input type="button" name="button5" value="全不校验" onclick="javascript:setAllUnChecked()"/>
						      	    </logic:notEqual> 
						  </logic:present>
						      <input type="button" name="button5" value="刷新" onclick="javascript:refrush()"/>
					     </td>
				             <td align="right"  height="40%">
                                                  <input type="button" name="button1" value="上一页" onclick="javascript:myPage.previousPage()"/> 
					          <input type="button" name="button2" value="下一页" onclick="javascript:myPage.nextPage()"/>					    
					          第<script>document.write(myPage.current)</script>页/共<script>document.write(myPage.total)</script>页
					     </td>
					  </tr>
	                   </table>
	               </form>
	  </eos:OneTab>
   </td>
   </tr> 
  </table>	

<script>
	function refrush(){
	      var frm = document.functionListFrm;
	      	frm.target = "_parent";
	      	frm.action = "ROLE.pr_automata.ROLE_P_SyncFunctions.do";
		frm.submit();
}
	function setChecked(){
	        var frm = document.functionListFrm;
	        if(selectedCheckboxCount(frm) < 1){
		      alert("您至少选择一条记录才能执行该操作!");
		      return false;
	        } else {
		     if(confirm("确定校验吗?")) {
		          functionListFrm.isCheck.value="1";
		          functionListFrm.command.value="SET";
		          functionListFrm.action="ROLE.pr_automata.ROLE_P_UpdateCheckStateEX.do";
		          frm.submit();
		       } else {
			return false;
		       }
		}
	}
	function setUnChecked(){
	        var frm = document.functionListFrm;
	        if(selectedCheckboxCount(frm) < 1){
		      alert("您至少选择一条记录才能执行该操作!");
		      return false;
	        } else {
		     if(confirm("确定不校验吗?")) {
		functionListFrm.isCheck.value="0";
		functionListFrm.command.value="SET";
		functionListFrm.action="ROLE.pr_automata.ROLE_P_UpdateCheckStateEX.do";
		functionListFrm.submit();
	              } else {
			return false;
		      }
		}
	}
	
	
	function setAllChecked(){
	        var frm = document.functionListFrm;

		if(confirm("确定包里所有的展现逻辑全校验权限吗?")) {
		functionListFrm.isCheck.value="1";
		functionListFrm.command.value="ALL";
		functionListFrm.action="ROLE.pr_automata.ROLE_P_UpdateCheckStateEX.do";
		functionListFrm.submit();
	         } else {
	          return false;
		 }
	}
	
	function setAllUnChecked(){
	        var frm = document.functionListFrm;
		if(confirm("确定包里所有的展现逻辑全不校验权限吗?")) {
		functionListFrm.isCheck.value="0";
		functionListFrm.command.value="ALL";
		functionListFrm.action="ROLE.pr_automata.ROLE_P_UpdateCheckStateEX.do";
		functionListFrm.submit();
	        } else {
			return false;
		}
	}


  function getCheckedValue(frm) {

	var length =0;
	var i=0;
	var count =0;
	eles = frm.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.attributes.item("type").nodeValue;
		if(type == "checkbox"){
			if(obj.checked){
				return obj.value;
				//count++;
			}
		}
		i++;
	}
	//return count;
}

function selectedCheckboxCount(frm){
	var length =0;
	var i=0;
	var count =0;
	eles = frm.elements;
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
</script>