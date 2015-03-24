 
 <%@ include file="/internet/common.jsp" %>
<html>
<head>
	<script language="JavaScript" src="/internet/scripts/pagination.js"></script>
	<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css" />
</head>




<form name="frmOperatorList" action="BNDICT.pr_automata.BNDICT_P_ShowAllBusiType.do" method="POST">
	
	<!----------Hidden Param Start---------------->
	<html:hidden property="QueryCondition[@entity='BNDICT_T_BusinType']/BNDICT_T_BusinType/businTypeID" />
	<html:hidden property="QueryCondition[@entity='BNDICT_T_BusinType']/BNDICT_T_BusinType/businTypeName" />
	<html:hidden property="queryAll" />
	<html:hidden property="QueryCondition[@entity='BNDICT_T_BusinType']/PageCond/begin" />
	<html:hidden property="QueryCondition[@entity='BNDICT_T_BusinType']/PageCond/length" />
	<html:hidden property="QueryCondition[@entity='BNDICT_T_BusinType']/PageCond/count" />
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
	
		<table class="result" width="100%">
			<tr class="result_title">
		      <td colspan="3" width="100%"> 
		        <div align="left">业务类型列表</div>
		      </td>
		    </tr>
			<tr class="result_head"> 
				<td width="2%"></td>
				<td width="49%">业务类型名称</td>
				<td width="49%">业务类型ID</td>
			</tr>
			
			<%
			int count=0;
			String trClass = "result_content";
			int resultShowLen = 10;
			%>
			<logic:iterate id="notePaper" property="QueryCondition[@entity='BNDICT_T_BusinType']/list[@type='BNDICT_T_BusinType']">
			
			
				<%
				if(count%2==0)
				trClass = "result_content_";
				else
				trClass = "result_content";
				%>
				<tr class="<%=trClass%>">
					<td width="2%">
						<html:checkbox indexed="true" id="notePaper" name="list/entity/BUSINTYPEID" property="entity/BUSINTYPEID" />
					</td>
					<td width="49%">
						<bean:write id="notePaper" property="entity/BUSINTYPENAME"/>
					</td>
					<td width="49%">
						<bean:write id="notePaper" property="entity/BUSINTYPEID"/>
					</td>
				</tr>
				<%count++;%>
			</logic:iterate>
			
			<!-- 补充行数!  -->
			<%
				for(int i=count; i<resultShowLen; i++) {
					if(i%2 == 0) {
						trClass = "result_content_";
					} else {
						trClass = "result_content"; 
					}
			%>
				<tr class="<%=trClass%>">
				<td></td><td></td><td></td>
				</tr>
			<%
				}// end of for count
			%>
			
		<tr> 
          <td colspan="3" class="hcibottom" width="885">
     	     <table border="0" width="100%" cellspacing="0" cellpadding="0">
        	   <tr> 
	        	   <td nowrap width="40%" height="20">
	          		<div align="left">
	          			<a href="#1" onclick="javascript:add();">
	          				<img src="/internet/theme/style0/add.gif" border="0"/>
	          			</a>
	          			<a href="#2" onclick="javascript:mod();">
	          				<img src="/internet/theme/style0/modify.gif" border="0"/>
	          			</a>
	          			<a href="#4" onclick="javascript:del()">
	          				<img src="/internet/theme/style0/delete.gif" border="0"/>
	          			</a>
	          			<a href="#5" onclick="javascript:setPart()">
	          				<img src="/internet/images/bndict_showparam.gif" border="0"/>
	          			</a>
	          			

	          		</div>
	          	   </td>
	               <td align="right" class="hcibottom">              	   
	                <script>
						if (otherPageBnDict.total > 1 && !otherPageBnDict.noCount) {
							document.write('<a  href="javascript:previousPage();" ><img src="/internet/theme/style0/prevpage.gif" border="0"/></a>&nbsp;');
							document.write('<a  href="javascript:nextPage();" ><img src="/internet/theme/style0/nextpage.gif" border="0"/></a>&nbsp;&nbsp;&nbsp;');
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

<iframe name="modiFrame" src="#" frameborder="0" width="100%" height="100%" marginwidth="0" marginheight="0" scrolling="no" align="left">
</iframe>

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
	submitFrm.target = "modiFrame";
	submitFrm.action = "BNDICT.pr_automata.BNDICT_P_AddBusiType.do";
	submitFrm.submit();
}


function setPart() {
	var frm = document.frmOperatorList;
	if(selectedCheckboxCount(frm) != 1){
		alert("您必须选择一条业务类型才能显示其业务参数！");
		return false;
	}
	var vID = getCheckedValue(frm);

	frm.elements["BNDICT_V_Dictionary/businTypeID"].value=vID;
	frm.target="_self";
	//alert(vID);
	frm.action = "BNDICT.pr_automata.BNDICT_P_DictDetailQuery.do";
	//alert(frm.action);
	frm.submit();
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
	frm.target = "modiFrame";
	frm.elements["BNDICT_T_BusinType/businTypeID"].value=vID;
	frm.action = "BNDICT.pr_automata.BNDICT_P_ModBusiType.do";
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