<%@ include file="/internet/common.jsp" %>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>
<%
java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String curdate = sdf.format(date);
%>

<script>
//得到计量单位SELECT
function createUnitOption(name){
var result = "";
	result += "<select name=\""+name+"\" style=\"width:100%\" >";
	<logic:iterate id="set"  property="list[type='Unit']" >
	result +=  "<option  value='<bean:write id="set" property="Unit/businID"/>'><bean:write id="set" property="Unit/businName"/></option>";
	</logic:iterate>
	result += "</select>";
	alert(result);
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
 			<td class="text_wirte">首页—&gt;办公系统—&gt;用品管理—&gt;<span id="printTable">用品发放新增</span></td>
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
	  </td>
    </tr>
  </table>
  
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td class="text">
            <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1"  bgcolor="#A2C4DC">
                <tr> 
                  <td width="10%" align="right" class="td2">发放编号：</td>
                  <td width="35%"  class="td1">&nbsp;<bean:write property="COMM_DRAW/DRAWCODE"/> 
                    <html:hidden property="COMM_DRAW/DRAWCODE"/></td>
                  <td width="12%" align="right" class="td2">发放日期：</td>
                  <td width="43%"  class="td1">&nbsp; <%=curdate%> <input type="hidden" name="COMM_DRAW/DRAWDATE[@pattern='yyyy-MM-dd']" value="<%=curdate%>"></td>
                </tr>
                <tr> 
                
                <td align="right" class="td2">操 作 人：</td>
                  <td  class="td1" colspan="3">&nbsp; <bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/> 
                    <html:hidden name="COMM_DRAW/OPERATOR"  property="SessionEntity/operatorID" /> </td>
                 
                
                </tr>
               
                <tr > 
                  <td align="right" class="td2">领用部门：</td>
                  <td class="td1"><select  name="COMM_DRAW/BRANCH"   id="select1" bizAction="oa.bizThingsManage.selectAllGroup"   paramXML="" listXpath="list[@type='TeachGroup']" entityName="TeachGroup" valueField="orgID"    textField="orgName"        childID="select2"  nullLable="true" nullLableText="<bean:write property="SessionEntity/orgName"/>" nullLableValue="<bean:write property="SessionEntity/orgID"/>" onchange="refreshChild_DS(this)" ></select> 
                   </td>
                  <td align="right" class="td2">领 用 人：</td>
                  <td class="td1"><select name="COMM_DRAW/PROPOSER"        id="select2" bizAction="oa.bizThingsManage.selectTeacher"    paramXML="" listXpath="list[@type='Teacher']"     entityName="Teacher"    valueField="TeacherID" textField="operatorName"  childID=""       mainSelectID="select1" nullLable="true" nullLableText="<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/> " nullLableValue=" <bean:write property="SessionEntity/operatorID" /> "></select>
                  </td>
				 <script language="JavaScript" type="text/JavaScript">	 	
					initSel_DS(document.getElementById("select1"));
				</script>
                </tr>
               
               
                <tr> 
                  <td align="right" class="td2">备注：</td>
                  <td colspan="3"  class="td1">
				  <html:textarea property="COMM_DRAW/REMARK" attributesText='rows="3" cols="60"'/>
				  </td>
                </tr>
              </table>
            
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
         
            <tr>
              <td align="right"> <input type="button" class="button_02" value="领用单" onClick="readDetails()">
                                 <input type="button" class="button_02" value="新 增" onClick="selectGoods(1) ">
                                 <input type="button" class="button_02"  value="删 除" onClick="deleteDetails()">
                &nbsp; </td>
            </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                 
                  <td width="27%" align="center" nowrap id="COMM_DRAWDETAIL.COMMNAME" onClick="talentsort()">品名</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAIL.UNIT" onClick="talentsort()">计量单位</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAIL.SPECIA" onClick="talentsort()">规格</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAIL.PRICE" onClick="talentsort()">单价（元)</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAIL.QUANTITY" onClick="talentsort()">数量</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAIL.REMARK" onClick="talentsort()">合计金额（元)</td>
                   <td width="20%" align="center" nowrap id="COMM_DRAWDETAIL.REMARK" onClick="talentsort()">备注</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_STOREOUTDETAILVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
               <tr class="td1" onClick="changeTRBgColor(this)" id="row_<%=count %>">  
                <td align="center"> 
				<input type="checkbox" name="BookCheckBox" value="<%=count%>" />
				</td>
                <td nowrap><input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/COMMNAME" value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/COMMNAME'/>" style="width:100%"  class="inputOA" />
                		<input type="hidden" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/COMMID"  value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/COMMID'/>"   class="inputOA"/></td> 
                <td nowrap> <input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/UNIINAME"  value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/UNITNAME'/>"  style="width:100%" readonly="readonly" class="inputOA" /></td>
                <td nowrap><input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/SPECIA"  value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/SPECIA' />" style="width:100%"  readonly="readonly" class="inputOA"/></td>
                <td nowrap><input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/PRICE"  value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/PRICE'/>"  style="width:100%" class="inputOA"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/QUANTITY"  value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/QUANTITY'/>" style="width:100%" class="inputOA"  onkeyup="sumFee(<%=count %>)"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/AMOUNT"  value="<bean:write id="resultset" property='COMM_STOREOUTDETAILVIEW/AMOUNT'/>"style="width:100%"  readonly="readonly" class="inputOA"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/RMARKS"  maxlength="50" style="width:100%" class="inputOA"/></td>
              </tr>
				</logic:iterate>
              </table>
       	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				  <input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="goBack()"></td>
				</tr>
     </table>
		  
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
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

    // 校验表单数据的合法性
    function verifyForm(frm)
    {
    	var frm = document.forms[0];
    	var objTable = document.all['listdetail'];  
    	var rowIndexId = 0;
    	var rowObj;
    	
    	if (objTable.rows.length <= 1) {
    		alert("至少要有一条明细！");
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

    	
    	// 购数
    	
        if (!isNumeric(rowObj.all[quantityName].value)||isEmpty(rowObj.all[quantityName].value)) {
        	alert("购数不能为空且必须是数字");
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
 	 var price = frm.elements[priceName].value;
 	 var quantity = frm.elements[quantityName].value;
 	 if(isNaN(quantity)){
		alert("必须为数字");
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
  

  
function Good(COMMID,TYPEID,COMMNAME,SPECIA,UNITID,PRICE,STORAGE,REMARK,UNITNAME,TYPENAME) {  //物品对象
	this.COMMID = COMMID;
	this.TYPEID = TYPEID;
	this.COMMNAME = COMMNAME;
	this.SPECIA = SPECIA;
	this.UNITID = UNITID;
	this.PRICE = PRICE;
	this.STORAGE = STORAGE;
	this.REMARK = REMARK;
	this.UNITNAME = UNITNAME;
	this.TYPENAME = TYPENAME;
	function compareByID(patternStr) {
		return this.COMMID==patternStr;
	}
	this.isMatch = compareByID;
}
function getGoodInfo(id) {  //根据ID返回物品数组
	for(goods in goodsArray) {
        if(goodsArray[goods].isMatch(id)) {
			return goodsArray[goods];
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
  
  /*选择物品
    type 为 1 时 不能新增物品
    type 为 2 时 可以新增物品
  */
 function selectGoods(type) {
	var url = "oa.prThingsManage.selectGoods.do?type="+type;
	var frm = document.forms[0];
	var ret = new Array();
	
	var goodIDs = getGoodIDs();
	url += "&goodIDs=" + goodIDs;
	
	var wparam = "dialogHeight:430px;dialogWidth:500px;center:yes";
	ret = window.showModalDialog(url,frm,wparam);

	if(typeof(ret) =="string"){
		insertDetail("New");
		return;
	}
	
	
	if(ret != null){
		for(goods in ret) {
			insertDetail(ret[goods]);
		}
	}
	
}
	
// 增加明细表记录
	function insertDetail(good) {
		var objTable = document.all['listdetail']; // 明细表
		var nameArray = new Array();  //要显示字段名称
		var i = 0;
		nameArray[i++] = "COMMNAME"; 
		nameArray[i++] = "UNITNAME";
		nameArray[i++] = "SPECIA";
		nameArray[i++] = "PRICE";
		nameArray[i++] = "QUANTITY";
		nameArray[i++] = "AMOUNT";
		nameArray[i++] = "STORAGE";
		nameArray[i++] = "REMARK";
		if(typeof(good) == "string"){
			addNewRecordToTable(objTable, nameArray);	
		}else{
			addRecordToTable(objTable, nameArray,good);	
		}	
	}
	var checkboxIndex = 0;  //递增索引号
	function addRecordToTable(objTable, nameArray,good) {
		
		var formHTML = "";
		var bodyHTML = objTable.innerHTML;
		bodyHTML = bodyHTML.replace("<TBODY>", "");
		bodyHTML = bodyHTML.replace("</TBODY>", "");
		formHTML += "<table width =\"98%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\"  bgcolor=\"#CAD6E8\" id=\"listdetail\">";
		formHTML += bodyHTML;
		formHTML += "<tr class=\"td1\" id=\"row_" + checkboxIndex + "\">";
		var colHTML = "<td align=\"center\">";
		colHTML += "<input type=\"checkbox\" name=\"BookCheckBox\" value=\"" + checkboxIndex + "\" />";
		colHTML += "</td>";
		formHTML += colHTML;
		
		for (var i=0; i<nameArray.length; i++) {
			var colHTML = "";
			switch (i) {
			case  0: // 用品名称
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/COMMNAME\"  value=\""+good.COMMNAME+"\" style=\"width:100%\" class=\"inputOA\" readonly />";
		  		colHTML += "<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/COMMID\"  value=\""+good.COMMID+"\"    id=\"goodID\" />";
		  		break;
			case 3: // 单价
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  value=\""+good.PRICE+"\" style=\"width:100%\" class=\"inputOA\"  />";
				break;
			case 4: // 数量
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"inputOA\" onkeyup=\"sumFee("+checkboxIndex+")\"/>";
				break;
		   case 5: //合计金额
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" id=\"account\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"   style=\"width:100%\" class=\"inputOA\" readonly />";
				break;
		  case 7: //备注
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"inputOA\"  />";
				break;
			default:
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  value=\""+eval("good."+nameArray[i])+"\"   style=\"width:100%\" class=\"inputOA\" readonly/>";
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
	function addNewRecordToTable(objTable, nameArray) {
		
		var formHTML = "";
		var bodyHTML = objTable.innerHTML;
		bodyHTML = bodyHTML.replace("<TBODY>", "");
		bodyHTML = bodyHTML.replace("</TBODY>", "");
		formHTML += "<table width =\"98%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\"  bgcolor=\"#CAD6E8\" id=\"listdetail\">";
		formHTML += bodyHTML;
		formHTML += "<tr class=\"td1\" id=\"row_" + checkboxIndex + "\">";
		var colHTML = "<td align=\"center\">";
		colHTML += "<input type=\"checkbox\" name=\"BookCheckBox\" value=\"" + checkboxIndex + "\" />";
		colHTML += "</td>";
		formHTML += colHTML;
		
		for (var i=0; i<nameArray.length; i++) {
			var colHTML = "";
			switch (i) {
			case  0: // 用品名称
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/COMMNAME\"   style=\"width:100%\" class=\"inputOA\"  />";
		  		colHTML += "<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/COMMID\"      id=\"goodID\" />";
		  		break;
		  		
		  case  1: //单位
				colHTML += "<td  nowrap>";
				colHTML += createUnitOption(listName + checkboxIndex + "'" + "]/" + nameArray[i] );
				break;
			case 3: // 单价
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"inputOA\"  />";
				break;
			case 4: // 数量
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"inputOA\" onkeyup=\"sumFee("+checkboxIndex+")\"/>";
				break;
		   case 5: //合计金额
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" id=\"account\"  name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"   style=\"width:100%\" class=\"inputOA\"  />";
				break;
		  case 7: //备注
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"inputOA\"  />";
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
	
	
	
	
		// 删除明细表记录
	function deleteDetails() {
		
		var objForm = document.forms[0];
    	var rowArray = new Array;
    	// 遍历objForm中所有的控件，但只是对checkbox进行处理
    	// 找出选中的checkbox，因为checkbox的value中记录了它所在行的id
    	for (var i=0; i<objForm.length; ++i) {
    		if (objForm.elements[i].type == "checkbox" && 
    		    objForm.elements[i].checked == true && objForm.elements[i].name != "chkall") {
    			rowArray[rowArray.length] = objForm.elements[i].value;
    		}
    	}
		if (rowArray.length == 0) {
			alert("至少必须选择一行！");
    		return;
		}
		
		if(confirm("是否确定删除指定记录？") == false) { 
			return ;
		}  
		
		// 遍历rowArray，然后删除每一条药库入库单明细表记录
		
		for (var i=0; i<rowArray.length; ++i) {
			var objTable = document.all['listdetail']; // 药库入库单明细表
			var rowId = "row_" + rowArray[i]; 
			removeRowFromTable(objTable, rowId);
		}
	}
	 
	// 从表格中删除id为rowId的行
	function removeRowFromTable(objTable, rowId) {
		
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
  	//读取采购申请单
   function readDetails() {
		var url="oa.prThingsManage.selectStoreOut.do";
		createWindow(url,100,100,800,500);
	}
</script>