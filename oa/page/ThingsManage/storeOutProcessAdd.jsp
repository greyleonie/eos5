 <%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/internet/scripts/autoSelect.js" ></SCRIPT>
<%
java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String curdate = sdf.format(date);
%>

<script>
//得到计量单位SELECT
function createUnitOption(name){
	var result = "";
	result += "<select name=\""+name+"\" style=\"width:100%\">";
	<logic:iterate id="set"  property="list[type='Unit']" >
	result +=  "<option  value='<bean:write id="set" property="Unit/businID"/>'><bean:write id="set" property="Unit/businName"/></option>";
	</logic:iterate>
	result += "</select>";
	return result;

}
</script>
<body>
<form method="post" action="oa.prThingsManage.storeOutProcessDo.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;用品管理—&gt;用品申请处理流程—&gt;<bean:write property="WFWorkItem/workItemName"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="COMM_STOREOUT/_order/col1/field"/>
		<html:hidden  property="COMM_STOREOUT/_order/col1/asc" />
		
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
		
		<html:hidden property="COMM_STOREOUT/STOREOUTID"/> 
		<html:hidden property="COMM_STOREOUT/participant" />
		<html:hidden property="COMM_STOREOUT/passParticipant" />
		<html:hidden property="COMM_OfficeFund/FundID" />
		<input type="hidden"  name="COMM_OfficeFund/Balance" value="<bean:write property="COMM_OfficeFund/Balance"/>"/>
		<input type="hidden" name="COMM_OfficeFund/AMOUNT"   value='<bean:write property="AMOUNT"/>'/>
		
		        <!--传递给选择用品层的参数-->
        <html:hidden property="detailName"/> <html:hidden property="index"/> <html:hidden property="goodIDs" /> 

		
	  </td>
    </tr>
  </table>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0" class="table">
      <tr>
      <td height="8"></td>
      </tr>
      
        <tr>
          <td>
          
<!------------------------------  文头  ----------------------------->
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">广州市党校用品领用申请单</td>
				</tr>
			</table>
