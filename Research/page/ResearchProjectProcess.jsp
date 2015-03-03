<%@include file="/internet/common.jsp"%>
<script type="text/javascript">
	document.domain = "gzswdx.gov.cn";
</script>
<body>
	<form method="post" name="myform" action="Research.pr.prResearchProjectProcessDo.do" enctype="multipart/form-data">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="5">
					<html:hidden property="temptype" />

					<html:hidden property="WFWorkItem/submitType" />

					<html:hidden property="WFWorkItem/workItemID" />

					<html:hidden property="WFWorkItem/processInstID" />
					<html:hidden property="WFWorkItem/processDefID" />
					<html:hidden property="WFWorkItem/processDefName" />


					<html:hidden property="WFWorkItem/activityDefID" />
					<html:hidden property="WFWorkItem/activityInstID" />
					<html:hidden property="WCMMetaTablePaperBuild/WCMMetaTablePaperBuildID" />
					<html:hidden property="WCMMetaTablePaperBuild/participant" />
					<html:hidden property="WCMMetaTablePaperBuild/passParticipant" />



				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse">
			<tr>
				<td height="100%" valign="top" nowrap bgcolor="#FFFFFF" style="border:0px #ffffff solid">
				<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
						<tr>
							<td width="19%" align="left" nowrap colspan="2" bgcolor="#FFFFFF"><iframe
						src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0"
						width="100%" name="graphID" style="height:200;"></iframe></td>

						</tr>
						<tr>
							<td width="19%" align="right" nowrap class="td2">下环节流转选择：</td>
							<td width="81%" class="td1"><%
		int i = 0;
		boolean display = true;

		%>
								<logic:iterate id="resultset" property="list[@type='nextnodes']">
									<%String actDefID = base.util.TalentContext.getValue(pageContext,
				"resultset", "Activity/actDefID");
		String passedNode = base.util.TalentContext.getValue(pageContext, null,
				"ExtendData/PassedNode/Node");
		if (actDefID.equals(passedNode)) {
			if (i == 0) {
				display = false;
			}
			%>
									<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' onclick="endCheck(this)"
										nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%>
										style="display: none;">
									<%}else{ 
		  	%>
									<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' onclick="endCheck(this)"
										nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%>>
									<bean:write id="resultset" property="Activity/actDefName" />&nbsp;
		  	<%} %>
									<%i++;
		%>
								</logic:iterate>
							</td>
						</tr>
						<logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
							<tr id="nextName">
								<td width="19%" align="right" nowrap class="td2">下环节人员选择：</td>
								<td class="td1"><!--<html:text property="MR_APPLY/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="MR_APPLY/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','MR_APPLY/nextParticipantName','MR_APPLY/nextParticipantId')">-->
									<%if (display) {
		%>
									<html:text property="WCMMetaTablePaperBuild/nextParticipantName"
										attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />

									<input name="select" type="button" class="button_02" value="选 择"
										onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','WCMMetaTablePaperBuild/nextParticipantName','WCMMetaTablePaperBuild/nextParticipantId')">
									<%} else {
		%>
									<html:text property="WCMMetaTablePaperBuild/nextParticipantName"
										attributesText='style="display:none;width:80%;border:1 #efefef soild;" readonly="true"' />

									<input name="select" type="button" class="button_02" value="选 择" style="display:none;"
										onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','WCMMetaTablePaperBuild/nextParticipantName','WCMMetaTablePaperBuild/nextParticipantId')">
									<%}
		%></td>
							</tr>
							<!--<logic:equal property="WFWorkItem/activityDefID" value="DX2">
								<tr id="nobuild" style="display: none;">
									<td width="19%" align="right" nowrap class="td2">意见：</td>
									<td class="td1">
										<html:textarea property="WCMMetaTablePaperBuild/nobuildoption" attributesText="cols='62' rows='5'"/>
									</td>
								</tr>
							</logic:equal>
							<logic:equal property="WFWorkItem/activityDefID" value="DX4">
								<tr id="endbuild" style="display: none;">
									<td width="19%" align="right" nowrap class="td2">意见：</td>
									<td class="td1">
										<html:textarea property="WCMMetaTablePaperBuild/endbuildoption" attributesText="cols='62' rows='5'"/>
									</td>
								</tr>
							</logic:equal>-->
						</logic:notEqual>
						<html:hidden property="WCMMetaTablePaperBuild/nextParticipantId" />
					</table>
				</td>
			</tr>
			</td>
		</table>
		<!--<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
					<logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
						<input name="wfsend" type="button" class="button_02" value="发 送" onClick="send()">
					</logic:notEqual>
					<%String act = base.util.TalentContext.getValue(pageContext, null,
				"WFWorkItem/activityDefID");
		if (" ".indexOf(act) >= 0) {
		%> <input name="wfreturn" type="button" class="button_02" value=" 驳 回 " onClick="returnNode()"> <%}
		%>
					<logic:equal property="WFWorkItem/activityDefID" value="DX5">
						<input name="wfsend" type="button" class="button_02" value="结束流程" onClick="send()">
					</logic:equal>
					<logic:equal property="WFWorkItem/activityDefID" value="DX4">
						<input name="wfsend" type="button" class="button_02" value="结束流程" onClick="send()">
					</logic:equal>
					<input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()"> <input name="wfcancel"
						type="button" class="button_02" value="返 回" onClick="history.back()"></td>
			</tr>
		</table>-->
	</form>
