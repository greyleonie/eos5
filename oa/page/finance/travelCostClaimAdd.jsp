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
<form method="post" name="myform" action="oa.prFinance.travelCostClaimAddDo.do" enctype="multipart/form-data">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;�������&gt;���÷ѱ�����&gt;�������÷ѱ���</td>
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
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">���÷ѱ�����</td>
				</tr>
			</table>
			<!------------------------------  �����  ----------------------------->
			<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="10%" height="25" align="center" nowrap class="td1">�� ����</td>
				<td width="24%" nowrap class="td1"> <bean:write property="SessionEntity/userName" /></td>
				<td width="10%" align="center" nowrap class="td1">ְ ��</td>
				<td width="23%" nowrap class="td1"><html:text property="TravelCostClaim/Post" attributesText='class="inputOA" '  size="20" maxlength="50" /></td>
			  </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�������ɣ�</td>
			    <td colspan="3" nowrap class="td1"><html:text property="TravelCostClaim/TravelCase" attributesText='class="inputOA" '  size="60" maxlength="200" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�������ţ�</td>
			    <td nowrap class="td1"><bean:write property="SessionEntity/orgName" /></td>
			    <td align="center" nowrap class="td1">����ڣ�</td>
			    <td nowrap class="td1"><html:text name="TravelCostClaim/ClaimDate[@pattern='yyyy-MM-dd']"   attributesText='class="inputOA" readonly="true"' onclick="calendar(this,'yyyy-MM-dd')" property="currentDate" size="20" /></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="4" nowrap class="td1">&nbsp;&nbsp;&nbsp;&nbsp;������ֹ������
			    <html:text property="TravelCostClaim/StartDate[@pattern='yyyy-MM-dd']"   attributesText='class="inputOA" readonly="true"' onclick="calendar(this,'yyyy-MM-dd')"  size="12"  />
			    ����
			    <html:text property="TravelCostClaim/EndDate[@pattern='yyyy-MM-dd']"   attributesText='class="inputOA" readonly="true"' onclick="calendar(this,'yyyy-MM-dd')"  size="12" />
			    ֹ��
			    <html:text property="TravelCostClaim/TravelDays" attributesText='class="inputOA" ValidateType="int" Msg="��������Ϊ������ʽ"  '  size="6" maxlength="10" /> ��</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����ݣ�</td>
			    <td colspan="3" nowrap class="td1"><html:text property="TravelCostClaim/Documents" attributesText='class="inputOA" ValidateType="int" Msg="��������Ϊ������ʽ"  '  size="6" maxlength="10" /> ��</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����쵼������</td>
			    <td nowrap class="td1"></td>
			    <td align="center" nowrap class="td1">֤���ˣ�</td>
			    <td nowrap class="td1"><html:text property="TravelCostClaim/Witnesses" attributesText='class="inputOA" '  size="20" maxlength="50" /></td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">������������</td>
			    <td nowrap class="td1"></td>
			    <td align="center" nowrap class="td1">У�쵼������</td>
			    <td nowrap class="td1">&nbsp;</td>
		      </tr>
			  <tr>
			    <td height="25" align="center" nowrap class="td1">�����ǩ�գ�</td>
			    <td colspan="3" nowrap class="td1">&nbsp;</td>
		      </tr>
			  
			  <tr>
			    <td height="25" colspan="4" align="center" nowrap class="td1">
			    <table id="inTable" width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr class="td1">
                    <td width="10%" height="25" align="center">����</td>
                    <td width="10%" align="center">�����ص�</td>
                    <td width="10%" align="center">����</td>
                    <td width="10%" align="center">��Ʊ��</td>
                    <td width="10%" align="center">������</td>
                    <td width="10%" align="center">���ڽ�ͨ��</td>
                    <td width="10%" align="center">ס�޷�</td>
                    <td width="10%" align="center">�����</td>
                    <td width="10%" align="center">����</td>
                    <td width="10%" align="center">С��</td>
                  </tr>
                  <tr class="td1">
                    <td height="25" align="center">
                    	<html:text property="listDetail/TravelClaimDetail[@index='0']/travelDate[@pattern='yyyy-MM-dd']" attributesText='class="inputOA" '  size="11" readonly="true" onclick="calendar(this,'yyyy-MM-dd')"   />
                    </td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='0']/locations" attributesText='class="inputOA"  '  size="10" maxlength="50"  /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='0']/travelDays" attributesText='class="inputOA" ValidateType="int" Msg="��������Ϊ������ʽ" '  size="10" maxlength="10"  /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='0']/Airfares" attributesText='class="inputOA" ValidateType="money" Msg="��Ʊ�Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(0)" /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='0']/Travelcosts" attributesText='class="inputOA" ValidateType="money" Msg="�����Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(0)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='0']/Transport" attributesText='class="inputOA" ValidateType="money" Msg="���ڽ�ͨ�Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(0)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='0']/Accommodation" attributesText='class="inputOA" ValidateType="money" Msg="ס�޷Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(0)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='0']/Subsidy" attributesText='class="inputOA" ValidateType="money" Msg="�������ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(0)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='0']/Other" attributesText='class="inputOA" ValidateType="money" Msg="������ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(0)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='0']/Subtotal" attributesText='class="inputOA" ValidateType="money" Msg="С�Ƹ�ʽ����ȷ" '  size="10" maxlength="10"  onchange="javascript:makeCount();"/></td>
                  </tr>
                  <tr class="td1">
                    <td height="25" align="center">
                    	<html:text property="listDetail/TravelClaimDetail[@index='1']/travelDate[@pattern='yyyy-MM-dd']" attributesText='class="inputOA" '  size="11" readonly="true" onclick="calendar(this,'yyyy-MM-dd')"   />
                    </td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='1']/locations" attributesText='class="inputOA"  '  size="10" maxlength="50"  /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='1']/travelDays" attributesText='class="inputOA" ValidateType="int" Msg="��������Ϊ������ʽ" '  size="10" maxlength="10"  /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='1']/Airfares" attributesText='class="inputOA" ValidateType="money" Msg="��Ʊ�Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(1)" /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='1']/Travelcosts" attributesText='class="inputOA" ValidateType="money" Msg="�����Ѹ�ʽ����ȷ" '  size="10" maxlength="10" onkeyup="countDetail(1)" /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='1']/Transport" attributesText='class="inputOA" ValidateType="money" Msg="���ڽ�ͨ�Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(1)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='1']/Accommodation" attributesText='class="inputOA" ValidateType="money" Msg="ס�޷Ѹ�ʽ����ȷ" '  size="10" maxlength="10" onkeyup="countDetail(1)" /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='1']/Subsidy" attributesText='class="inputOA" ValidateType="money" Msg="�������ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(1)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='1']/Other" attributesText='class="inputOA" ValidateType="money" Msg="������ʽ����ȷ" '  size="10" maxlength="10" onkeyup="countDetail(1)" /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='1']/Subtotal" attributesText='class="inputOA" ValidateType="money" Msg="С�Ƹ�ʽ����ȷ" '  size="10" maxlength="10"  onchange="javascript:makeCount();"/></td>
                  </tr>
                  <tr class="td1">
                    <td height="25" align="center">
                    	<html:text property="listDetail/TravelClaimDetail[@index='2']/travelDate[@pattern='yyyy-MM-dd']" attributesText='class="inputOA" '  size="11" readonly="true" onclick="calendar(this,'yyyy-MM-dd')"   />
                    </td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='2']/locations" attributesText='class="inputOA"  '  size="10" maxlength="50"  /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='2']/travelDays" attributesText='class="inputOA" ValidateType="int" Msg="��������Ϊ������ʽ" '  size="10" maxlength="10"  onkeyup="countDetail(2)" /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='2']/Airfares" attributesText='class="inputOA" ValidateType="money" Msg="��Ʊ�Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(2)" /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='2']/Travelcosts" attributesText='class="inputOA" ValidateType="money" Msg="�����Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(2)" /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='2']/Transport" attributesText='class="inputOA" ValidateType="money" Msg="���ڽ�ͨ�Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(2)" /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='2']/Accommodation" attributesText='class="inputOA" ValidateType="money" Msg="ס�޷Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(2)" /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='2']/Subsidy" attributesText='class="inputOA" ValidateType="money" Msg="�������ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(2)" /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='2']/Other" attributesText='class="inputOA" ValidateType="money" Msg="������ʽ����ȷ" '  size="10" maxlength="10" onkeyup="countDetail(2)"  /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='2']/Subtotal" attributesText='class="inputOA" ValidateType="money" Msg="С�Ƹ�ʽ����ȷ" '  size="10" maxlength="10"  onchange="javascript:makeCount();"/></td>
                  </tr>
                  <tr class="td1">
                    <td height="25" align="center">
                    	<html:text property="listDetail/TravelClaimDetail[@index='3']/travelDate[@pattern='yyyy-MM-dd']" attributesText='class="inputOA" '  size="11" readonly="true" onclick="calendar(this,'yyyy-MM-dd')"   />
                    </td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='3']/locations" attributesText='class="inputOA"  '  size="10" maxlength="50"  /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='3']/travelDays" attributesText='class="inputOA" ValidateType="int" Msg="��������Ϊ������ʽ" '  size="10" maxlength="10"  /></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='3']/Airfares" attributesText='class="inputOA" ValidateType="money" Msg="��Ʊ�Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(3)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='3']/Travelcosts" attributesText='class="inputOA" ValidateType="money" Msg="�����Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(3)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='3']/Transport" attributesText='class="inputOA" ValidateType="money" Msg="���ڽ�ͨ�Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(3)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='3']/Accommodation" attributesText='class="inputOA" ValidateType="money" Msg="ס�޷Ѹ�ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(3)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='3']/Subsidy" attributesText='class="inputOA" ValidateType="money" Msg="�������ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(3)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='3']/Other" attributesText='class="inputOA" ValidateType="money" Msg="������ʽ����ȷ" '  size="10" maxlength="10"  onkeyup="countDetail(3)"/></td>
                    <td align="center"><html:text property="listDetail/TravelClaimDetail[@index='3']/Subtotal" attributesText='class="inputOA" ValidateType="money" Msg="С�Ƹ�ʽ����ȷ" '  size="10" maxlength="10"  onchange="javascript:makeCount();"/></td>
                  </tr>
              </table>
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                 
                  <tr class="td1">
                    <td width="90%" height="25" align="center">�ϼ�: &nbsp;&nbsp;&nbsp;<input name="addLie" type="button" class="button_02" value="����һ��"  onclick="addOneTR()"></td>
                    <td width="10%" align="center"><html:text property="countCost" attributesText='class="inputOA" '  size="10" maxlength="10"  /></td>
                  </tr>
                </table></td>
		      </tr>
			</table>
				  
		  
		 
		   
      
		
			
			<!------------------------------  ��ת  ----------------------------->
		   
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
        <tr> 
          <td width="19%" align="right" nowrap colspan="2" bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20" scrolling="auto"></iframe>	
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
		  <html:text property="TravelCostClaim/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="TravelCostClaim/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="ѡ ��" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','TravelCostClaim/nextParticipantName','TravelCostClaim/nextParticipantId')">
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
				if(frm.elements["TravelCostClaim/nextParticipantId"].value == ""){
					alert("��ѡ���»�����Ա");
					return;
				}
			}
			getWFData(frm);
			frm.submit();	
		}
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
			
			alert("����������");
			frm[fieldName].value="";
			return;
		}
		value += Number(fieldValue) ;
	}
	frm.elements["listDetail/TravelClaimDetail[@index='"+index+"']/Subtotal"].value = value ;
	makeCount();
}


