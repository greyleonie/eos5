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
<form method="post" name="myform" action="oa.prFinance.checkRequestAddDo.do" enctype="multipart/form-data">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;财务管理—&gt;领用支票审批—&gt;新增领用支票</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="CheckRequest/_order/col1/field"/>
		<html:hidden property="CheckRequest/_order/col1/asc" />
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
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">领取支票审批单</td>
				</tr>
			</table>
			<!------------------------------  表单意见  ----------------------------->
			<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">领用部门：</td>
				<td width="24%" colspan="2" nowrap class="td1"> <bean:write property="SessionEntity/orgName" /></td>
				<td width="10%" align="center" nowrap class="td1">日期： </td>
				<td width="23%" nowrap class="td1"> <html:text name="CheckRequest/ConsumDate[@pattern='yyyy-MM-dd']"   attributesText='class="inputOA" readonly="true"' onclick="calendar(this,'yyyy-MM-dd')" property="currentDate" size="20" /></td>
				<td width="10%" align="center" nowrap class="td1">编号：</td>
				<td width="23%" nowrap class="td1"><html:text property="CheckRequest/Number" attributesText='class="input" '  size="20" maxlength="20" readonly="true" /> </td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">领用人：</td>
			    <td colspan="2" nowrap class="td1"><bean:write property="SessionEntity/userName" /></td>
			    <td align="center" nowrap class="td1">预支金额：</td>
			    <td nowrap class="td1"><html:text property="CheckRequest/Advance" attributesText='class="inputOA" ValidateType="notempty,money" Msg="预支金额不能为空;预支金额格式不正确" '  size="20" maxlength="20" /> 元 <span class="text_red">*</span></td>
			    <td align="center" nowrap class="td1">开支资金渠道：</td>
			    <td nowrap class="td1"><html:text property="CheckRequest/Channel" attributesText='class="inputOA" ValidateType="notempty" Msg="开支资金渠道不能为空"'  size="20" maxlength="50" /> <span class="text_red">*</span></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">支票归属行：</td>
			    <td colspan="2" nowrap class="td1"><html:text property="CheckRequest/BankOwnership" attributesText='class="input" '  size="20" maxlength="20" readonly="true" /></td>
			    <td align="center" nowrap class="td1">支票号码：</td>
			    <td nowrap class="td1"><html:text property="CheckRequest/CheckNO" attributesText='class="input" '  size="20" maxlength="20" readonly="true" /></td>
			    <td align="center" nowrap class="td1">限额：</td>
			    <td nowrap class="td1"><html:text property="CheckRequest/Limit" attributesText='class="input" '  size="20" maxlength="20" readonly="true" />元</td>
		      </tr>
			  
			  <tr> 
				<td height="25" align="center" nowrap class="td1">用途：</td>
				<td colspan="6" nowrap class="td1"><html:text property="CheckRequest/Uses" attributesText='class="inputOA" ValidateType="notempty" Msg="用途不能为空"'  size="80" maxlength="100"  /> <span class="text_red">*</span></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">收款单位：</td>
			    <td colspan="6" nowrap class="td1"><html:text property="CheckRequest/ReceiveOrg" attributesText='class="inputOA" '  size="80" maxlength="100"  /></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="7" align="left" nowrap class="td1">
			<div class="divwf1">【领用部门领导签批】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX2" type="textarea" list="list[@type='wfdata']" domwfnode="CheckRequest/activityDefID" cols="80" rows="5" classname="inputOA"/></div>				</td>
		      </tr>
			  <tr>
			    <td height="25" colspan="7" nowrap class="td1"><div class="divwf1">【财务部门审核】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX2" type="textarea" list="list[@type='wfdata']" domwfnode="CheckRequest/activityDefID" cols="80" rows="5" classname="inputOA"/></div></td>
		      </tr>
			</table>
				  
		  
		 
		   
      
		
			
			<!------------------------------  流转  ----------------------------->
		   
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
        <tr> 
          <td width="19%" align="right" nowrap colspan="2" bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20" scrolling="auto" ></iframe>	
		  </td>
          
        </tr>
		<tr> 
          <td width="19%" align="right" nowrap class="td2">下环节流转选择：</td>
          <td width="81%" class="td1">
		  <%
		  	int i = 0;
		  %>
		  <logic:iterate id="resultset" property="list[@type='nextnodes']">
		  	<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> ><bean:write id="resultset" property="Activity/actDefName"/>&nbsp;
			<%
				i++;
			%>
		  </logic:iterate>
          </td>
        </tr>
		<tr> 
          <td width="19%" align="right" nowrap class="td2">下环节人员选择：</td>
          <td class="td1">
		  <html:text property="CheckRequest/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="CheckRequest/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','CheckRequest/nextParticipantName','CheckRequest/nextParticipantId')">
		  </td>
        </tr>
        
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
				  <input name="wfsend" type="button" class="button_02" value="发 送" onClick="send()">
				  <input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
				</tr>
     </table>
</form>
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

function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
			if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["CheckRequest/nextParticipantId"].value == ""){
					alert("请选择下环节人员");
					return;
				}
			}
			getWFData(frm);
			frm.submit();	
		}
}
</script>