<!------------------------------  表单意见  ----------------------------->
          <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                <tr> 
                  <td align="right" width="10%" class="td2">申请单编号：</td>
                  <td width="10%" class="td1"><bean:write property="COMM_STOREOUTVIEW/STOREOUTCODE"/>  </td>
                  <td width="10%" align="right" class="td2">申请日期：</td>
                  <td width="10%" class="td1"><bean:write  property="COMM_STOREOUTVIEW/PURCHASEDATE" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                   <td width="10%" align="right" class="td2">申请部门：</td>
                  <td width="10%" class="td1" nowrap="nowrap"> <bean:write  property="COMM_STOREOUTVIEW/BRANCHNAME"/></td>
                  <td width="10%" align="right" class="td2">申 请 人：</td>
                  <td width="*" class="td1"><bean:write  property="COMM_STOREOUTVIEW/PROPOSERNAME"/> </td>
              </table>
          
			<table width="96%"   border="0" align="center" cellpadding="0" cellspacing="1" id="buttonspace">
				            <tr>
              <td align="right"><td align="left" class="td1"> 办公经费余额：<bean:write property="COMM_OfficeFund/Balance"/>元</td>            
           </tr>
			</table>
		
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="listdetail">
                <tr class="td_title">
                  <td width="20%" align="center">品名</td>
                  <td width="10%" align="center">规格</td>
                  <td width="10%" align="center">单价（元）</td>
                  <td width="10%" align="center">数量</td>
                  <td width="10%" align="center">单位</td>
                  <td width="10%" align="center">合计（元）</td>
                  <td width="10%" align="center">库存</td>
                   <td width="15%" align="center">备注</td>
                   <td width="5%"  align="center">操作</td>                
                </tr>
                 <%
		             int count=0;
			         String trClass = ""; 
		  
		  		%>
                      <logic:iterate id="detail" property="list[@type='COMM_STOREOUTDETAILVIEW']">
                        <%
				     
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td1";
			       	count++;
			       %>
			       
			      <html:hidden name="listOld/COMM_STOREOUTDETAIL/DETAILID" id="detail" property="COMM_STOREOUTDETAILVIEW/DETAILID" indexed="true"/>
               	<html:hidden name="listOld/COMM_STOREOUTDETAIL/COMMID" id="detail" property="COMM_STOREOUTDETAILVIEW/COMMID" indexed="true"/>
                         <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"    id="row_<%=count %>" >  
                          <td ><input type="text" name="listInsert/COMM_STOREOUTDETAIL[@hciTagIndex='<%=count %>']/COMMNAME" value='<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/COMMNAME"/>' style="width: 100%"  class="inputOA" readonly="readonly"   id="goodName"  />
                          <input type="hidden" name="listInsert/COMM_STOREOUTDETAIL[@hciTagIndex='<%=count %>']/COMMID" value='<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/COMMID"/>' style="width: 100%"  class="inputOA" />
                          </td>
                     
                          <td ><input type="text" name="listInsert/COMM_STOREOUTDETAIL[@hciTagIndex='<%=count %>']/SPECIA" value='<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/SPECIA"/>'    style="width: 100%"  class="inputOA" readonly="readonly"/></td>
                          <td ><input type="text" name="listInsert/COMM_STOREOUTDETAIL[@hciTagIndex='<%=count %>']/PRICE" value='<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/PRICE"/>'  onkeyup="sumFee(<%=count %>)" style="width: 100%"  class="inputOA"  /></td>
                          <td ><input type="text" name="listInsert/COMM_STOREOUTDETAIL[@hciTagIndex='<%=count %>']/QUANTITY" value='<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/QUANTITY"/>'   onkeyup="sumFee(<%=count %>)" style="width: 100%"   class="inputOA" /></td>
                               <td ><input type="text" name="listInsert/COMM_STOREOUTDETAIL[@hciTagIndex='<%=count %>']/UNITNAME" value='<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/UNITNAME"/>'  style="width: 100%"   class="inputOA" readonly="readonly"/></td>
                          <td ><input id="account" type="text" name="listInsert/COMM_STOREOUTDETAIL[@hciTagIndex='<%=count %>']/AMOUNT" value='<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/AMOUNT"/>'  style="width: 100%" class="inputOA"  readonly="readonly"/></td>
                          <td ><input type="text" name="listInsert/COMM_STOREOUTDETAIL[@hciTagIndex='<%=count %>']/STORAGE" value='<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/STORAGE"/>'  style="width: 100%"  class="inputOA"  readonly="readonly"/></td>
                          <td ><input type="text" name="listInsert/COMM_STOREOUTDETAIL[@hciTagIndex='<%=count %>']/REMARK" value='<bean:write id="detail" property="COMM_STOREOUTDETAILVIEW/REMARK"/>'  style="width: 100%" class="inputOA"  /></td>
                         <td nowrap align="center"><img  onClick='removeRowFromTable(document.all["listdetail"], "row_<%=count %>")' src="/internet/image/delete1.gif" style="cursor: hand"></td>
                        </tr>
                      </logic:iterate>
                
              </table>	
			  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" id="sum">
              	<tr>
				<td align="center" class="td1" colspan="4"> <input name="add" type="button" class="button_eight" value="增加用品输入栏"  onClick="insertDetail()"> </td>
				</tr>
				<tr>
				<td align="left" class="td1"> 办公经费余额：<input name="officeFund"  size="8"  value="<bean:write   property="COMM_OfficeFund/Balance"/>"  class="input" readonly="readonly" />元&nbsp;&nbsp;
				还剩下：<input readonly="readonly" size="8" class="input" name="sy" type="text"></td>
				<td align="right" class="td1">合计：<input name="TotalAccount" onchange="" size="8"   value="<bean:write property='AMOUNT'/>"  class="input" readonly="readonly"/>元</td>
				</tr>
		      </table> 
			
			
          	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="space">
							  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【部门负责人签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX2" type="textarea" list="list[@type='wfdata']" domwfnode="COMM_STOREOUT/activityDefID" cols="80" rows="5" classname="inputOA"/></div></td>
		      </tr>
			  <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【财务处签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX3" type="textarea" list="list[@type='wfdata']" domwfnode="COMM_STOREOUT/activityDefID" cols="80" rows="5" classname="inputOA"/></div></td>
		      </tr>
		      <tr>
			    <td height="25" colspan="6" nowrap class="td1"><div class="divwf1">【校领导签批意见】</div>
		        <div class="divwf2">
				<fcc:wfdata name="niBanOption" wfnode="DX4" type="textarea" list="list[@type='wfdata']" domwfnode="COMM_STOREOUT/activityDefID" cols="80" rows="5" classname="inputOA"/></div></td>
		      </tr>
		</table>
