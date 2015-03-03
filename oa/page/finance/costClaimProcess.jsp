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
<form method="post" name="myform" action="oa.prFinance.costClaimProcessDo.do" enctype="multipart/form-data">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;财务管理—&gt;费用报销—&gt;费用报销处理流程—&gt;<bean:write property="WFWorkItem/workItemName"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="CostClaim/_order/col1/field"/>
		<html:hidden property="CostClaim/_order/col1/asc" />
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
		<html:hidden property="CostClaim/RequestID" />
		<html:hidden property="CostClaim/participant" />
		<html:hidden property="CostClaim/passParticipant" />
		
		
		
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
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">费用报销单</td>
				</tr>
			</table>
			<!------------------------------  表单意见  ----------------------------->
			<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">报销部门：</td>
				<td width="24%" nowrap class="td1"> <bean:write property="EOSORG_T_Organization/orgName" /></td>
				<td width="10%" align="center" nowrap class="td1">日期：</td>
				<td width="23%" nowrap class="td1">
				<fcc:wfInput property="CostClaim/ClaimDate[@pattern='yyyy-MM-dd']" wfnode="DX1" type="text" domwfnode="CostClaim/activityDefID" size="20" readonly="true"  onclick="calendar(this,'yyyy-MM-dd')" classname="inputOA"/>
				</td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">财务审核：</td>
			    <td nowrap class="td1"><fcc:wfdata name="niBanOption" wfnode="DX3" type="text" list="list[@type='wfdata']" domwfnode="CostClaim/activityDefID" size="40" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></td>
			    <td align="center" nowrap class="td1">部门签名：</td>
			    <td nowrap class="td1"><fcc:wfdata name="niBanOption" wfnode="DX2" type="text" list="list[@type='wfdata']" domwfnode="CostClaim/activityDefID" size="40" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">证明人：</td>
			    <td nowrap class="td1">
			    <fcc:wfInput property="CostClaim/Witnesses" wfnode="DX1" type="text" domwfnode="CostClaim/activityDefID" size="20" maxlength="50" classname="inputOA"/>
			    
			   
			    </td>
			    <td align="center" nowrap class="td1">领款人签收：</td>
			    <td nowrap class="td1"><fcc:wfdata name="niBanOption" wfnode="DX5" type="text" list="list[@type='wfdata']" domwfnode="CostClaim/activityDefID" size="40" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">开支资金渠道：</td>
			    <td nowrap class="td1">
			    <fcc:wfInput property="CostClaim/fundChannel" wfnode="DX1" type="text" domwfnode="CostClaim/activityDefID" size="20" maxlength="50" classname="inputOA"/>
			    </td>
			    <td align="center" nowrap class="td1">领导审批：</td>
			    <td nowrap class="td1"><fcc:wfdata name="niBanOption" wfnode="DX4" type="text" list="list[@type='wfdata']" domwfnode="CostClaim/activityDefID" size="40" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">原借款：</td>
			    <td nowrap class="td1">
			    <fcc:wfInput property="CostClaim/Borrowing" wfnode="DX1" type="text" domwfnode="CostClaim/activityDefID" attributestext='ValidateType="money" Msg="原借款格式不正确" '  size="20" maxlength="20"  classname="inputOA"/>
			    元 </td>
			    <td align="center" nowrap class="td1">应退余款：</td>
			    <td nowrap class="td1">
			    <fcc:wfInput property="CostClaim/Refund" wfnode="DX1" type="text" domwfnode="CostClaim/activityDefID" attributestext='ValidateType="money" Msg="应退余款格式不正确" '  size="20" maxlength="20"  classname="inputOA"/>
			  元</td>
		      </tr>
			  
			  <tr>
			    <td height="25" colspan="4" align="center" nowrap class="td1">
			    <table id="inTable" width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr class="td1">
                    <td width="70%" height="25" align="center"><strong>用途</strong></td>
                    <td width="30%" align="center"><strong>金额（元）</strong></td>
                  </tr>
                  <%
                  double count = 0;
                  int num = -1;
                   %>
                  <logic:iterate id="resultset" property="list[@type='CostClaimDetail']"> 
                	<%
                	num++;
                	Double Amount = talent.core.TalentFunctions.getDouble(base.util.TalentContext.getValue(pageContext,"resultset","CostClaimDetail/Amount"));
                	 if(Amount!=null)
                	 	count += Amount.doubleValue();
                	 %>
                	 <logic:equal property="WFWorkItem/activityDefID" value="DX1">
                	  <tr class="td1">
                    	<td height="25" align="center">
                    	<input type="hidden" name="listDetail/CostClaimDetail[@index='<%=num %>']/DetailID" value='<bean:write id="resultset" property="CostClaimDetail/DetailID"/>' />
                    	<input type="text" name="listDetail/CostClaimDetail[@index='<%=num %>']/Uses" class="inputOA"   size="80" maxlength="100"  value='<bean:write id="resultset" property="CostClaimDetail/Uses"/>' />
                    	</td>
                    	<td align="center"><input type="text" name="listDetail/CostClaimDetail[@index='<%=num %>']/Amount" class="inputOA" ValidateType="money" Msg="金额格式不正确"   size="20" maxlength="20"  onchange="javascript:makeCount();" value="<%=Amount %>"/></td>
                  		</tr>
                	 </logic:equal>
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
                  <tr class="td1">
                    <td height="25" >&nbsp;
                    <bean:write id="resultset" property="CostClaimDetail/Uses"/></td>
                    <td align="center"><%=Amount %></td>
                  </tr>
                  </logic:notEqual>
                  </logic:iterate>
              </table>
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                 
                  <tr class="td1">
                    <td width="70%" height="25" align="center">合计: 
                    <logic:equal property="WFWorkItem/activityDefID" value="DX1">
                    <input name="addLie" type="button" class="button_02" value="增加一行"  onclick="addOneTR()">
                    </logic:equal>
                    </td>
                    <td width="30%" align="center">
                    <logic:equal property="WFWorkItem/activityDefID" value="DX1">
                    <input type="text" name="countCost" class="inputOA"  size="20" maxlength="20"  value="<%=count %>"/>
                    </logic:equal>
                    <logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
                    <%=count %>
                    </logic:notEqual>
                    </td>
                  </tr>
                </table></td>
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
		  	<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> style="display: none;" >
		  	<%}else{ 
		  	%>
		  	<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> ><bean:write id="resultset" property="Activity/actDefName"/>&nbsp;
		  	<%} %>
			<%
				i++;
			%>
		  </logic:iterate>
          </td>
        </tr>
         <logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
		<tr> 
          <td width="19%" align="right" nowrap class="td2">下环节人员选择：</td>
          <td class="td1">
		  <!--<html:text property="CostClaim/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="CostClaim/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','CostClaim/nextParticipantName','CostClaim/nextParticipantId')">-->
		  <%if(display){ %>
		  <html:text property="CostClaim/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="CostClaim/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','CostClaim/nextParticipantName','CostClaim/nextParticipantId')">
		  <%}else{ %>
		  <html:text property="CostClaim/nextParticipantName" attributesText='style="display:none;width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="CostClaim/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" style="display:none;" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','CostClaim/nextParticipantName','CostClaim/nextParticipantId')">
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
				   <logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
				  <input name="wfsend" type="button" class="button_02" value="发 送" onClick="send()">
				  </logic:notEqual>
				  <%
				  	String act = base.util.TalentContext.getValue(pageContext,null,"WFWorkItem/activityDefID");
				  	if ("DX2,DX3".indexOf(act)>=0){
				  %>
				  <input name="wfreturn" type="button" class="button_02" value=" 驳 回 " onClick="returnNode()">
				  <%} %>		
				  <logic:equal property="WFWorkItem/activityDefID" value="DX5">
				  <input name="wfsend" type="button" class="button_02" value="结束流程" onClick="send()">
				  </logic:equal>
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
		document.getElementById('CostClaim/nextParticipantName').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		document.getElementById('CostClaim/nextParticipantId').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		send();
	}
}
<% } %>
function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
			if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["CostClaim/nextParticipantId"].value == ""){
					alert("请选择下环节人员");
					return;
				}
			}
			getWFData(frm);
			frm.submit();	
		}
}

var count = <%=num%>;

function makeCount(){
	var frm = document.forms[0];
	var value = 0 ;
	for(i=0;i<=count; i++){
		var objName = "listDetail/CostClaimDetail[@index='"+i+"']/Amount";
		if(frm.elements[objName]){
			var temp = frm.elements[objName].value;
			if(temp!="" && isNaN(temp)){
				alert("金额必须为数字型");
				return;
			}
			value += Number(temp) ;
		}
	}
	frm.elements["countCost"].value = value ;
}

function addOneTR(){
	count ++ ;
	R=inTable.insertRow()
	 R.className="td1"
   C=R.insertCell()
   C.height = 25 
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/CostClaimDetail[@index='"+count+"']/Uses\" class='inputOA' size=80 maxlength=100  />";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/CostClaimDetail[@index='"+count+"']/Amount\" class='inputOA' size=20 maxlength=20 ValidateType='money' Msg='金额格式不正确'  onchange='javascript:makeCount();' />";
   
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
</script>