<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/internet/scripts/autoSelect.js" ></SCRIPT>
<script>
//�õ�������λSELECT
function createUnitOption(name){
var result = "";
	result += "<select name=\""+name+"\" style=\"width:100%\" >";
	<logic:iterate id="set"  property="list[type='Unit']" >
	result +=  "<option  value='<bean:write id="set" property="Unit/businID"/>'><bean:write id="set" property="Unit/businName"/></option>";
	</logic:iterate>
	result += "</select>";
	return result;

}

</script>

<body>
<form method="post" action="oa.prThingsManage.purchaseProcessDo.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;��Ʒ����&gt;��Ʒ�ɹ����봦�����̡�&gt;<bean:write property="WFWorkItem/workItemName"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="COMM_PURCHASE/_order/col1/field"/>
		<html:hidden  property="COMM_PURCHASE/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />

		<html:hidden property="WFWorkItem/submitType" />
		
		<html:hidden property="WFWorkItem/workItemID" />
		
		<html:hidden property="WFWorkItem/processInstID" />
		<html:hidden property="WFWorkItem/processDefID" />
		<html:hidden property="WFWorkItem/processDefName" />
		
		
		<html:hidden property="WFWorkItem/activityDefID" />
		<html:hidden property="WFWorkItem/activityInstID" />
		
		<html:hidden property="COMM_PURCHASE/PURCHASEID"/> 
		<html:hidden property="COMM_PURCHASE/participant" />
		<html:hidden property="COMM_PURCHASE/passParticipant" />
		
		
				<!--���ݸ�ѡ����Ʒ��Ĳ���-->
		<html:hidden property="detailName"/>
		<html:hidden property="index"/>
		<html:hidden property="goodIDs" />
		

		
	  </td>
    </tr>
  </table>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0" class="table">
      <tr>
      <td height="8"></td>
      </tr>
      
        <tr>
          <td>
          
<!------------------------------  ��ͷ  ----------------------------->
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">�����е�У��Ʒ�ɹ����뵥</td>
				</tr>
			</table>
