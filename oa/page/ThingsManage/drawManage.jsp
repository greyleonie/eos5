<%@ include file="/internet/common.jsp" %>
<SCRIPT language="JavaScript" src="/internet/scripts/autoSelect.js" ></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script><!--ʵ����AJAX����-->
<%
java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String curdate = sdf.format(date);
%>

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
<form method="post" action="oa.prThingsManage.drawAddDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��Ʒ����&gt;<span id="printTable">��Ʒ����</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" >
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction" >
		<input type="hidden" name="deleteaction" >
	
		<html:hidden property="COMM_DRAW/_order/col1/field"/>
		<html:hidden property="COMM_DRAW/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="COMM_STOREOUT/STOREOUTID" />
		
						<!--���ݸ�ѡ����Ʒ��Ĳ���-->
		<html:hidden property="detailName"/>
		<html:hidden property="index"/>
		<html:hidden property="goodIDs" />
	  </td>
    </tr>
  </table>
  
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30"><input name="Button" type="button" class="button_eight" value="��ʷ���Ų�ѯ"  onClick="historyQuery()"></td>
      </tr>
      
	  <tr>
            <td class="text">
            <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1"  bgcolor="#A2C4DC">
                <tr> 
                  <td width="10%" align="right" class="td2">���ű�ţ�</td>
                  <td width="30%"  class="td1">&nbsp;<bean:write property="COMM_DRAW/DRAWCODE"/> 
                    <html:hidden property="COMM_DRAW/DRAWCODE"/></td>
                  <td width="10%" align="right" class="td2">�������ڣ�</td>
                  <td width="20%"  class="td1">&nbsp; <%=curdate%> <input type="hidden" name="COMM_DRAW/DRAWDATE[@pattern='yyyy-MM-dd']" value="<%=curdate%>"></td>
                <td width="10%" align="right" class="td2">�� �� �ˣ�</td>
                  <td  width="20%" class="td1" >&nbsp; <bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/> 
                    <html:hidden name="COMM_DRAW/OPERATOR"  property="SessionEntity/operatorID" /> </td>
                </tr>
              </table>
            
			</td>
      </tr>
      
        <logic:greaterThan  property="rowNum" value="0">
            <tr>
        <td height="8" class="td1" align="center">����׼�����õ�</td>
      </tr>
      <tr>
        <td> <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="olddetail" >
                <tr class="td_title"> 
                  <td width="10%" align="center" nowrap id="COMM_STOREOUTVIEW.STOREOUTCODE" onClick="talentsort()">���뵥���</td>
                  <td width="10%" align="center" nowrap id="COMM_STOREOUTVIEW.PROPOSER" onClick="talentsort()">������</td>
                  <td width="10%" align="center" nowrap id="COMM_STOREOUTVIEW.BRANCH" onClick="talentsort()">���벿��</td>
                  <td width="10%" align="center" nowrap id="COMM_STOREOUTVIEW.PURCHASEDATE" onClick="talentsort()">��������</td>
                  <td width="50%" align="center" nowrap id="COMM_STOREOUTVIEW.ZCNC" onClick="talentsort()">��Ʒ����</td>
                  <td width="10%" align="center" >����</td>
                </tr>
                
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_STOREOUTVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="COMM_STOREOUTVIEW/STOREOUTID"/>','true')">  
                <td nowrap>&nbsp;<bean:write id="resultset" property="COMM_STOREOUTVIEW/STOREOUTCODE"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="COMM_STOREOUTVIEW/PROPOSERNAME"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="COMM_STOREOUTVIEW/BRANCHNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_STOREOUTVIEW/PURCHASEDATE" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
				<td nowrap title="<bean:write id="resultset" property="COMM_STOREOUTVIEW/ZCNC"/>">&nbsp;<bean:write id="resultset" property="COMM_STOREOUTVIEW/ZCNC" maxLength="50"/></td>
                <td nowrap align="center"><a href="#" onclick='addGood(<bean:write id="resultset" property="COMM_STOREOUTVIEW/STOREOUTID"/>,document.all["olddetail"], "row_<%=count %>")' >����</a></td>
              </tr>
  
                </logic:iterate> 
              </table></td>
      </tr>
      
      
       </logic:greaterThan>
                  <tr>
        <td height="30" class="td1" align="right"><input name="add" type="button" class="button_eight" value="������Ʒ������" onClick="insertDetail()"></td>
      </tr> 
      
      	  <tr>
            <td class="text">
            <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1"  bgcolor="#A2C4DC">
                <tr > 
                  <td align="right" class="td2">���ò��ţ�</td>
                  <td class="td1" ><select  name="COMM_DRAW/BRANCH"   id="select1" bizAction="oa.bizThingsManage.selectAllGroup"   paramXML="" listXpath="list[@type='TeachGroup']" entityName="TeachGroup" valueField="orgID"    textField="orgName"        childID="select2"  nullLable="true" nullLableText="<bean:write property="SessionEntity/orgName"/>" nullLableValue="<bean:write property="SessionEntity/orgID"/>" onchange="refreshChild_DS(this)" ></select> 
                   </td>
                  <td align="right" class="td2">�� �� �ˣ�</td>
                  <td class="td1" ><select name="COMM_DRAW/PROPOSER"        id="select2" bizAction="oa.bizThingsManage.selectTeacher"    paramXML="" listXpath="list[@type='Teacher']"     entityName="Teacher"    valueField="TeacherID" textField="operatorName"  childID=""       mainSelectID="select1" nullLable="true" nullLableText="<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/> " nullLableValue=" <bean:write property="SessionEntity/operatorID" /> "></select>
                  </td>
				 <script language="JavaScript" type="text/JavaScript">	 	
					initSel_DS(document.getElementById("select1"));
				</script>
                </tr>
              </table>
            
			</td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="30%" align="center" nowrap id="COMM_DRAWDETAIL.COMMNAME" onClick="talentsort()">Ʒ��</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAIL.SPECIA" onClick="talentsort()">���</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAIL.PRICE" onClick="talentsort()">���ۣ�Ԫ)</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAIL.QUANTITY" onClick="talentsort()">����</td>
                  <td width="5%" align="center" nowrap id="COMM_DRAWDETAIL.UNIT" onClick="talentsort()">��λ</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAIL.AMOUNT" onClick="talentsort()">�ϼƽ�Ԫ)</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAIL.STORAGE" onClick="talentsort()">���</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAIL.REMARK" onClick="talentsort()">��ע</td>
                  <td width="5%" align="center" nowrap id="COMM_DRAWDETAIL.REMARK" onClick="talentsort()">����</td>
                </tr>
                <%
		             int count1=0;
			         String trClass1 = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_STOREOUTDETAILVIEW']"> 
                <%
				     
						if(count1%2==0)
							trClass1 = "td1";
						else
							trClass1 = "td2";
						count1++;
			       %>
               <tr class="td1" onClick="changeTRBgColor(this)" id="row_<%=count1 %>">  
                <td align="center"> 
				<input type="checkbox" name="BookCheckBox" value="<%=count1%>" />
				</td>
                <td nowrap><input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count1%>']/COMMNAME" value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/COMMNAME'/>" style="width:100%"  class="inputOA" />
                		<input type="hidden" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count1%>']/COMMID"  value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/COMMID'/>"   class="inputOA"/></td> 
                <td nowrap> <input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count1%>']/UNIINAME"  value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/UNITNAME'/>"  style="width:100%" readonly="readonly" class="inputOA" /></td>
                <td nowrap><input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count1%>']/SPECIA"  value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/SPECIA' />" style="width:100%"  readonly="readonly" class="inputOA"/></td>
                <td nowrap><input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count1%>']/PRICE"  value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/PRICE'/>"  style="width:100%" class="inputOA"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count1%>']/QUANTITY"  value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/QUANTITY'/>" style="width:100%" class="inputOA"  onkeyup="sumFee(<%=count1 %>)"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count1%>']/AMOUNT"  value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/AMOUNT'/>"style="width:100%"  readonly="readonly" class="inputOA"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count1%>']/RMARKS"  maxlength="50" style="width:100%" class="inputOA"/></td>
              </tr>
				</logic:iterate>
              </table>
       	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				  
				  <input name="wfsave" type="button" class="button_02" value="�� ��" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="�� ��" onClick="goBack()"></td>
				</tr>
     </table>
		  
		  </td>
      </tr>
      <tr>
        <td class="text" height="200">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>   
