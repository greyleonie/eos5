<%@include file="/internet/common.jsp"%>


<script>
var i=1 
 function insertFile(){
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
	    C1.innerHTML = "<input  type='file' name='file' class='input' size='30'>&nbsp;<input class='button_02' type='button' value='ɾ ��' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'>";
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
            <td class="text_wirte">�칫ϵͳ��&gt;�������&gt;���ñ�����&gt;�������ñ���</td>
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
			<!------------------------------  ��ͷ  ----------------------------->
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">���ñ�����</td>
				</tr>
			</table>
			<!------------------------------  �����  ----------------------------->
			<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">�������ţ�</td>
				<td width="24%" nowrap class="td1"> <bean:write property="SessionEntity/orgName" /></td>
				<td width="10%" align="center" nowrap class="td1">���ڣ�</td>
				<td width="23%" nowrap class="td1"><html:text name="CostClaim/ClaimDate[@pattern='yyyy-MM-dd']"   attributesText='class="inputOA" readonly="true"' onclick="calendar(this,'yyyy-MM-dd')" property="currentDate" size="20" /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">������ˣ�</td>
			    <td nowrap class="td1">&nbsp;</td>
			    <td align="center" nowrap class="td1">����ǩ����</td>
			    <td nowrap class="td1">&nbsp;</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">֤���ˣ�</td>
			    <td nowrap class="td1"><html:text property="CostClaim/Witnesses" attributesText='class="inputOA" '  size="20" maxlength="50" /></td>
			    <td align="center" nowrap class="td1">�����ǩ�գ�</td>
			    <td nowrap class="td1">&nbsp;</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">��֧�ʽ�������</td>
			    <td nowrap class="td1"><html:text property="CostClaim/fundChannel" attributesText='class="inputOA" '  size="20" maxlength="50" /></td>
			    <td align="center" nowrap class="td1">�쵼������</td>
			    <td nowrap class="td1">&nbsp;</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">ԭ��</td>
			    <td nowrap class="td1"><html:text property="CostClaim/Borrowing" attributesText='class="inputOA" ValidateType="notempty,money" Msg="ԭ����Ϊ��;ԭ����ʽ����ȷ" '  size="20" maxlength="20" /> Ԫ  <span class="text_red">*</span></td>
			    <td align="center" nowrap class="td1">Ӧ����</td>
			    <td nowrap class="td1"><html:text property="CostClaim/Refund" attributesText='class="inputOA" ValidateType="notempty,money" Msg="Ӧ������Ϊ��;Ӧ������ʽ����ȷ" '  size="20" maxlength="20" /> Ԫ  <span class="text_red">*</span></td>
		      </tr>
			  
			  <tr>
			    <td height="25" colspan="4" align="center" nowrap class="td1">
			    <table id="inTable" width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr class="td1">
                    <td width="70%" height="25" align="center"><strong>��;</strong></td>
                    <td width="30%" align="center"><strong>��Ԫ��</strong></td>
                  </tr>
                  <tr class="td1">
                    <td height="25" align="center"><html:text property="listDetail/CostClaimDetail[@index='0']/Uses" attributesText='class="inputOA" '  size="80" maxlength="100"  /></td>
                    <td align="center"><html:text property="listDetail/CostClaimDetail[@index='0']/Amount" attributesText='class="inputOA" ValidateType="money" Msg="����ʽ����ȷ" '  size="20" maxlength="20"  onchange="javascript:makeCount();"/></td>
                  </tr>
                  <tr class="td1">
                    <td height="25" align="center"><html:text property="listDetail/CostClaimDetail[@index='1']/Uses" attributesText='class="inputOA" '  size="80" maxlength="100"  /></td>
                    <td align="center"><html:text property="listDetail/CostClaimDetail[@index='1']/Amount" attributesText='class="inputOA" ValidateType="money" Msg="����ʽ����ȷ" '  size="20" maxlength="20"  onchange="javascript:makeCount()"/></td>
                  </tr>
                  <tr class="td1">
                    <td height="25" align="center"><html:text property="listDetail/CostClaimDetail[@index='2']/Uses" attributesText='class="inputOA" '  size="80" maxlength="100"  /></td>
                    <td align="center"><html:text property="listDetail/CostClaimDetail[@index='2']/Amount" attributesText='class="inputOA" ValidateType="money" Msg="����ʽ����ȷ" '  size="20" maxlength="20"  onchange="javascript:makeCount();"/></td>
                  </tr>
                 <tr class="td1">
                    <td height="25" align="center"><html:text property="listDetail/CostClaimDetail[@index='3']/Uses" attributesText='class="inputOA" '  size="80" maxlength="100"  /></td>
                    <td align="center"><html:text property="listDetail/CostClaimDetail[@index='3']/Amount" attributesText='class="inputOA" ValidateType="money" Msg="����ʽ����ȷ" '  size="20" maxlength="20"  onchange="javascript:makeCount();"/></td>
                  </tr>
              </table>
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                 
                  <tr class="td1">
                    <td width="70%" height="25" align="center">�ϼ�: &nbsp;&nbsp;&nbsp;<input name="addLie" type="button" class="button_02" value="����һ��"  onclick="addOneTR()"></td>
                    <td width="30%" align="center"><html:text property="countCost" attributesText='class="inputOA" '  size="20" maxlength="20"  /></td>
                  </tr>
                </table></td>
		      </tr>
			</table>
				  
		  
		 
		   
      
		
			
			<!------------------------------  ��ת  ----------------------------->
		   
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
        <tr> 
          <td width="19%" align="right" nowrap colspan="2" bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight +20" scrolling="auto"></iframe>	
		  </td>
          
        </tr>
		<tr> 
          <td width="19%" align="right" nowrap class="td2">�»�����תѡ��</td>
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
          <td width="19%" align="right" nowrap class="td2">�»�����Աѡ��</td>
          <td class="td1">
		  <html:text property="CostClaim/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="CostClaim/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="ѡ ��" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','CostClaim/nextParticipantName','CostClaim/nextParticipantId')">
		 
		 
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
				  <input name="wfsend" type="button" class="button_02" value="�� ��" onClick="send()">
				  <input name="wfsave" type="button" class="button_02" value="�� ��" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
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
					alert("��ѡ���»�����Ա");
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
				alert("������Ϊ������");
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
   C.innerHTML="<input type='text' name=\"listDetail/CostClaimDetail[@index='"+count+"']/Amount\" class='inputOA' size=20 maxlength=20 ValidateType='money' Msg='����ʽ����ȷ' onchange='javascript:makeCount();' />";
   
}
</script>