<!------------------------------  �����  ----------------------------->
            <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                <tr> 
                  <td align="right" width="10%" class="td2">���뵥��ţ�</td>
                  <td width="10%" class="td1"><bean:write property="COMM_PURCHASEVIEW/PURCHASECODE"/>  </td>
                  <td width="10%" align="right" class="td2">�������ڣ�</td>
                  <td width="10%" class="td1"><bean:write  property="COMM_PURCHASEVIEW/PURCHASEDATE" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                   <td width="10%" align="right" class="td2">���벿�ţ�</td>
                  <td width="10%" class="td1" nowrap="nowrap"> <bean:write  property="COMM_PURCHASEVIEW/BRANCHNAME"/></td>
                  <td width="10%" align="right" class="td2">�� �� �ˣ�</td>
                  <td width="*" class="td1"><bean:write  property="COMM_PURCHASEVIEW/PROPOSERNAME"/> </td>
              </table>
			
                            <table width="96%"   border="0" align="center" cellpadding="0" cellspacing="1" id="buttonspace">
				            <tr>
				            
		
              <td align="right" height="30">
                &nbsp; </td>
            </tr>
			</table>
			                 <%
		             int count=0;
			         String trClass = ""; 
		  
		  		%>
              <logic:greaterThan property="rowNum2" value="0">
			<table width="96%"   border="0" align="center" cellpadding="0" cellspacing="1" id="buttonspace">
				            <tr>
				            
		     <td align="center" class="td1">
		     �ƻ��ɹ���Ʒ</td> 
            </tr>
			</table>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="listdetail">
                       <tr class="td_title">
                  <td width="25%" align="center">Ʒ��</td>
                  <td width="10%" align="center">���</td>
                  <td width="10%" align="center">���ۣ�Ԫ��</td>
                  <td width="10%" align="center">����</td>
                   <td width="10%" align="center">��λ</td>
                  <td width="15%" align="center">�ϼƽ�Ԫ��</td>
                  <td width="15%" align="center">��ע</td>
                  <td width="5%" align="center">����</td>
                </tr>
                   
                   
                 <logic:iterate id="detail" property="list[@type='COMM_PURCHASEDETAILVIEW']"> 
				<%count++; %>
				<html:hidden name="listOld/COMM_PURCHASEDETAIL/DETAILID" id="detail" property="COMM_PURCHASEDETAILVIEW/DETAILID" indexed="true"/>
               	<html:hidden name="listOld/COMM_PURCHASEDETAIL/CAPTID" id="detail" property="COMM_PURCHASEDETAILVIEW/COMMID" indexed="true"/>
				
                <tr class="td1" onClick="changeTRBgColor(this)" id="row_<%=count %>">  
                <td nowrap>
                <input type="text" name="listInsert/COMM_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/COMMNAME" value="<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/COMMNAME"/>"   id="goodName"  style="width:100%"  readonly="readonly"  class="inputOA"/>
                <input type="hidden" name="listInsert/COMM_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/COMMNID"  value="<bean:write id="resultset" property='COMM_SHORTAGEDETAILVIEW/COMMNID'/>"/></td>            
                <td nowrap>
                <input type="text" name="listInsert/COMM_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/SPECIA" value="<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/SPECIA"/>"  style="width:100%"  readonly="readonly"  class="inputOA"/>
                <td nowrap>
                <input type="text" name="listInsert/COMM_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/PRICE"  value="<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/PRICE"/>"   onkeyup="sumFee(<%=count%>)" style="width:100%"  readonly="readonly"  class="inputOA" /></td>
                <td nowrap>
                <input type="text" name="listInsert/COMM_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/QUANTITY"  value="<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/QUANTITY"/>" onkeyup="sumFee(<%=count%>)" style="width:100%"    class="inputOA"/></td>
                <td nowrap>
                <input type="text" name="listInsert/COMM_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/UNITNAME"  value="<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/UNITNAME"/>" style="width:100%"  readonly="readonly"  class="inputOA" /></td>
                
                <td nowrap>
                <input type="text" name="listInsert/COMM_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/AMOUNT"  value="<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/AMOUNT"/>" style="width:100%"  readonly="readonly"  class="inputOA"/></td>
                <td nowrap>
                <input type="text" name="listInsert/COMM_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/REMARK"  value="<bean:write id="detail" property="COMM_PURCHASEDETAILVIEW/REMARK"/>" style="width:100%"   class="inputOA"/></td>
                <td nowrap align="center"><img  onClick='removeRowFromTable(document.all["listdetail"], "row_<%=count %>")' src="/internet/image/delete1.gif" style="cursor: hand"></td>
              </tr>
				</logic:iterate>
              </table>
               <table width="96%" height="30"  border="0" align="center" cellpadding="0" cellspacing="1" id="space">
				<tr><td align="center">
				<input name="add" type="button" class="button_eight" value="������Ʒ������"  onClick="insertDetail()">
				</td></tr>
		</table>
              
              	
               </logic:greaterThan>
               
          	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="space">
							  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">�����Ÿ�����ǩ�������</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX2" type="textarea" list="list[@type='wfdata']" domwfnode="COMM_PURCHASE/activityDefID" cols="80" rows="5" classname="inputOA"/></div></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">������ǩ�������</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX3" type="textarea" list="list[@type='wfdata']" domwfnode="COMM_PURCHASE/activityDefID" cols="80" rows="5" classname="inputOA"/></div></td>
		      </tr>
		      <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">��У�쵼ǩ�������</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX4" type="textarea" list="list[@type='wfdata']" domwfnode="COMM_PURCHASE/activityDefID" cols="80" rows="5" classname="inputOA"/></div></td>
		      </tr>
		</table>
<!------------------------------  ��ת  ----------------------------->
		   
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
        <tr> 
          <td width="100%" align="left" nowrap colspan="2" bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0"  name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20" scrolling="auto"></iframe>	
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
		  <html:text property="COMM_PURCHASE/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="COMM_PURCHASE/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="ѡ ��" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','COMM_PURCHASE/nextParticipantName','COMM_PURCHASE/nextParticipantId')">
		  </td>
        </tr>
      </table>
<!------------------------------  ��β  ----------------------------->			
	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="spacedown">
				<tr><td></td></tr>
		</table>

 </td></tr>
</table>

	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				  <input name="wfsend" type="button" class="button_02" value="�� ��" onClick="send()">
				  <input name="wfsave" type="button" class="button_02" value="�� ��" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="�� ��" onClick="goBack()"></td>
				</tr>
     </table>
</form>
</body>
<script>
	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>
<script language="JavaScript" type="text/javascript">
  var listName = "listInsert/COMM_PURCHASEDETAIL[@hciTagIndex='"; 
 
 function save() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "0";
		if(verifyForm(frm)) {
			getWFData(frm);
			frm.submit();	
		}

}
  function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prThingsManage.purchaseList.do";
	frm.submit();
  }