var count = 4;

function makeCount(){
	var frm = document.forms[0];
	var value = 0 ;
	for(i=0;i<=count; i++){
		var objName = "listDetail/TravelClaimDetail[@index='"+i+"']/Subtotal";
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
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/travelDate[@pattern='yyyy-MM-dd']\" class='inputOA'   size=11 readonly onclick=\"calendar(this,'yyyy-MM-dd')\"   />";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/locations\" class='inputOA' size=10 maxlength=50  />";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/travelDays\" class='inputOA' size=10 maxlength=10  ValidateType='int' Msg='��������Ϊ������ʽ' />";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Airfares\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='��Ʊ�Ѹ�ʽ����ȷ'  onkeyup='countDetail(count)' />";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Travelcosts\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='�����Ѹ�ʽ����ȷ' onkeyup='countDetail(count)'/>";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Transport\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='���ڽ�ͨ�Ѹ�ʽ����ȷ' onkeyup='countDetail(count)' />";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Accommodation\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='ס�޷Ѹ�ʽ����ȷ' onkeyup='countDetail(count)' />";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Subsidy\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='�������ʽ����ȷ' onkeyup='countDetail(count)'  />";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Other\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='������ʽ����ȷ' onkeyup='countDetail(count)' />";
   C=R.insertCell()
   C.align = "center"
   C.innerHTML="<input type='text' name=\"listDetail/TravelClaimDetail[@index='"+count+"']/Subtotal\" class='inputOA' size=10 maxlength=10  ValidateType='money' Msg='С�Ƹ�ʽ����ȷ'  onchange='javascript:makeCount();'/>";
   
}


function getDateDiff(){
		var frm = document.forms[0];
        var one_day=1000*60*60*24; 
        var t1= frm["TravelCostClaim/StartDate[@pattern='yyyy-MM-dd']"].value;
        var t1= frm["TravelCostClaim/EndDate[@pattern='yyyy-MM-dd']"].value;
        alert(t1);
        if(t1!="" && t2 != ""){
        var x=t1.split("-");     
        var y=t2.split("-");
        var date1=new Date(x[2],(x[1]-1),x[0]);
        var date2=new Date(y[2],(y[1]-1),y[0]);
        var month1=x[1]-1;
        var month2=y[1]-1;          
        _Diff=Math.ceil((date2.getTime()-date1.getTime())/(one_day));  
        frm["TravelCostClaim/TravelDays"].value = _Diff;
 		}
}
</script>