</body>
<script>

	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>
<script>function save() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "0";
		if(validater(frm)) {
			getWFData(frm);
			frm.submit();	
		}

}
<% if (" ".indexOf("")>=0){ %>
function returnNode(){
	var isSure = confirm('是否驳回申请?');
	if(isSure==true){
		var newValue='<bean:write property="ExtendData/PassedNode/Node"/>';
		selRadioByValue("Flow/nextNode",newValue);
		try{
		document.getElementById('WCMMetaTablePaperBuild/nextParticipantName').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		}catch(e){
		
		}
		document.getElementById('WCMMetaTablePaperBuild/nextParticipantId').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		//var eles = document.getElementsByName('Flow/nextNode');
		//var i=0;
		//while(i<eles.length){
		//	var obj= eles[i];
		//		if(obj.checked==true){
		//		  alert(obj.value);
		//	     }
		//	i++
		//}//while
		send();
	}
}
<% } %>
function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
			if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["WCMMetaTablePaperBuild/nextParticipantId"].value == ""){
					alert("请选择下环节人员");
					return;
				}
			}
			getWFData(frm);
			frm.submit();	
		}
}

function endCheck(obj){
	var value=obj.value;
	if(value=='EndActivity'){
		document.getElementById('nextName').style.display='none';
	}else{		
		document.getElementById('nextName').style.display='block';
	}
	if(value=='DX1' && '<bean:write property='WFWorkItem/activityDefID'/>'=='DX2'){
		parent.showBuildTr();
		//document.getElementById('nobuild').style.display='block';
		//document.getElementById('endbuild').style.display='none';
	}else if(value=='DX3' && '<bean:write property='WFWorkItem/activityDefID'/>'=='DX4'){
		parent.showBuildTr();
		//document.getElementById('endbuild').style.display='block';
		//document.getElementById('nobuild').style.display='none';
	}else{
		parent.closeBuildTr();
		//document.getElementById('endbuild').style.display='none';
		//document.getElementById('nobuild').style.display='none';
	}
}
</script>
<script language="javascript">
function menuControl(obj,show)
{
window.event.cancelBubble=true;
inputobj = event.srcElement;
var objID=event.srcElement.id;
var index=objID.indexOf("_");
var mainID=objID.substring(0,index);
var numID=objID.substring(index+1,objID.length);

if(show==1)
{
eval("showMenu("+obj+")");
}
else
{
eval("hideMenu("+obj+")");
}


}

var nbottom=0,speed=11;
function displayMenu(obj)
{
obj.style.clip="rect(0 100% "+nbottom+"% 0)";
nbottom+=speed;
if(nbottom<=100) 
{
timerID=setTimeout("displayMenu("+obj.id+"),70");
}
else clearTimeout(timerID);
}
function showMenu(obj)
{var parent = event.srcElement;
obj.style.display="block";
//obj.style.clip="rect(0 0 0 0)";
obj.style.top = ylib_getPageY(parent)+18;
obj.style.left = ylib_getPageX(parent);
//nbottom=5;
//displayMenu(obj);
}
function hideMenu(obj)
{
nbottom=0;
obj.style.display="none";
}
function keepMenu(obj)
{
obj.style.display="block";
}

function ylib_getPageX(o) { 
	var x=0;
	{ while(eval(o)) { 
		x+=o.offsetLeft; o=o.offsetParent; 
	} 
  } 
return x; 
}
function ylib_getPageY(o) {
 	var y=0; 
 	{ while(eval(o)) {
		 y+=o.offsetTop; o=o.offsetParent;
		  } 
	} 
	return y;
 }
 
function setValue(value) {
inputobj.value = inputobj.value + value;
}


	parent.submitTo.disabled=false;
	parent.showFlow();
</script>