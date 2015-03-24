<%@ include file="/internet/eosapp/hciHead.jsp" %>

<html>
<head>
    <script language="JavaScript" src="/internet/scripts/pagination.js"></script>

    <link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css" />
    <LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>
</head>    
    <form name="frmFunctionList" action="ROLE.pr_automata.ROLE_P_ShowAllFunction.do" method="POST">
	<!----------Hidden Param Start---------------->
	<html:hidden name="EOSBizCatalog/catalogID"/>
	<html:hidden property="QueryCondition[@entity='EOSBizCatalog']/PageCond/begin" />
	<html:hidden property="QueryCondition[@entity='EOSBizCatalog']/PageCond/length" />
	<html:hidden property="QueryCondition[@entity='EOSBizCatalog']/PageCond/count" />
	<!----------Hidden Param END---------------->
	
	   <script>
		var otherPage = new page();
		otherPage.init("frmFunctionList", "QueryCondition[@entity='EOSBizCatalog']/PageCond/begin", "QueryCondition[@entity='EOSBizCatalog']/PageCond/length", "QueryCondition[@entity='EOSBizCatalog']/PageCond/count");
	   </script>
	  
<table width="100%" height="100%"  border=0>

  <tr>

    <td width="100%" height="95%">
	<eos:OneTab name="功能管理" imagePath="/internet/images/tt.gif" >
	   <table class="result" cellpadding="0"  cellspacing="0"> 
	        <tr><td width="100%" height="5%"colspan="2"><b>功能列表</b></td></tr>      
		<tr valign="top">
		    <td colspan="2" class="tb_blue" width="100%" height="50%">
		       <table width="100%" border="1"  bordercolor="#B6B5B5" style="border-collapse: collapse">
			  <tr class="tableHeadTR"> 
			      <td width="4%" align="center"></td>
			      <td width="38%" align="center">功能ID</td>
			      <td width="40%" align="center">功能名</td>
			      <td width="18%" align="center">展现逻辑</td>
			  </tr>
				
			  <logic:iterate id="notePaper" property="QueryCondition[@entity='EOSBizCatalog']/list[@type='EOSBizCatalog']">
	
			  <tr class="tableContentTR" >
			      <td width="4%" align="center">
				  <html:checkbox indexed="true" id="notePaper" name="list/EOSBizCatalog/catalogID" property="EOSBizCatalog/catalogID" />
			      </td>
			      <td width="38%" align="center">
				  <bean:write id="notePaper" property="EOSBizCatalog/catalogID"/>
			      </td>
			      <td width="40%" align="center">
				  <bean:write id="notePaper" property="EOSBizCatalog/catalogName"/>
			      </td>
			      <td width="18%" align="center">
				  <a href="ROLE.pr_automata.ROLE_P_FunctionUpdateForBiz.do?EOSFunction/unitID=9999&EOSBizCatalog/catalogID=<bean:write id="notePaper" property="EOSBizCatalog/catalogID"/>" >【展现逻辑】 </a>
			      </td>
			  </tr>
				</logic:iterate>
	
	
			</table>
		    </td>
	        </tr>

	        <tr class=queryLabelTD valign=top> 
	             <td align="left" height="45%"> 
			       <input type="button" name="button2" value="&nbsp;修改&nbsp;" onclick="javascript:mod()"/>
			       <input type="button" name="button3" value="&nbsp;删除&nbsp;" onclick="javascript:del()"/>
			       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			       <input type="button" name="button1" value="&nbsp;新增功能&nbsp;" onclick="javascript:add()"/>	
		     </td>  
		      
		     <td align="right" height="45%"> 	
					
					<!-------------------翻页开始---------------------------->
						<script>
							if (otherPage.total > 1 && !otherPage.noCount) {
								document.write('<input type="button" name="button5" value="上一页" onclick="javascript:otherPage.previousPage()()"/>&nbsp;');
								document.write('<input type="button" name="button5" value="下一页" onclick="javascript:otherPage.nextPage()"/>&nbsp;&nbsp;');
								document.write('总共' + otherPage.count + '条');
								document.write('&nbsp;&nbsp;第');
								document.write(otherPage.current + '/');
								document.write(otherPage.total + '页&nbsp;&nbsp;&nbsp;')
							}
						</script>
						
		      </td>
					<!-------------------翻页结束---------------------------->
	        </tr>  


	          </form> 
	
	    </table>
	</eos:OneTab>
   </td>
   </tr> 
   </table>



<script language="javascript">
function add() {
	var submitFrm = document.frmFunctionList;
	submitFrm.action = "ROLE.pr_automata.ROLE_P_FunctionEdit.do?command=add";
	submitFrm.submit();
}


function addAutomato(){
	var frm = document.frmFunctionList;
	if(selectedCheckboxCount(frm) != 1){
		alert("您必须选择一条记录才能执行该操作！");
		return false;
	}

	var vID = getCheckedValue(frm);
	frm.action = "ROLE.pr_automata.ROLE_P_FunctionUpdateForBiz.do?EOSFunction/unitID=9999&EOSBizCatalog/catalogID="+vID;
	frm.submit();
}


function mod() {
	var frm = document.frmFunctionList;
	if(selectedCheckboxCount(frm) != 1){
		alert("您必须选择一条记录才能执行修改操作！");
		return false;
	}
	frm.action = "ROLE.pr_automata.ROLE_P_FunctionEdit.do?command=mod";
	frm.submit();

}

function del() {
	var frm = document.frmFunctionList;
	var selectedName="";
	if(selectedCheckboxCount(frm) < 1){
		alert("您至少选择一条记录才能执行删除操作!");
		return false;
	} else {
		if(confirm("此动作将删除掉该功能对应的所有记录,请谨慎使用,确定删除吗?")) {
			frm.target = "_parent";
			frm.action = "ROLE.pr_automata.ROLE_P_FunctionDelSubmit.do";
			frm.submit();
		} else {
			return false;
		}
	}
}

</script>

<script language="javascript">
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

function getCheckedValue(frm) {

	var length =0;
	var i=0;
	var count =0;
	eles = frm.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.type;
		if(type == "checkbox"){
			if(obj.checked){
				return obj.value;
			}
		}
		i++;
	}
	
}
</script>
