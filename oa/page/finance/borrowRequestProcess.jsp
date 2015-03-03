<%@include file="/internet/common.jsp"%>


<script>
var i=1 
 function insertFile(){
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
	    C1.innerHTML = "<input  type='file' name='file' class='input' size='30'>&nbsp;<input class='button_02' type='button' value='删 除' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'>";
	}
</script> 


<body>
<form method="post" name="myform" action="oa.prFinance.borrowRequestProcessDo.do" enctype="multipart/form-data">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;财务管理—&gt;借款审批—&gt;借款审批处理流程—&gt;<bean:write property="WFWorkItem/workItemName"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="BorrowRequest/_order/col1/field"/>
		<html:hidden property="BorrowRequest/_order/col1/asc" />
		<html:hidden property="temptype" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="WFWorkItem/submitType" />
		
		<html:hidden property="WFWorkItem/workItemID" />
		
		<html:hidden property="WFWorkItem/processInstID" />
		<html:hidden property="WFWorkItem/processDefID" />
		<html:hidden property="WFWorkItem/processDefName" />
		
		
		<html:hidden property="WFWorkItem/activityDefID" />
		<html:hidden property="WFWorkItem/activityInstID" />
		<html:hidden property="BorrowRequest/RequestID" />
		<html:hidden property="BorrowRequest/participant" />
		<html:hidden property="BorrowRequest/passParticipant" />
		
		
		
	  </td>
    </tr>
  </table>
  <table width="98%" border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" >
	<tr>
		<td>

		</td>
	</tr>
	<tr>
		<td height="100%" valign="top" nowrap bgcolor="#FFFFFF" style="border:1px #000000 solid;border-top:none">
		
		
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="10"></td></tr>
			</table>
			<!------------------------------  文头  ----------------------------->
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">借款审批单</td>
				</tr>
			</table>
			<!------------------------------  表单意见  ----------------------------->
			<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">部门：</td>
				<td width="24%" nowrap class="td1"> <bean:write property="EOSORG_T_Organization/orgName" /></td>
				<td width="10%" align="center" nowrap class="td1">借款人：</td>
				<td width="23%" nowrap class="td1"><bean:write property="BorrowRequest/UserID" formatClass="username" formatType="operatorID" /></td>
				<td width="10%" align="center" nowrap class="td1">日期：</td>
				<td width="23%" nowrap class="td1">
				
				<fcc:wfInput property="BorrowRequest/ConsumDate[@pattern='yyyy-MM-dd']" wfnode="DX1" type="text" domwfnode="BorrowRequest/activityDefID" size="20" readonly="true" onclick="calendar(this,'yyyy-MM-dd')" classname="inputOA"/>
				 </td>
			  </tr>
			  
			  <tr>
			    <td height="25" align="center" nowrap class="td1">借款事由：</td>
			    <td colspan="5" nowrap class="td1">
			    <fcc:wfInput property="BorrowRequest/Reasons" wfnode="DX1" type="text" domwfnode="BorrowRequest/activityDefID" attributestext='class="inputOA" ValidateType="notempty" Msg="借款事由不能为空" '  size="80" maxlength="100"  />
			    </td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">开支资金渠道：</td>
			    <td colspan="5" nowrap class="td1">
			    <fcc:wfInput property="BorrowRequest/Channel" wfnode="DX1" type="text" domwfnode="BorrowRequest/activityDefID" attributestext='class="inputOA" '  size="80" maxlength="100"  />
			    </td>
		      </tr>
			  <tr> 
				<td height="25" align="center" nowrap class="td1">借款金额：</td>
				<td colspan="5" nowrap class="td1"><fcc:wfInput property="BorrowRequest/AmountBig" wfnode="DX1" type="text" readonly="true" domwfnode="BorrowRequest/activityDefID" attributestext='class="inputOA" '  size="40" maxlength="50"   />（大写）
				&nbsp;<fcc:wfInput property="BorrowRequest/Amount" wfnode="DX1" type="text" domwfnode="BorrowRequest/activityDefID" attributestext='class="inputOA"  ValidateType="money" Msg="借款金额格式不正确"  '  size="20" maxlength="20"  onchange="piliskys()"  />（数字）</td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">预计还款报销日期：</td>
			    <td colspan="5" nowrap class="td1"><bean:write property="BorrowRequest/RepayDate[@pattern='yyyy-MM-dd']"   /></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" align="left" nowrap class="td1">
			<div class="divwf1">【部门领导签批】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX2" type="textarea" list="list[@type='wfdata']" domwfnode="BorrowRequest/activityDefID" cols="80" rows="5" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></div>				</td>
		      </tr>
		      <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【校领导审核】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX4" type="textarea" list="list[@type='wfdata']" domwfnode="BorrowRequest/activityDefID" cols="80" rows="5" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></div></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【财务部门审核】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX3" type="textarea" list="list[@type='wfdata']" domwfnode="BorrowRequest/activityDefID" cols="80" rows="5" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></div></td>
		      </tr>
			  <tr>
			    <td align="center" nowrap class="td1">领款人签收：</td>
		        <td align="center" nowrap class="td1">
					<logic:equal property="WFWorkItem/activityDefID" value="DX5">
					<html:text name="BorrowRequest/SignName"  property="SessionEntity/userName" attributesText='class="inputOA"'  size="20" maxlength="20" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/> 
				</logic:equal>
				</td>
		        <td align="center" nowrap class="td1">日期：</td>
		        <td nowrap class="td1"><logic:equal property="WFWorkItem/activityDefID" value="DX5">
					<html:text name="BorrowRequest/SignTime[@pattern='yyyy-MM-dd']"   attributesText='class="inputOA" readonly="true"' onclick="calendar(this,'yyyy-MM-dd')" property="currentDate" size="20" />
				</logic:equal></td>
		        <td nowrap class="td1">&nbsp;</td>
		        <td nowrap class="td1">&nbsp;</td>
			  </tr>
			</table>
				  
		  
		 
		   
      
		
			
			<!------------------------------  流转  ----------------------------->
		   
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
        <tr> 
          <td width="19%" align="right" nowrap colspan="2" bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20" scrolling="auto"></iframe>	
		  </td>
          
        </tr>
		<tr> 
          <td width="19%" align="right" nowrap class="td2">下环节流转选择：</td>
          <td width="81%" class="td1">
		  <%
		  	int i = 0;
		  	boolean display=true;
		  %>
		  <logic:iterate id="resultset" property="list[@type='nextnodes']">
		  	<%
		  	 String actDefID=base.util.TalentContext.getValue(pageContext,"resultset","Activity/actDefID");
		  	 String passedNode=base.util.TalentContext.getValue(pageContext,null,"ExtendData/PassedNode/Node");
		  	 if(actDefID.equals(passedNode)){
		  	 	if(i==0){
		  	 		display=false;
		  	 	}
		  	 %>
		  	<input onclick="hideButton(this)" name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> style="display: none;" >
		  	<%}else{ 
		  	%>
		  	<input onclick="hideButton(this)" name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> ><bean:write id="resultset" property="Activity/actDefName"/>&nbsp;
		  	<%} %>
			<%
				i++;
			%>
		  </logic:iterate>
          </td>
        </tr>
        <logic:notEqual property="WFWorkItem/activityDefID" value="DX6">
		<tr id="trDisplay"> 
          <td width="19%" align="right" nowrap class="td2">下环节人员选择：</td>
          <td class="td1">
		  <!--<html:text property="BorrowRequest/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="BorrowRequest/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','BorrowRequest/nextParticipantName','BorrowRequest/nextParticipantId')">-->
		  <%if(display){ %>
		  <html:text property="BorrowRequest/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="BorrowRequest/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','BorrowRequest/nextParticipantName','BorrowRequest/nextParticipantId')">
		  <%}else{ %>
		  <html:text property="BorrowRequest/nextParticipantName" attributesText='style="display:none;width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="BorrowRequest/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" style="display:none;" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','BorrowRequest/nextParticipantName','BorrowRequest/nextParticipantId')">
		  <%} %>
		  </td>
        </tr>
          </logic:notEqual>
      </table>
			
			<table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="spacedown">
				<tr><td></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>

		</tr>
		</td>
	</table> 
	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				 <logic:notEqual property="WFWorkItem/activityDefID" value="DX6">
				  <input id="sendId" name="wfsend" type="button" class="button_02" value="发 送" onClick="send()">
				  </logic:notEqual>
				  <logic:equal property="WFWorkItem/activityDefID" value="DX5">
				  <input id="endBtn" name="wfsend" type="button" class="button_02" value="结束流程" onClick="send()">
				  </logic:equal>
				  <logic:equal property="WFWorkItem/activityDefID" value="DX6">
				  <input id="endBtn" name="wfsend" type="button" class="button_02" value="结束流程" onClick="send()">
				  </logic:equal>
				  <%
				  	String act = base.util.TalentContext.getValue(pageContext,null,"WFWorkItem/activityDefID");
				  	if ("DX2,DX3".indexOf(act)>=0){
				  %>
				  <input name="wfreturn" type="button" class="button_02" value=" 驳 回 " onClick="returnNode()">
				  <%} %>
				  <input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
				</tr>
     </table>
