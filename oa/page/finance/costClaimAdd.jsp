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
<form method="post" name="myform" action="oa.prFinance.costClaimAddDo.do" enctype="multipart/form-data">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;财务管理—&gt;费用报销—&gt;新增费用报销</td>
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
				<td width="24%" nowrap class="td1"> <bean:write property="SessionEntity/orgName" /></td>
				<td width="10%" align="center" nowrap class="td1">日期：</td>
				<td width="23%" nowrap class="td1"><html:text name="CostClaim/ClaimDate[@pattern='yyyy-MM-dd']"   attributesText='class="inputOA" readonly="true"' onclick="calendar(this,'yyyy-MM-dd')" property="currentDate" size="20" /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">财务审核：</td>
			    <td nowrap class="td1">&nbsp;</td>
			    <td align="center" nowrap class="td1">部门签名：</td>
			    <td nowrap class="td1">&nbsp;</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">证明人：</td>
			    <td nowrap class="td1"><html:text property="CostClaim/Witnesses" attributesText='class="inputOA" '  size="20" maxlength="50" /></td>
			    <td align="center" nowrap class="td1">领款人签收：</td>
			    <td nowrap class="td1">&nbsp;</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">开支资金渠道：</td>
			    <td nowrap class="td1"><html:text property="CostClaim/fundChannel" attributesText='class="inputOA" '  size="20" maxlength="50" /></td>
			    <td align="center" nowrap class="td1">领导审批：</td>
			    <td nowrap class="td1">&nbsp;</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">原借款：</td>
			    <td nowrap class="td1"><html:text property="CostClaim/Borrowing" attributesText='class="inputOA" ValidateType="notempty,money" Msg="原借款不能为空;原借款格式不正确" '  size="20" maxlength="20" /> 元  <span class="text_red">*</span></td>
			    <td align="center" nowrap class="td1">应退余款：</td>
			    <td nowrap class="td1"><html:text property="CostClaim/Refund" attributesText='class="inputOA" ValidateType="notempty,money" Msg="应退余款不能为空;应退余款格式不正确" '  size="20" maxlength="20" /> 元  <span class="text_red">*</span></td>
		      </tr>
			  
			  <tr>
			    <td height="25" colspan="4" align="center" nowrap class="td1">
			    <table id="inTable" width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr class="td1">
                    <td width="70%" height="25" align="center"><strong>用途</strong></td>
                    <td width="30%" align="center"><strong>金额（元）</strong></td>
                  </tr>
                  <tr class="td1">
                    <td height="25" align="center"><html:text property="listDetail/CostClaimDetail[@index='0']/Uses" attributesText='class="inputOA" '  size="80" maxlength="100"  /></td>
                    <td align="center"><html:text property="listDetail/CostClaimDetail[@index='0']/Amount" attributesText='class="inputOA" ValidateType="money" Msg="金额格式不正确" '  size="20" maxlength="20"  onchange="javascript:makeCount();"/></td>
                  </tr>
                  <tr class="td1">
                    <td height="25" align="center"><html:text property="listDetail/CostClaimDetail[@index='1']/Uses" attributesText='class="inputOA" '  size="80" maxlength="100"  /></td>
                    <td align="center"><html:text property="listDetail/CostClaimDetail[@index='1']/Amount" attributesText='class="inputOA" ValidateType="money" Msg="金额格式不正确" '  size="20" maxlength="20"  onchange="javascript:makeCount()"/></td>
                  </tr>
                  <tr class="td1">
                    <td height="25" align="center"><html:text property="listDetail/CostClaimDetail[@index='2']/Uses" attributesText='class="inputOA" '  size="80" maxlength="100"  /></td>
                    <td align="center"><html:text property="listDetail/CostClaimDetail[@index='2']/Amount" attributesText='class="inputOA" ValidateType="money" Msg="金额格式不正确" '  size="20" maxlength="20"  onchange="javascript:makeCount();"/></td>
                  </tr>
                 <tr class="td1">
                    <td height="25" align="center"><html:text property="listDetail/CostClaimDetail[@index='3']/Uses" attributesText='class="inputOA" '  size="80" maxlength="100"  /></td>
                    <td align="center"><html:text property="listDetail/CostClaimDetail[@index='3']/Amount" attributesText='class="inputOA" ValidateType="money" Msg="金额格式不正确" '  size="20" maxlength="20"  onchange="javascript:makeCount();"/></td>
                  </tr>
              </table>
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                 
                  <tr class="td1">
                    <td width="70%" height="25" align="center">合计: &nbsp;&nbsp;&nbsp;<input name="addLie" type="button" class="button_02" value="增加一行"  onclick="addOneTR()"></td>
                    <td width="30%" align="center"><html:text property="countCost" attributesText='class="inputOA" '  size="20" maxlength="20"  /></td>
                  </tr>
                </table></td>
		      </tr>
			</table>
				  
		  
		 
		   
      
		
			
			<!------------------------------  流转  ----------------------------->
		   
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
        <tr> 
          <td width="19%" align="right" nowrap colspan="2" bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight +20" scrolling="auto"></iframe>	
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
		  <html:text property="CostClaim/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="CostClaim/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','CostClaim/nextParticipantName','CostClaim/nextParticipantId')">
		 
		 
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

<script >
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
				if(frm.elements["CostClaim/nextParticipantId"].value == ""){
					alert("请选择下环节人员");
					return;
				}
			}
			getWFData(frm);
			frm.submit();	
		}
}
var count = 4;

function makeCount(){
	var frm = document.forms[0];
	var value = 0 ;
	for(i=0;i<count; i++){
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
   C.innerHTML="<input type='text' name=\"listDetail/CostClaimDetail[@index='"+count+"']/Amount\" class='inputOA' size=20 maxlength=20 ValidateType='money' Msg='金额格式不正确' onchange='javascript:makeCount();' />";
   
}
</script>