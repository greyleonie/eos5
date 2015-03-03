<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/internet/scripts/common.js" ></SCRIPT>
<SCRIPT language="JavaScript" src="/internet/scripts/autoFinish.js" ></SCRIPT>
<link href="/internet/css/autoFinish.css" rel="stylesheet" type="text/css">
<SCRIPT language="JavaScript" >

 var textbookArray = new Array();
 <logic:iterate id="resultset" property="list[@type='textbook']">
	textbookArray[textbookArray.length] = new Array('<bean:write id="resultset" property="QueryTextbook/TextbookID" />','<bean:write id="resultset" property="QueryTextbook/Title" />','<bean:write id="resultset" property="QueryTextbook/Author" />','<bean:write id="resultset" property="QueryTextbook/Publisher" />','<bean:write id="resultset" property="QueryTextbook/TextbookType" />','<bean:write id="resultset" property="QueryTextbook/StockNum" />','<bean:write id="resultset" property="QueryTextbook/Entry" />','<bean:write id="resultset" property="QueryTextbook/Delivery" />','<bean:write id="resultset" property="QueryTextbook/DeliveryDestroy" />','<bean:write id="resultset" property="QueryTextbook/BeginTime" />','<bean:write id="resultset" property="QueryTextbook/Balance" />');
 </logic:iterate>
  var listName = "booklist/TextbookInventory[@hciTagIndex='"; //要写入数据库的字段
  var listNameUpdate = "booklistupdate/Textbook[@hciTagIndex='"; //不用写入数据库的
  var g_BookIdObject = null;
  var g_BookAuthorObject = null;
  var g_BookPublisherObject = null;
  var g_BookTextbookTypeObject = null;
  var g_BookEntryObject = null;
  var g_BookDeliveryObject = null;
  var g_BookDeliveryDestroyObject = null;
  var g_BookNomialNumObject = null;  //帐面库存
  var g_BookBeginTimeObject = null; //期初时间
    
  function f_OnKeyDown(obj, event, index) {  
  	var bookID = listName + index + "']/TextbookID";
  	var bookAuthor = listNameUpdate + index + "']/Author"; 
  	var bookPublisher = listNameUpdate + index + "']/Publisher"; 
  	var bookTextbookType = listNameUpdate + index + "']/TextbookType"; 
  	var bookBalance = listName + index + "']/Balance";
  	var bookEntry = listName + index + "']/Entry";
  	var bookDelivery = listName + index + "']/Delivery";
  	var bookDeliveryDestroy = listName + index + "']/DeliveryDestroy";
  	var bookNomialNum = listNameUpdate + index + "']/NominalNum";
  	var bookBeginTime = listName + index + "']/BeginTime";
  	
  	var bookIDObj = document.all[bookID];
  	var rowId = "row_" + index;
  	var rowObj = document.all['listdetail'].rows[rowId];
  	var bookIDObj = rowObj.all[bookID];
  	var bookAuthorObj = rowObj.all[bookAuthor];
  	var bookPublisherObj = rowObj.all[bookPublisher];
  	var bookTextbookTypeObj = rowObj.all[bookTextbookType];
  	var bookBalanceObj = rowObj.all[bookBalance];
  	var bookEntryObj = rowObj.all[bookEntry];
  	var bookDeliveryObj = rowObj.all[bookDelivery];
  	var bookDeliveryDestroyObj = rowObj.all[bookDeliveryDestroy];
  	var bookNomialNumObj = rowObj.all[bookNomialNum];
  	var bookBeginTimeObj = rowObj.all[bookBeginTime];
  	
    if (obj != g_InputObject) {
      if (g_MainDiv != null) {
        g_MainDiv.innerHTML = "";
        g_MainDiv = null;
      }
      g_OldInnerTxt = "";
      g_NewInnerTxt = "";
      g_FirstTd = null;
      g_CurrentTd = null;
      // 给obj赋初始值
      g_InputObject = obj;
      g_BookIdObject = bookIDObj;
      g_BookAuthorObject = bookAuthorObj;
      g_BookPublisherObject = bookPublisherObj;
      g_BookTextbookTypeObject = bookTextbookTypeObj;
      g_BookBalanceObject = bookBalanceObj;
      g_BookEntryObject = bookEntryObj;
      g_BookDeliveryObject = bookDeliveryObj;
      g_BookDeliveryDestroyObject = bookDeliveryDestroyObj;
      g_BookNomialNumObject = bookNomialNumObj;
      g_BookBeginTimeObject = bookBeginTimeObj;

    }
    
    f_InitMain();
    var kc = event.keyCode;
    switch (kc) {
      case 13:
        f_EnterKey();
        f_SetDivDisplay(false);
        return false;
        break;
      case 27:
        f_EscapeKey();
        f_SetDivDisplay(false);
        return false;
        break;
      case 8:
        f_BackSpaceKey(obj, event);
        return;
        break;
      case 38:
        f_UpKey();
        return;
        break;
      case 40:
        f_DownKey();
        return;
        break;
      default:
        break;
    }
   
    return true;
  }
  
  
  // 选择合适的项，添到输入框中
  function f_FillCurrentEmail() {
    if (g_CurrentTd == null || g_InputObject == null) {
      return;
    }
   
    if (g_ArrBookList == null || g_ArrBookList.length == 0) {
      return;
    }
 
    var i = parseInt(g_CurrentTd.zIndex);
    var s = g_OldInnerTxt;
    if (g_OldInnerTxt != "") {
      s += ",";
    }

    g_InputObject.focus();
    // 放到输入框中的内容
    g_InputObject.value = s + g_ArrBookList[i][1];
  	g_BookIdObject.value = g_ArrBookList[i][0];
 	g_BookAuthorObject.value = g_ArrBookList[i][2];
  	g_BookPublisherObject.value = g_ArrBookList[i][3];
  	g_BookTextbookTypeObject.value = g_ArrBookList[i][4];
  	g_BookEntryObject.value = g_ArrBookList[i][6];
  	g_BookDeliveryObject.value = g_ArrBookList[i][7];
  	g_BookDeliveryDestroyObject.value = g_ArrBookList[i][8];
  	//g_BookNomialNumObject.value = g_ArrBookList[i][5];  //帐面库存
  	g_BookBalanceObject.value = g_ArrBookList[i][10];  //期初结存
  	g_BookBeginTimeObject.value = g_ArrBookList[i][9]; //期初时间
  	
  	g_BookNomialNumObject.value = g_BookBalanceObject.value*1 + g_BookEntryObject.value*1 - g_BookDeliveryObject.value*1 - g_BookDeliveryDestroyObject.value*1;  //帐面库存
    
    f_SetDivDisplay(false);
    g_CurrentTd = null;
  }
  