function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(verifyForm(frm)) {
				if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["COMM_PURCHASE/nextParticipantId"].value == ""){
					alert("��ѡ���»�����Ա");
					return;
				}
			}		
			getWFData(frm);
			frm.submit();	
		}

}

    // У������ݵĺϷ���
    function verifyForm(frm)
    {
    	var frm = document.forms[0];
    	var objTable = document.all['listdetail'];  
    	
    	var rowIndexId = 0;
    	var rowObj;
    	removeRowNull(objTable);
    	objTable = document.all['listdetail'];
    	if (objTable.rows.length <= 1) {
    		alert("����Ҫ��һ����ϸ��");
    		return false;
    	}
		for (var i=1; i<objTable.rows.length; ++i) {
    		rowObj = objTable.rows[i];
    		var rowId = rowObj.id;
    		rowIndexId = rowId.substr(4, rowId.length-4);  
    		if (!verifyEachRow(rowObj, rowIndexId)) 
    			return false;
    	}
    	return true;
    }
    // ���ÿһ�еĺϷ���
    function verifyEachRow(rowObj, rowIndexId) {
    	var quantityName = listName + rowIndexId + "']/QUANTITY";
    	var priceName = listName + rowIndexId + "']/PRICE";
    	// ����
        if (!isNumeric(rowObj.all[quantityName].value)||isEmpty(rowObj.all[quantityName].value)) {
        	alert("��������Ϊ���ұ���������");
        	return false;	
        }
        //����
        if (!isNumeric(rowObj.all[priceName].value)||isEmpty(rowObj.all[priceName].value)) {
        	alert("���۲���Ϊ���ұ���������");
        	return false;	
        }
        return true;
        return true;
    }
    
function sumFee(index){
 	 var frm = document.forms[0];
 	 var priceName = listName + index +"']/PRICE";
 	 var quantityName = listName + index +"']/QUANTITY";
 	 var amountName = listName + index +"']/AMOUNT";
 	 var price = frm.elements[priceName].value;
 	 var quantity = frm.elements[quantityName].value;
 	 if(isNaN(quantity)){
		alert("����Ϊ����");
		return;
	}
	var total = frm.elements[amountName];
	var tprice =new String(parseInt(quantity)*parseFloat(price));
	if(tprice.indexOf(".")!=-1){
		tprice = tprice.substring(0,tprice.indexOf(".")+3);
	}
	total.value = tprice;
	if(isNaN(total.value)) total.value="";

  }
  

  
 function getGoodIDs() {  //�õ��Ѽ������Ʒ
	var goodIDs = document.all['goodID'];
	var goodIDArray = new Array();
	if(goodIDs != null) {
		
		if(typeof(goodIDs.length) == "undefined") {
			return document.all['goodID'].value;
		} else {
			for(var i=0 ;i< goodIDs.length ; i++) {
				if(goodIDs[i].value != ""){
					goodIDArray[i] = goodIDs[i].value;
				}
			}
		}
	}
	return goodIDArray.join();
}

   function selectGood(obj,index) {  //ѡ����Ʒ
   var frm = document.forms[0];
   var goodIDs = getGoodIDs();
	frm["detailName"].value = "COMM_PURCHASEDETAIL";
	frm["index"].value = index;
	frm["goodIDs"].value = goodIDs;
	f_InitDivData(obj); //�˺�����autoSelect�ļ���
	
	
}
  
  

