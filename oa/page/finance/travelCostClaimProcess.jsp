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
<form method="post" name="myform" action="oa.prFinance.travelCostClaimProcessDo.do" enctype="multipart/form-data">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;财务管理—&gt;差旅费报销—&gt;差旅费报销处理流程—&gt;
            <bean:write property="WFWorkItem/workItemName"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="TravelCostClaim/_order/col1/field"/>
		<html:hidden property="TravelCostClaim/_order/col1/asc" />
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
		<html:hidden property="TravelCostClaim/RequestID" />
		<html:hidden property="TravelCostClaim/participant" />
		<html:hidden property="TravelCostClaim/passParticipant" />
		
		
		
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
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">差旅费报销单</td>
				</tr>
			</table>
			<!------------------------------  表单意见  ----------------------------->
			<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">姓 名：</td>
				<td width="24%" nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/UserID" formatClass="username" formatType="operatorID" /></td>
				<td width="10%" align="center" nowrap class="td1">职 别：</td>
				<td width="23%" nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/Post" /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">出差理由：</td>
			    <td colspan="3" nowrap class="td1">&nbsp;<fcc:wfInput property="TravelCostClaim/TravelCase" wfnode="DX1" type="text" domwfnode="TravelCostClaim/activityDefID"  size="60" maxlength="200" classname="inputOA"/>
			    </td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">报销部门：</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="EOSORG_T_Organization/orgName" /></td>
			    <td align="center" nowrap class="td1">填报日期：</td>
			    <td nowrap class="td1">&nbsp;<fcc:wfInput property="TravelCostClaim/ClaimDate[@pattern='yyyy-MM-dd']" wfnode="DX1" type="text" domwfnode="TravelCostClaim/activityDefID" readonly="true" size="20" maxlength="20" classname="inputOA"  onclick="calendar(this,'yyyy-MM-dd')" />
			    </td>
		      </tr>
			  <tr>
			    <td height="25" colspan="4" nowrap class="td1">&nbsp;&nbsp;&nbsp;&nbsp;出差起止日期自
			    <fcc:wfInput property="TravelCostClaim/StartDate[@pattern='yyyy-MM-dd']" wfnode="DX1" type="text" domwfnode="TravelCostClaim/activityDefID" readonly="true" size="20" maxlength="20" classname="inputOA"  onclick="calendar(this,'yyyy-MM-dd')" />
			    起至
			    <fcc:wfInput property="TravelCostClaim/EndDate[@pattern='yyyy-MM-dd']" wfnode="DX1" type="text" domwfnode="TravelCostClaim/activityDefID" readonly="true" size="20" maxlength="20" classname="inputOA"  onclick="calendar(this,'yyyy-MM-dd')" />
			    止共
			    <fcc:wfInput property="TravelCostClaim/TravelDays" wfnode="DX1" type="text" domwfnode="TravelCostClaim/activityDefID"  attributestext='class="inputOA" ValidateType="int" Msg="天数必须为整数格式"  '  size="6" maxlength="10" />
			    天</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">附单据：</td>
			    <td colspan="3" nowrap class="td1">&nbsp;<fcc:wfInput property="TravelCostClaim/Documents" wfnode="DX1" type="text" domwfnode="TravelCostClaim/activityDefID"  attributestext='class="inputOA" ValidateType="int" Msg="张数必须为整数格式"  '  size="6" maxlength="10" />
			    张</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">部门领导审批：</td>
			    <td nowrap class="td1"><fcc:wfdata name="niBanOption" wfnode="DX2" type="text" list="list[@type='wfdata']" domwfnode="TravelCostClaim/activityDefID" size="40" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></td>
			    <td align="center" nowrap class="td1">证明人：</td>
			    <td nowrap class="td1">&nbsp;<bean:write property="TravelCostClaim/Witnesses"/></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">财务部门审批：</td>
			    <td nowrap class="td1"><fcc:wfdata name="niBanOption" wfnode="DX3" type="text" list="list[@type='wfdata']" domwfnode="TravelCostClaim/activityDefID" size="40" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></td>
			    <td align="center" nowrap class="td1">校领导审批：</td>
			    <td nowrap class="td1"><fcc:wfdata name="niBanOption" wfnode="DX4" type="text" list="list[@type='wfdata']" domwfnode="TravelCostClaim/activityDefID" size="40" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">领款人签收：  </td>
			    <td colspan="3" nowrap class="td1"><fcc:wfdata name="niBanOption" wfnode="DX5" type="text" list="list[@type='wfdata']" domwfnode="TravelCostClaim/activityDefID" size="40" classname="inputOA" onmousedown="menuControl('pubLemma',1)" onmouseout="menuControl('pubLemma',0)"/></td>
		      </tr>
			  
			  <tr>
			    <td height="25" colspan="4" align="center" nowrap class="td1">
			    <table id="inTable" width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr class="td1">
                    <td width="10%" height="25" align="center">日期</td>
                    <td width="10%" align="center">起讫地点</td>
                    <td width="10%" align="center">天数</td>
                    <td width="10%" align="center">机票费</td>
                    <td width="10%" align="center">车船费</td>
                    <td width="10%" align="center">市内交通费</td>
                    <td width="10%" align="center">住宿费</td>
                    <td width="10%" align="center">出差补助</td>
                    <td width="10%" align="center">其它</td>
                    <td width="10%" align="center">小计</td>
                  </tr>
                    <%
                  double count = 0;
                  int num = -1;
                   %>
                  <logic:iterate id="resultset" property="list[@type='TravelClaimDetail']"> 
                	<%
                	num++;
                	Double Subtotal = talent.core.TalentFunctions.getDouble(base.util.TalentContext.getValue(pageContext,"resultset","TravelClaimDetail/Subtotal"));
                	 if(Subtotal!=null)
                	 	count += Subtotal.doubleValue();
                	 %>
                	 <logic:equal property="WFWorkItem/activityDefID" value="DX1">
                	 <tr class="td1">
                    <td height="25" align="center">
                    <input type="hidden" name="listDetail/TravelClaimDetail[@index='<%=num %>']/DetailID" value='<bean:write id="resultset" property="TravelClaimDetail/DetailID"/>' />
                    	<input type="text" name="listDetail/TravelClaimDetail[@index='<%=num %>']/travelDate[@pattern='yyyy-MM-dd']" class="inputOA"   size="11" readonly="true" onclick="calendar(this,'yyyy-MM-dd')"  value='<bean:write id="resultset" property="TravelClaimDetail/travelDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>'/>
                    </td>
                    <td align="center"><input type="text" name="listDetail/TravelClaimDetail[@index='<%=num %>']/locations" class="inputOA"    size="10" maxlength="50" value='<bean:write id="resultset" property="TravelClaimDetail/locations"/>' /></td>
                    <td align="center"><input type="text" name="listDetail/TravelClaimDetail[@index='<%=num %>']/travelDays" class="inputOA" ValidateType="int" Msg="天数必须为整数格式"   size="10" maxlength="10"   value='<bean:write id="resultset" property="TravelClaimDetail/travelDays"/>' /></td>
                    <td align="center"><input type="text" name="listDetail/TravelClaimDetail[@index='<%=num %>']/Airfares" class="inputOA" ValidateType="money" Msg="机票费格式不正确"   size="10" maxlength="10"  value='<bean:write id="resultset" property="TravelClaimDetail/Airfares"/>'  onkeyup="countDetail(<%=num %>)"/></td>
                    <td align="center"><input type="text" name="listDetail/TravelClaimDetail[@index='<%=num %>']/Travelcosts" class="inputOA" ValidateType="money" Msg="车船费格式不正确"   size="10" maxlength="10"   value='<bean:write id="resultset" property="TravelClaimDetail/Travelcosts"/>' onkeyup="countDetail(<%=num %>)"/></td>
                    <td align="center"><input type="text" name="listDetail/TravelClaimDetail[@index='<%=num %>']/Transport" class="inputOA" ValidateType="money" Msg="市内交通费格式不正确"   size="10" maxlength="10"   value='<bean:write id="resultset" property="TravelClaimDetail/Transport"/>' onkeyup="countDetail(<%=num %>)"/></td>
                    <td align="center"><input type="text" name="listDetail/TravelClaimDetail[@index='<%=num %>']/Accommodation" class="inputOA" ValidateType="money" Msg="住宿费格式不正确"   size="10" maxlength="10"   value='<bean:write id="resultset" property="TravelClaimDetail/Accommodation"/>' onkeyup="countDetail(<%=num %>)"/></td>
                    <td align="center"><input type="text" name="listDetail/TravelClaimDetail[@index='<%=num %>']/Subsidy" class="inputOA" ValidateType="money" Msg="出差补助格式不正确"   size="10" maxlength="10"   value='<bean:write id="resultset" property="TravelClaimDetail/Subsidy"/>' onkeyup="countDetail(<%=num %>)"/></td>
                    <td align="center"><input type="text" name="listDetail/TravelClaimDetail[@index='<%=num %>']/Other" class="inputOA" ValidateType="money" Msg="其它格式不正确"   size="10" maxlength="10"   value='<bean:write id="resultset" property="TravelClaimDetail/Other"/>' onkeyup="countDetail(<%=num %>)"/></td>
                    <td align="center"><input type="text" name="listDetail/TravelClaimDetail[@index='<%=num %>']/Subtotal" class="inputOA" ValidateType="money" Msg="小计格式不正确"   size="10" maxlength="10"  onchange="javascript:makeCount();"  value='<bean:write id="resultset" property="TravelClaimDetail/Subtotal"/>' /></td>
                  </tr>
                   </logic:equal>
                   
				<logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
                  <tr class="td1">
                  <td height="25" align="center"><bean:write id="resultset" property="TravelClaimDetail/travelDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/locations"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/travelDays"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/Airfares"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/Travelcosts"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/Transport"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/Accommodation"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/Subsidy"/></td>
                    <td height="25"  align="center"><bean:write id="resultset" property="TravelClaimDetail/Other"/></td>
                    <td align="center"><%=Subtotal %></td>
                  </tr>
                   </logic:notEqual>
                  </logic:iterate>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">      
                  
             <tr class="td1">
                    <td width="90%" height="25" align="center"  >合计: 
                    <logic:equal property="WFWorkItem/activityDefID" value="DX1">
                    <input name="addLie" type="button" class="button_02" value="增加一行"  onclick="addOneTR()">
                    (若要删除一行去掉小计数到时提交/保存即可)
                    </logic:equal>
                    </td>
                    <td width="10%" align="center">
                    <logic:equal property="WFWorkItem/activityDefID" value="DX1">
                    <input type="text" name="countCost" class="inputOA"  size="10" maxlength="20"  value="<%=count %>"/>
                    </logic:equal>
                    <logic:notEqual property="WFWorkItem/activityDefID" value="DX1">
                    <%=count %>
                    </logic:notEqual>
                    </td>
                  </tr>
              </table>
			</table>
			</td>	  
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
		  <!--<html:text property="TravelCostClaim/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="TravelCostClaim/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','TravelCostClaim/nextParticipantName','TravelCostClaim/nextParticipantId')">-->
		  <%if(display){ %>
		  <html:text property="TravelCostClaim/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="TravelCostClaim/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','TravelCostClaim/nextParticipantName','TravelCostClaim/nextParticipantId')">
		  <%}else{ %>
		  <html:text property="TravelCostClaim/nextParticipantName" attributesText='style="display:none;width:80%;border:1 #efefef soild;" readonly="true"' />
		  <html:hidden property="TravelCostClaim/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" style="display:none;" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','TravelCostClaim/nextParticipantName','TravelCostClaim/nextParticipantId')">
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
		document.getElementById('TravelCostClaim/nextParticipantName').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		document.getElementById('TravelCostClaim/nextParticipantId').value='<bean:write property="ExtendData/PassedNode/UserID"/>';
		send();
	}
}
<% } %>
function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
			if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["TravelCostClaim/nextParticipantId"].value == ""){
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
		var objName = "listDetail/TravelClaimDetail[@index='"+i+"']/Subtotal";
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
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/travelDate[@pattern='yyyy-MM-dd']\" class='inputOA'   size=11 readonly onclick=\"calendar(this,'yyyy-MM-dd')\"   />";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/locations\" class='inputOA' size=10 maxlength=50  />";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/travelDays\" class='inputOA' size=10 maxlength=10  ValidateType='int' Msg='天数必须为整数格式' />";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Airfares\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='机票费格式不正确' onkeyup='countDetail("+count+")'/>";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Travelcosts\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='车船费格式不正确' onkeyup='countDetail("+count+")'/>";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Transport\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='市内交通费格式不正确' onkeyup='countDetail("+count+")'/>";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Accommodation\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='住宿费格式不正确' onkeyup='countDetail("+count+")'/>";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Subsidy\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='出差补助格式不正确' onkeyup='countDetail("+count+")'/>";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Other\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='其它格式不正确' onkeyup='countDetail("+count+")'/>";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Subtotal\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='小计格式不正确' onchange='makeCount()'/>";
   
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


function countDetail(index){
	var frm = document.forms[0];
	var value = 0 ;
	var nameArr = new Array();
	nameArr[0]="Airfares";
	nameArr[1]="Travelcosts";
	nameArr[2]="Transport";
	nameArr[3]="Accommodation";
	nameArr[4]="Subsidy";
	nameArr[5]="Other";
	for(var i = 0 ;i < nameArr.length; i++){
		var fieldName = "listDetail/TravelClaimDetail[@index='"+index+"']/"+nameArr[i];
		var fieldValue = frm[fieldName].value;
		if(fieldValue!="" && isNaN(fieldValue)){
			
			alert("请填入数字");
			frm[fieldName].value="";
			return;
		}
		value += Number(fieldValue) ;
	}
	frm.elements["listDetail/TravelClaimDetail[@index='"+index+"']/Subtotal"].value = value ;
	makeCount();
}
</script>