</SCRIPT>

<body onload="pageOnLoad()">
<form method="post" action="teachWorkManage.prBookManage.inventoryAddDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable" >
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教材管理—&gt;教材盘点</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
		<input type="hidden" name="addaction" value="teachWorkManage.prBookManage.inventoryAddDo.do">
		<input type="hidden" name="modifytoSave" value="teachWorkManage.prBookManage.inventoryVerify.do">
		<html:hidden property="TextbookInventoryDetail/_order/col1/field"/>
		<html:hidden property="TextbookInventoryDetail/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
	  </td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" >
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
    
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" >
          <tr> 
			 <td class="td1">
			  盘点时间：
            	<html:text property="TextbookInventory/StockTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="10" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TextbookInventory/StockTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")> 
			  经手人：
			   <input type="text" name="TextbookInventory/Handler" value= "<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>" class="input" size="20" /><br/>
              <input name="add" type="button" class="button_02" value="新增明细" onClick="javascript:insertDetail()">
              <input name="delete" type="button" class="button_02" value="删除明细" onClick="javascript:deleteDetails()">
			</td>
          </tr>
                    <tr> 
			 <td height="20" align="center" class="td1"><b>盘点明细</b></td>
          </tr>
        </table>
        </td></tr>
        
        
        <tr>
           <td height="8"> </td>
       </tr>
      <tr>
      <td class="text">
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"  id="listdetail">
         <tr class="td_title" height="10"> 
                  <td width="3%" align="center" nowrap rowspan="2"> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
                  <td width="20%" align="center" nowrap rowspan="2" id="TextbookInventoryDetail.Title" onClick="talentsort()">书 名</td>
                  <td width="10%" align="center" nowrap rowspan="2" id="TextbookInventoryDetail.Author" onClick="talentsort()">作 者</td>
                  <td width="10%" align="center" nowrap rowspan="2" id="TextbookInventoryDetail.Publisher" onClick="talentsort()">出版社</td>
                  <td width="5%" align="center" nowrap rowspan="2" id="TextbookInventoryDetail.TextbookType" onClick="talentsort()">类 型</td>
                  <td width="5%" align="center" nowrap rowspan="2">期初<br/>结存</td>
                  <td width="5%" align="center" nowrap rowspan="2">本期<br/>入库</td>
                  <td width="5%" align="center" nowrap colspan="2">本期出库</td>
                  <td width="5%" align="center" nowrap rowspan="2">帐面<br/>库存</td>
                  <td width="5%" align="center" nowrap rowspan="2" id="TextbookInventoryDetail.StockNum" onClick="talentsort()">盘点<br/>库存</td>
                 <td width="5%" align="center" nowrap rowspan="2">差额</td>
                  <td width="15%" align="center" nowrap rowspan="2" id="TextbookInventoryDetail.Remarks" onClick="talentsort()">备 注</td>
                </tr>
                <tr class="td_title" height="10"> 
                <td width="5%" align="center" nowrap >发放</td>
                <td width="5%" align="center" nowrap >报废</td>
                </tr>              
        </table>
        
           <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="javascript:save()">
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:goBack()"></td>
            </tr>
          </table>
         
          </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <div style="display:none">
  <Iframe name="verifyFrame"></Iframe>
  </div>
  
   <p><font color="#C0C0C0"><b>说明：</b></font></p>