</form>
<div id="pubLemma" style="position:absolute; top:301px; width:185px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="pubLemmas" property="list[@type='pubLemmas']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION'/>');"><bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
</body>
<script>
	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>

<script>
function save() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "0";
		if(validater(frm)) {
			getWFData(frm);
			frm.submit();	
		}

}
<% if ("DX2,DX3".indexOf(act)>=0){ %>
function returnNode(){
	var isSure = confirm('是否驳回申请?');
	if(isSure==true){
		var newValue='<bean:write property="ExtendData/PassedNode/Node"/>';
		selRadioByValue("Flow/nextNode",newValue);
		document.getElementById('BorrowRequest/nextParticipantName').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		document.getElementById('BorrowRequest/nextParticipantId').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		send();
	}
}
<% } %>
function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
			if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["BorrowRequest/nextParticipantId"].value == ""){
					if(frm.elements["WFWorkItem/activityDefID"].value!="DX5"&&frm.elements["WFWorkItem/activityDefID"].value!="DX6"){
					  alert("请选择下环节人员");
					  return;
					}
					
					if(frm.elements["WFWorkItem/activityDefID"].value=="DX5"&&frm.elements["Flow/nextNode"].value!="EndActivity"){ 
					    alert("请选择下环节人员");
					    return;
					}
					
					if(frm.elements["WFWorkItem/activityDefID"].value=="DX5"&&frm.elements["Flow/nextNode"].value=="EndActivity"){ 
					   frm.elements["BorrowRequest/nextParticipantName"].value=="";
					   frm.elements["BorrowRequest/nextParticipantId"].value=="";
					}
					
				}
			}
			getWFData(frm);
			frm.submit();	
		}
}
function piliskys(){
	var test1= document.all["BorrowRequest/Amount"].value;
	if(isNaN(test1)) {
		alert("不是一个有效的数字，请重新输入！");
		document.all["BorrowRequest/Amount"].value="";
	}
	else {
		document.all["BorrowRequest/AmountBig"].value =chineseMoney(test1);
	}
}
</script>
<script language="javascript">
function hideButton(this){
var frm = document.forms[0];
var btn =document.getElementById("sendId");
var endBtn=document.getElementById("endBtn"); 

  if(frm.elements["WFWorkItem/activityDefID"].value=="DX5"&&frm.elements["Flow/nextNode"][1].checked){
    btn.style.display="none";
    endBtn.style.display="";
  }else{
    btn.style.display="";
    endBtn.style.display="none";
  }
	var v=obj.value;
	if(v=='EndActivity'){
		document.getElementById('trDisplay').style.display='none';
	}else{
		document.getElementById('trDisplay').style.display='block';
	}
}

function init(){
  if(frm.elements["WFWorkItem/activityDefID"].value=="DX5"){
     var endBtn=document.getElementById("endBtn"); 
      endBtn.style.display="none";
  }
}

init();

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
</script>