</form>
</body>
<script language="JavaScript">
	var listName = "listInsert/COMM_DRAWDETAIL[@hciTagIndex='"; 
	function save() {
	  	var frm = document.forms[0];
	  	if(verifyForm(frm)){
		    frm.submit();
		 }
	  
	  }
 function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prThingsManage.drawList.do";
	frm.submit();
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
        	alert("���ֲ���Ϊ���ұ���������");
        	return false;	
        }
        //����
        if (!isNumeric(rowObj.all[priceName].value)||isEmpty(rowObj.all[priceName].value)) {
        	alert("���۲���Ϊ���ұ���������");
        	return false;	
        }
        return true;
    }
    

 function sumTotal(){
	var frm = document.forms[0];
	var accountArr = document.all["account"];
	var account =0;
	for(var i= 0; i<accountArr.length;i++){
		account += accountArr[i].value; 
	}
	frm["TotalAccount"].value = account;
	
}    
	
function sumFee(index){
 	 var frm = document.forms[0];
 	 var priceName = listName + index +"']/PRICE";
 	 var quantityName = listName + index +"']/QUANTITY";
 	 var amountName = listName + index +"']/AMOUNT";
 	 var storageName = listName + index +"']/STORAGE";
 	 var price = frm.elements[priceName].value;
 	 var quantity = frm.elements[quantityName].value;
 	 var storage = frm.elements[storageName].value;
 	 if(isNaN(quantity)){
		alert("����Ϊ����");
		return;
	}
	if(Number(quantity)>Number(storage)){
		alert("�����������ܴ������п��");
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
				goodIDArray[i] = goodIDs[i].value;
			}
		}
	}
	return goodIDArray.join();
}
  
  
 function selectGood(obj,index) {  //ѡ����Ʒ
   var frm = document.forms[0];
   var goodIDs = getGoodIDs();
	frm["detailName"].value = "COMM_DRAWDETAIL";
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
		nameArray[i++] = "STORAGE";
		nameArray[i++] = "REMARK";
		nameArray[i++] = "OP";
	    addNewRecordToTable(objTable, nameArray);	
	
	}
	var checkboxIndex = <%=count1%>;  //����������
	function addNewRecordToTable(objTable, nameArray) {
		
		var formHTML = "";
		var bodyHTML = objTable.innerHTML;
		bodyHTML = bodyHTML.replace("<TBODY>", "");
		bodyHTML = bodyHTML.replace("</TBODY>", "");
		formHTML += "<table width =\"96%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\"  bgcolor=\"#CAD6E8\" id=\"listdetail\">";
		formHTML += bodyHTML;
		formHTML += "<tr class=\"td1\" id=\"row_" + checkboxIndex + "\">";
		for (var i=0; i<nameArray.length; i++) {
			var colHTML = "";
			switch (i) {
			case  0: // ��Ʒ����
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/COMMNAME\"  onclick=\"selectGood(this,"+checkboxIndex+")\"  onkeyup=\"selectGood(this,"+checkboxIndex+")\" onblur=\"f_OnBlur()\"    style=\"width:100%\" class=\"inputOA\"  />";
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
		   case  4: //��λ
				colHTML += "<td  nowrap>";
				colHTML += createUnitOption(listName + checkboxIndex + "'" + "]/" + nameArray[i] );
				break;
		   case 5: //�ϼƽ��
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" id=\"account\"  name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"   style=\"width:100%\" class=\"inputOA\"  />";
				break;
		   case 7: //��ע
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"inputOA\"  />";
				break;
	      case 8: //����
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
	function removeRowFromTable(objTable, rowId) {
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
	  function onLoad(){
		for(var i = 0 ;i<5 ;i++){ //������ҳ��Ĭ��5��
		insertDetail();
	}
	}
 onLoad();
	
function historyQuery(){
 window.location.href="oa.prThingsManage.drawList.do";
 
 }
 
 function checkSelectByValue(selObj,value,bSelected){
	 if (bSelected == undefined || bSelected ==""){
	 	 bSelected = true;
	 }
	 for (var i =0; i< selObj.options.length ; i++){
		  if (selObj.options[i].value==value){
		   selObj.options[i].selected = bSelected;
		   break;
		  }
	 }

	}
function setValue(sub){
		var frm = document.forms[0];
		arr0 = sub.getValues("root/data/list/COMM_STOREOUTDETAILVIEW/COMMNAME");
		arr1 = sub.getValues("root/data/list/COMM_STOREOUTDETAILVIEW/COMMID");
		arr2 = sub.getValues("root/data/list/COMM_STOREOUTDETAILVIEW/SPECIA");
		arr3 = sub.getValues("root/data/list/COMM_STOREOUTDETAILVIEW/PRICE");
		arr4 = sub.getValues("root/data/list/COMM_STOREOUTDETAILVIEW/STORAGE");
		arr5 = sub.getValues("root/data/list/COMM_PURCHASEDETAILVIEW/UNITID");
		arr6 = sub.getValues("root/data/list/COMM_STOREOUTDETAILVIEW/QUANTITY");
		arr7 = sub.getValues("root/data/list/COMM_STOREOUTDETAILVIEW/AMOUNT");
 	   for(var i =0;i<arr0.length;i++){
 	    insertDetail();
 	    var index = checkboxIndex-1;
		frm[listName+index+"']/COMMNAME"].value=arr0[i];
		frm[listName+index+"']/COMMID"].value=arr1[i];
		frm[listName+index+"']/SPECIA"].value=arr2[i];
		frm[listName+index+"']/PRICE"].value=arr3[i];
		frm[listName+index+"']/STORAGE"].value=arr4[i];
		var selObj = frm[listName+index+"']/UNITID"];
		checkSelectByValue(selObj,arr5[i],true);
		frm[listName+index+"']/QUANTITY"].value=arr6[i];
		frm[listName+index+"']/AMOUNT"].value=arr7[i];	
		
		frm[listName+index+"']/COMMNAME"].readOnly = true;
		frm[listName+index+"']/SPECIA"].readOnly = true;
		frm[listName+index+"']/STORAGE"].readOnly = true;
		selObj.disabled = true;
 	}
 	
 	var orgID = sub.getValue("root/data/COMM_STOREOUTVIEW/BRANCH");
 	var requestID = sub.getValue("root/data/COMM_STOREOUTVIEW/PROPOSER");
 	document.getElementById("select1").nullLableValue = orgID;
 	document.getElementById("select2").nullLableValue = requestID; 	
 	checkSelectByValue(document.getElementById("select1"),orgID,true);
 	onchange=refreshChild_DS(document.getElementById("select1"));
	checkSelectByValue(document.getElementById("select2"),requestID,true);
}
 
 //����
function addGood(id,objTable, rowId){
		var frm=document.forms[0];
		var storeOutID = frm["COMM_STOREOUT/STOREOUTID"].value; 
		if(storeOutID != ""){
				alert("һ��ֻ�ܷ���һ�����õ�");
				return;
			}else{
				frm["COMM_STOREOUT/STOREOUTID"].value = id;
			}
		
		if(confirm("ȷ��Ҫ���Ŵ����õ�����Ʒ��"))
		{
			var sub1 = new HiddenSubmit("oa.bizThingsManage.selectStoreOutDetail");
			sub1.add("fid", id);
			if (sub1.submit()) {
				var ret = sub1.getValue("root/return/code");
				if (ret == null || ret == "0") {
					alert("����ʧ�ܣ�����ϵ����Ա");
				} else {
				    removeRowNull(document.all['listdetail']);
					setValue(sub1);
					deleteRow(objTable, rowId);
					
				}
			}
		}
		
	}
 	function deleteRow(objTable, rowId) {
	 
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