<p><font color="#C0C0C0">增加明细后 按空格键可以显示全部书本</font></p>
</body>


<script language="JavaScript" type="text/javascript">

  function save() {
  	var frm = document.forms[0];
  	if(verifyForm(frm)){
	    frm.submit();
	 }
  
  }
	// 页面初始化函数
	function pageOnLoad() {
    	var frm = document.opeForm;
    	frm.elements["TextbookInventory/StockTime[@pattern='yyyy-MM-dd']"].value = getCurDateValue2();
	}
   // 将日历赋值
    function changeCalendar(index) { 
		var frm = document.opeForm;
        var STOCK_TIME_name = listName + index + "']/StockTime[@pattern='yyyy-MM-dd']";
		frm.elements[STOCK_TIME_name].value = getCurDateValue2();

    }
	
	// 返回到查询页面
	function goBack() {
		window.location.href = "teachWorkManage.prBookManage.inventoryList.do";
	}
	
	//保存增加的记录
    function confirmFrom() { 
    	var frm = document.opeForm;
    	var OrderTitle = frm.elements["TextbookOrder/OrderTitle"].value;
    	document.frames["verifyFrame"].location.href = "teachWorkManage.prBookManage.orderVerify.do?TextbookOrder/OrderTitle=" + OrderTitle;
    }
    
    // 校验表单数据的合法性
    function verifyForm(frm)
    {
    	var frm = document.opeForm;
    	var objTable = document.all['listdetail'];  
    	
    	var rowIndexId = 0;
    	var rowObj;
    	
    	if(isEmpty(frm.elements["TextbookInventory/StockTime[@pattern='yyyy-MM-dd']"].value.trim())){
    	 	alert("盘点时间不能为空");
    		return false;
    	}

    	if(isEmpty(frm.elements["TextbookInventory/Handler"].value.trim())){
    	 	alert("经手人不能为空");
    		return false;
    	}

    	if (objTable.rows.length <= 1) {
    		alert("至少要有一条明细！");
    		return false;
    	}

		for (var i=2; i<objTable.rows.length; ++i) {
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
    	var BuyNum = listName + rowIndexId + "']/StockNum";
		var TextbookID = listName + rowIndexId + "']/TextbookID";
    	
    	// 书名
    	var textbookName = listNameUpdate + rowIndexId + "']/Title";
    	var title = rowObj.all[textbookName].value;

        if (!isNumeric(rowObj.all[BuyNum].value)||isEmpty(rowObj.all[BuyNum].value)) {
        	alert("书名为'"+title+"'的教材盘点库存必须不为空且为数字");
        	return false;	
        }

         //TextbookID
    	
        if (!isNumeric(rowObj.all[TextbookID].value)||isEmpty(rowObj.all[TextbookID].value)) {
        	alert("书名为'"+title+"'的教材在库中不存在，请在教材信息管理中加入");
        	return false;	
        }
        return true;
    }
    
    
    // 判断一个项是否在一个数组中存在
    function isArrayItem(arr, itemID, itemName) {
    	var len = arr.length;
    	var isFlag = false;
    	for (var i=0; i<len; ++i) {
    		if ((arr[i][0]==itemID && arr[i][2]!=itemName)) {
    			isFlag = false;
    			break;
    		}
    		if ((arr[i][0]==itemID && arr[i][2]==itemName)) {
    			isFlag = true;
    			break;
    		}
    	}
    	
    	return isFlag;
    }
    

	//查询明细表记录
	function  queryDetail(){
	    var frm = document.opeForm;
    	var OrderTitle = frm.elements["TextbookOrder/OrderTitle"].value.trim();
    	if(OrderTitle == ""){
    	alert("订购名称不能为空");
    	}else{
     	window.location.href = "teachWorkManage.prBookManage.orderDetail.do?TextbookOrder/OrderTitle="+OrderTitle;   	
    	}

	}

	// 删除明细表记录
	function deleteDetails() {
		
		var objForm = document.forms['opeForm'];
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
	 
	
 // 增加明细表记录
	function insertDetail() {
		
		var objTable = document.all['listdetail']; // 明细表
		var nameArray = new Array();  //要显示字段名称
		var i = 0;
		nameArray[i++] = "Title"; 
		nameArray[i++] = "Author";
		nameArray[i++] = "Publisher";
		nameArray[i++] = "TextbookType";
		nameArray[i++] = "Balance";
		nameArray[i++] = "Entry";
		nameArray[i++] = "Delivery";
		nameArray[i++] = "DeliveryDestroy";
		nameArray[i++] = "NominalNum";
		nameArray[i++] = "StockNum";
		nameArray[i++] = "Diff";
		nameArray[i++] = "Remarks";
		addRecordToTable(objTable, nameArray);		
	}
	var checkboxIndex = 0;  //递增索引号
	function addRecordToTable(objTable, nameArray) {
		
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
			case  0: // 书名
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/Title\"  onkeydown=\"javascript:f_OnKeyDown(this,event," + checkboxIndex + ")\" onkeyup=\"f_OnKeyUp(this,event)\" onblur=\"f_OnBlur()\" style=\"width:100%\" class=\"input_text\" />";
		  		colHTML += "<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/TextbookID\"/>";
		  		colHTML += "<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/BeginTime\"/>";
		  		break;
		  	case 1: // 作者 
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_readonly\" readonly />";
				break;	
		    case 2: // 出版社 
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"input_readonly\" readonly />";
				break;	
			case 3: // 类型 
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"input_readonly\" readonly />";
				break;	
		   case 4: //期初结存
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"input_readonly\" readonly />";
				break;	
			case 5: // 本期入库
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\" readonly />";
				break;
		    case 6: // 本期出库发放
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\" readonly />";
				break;
		    case 7: // 本期出库报废
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\" readonly />";
				break;
			case 8: // 帐面库存
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\" readonly />";
				break;
			case 9: // 盘点库存
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\"  onkeyup=\"changeStock("+checkboxIndex+")\"/>";
				break;
		    case 10: // 差额
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\" readonly />";
				break;
			default:
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\" />";
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
	
		// 如果修改盘点库存，就要修改差额,本期入库，本期出库，帐面库存。
	function changeStock(index) {
		var frm = document.opeForm;
		
		var NominalNum_name = listNameUpdate+ index + "']/NominalNum";
		var StockNum_name =  listName+ index + "']/StockNum";
		var Diff_name =  listNameUpdate+ index + "']/Diff";
		
		var NominalNum_value = opeForm.elements[NominalNum_name].value;
		var StockNum_value = opeForm.elements[StockNum_name].value;
		var Diff_value = StockNum_value -   NominalNum_value ;
		opeForm.elements[Diff_name].value = Diff_value;
		
		
		
		
 		
	}
</script>