// ������ϸ���¼
	function insertDetail() {
		var objTable = document.all['listdetail']; // ��ϸ��
		var nameArray = new Array();  //Ҫ��ʾ�ֶ�����
		var i = 0;
		nameArray[i++] = "COMMNAME"; 
		nameArray[i++] = "SPECIA";
		nameArray[i++] = "PRICE";
		nameArray[i++] = "QUANTITY";
		nameArray[i++] = "UNITID";
		nameArray[i++] = "AMOUNT";
		nameArray[i++] = "REMARK";
		nameArray[i++] = "OP";
	  addNewRecordToTable(objTable, nameArray);	
	}
	 var checkboxIndex = <%=count+1%>;  //����������
	function addNewRecordToTable(objTable, nameArray) {
		
		var formHTML = "";
		var bodyHTML = objTable.innerHTML;
		bodyHTML = bodyHTML.replace("<TBODY>", "");
		bodyHTML = bodyHTML.replace("</TBODY>", "");
		formHTML += "<table width =\"96%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\"  bgcolor=\"#CAD6E8\" id=\"listdetail\">";
		formHTML += bodyHTML;
		formHTML += "<tr class=\"td1\" id=\"row_" + checkboxIndex + "\" onClick='changeTRBgColor(this)'>";

		
		for (var i=0; i<nameArray.length; i++) {
			var colHTML = "";
			switch (i) {
			case  0: // ��Ʒ����
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/COMMNAME\"  onclick=\"selectGood(this,"+checkboxIndex+")\"  onkeyup=\"selectGood(this,"+checkboxIndex+")\" onblur=\"f_OnBlur()\"  style=\"width:100%\" class=\"inputOA\"  />";
		  		colHTML += "<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/COMMID\"      id=\"goodID\" />";
		  		break;
			case 2: // ����
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"inputOA\" onkeyup=\"sumFee("+checkboxIndex+")\"  />";
				break;
			case 3: // ����
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"inputOA\" onkeyup=\"sumFee("+checkboxIndex+")\"/>";
				break;
			case 4: //��λ
				colHTML += "<td  nowrap>";
				colHTML += createUnitOption(listName + checkboxIndex + "'" + "]/" + nameArray[i] );
				break;
		    case 5: //�ϼƽ��
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"   style=\"width:100%\" class=\"inputOA\"  />";
				colHTML += "<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/STORAGE\"    />";
				break;
		    case 6: //��ע
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  maxlength=\"25\" style=\"width:100%\" class=\"inputOA\"  />";
				break;
		    case 7: //����
				colHTML += "<td  nowrap align=\"center\">";
				colHTML += "<img  onClick=\"removeRowFromTable(document.all['listdetail'], 'row_"+checkboxIndex+"')\" src=\"/internet/image/delete1.gif\" style=\"cursor: hand\"> ";
				break;
			
			default:
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"   style=\"width:100%\" class=\"inputOA\" />";
				break;
			}
			
			colHTML += "</td>";
			formHTML += colHTML;	
		}
		formHTML += "</tr>";
		formHTML += "</table>";  
		objTable.outerHTML = formHTML;
		var objTable = document.all['listdetail']; // ��ϸ��
		
		// ���� checkboxIndex
		checkboxIndex ++ ;
	}

	// �ӱ����ɾ��idΪrowId����
	var selectedRowIndex;
	function removeRowFromTable(objTable, rowId) {
	    if (document.getElementById(selectedRowIndex)) {
	    document.getElementById(selectedRowIndex).style.backgroundColor="#FFFFFF"; }
	    selectedRowIndex = rowId;
		document.getElementById(rowId).style.backgroundColor="#999999";
		
		if(confirm("�Ƿ�ȷ��ɾ��ָ����¼��") == false) { 
			return ;
		}  
		var tableHTML = objTable.outerHTML; 
		var locOfRowId = tableHTML.indexOf(rowId);
		var beginHTML = tableHTML.substr(0, locOfRowId);
		var endHTML = tableHTML.substr(locOfRowId+1, tableHTML.length-locOfRowId-1);
		var lastTRLoc = beginHTML.lastIndexOf("<TR");
		var beforeHTML = beginHTML.substr(0, lastTRLoc);
		var firstTRLoc = endHTML.indexOf("</TR>");
		var latterHTML = endHTML.substr(firstTRLoc+5, endHTML.length-firstTRLoc);
		
		objTable.outerHTML = beforeHTML + latterHTML;

	}
	
		// �ӱ����ɾ��Ʒ��Ϊ�յ���
	function removeRowNull(objTable) {
		var nullRowArr = new Array();
		var length = objTable.rows.length;
		for (var i=1; i< length; i++) {
    		rowObj = objTable.rows[i];
    		var rowId = rowObj.id;
    		var rowIndexId = rowId.substr(4, rowId.length-4);  
    		var goodName = listName + rowIndexId + "']/COMMNAME";
           if (isEmpty(rowObj.all[goodName].value)) {
                nullRowArr[nullRowArr.length] = rowId;
          }	
    	}
      var tableHTML = objTable.outerHTML; 
   	  for(var i =0;i<nullRowArr.length;i++){
   	    rowId = nullRowArr[i];
		var locOfRowId = tableHTML.indexOf(rowId);
		var beginHTML = tableHTML.substr(0, locOfRowId);
		var endHTML = tableHTML.substr(locOfRowId+1, tableHTML.length-locOfRowId-1);
		var lastTRLoc = beginHTML.lastIndexOf("<TR");
		var beforeHTML = beginHTML.substr(0, lastTRLoc);
		var firstTRLoc = endHTML.indexOf("</TR>");
		var latterHTML = endHTML.substr(firstTRLoc+5, endHTML.length-firstTRLoc);
   	  	tableHTML= beforeHTML + latterHTML;
   	  }
   	  objTable.outerHTML = tableHTML;
	}	
</script>