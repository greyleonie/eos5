<%@ include file="/internet/common.jsp" %>
<html>
<head>
	<script language="JavaScript" src="/internet/scripts/pagination.js"></script>
	<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css" />
	 <LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>
</head>


<form name="frmOperatorList" action="BNDICT.pr_automata.BNDICT_P_ShowAllBusiType.do" method="POST">
	
	<!----------Hidden Param Start---------------->
	<html:hidden 	property="QueryCondition[@entity='BNDICT_T_BusinType']/PageCond/begin" 	/>
	<html:hidden    property="QueryCondition[@entity='BNDICT_T_BusinType']/PageCond/length"/> 
	<html:hidden	property="QueryCondition[@entity='BNDICT_T_BusinType']/PageCond/count"/> 
	<html:hidden 	property="QueryCondition[@entity='BNDICT_T_BusinType']/BNDICT_T_BusinType/businTypeID" />
	<html:hidden    property="QueryCondition[@entity='BNDICT_T_BusinType']/BNDICT_T_BusinType/businTypeName" />
	<html:hidden    property="queryAll" />
	<!----------Hidden Param END---------------->
	
	
	<html:hidden property="BNDICT_V_Dictionary/businTypeID" />
	<html:hidden property="BNDICT_T_BusinType/businTypeID" />
  	<html:hidden property="PageCond/count" value="-1"/>
  	<html:hidden property="PageCond/length" value="10"/>
  	<html:hidden property="PageCond/begin" value="0"/>
  	<script>
		var otherPageBnDict = new page();
		otherPageBnDict.init("frmOperatorList", "QueryCondition[@entity='BNDICT_T_BusinType']/PageCond/begin", "QueryCondition[@entity='BNDICT_T_BusinType']/PageCond/length", "QueryCondition[@entity='BNDICT_T_BusinType']/PageCond/count");
	</script>
<table border="0" cellpadding=0 cellspacing=0 bgcolor="#EEEEEE" height="100%" width="100%">   
<tr><td height="100%" width="100%"  align="center">
	   <table class="result" cellpadding=0 cellspacing=0 >  
	                <tr><td width="100%" colspan="2"><b>业务类型列表</b></td></tr>      
		        <tr valign="top" >
				    <td class="tb_blue"  height="60%" colspan="2">
					       <table width="100%"  border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse">
							<tr class="tableHeadTR"> 
								<td width="4%"></td>
								<td width="48%">业务类型名称</td>
								<td width="48%">业务类型ID</td>
							</tr>
							<logic:iterate id="notePaper" property="QueryCondition[@entity='BNDICT_T_BusinType']/list[@type='BNDICT_T_BusinType']">
							 <tr class=tableContentTR>
									<td width="4%" align="center">
										<html:checkbox indexed="true" id="notePaper" name="list/BNDICT_T_BusinType/businTypeID" property="BNDICT_T_BusinType/businTypeID" />
									</td>
									<td width="48%" align="center">
										<bean:write id="notePaper" property="BNDICT_T_BusinType/businTypeName"/>
									</td>
									<td width="48%" align="center">
										<bean:write id="notePaper" property="BNDICT_T_BusinType/businTypeID"/>
									</td>
							 </tr>
							</logic:iterate>	        			
						</table>
				    </td>
		        </tr>      
		             
		        <tr class=queryLabelTD valign="top"> 
				   <td nowrap height="40%" align="left">
	
					       <input type="button" name="button2" value="&nbsp;修改&nbsp;" onclick="javascript:mod()"/>
					       <input type="button" name="button3" value="&nbsp;删除&nbsp;" onclick="javascript:del()"/>
					       <input type="button" name="button3" value="&nbsp;业务参数&nbsp;" onclick="javascript:setPart()"/>
			               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			               <input type="button" name="button1" value="新增业务类型" onclick="javascript:add()"/>					       
			  			
			  	    </td>		        
			            <td align="right" height="20%">              	   
			                       <script>
							if (otherPageBnDict.total > 1 && !otherPageBnDict.noCount) {
					                document.write('<input type="button" name="button5" value="上一页" onclick="javascript:previousPage()()"/>&nbsp;');
							document.write('<input type="button" name="button5" value="下一页" onclick="javascript:nextPage()"/>&nbsp;&nbsp;');							
							
								document.write('总共' + otherPageBnDict.count + '条');
								document.write('&nbsp;&nbsp;第');
								document.write(otherPageBnDict.current + '/');
								document.write(otherPageBnDict.total + '页')
							}
						</script>
				    </td>		         
		    </tr>
	  </table>
      </td>
  </tr>	 						
</table>
</form>
</html>

<%@ include file="/internet/commonTail.jsp" %>



<script language="javascript">


function previousPage() {
	var frm = document.frmOperatorList;
	frm.target="_self";
	frm.action="BNDICT.pr_automata.BNDICT_P_ShowAllBusiType.do";
	otherPageBnDict.previousPage();

}
function nextPage() {
	var frm = document.frmOperatorList;
	frm.target="_self";
	frm.action="BNDICT.pr_automata.BNDICT_P_ShowAllBusiType.do";
	otherPageBnDict.nextPage();

}

function add() {
	var submitFrm = document.frmOperatorList;
	submitFrm.target = "_self";
	submitFrm.action = "BNDICT.pr_automata.BNDICT_P_AddBusiType.do";
	submitFrm.submit();
}




function del() {
	var frm = document.frmOperatorList;
	var selectedName="";
	if(selectedCheckboxCount(frm) < 1){
		alert("您至少选择一条记录才能执行删除操作!");
		return false;
	} else {
		if(confirm("此动作将删除掉该业务类型对应的所有业务参数,请谨慎使用,确定删除吗?")) {
			frm.target = "_self";
			frm.action = "BNDICT.pr_automata.BNDICT_P_DelBusiType.do";
			frm.submit();
		} else {
			return false;
		}
	}
}

function mod() {
	var frm = document.frmOperatorList;
	if(selectedCheckboxCount(frm) != 1){
		alert("您必须选择一条记录才能执行修改操作！");
		return false;
	}
	var vID = getCheckedValue(frm);
	frm.target = "_self";
	frm.elements["BNDICT_T_BusinType/businTypeID"].value=vID;
	frm.action = "BNDICT.pr_automata.BNDICT_P_ModBusiType.do";
	frm.submit();

}
function setPart() {
	var frm = document.frmOperatorList;
	if(selectedCheckboxCount(frm) != 1){
		alert("您必须选择一条业务类型才能显示其业务参数！");
		return false;
	}
	var vID = getCheckedValue(frm);

	frm.elements["BNDICT_V_Dictionary/businTypeID"].value=vID;
	frm.target="_parent";
	frm.action = "BNDICT.pr_automata.BNDICT_P_ShowDict.do";
	frm.submit();
}
</script>

<script language="javascript">
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