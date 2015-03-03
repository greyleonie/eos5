<%@include file="/internet/common.jsp"%>
<script type="text/javascript">
	document.domain = "gzswdx.gov.cn";
</script>
<%
		String userName = base.util.TalentContext.getValue(pageContext, null,
				"SessionEntity/userName");
%>
<body>
	<form method="post" name="myform" action="Research.pr.prResearchFundingAddDo.do">		
		<html:hidden property="WFWorkItem/submitType" />		
		<html:hidden property="id" />
		<input type="hidden" name="WCMMetaTableAccountExpense/WCMMetaTableAccountExpenseID" value='<bean:write property="id"/>' />
		<html:hidden property="WFWorkItem/workItemID" />
		<html:hidden property="WFWorkItem/processInstID" />
		<html:hidden property="WFWorkItem/processDefID" />
		<html:hidden property="WFWorkItem/processDefName" />
		<html:hidden property="WFWorkItem/activityDefID" />
		<html:hidden property="WFWorkItem/activityInstID" />
		<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
			<tr>
				<td width="100%" align="left" nowrap colspan="2" bgcolor="#FFFFFF"><iframe
						src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0"
						width="100%" name="graphID" style="height:200;"></iframe></td>
			</tr>
			<tr>
				<td width="19%" align="right" nowrap class="td2">下环节流转选择：</td>
				<td width="81%" class="td1"><%
		int i = 0;
		%>
					<logic:iterate id="resultset" property="list[@type='nextnodes']">
						<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>'
							nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%>>
						<bean:write id="resultset" property="Activity/actDefName" />&nbsp;
			<%
				i++;
			%>
					</logic:iterate>
				</td>
			</tr>
	<tr>
				<td width="19%" align="right" nowrap class="td2">下环节人员选择：</td>
				<td class="td1">
				
					<html:text property="WCMMetaTableAccountExpense/nextParticipantName"
						attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
					<html:hidden property="WCMMetaTableAccountExpense/nextParticipantId" />
					<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
					<input name="select" type="button" class="button_02" value="选 择"
						onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','WCMMetaTableAccountExpense/nextParticipantName','WCMMetaTableAccountExpense/nextParticipantId')">
				</logic:notEqual>
				</td>
			</tr>
		</table>
		<!------------------------------  公文流转  结束 ----------------------------->
		<!--<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td colspan="9" nowrap>
					<table id="tail" width="100%" height="50" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
						<tr>
							<td align="center" valign="middle"><input name="wfsend" type="button" class="button_02" value="发 送"
									onClick="send()"> <input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()"> <input
									name="wfcancel" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>-->
	</form>
</body>
<script language="javascript">

	function save() {
		var frm = document.forms[0];
		frm.action = "Research.pr.prResearchFundingAddDo.do";
		frm.enctype = "multipart/form-data";
		frm.target = "_self";
		frm.method = "post";
		frm.elements["WFWorkItem/submitType"].value = "0";
		if (validater(frm)) {
			getWFData(frm);
			setTimeout("document.forms[0].submit()",5000);
		}
	}

	function send() {
		var frm = document.forms[0];
		frm.action = "Research.pr.prResearchFundingAddDo.do";
		frm.enctype = "multipart/form-data";
		frm.target = "_self";
		frm.method = "post";
		frm.elements["WFWorkItem/submitType"].value = "1";
		if (validater(frm)) {
			if (getRadioValue("Flow/nextNode")!="EndActivity") {
				if (frm.elements["WCMMetaTableAccountExpense/nextParticipantId"].value == "") {
					alert("请选择下环节人员");
					return;
				}
			}
			getWFData(frm);
			setTimeout("document.forms[0].submit()",5000);
		}
	}
	
	
	document.getElementById('WCMMetaTableAccountExpense/nextParticipantId').value=parent.sChargeName.value;
	document.getElementById('WCMMetaTableAccountExpense/nextParticipantName').value=parent.sChargeTrueName.value;
	parent.submitTo.disabled=false;
	parent.showFlow();
</script>