<!------------------------------  流转  ----------------------------->
		   
      <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
        <tr> 
          <td width="100%" align="left" nowrap colspan="2" bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0"  name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20" scrolling="auto"></iframe>	
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
		  <html:text property="COMM_STOREOUT/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="COMM_STOREOUT/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','COMM_STOREOUT/nextParticipantName','COMM_STOREOUT/nextParticipantId')">
		  </td>
        </tr>
      </table>
<!------------------------------  文尾  ----------------------------->			
	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="spacedown">
				<tr><td></td></tr>
		</table>

 </td></tr>
</table>

	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				  <input name="wfsend" type="button" class="button_02" value="发 送" onClick="send()">
				  <input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="goBack()"></td>
				</tr>
     </table>
</form>
</body>
<script>
	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>
<script language="JavaScript" type="text/javascript">
  var listName = "listInsert/COMM_STOREOUTDETAIL[@hciTagIndex='"; 
function save() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "0";
	   if(verifyForm(frm)) {
			getWFData(frm);
			frm.submit();	
		}

}

function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(verifyForm(frm)) {
				if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["COMM_STOREOUT/nextParticipantId"].value == ""){
					alert("请选择下环节人员");
					return;
				}
			}			
			getWFData(frm);
			frm.submit();	
		}

}

  function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prThingsManage.storeOutList.do";
	frm.submit();
  }


    // 校验表单数据的合法性
    function verifyForm(frm)
    {
    	var frm = document.forms[0];
    	var objTable = document.all['listdetail'];  
    	var rowIndexId = 0;
    	var rowObj;
    	removeRowNull(objTable);
    	objTable = document.all['listdetail'];
    	if (objTable.rows.length <= 1) {
    		alert("至少要有一条明细！");
    		return false;
    	}
    	
    	var officeFund = frm["officeFund"].value;
    	var TotalAccount = frm["TotalAccount"].value;
    	if (Number(TotalAccount) > Number(officeFund)) {
    		alert("您此次领用超过了您所在部门预算！");
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
    // 检查每一行的合法性
    function verifyEachRow(rowObj, rowIndexId) {
    	var quantityName = listName + rowIndexId + "']/QUANTITY";
    	var priceName = listName + rowIndexId + "']/PRICE";
        if (isEmpty(rowObj.all[quantityName].value)||!isNumeric(rowObj.all[quantityName].value)) {
        	alert("数量必须是数字");
        	return false;	
        }
        //单价
        if (!isNumeric(rowObj.all[priceName].value)||isEmpty(rowObj.all[priceName].value)) {
        	alert("单价不能为空且必须是数字");
        	return false;	
        }
        return true;
    }
    
function countSY(){
try{
   var totalMoney=document.forms[0].elements["officeFund"];
   var accountMoney=document.forms[0].elements["TotalAccount"];
   document.forms[0].elements["sy"].value=(eval(totalMoney.value)*100-eval(accountMoney.value)*100)/100;
   }catch(e){}
}

 function sumTotal(){
	var frm = document.forms[0];
	var accountArr = document.all["account"];
	var account =0;
	if(accountArr.length == undefined){
		account = accountArr.value;
	}else{
	
		for(var i= 0; i<accountArr.length;i++){
			account += Number(accountArr[i].value); 
		}
	}
	frm["TotalAccount"].value = account;
	countSY();
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
		alert("必须为数字");
		frm.elements[quantityName].value = '';
		frm.elements[amountName].value = '';
		return;
	} else if (parseInt(quantity) > parseInt(storage)) {
	    alert("申请数量不能大于库存数！");
		frm.elements[quantityName].value = '';
		frm.elements[amountName].value = '';
		return;
	} else {
	var total = frm.elements[amountName];
	var tprice =new String(parseInt(quantity)*parseFloat(price));
	if(tprice.indexOf(".")!=-1){
		tprice = tprice.substring(0,tprice.indexOf(".")+3);
	}
	total.value = tprice;
	if(isNaN(total.value)) total.value="";
	sumTotal();
	var officeFund = frm["officeFund"].value;
    var TotalAccount = frm["TotalAccount"].value;
    if (Number(TotalAccount) > Number(officeFund)) {
    	alert("您此次领用超过了您所在部门预算！");
    	return false;
    }
    }
  }

 function getGoodIDs() {  //得到已加入的物品
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




 function selectGood(obj,index) {  //选择物品
   var frm = document.forms[0];
   var goodIDs = getGoodIDs();
	frm["detailName"].value = "COMM_STOREOUTDETAIL";
	frm["index"].value = index;
	frm["goodIDs"].value = goodIDs;
	f_InitDivData(obj); //此函数在autoSelect文件中
	
	
} 

	 

// 增加明细表记录
	function insertDetail() {
		var objTable = document.all['listdetail']; // 明细表
		var nameArray = new Array();  //要显示字段名称
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
	var checkboxIndex = <%=count+1%>;  //递增索引号
	function addNewRecordToTable(objTable, nameArray) {
		
		var formHTML = "";
		var bodyHTML = objTable.innerHTML;
		bodyHTML = bodyHTML.replace("<TBODY>", "");
		bodyHTML = bodyHTML.replace("</TBODY>", "");
		formHTML += "<table width =\"96%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\"  bgcolor=\"#CAD6E8\" id=\"listdetail\">";
		formHTML += bodyHTML;
		formHTML += "<tr class=\"td1\" id=\"row_" + checkboxIndex + "\" onClick=\"changeTRBgColor(this)\">";
		for (var i=0; i<nameArray.length; i++) {
			var colHTML = "";
			switch (i) {
			case  0: // 用品名称
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/COMMNAME\"  id=\"goodName\" onclick=\"selectGood(this,"+checkboxIndex+")\"  onkeyup=\"selectGood(this,"+checkboxIndex+")\" onblur=\"f_OnBlur()\"      style=\"width:100%\" class=\"inputOA\"  />";
		  		colHTML += "<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/COMMID\"      id=\"goodID\" />";
		  		break;
			case 2: // 单价
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"inputOA\"  onkeyup=\"sumFee("+checkboxIndex+")\"/>";
				break;
			case 3: // 数量
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"inputOA\" onkeyup=\"sumFee("+checkboxIndex+")\"/>";
				break;
		   case  4: //单位
				colHTML += "<td  nowrap>";
				colHTML += createUnitOption(listName + checkboxIndex + "'" + "]/" + nameArray[i] );
				break;	
		   case 5: //合计金额
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" id=\"account\"  name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"   style=\"width:100%\" class=\"inputOA\"  />";
				break;
		  case 7: //备注
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  maxlength=\"25\" style=\"width:100%\" class=\"inputOA\"  />";
				break;
		  case 8: //操作
				colHTML += "<td  nowrap align=\"center\">";
				colHTML += "<IMG  onClick=\"removeRowFromTable(document.all['listdetail'], 'row_"+ checkboxIndex +"')\"  src=\"/internet/image/delete1.gif\" style=\"cursor: hand\"> ";
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
		var objTable = document.all['listdetail']; // 明细表
		
		// 递增 checkboxIndex
		checkboxIndex ++ ;
	}

		// 从表格中删除id为rowId的行
	var selectedRowIndex;
	function removeRowFromTable(objTable, rowId) {
	    if (document.getElementById(selectedRowIndex)) {
	    document.getElementById(selectedRowIndex).style.backgroundColor="#FFFFFF"; }
	    selectedRowIndex = rowId;
		document.getElementById(rowId).style.backgroundColor="#999999";
		
		if(confirm("是否确定删除指定记录？") == false) {
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
		sumTotal();

	}	
	// 从表格中删除品名为空的行
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