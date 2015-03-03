<%@include file="/internet/common.jsp"%>
<%@ page import=" java.util.GregorianCalendar"%>
<SCRIPT language="JavaScript" src="/internet/scripts/common.js" ></SCRIPT>
<SCRIPT language="JavaScript" src="/internet/scripts/autoFinish.js" ></SCRIPT>
<link href="/internet/css/autoFinish.css" rel="stylesheet" type="text/css">
<SCRIPT language="JavaScript" >

 var textbookArray = new Array();
 <logic:iterate id="resultset" property="list[@type='textbook']">
	textbookArray[textbookArray.length] = new Array('<bean:write id="resultset" property="QueryTextbook/TextbookID" />','<bean:write id="resultset" property="QueryTextbook/Title" />','<bean:write id="resultset" property="QueryTextbook/Author" />','<bean:write id="resultset" property="QueryTextbook/Publisher" />','<bean:write id="resultset" property="QueryTextbook/Price" />','<bean:write id="resultset" property="QueryTextbook/StockNum" />');
 </logic:iterate>
  var listName = "booklist/TextbookOrder[@hciTagIndex='"; 
  var listNameUpdate = "bookupdatelist/Textbook[@hciTagIndex='"; //更新书本信息的列表
  var g_BookIdObject = null;
  var g_BookPriceObject = null;
  var g_BookStockObject = null;
  
  var g_BookIdUpdateObject = null;
  var g_BookPublisherUpdateObject = null;
  var g_BookPriceUpdateObject = null;
    
  function f_OnKeyDown(obj, event, index) {  
  	var bookID = listName + index + "']/TextbookID";
  	var bookPrice = listName + index + "']/Price";
  	var bookStock = listName + index + "']/Stock";
  	
  	var bookIDUpdate = listNameUpdate + index + "']/TextbookID";
  	var bookPublisherUpdate = listNameUpdate + index + "']/Publisher";
  	var bookPriceUpdate = listNameUpdate + index + "']/Price";
  	
  	
  	
  	var rowId = "row_" + index;
  	var rowObj = document.all['listdetail'].rows[rowId];
  	var bookIDObj = rowObj.all[bookID];
  	var bookPriceObj = rowObj.all[bookPrice];
  	var bookStockObj = rowObj.all[bookStock];
  	
  	var bookIDUpdateObj = rowObj.all[bookIDUpdate];
  	var bookPublisherUpdateObj = rowObj.all[bookPublisherUpdate];
  	var bookPriceUpdateObj = rowObj.all[bookPriceUpdate];
  	
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
      g_BookPriceObject = bookPriceObj;
      g_BookStockObject = bookStockObj;
      
      g_BookIdUpdateObject = bookIDUpdateObj;
      g_BookPublisherUpdateObject = bookPublisherUpdateObj;
      g_BookPriceUpdateObject = bookPriceUpdateObj;

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
    g_BookPriceObject.value =  g_ArrBookList[i][4];
    g_BookStockObject.value =  g_ArrBookList[i][5];
    
    g_BookIdUpdateObject.value = g_ArrBookList[i][0];
    g_BookPriceUpdateObject.value =  g_ArrBookList[i][4];
    g_BookPublisherUpdateObject.value =  g_ArrBookList[i][3];
    
    f_SetDivDisplay(false);
    g_CurrentTd = null;
  }
  

</SCRIPT>

<body>
<form method="post" action="teachWorkManage.prBookManage.orderModifyDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable" >
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教材管理—&gt;教材订购修改</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">

	  </td>
    </tr>
  </table>
  
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
    
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" >

          <tr>
          	<td  class="td1" >
              <input name="add" type="button" class="button_02" value="新增明细" onClick="javascript:insertDetail()">
              <input name="delete" type="button" class="button_02" value="删除明细" onClick="javascript:deleteDetails()">
			  <td></tr>
              <tr>
      <td height="8"> </td>
    </tr>
		 <tr><td  class="td1">
            <html:hidden property="TextbookOrder/Yearth"/>
            <html:hidden property="TextbookOrder/Season"/>		
            <html:hidden property="TextbookOrder/OrderTitle"/>
          
         </td>
           <tr><td align="center" height="20" class="td1"> <b><bean:write  property="TextbookOrder/OrderTitle"/></b> </td></tr>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"  id="listdetail">
        
         <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
                  <td width="27%" align="center" nowrap id="TextbookOrder.Title" onClick="talentsort()">书 名</td>
                  <td width="25%" align="center" nowrap id="TextbookOrder.Title" onClick="talentsort()">出版社</td>
                  <td width="5%" align="center" nowrap id="TextbookOrder.Price" onClick="talentsort()">单价</td>
                  <td width="20%" align="center" nowrap id="TextbookOrder.UseClasses" onClick="talentsort()">班别</td>
                  <td width="10%" align="center">选择班别</td>
                  <td width="5%" align="center" nowrap id="TextbookOrder.Stock" onClick="talentsort()">库存</td>
                  <td width="5%" align="center" nowrap id="TTextbookOrder.OrderNum" onClick="talentsort()">购数</td>
                </tr>
            
                 <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='textbookorderdetail']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" id="row_<%=count%>">  
                <td align="center"><input type="checkbox" name="BookCheckBox" value=<%=count%> /></td>	
				<td  nowrap>
				<input type="text" name="bookupdatelist/Textbook[@hciTagIndex='<%=count %>']/Title" value="<bean:write id="resultset" property="TextbookOrderDetail/Title"/>"  onkeydown="javascript:f_OnKeyDown(this,event, <%=count%>)" onkeyup="f_OnKeyUp(this,event)" onblur="f_OnBlur()" size="25" style="width:100%" maxlength="50" class="input_text" />
		  		<input type="hidden" name="booklist/TextbookOrder[@hciTagIndex='<%=count %>']/TextbookID" value="<bean:write id="resultset" property="TextbookOrderDetail/TextbookID"/>"/>
		  		<input type="hidden" name="bookupdatelist/Textbook[@hciTagIndex='<%=count %>']/TextbookID" value="<bean:write id="resultset" property="TextbookOrderDetail/TextbookID"/>"/></td>
		  		
				<td  nowrap>
				<input type="text" name="bookupdatelist/Textbook[@hciTagIndex='<%=count %>']/Publisher" value="<bean:write id="resultset" property="TextbookOrderDetail/Publisher"/>" size="25" style="width:100%" maxlength="50" class="input_readonly" readonly /></td>
				<td  nowrap>
				<input type="text" name="booklist/TextbookOrder[@hciTagIndex='<%=count %>']/Price" value="<bean:write id="resultset" property="TextbookOrderDetail/Price"/>" size="5" style="width:100%"  class="input_text"  />
				<input type="hidden" name="bookupdatelist/Textbook[@hciTagIndex='<%=count %>']/Price" value="<bean:write id="resultset" property="TextbookOrderDetail/Price"/>"/></td>
				<td  nowrap>
				<input type="text" name="booklist/TextbookOrder[@hciTagIndex='<%=count %>']/UseClasses" value="<bean:write id="resultset" property="TextbookOrderDetail/UseClasses"/>" size="25" style="width:100%" maxlength="50" class="input_text" readonly /></td>
				<td  align="center" nowrap>
				<input type ="button" class="button_02" value="选 择"   onClick="javascript:selectClass('<%=count %>')"/></td>
				<td  nowrap>
				<input type="text" name="booklist/TextbookOrder[@hciTagIndex='<%=count %>']/Stock" value="<bean:write id="resultset" property="TextbookOrderDetail/Stock"/>" size="5" style="width:100%"  class="input_text" readonly /></td>
				<td  nowrap>
				<input type="text" name="booklist/TextbookOrder[@hciTagIndex='<%=count %>']/OrderNum" value="<bean:write id="resultset" property="TextbookOrderDetail/OrderNum"/>" size="5" style="width:100%" class="input_text" />
                </td></tr>
                </logic:iterate>      
        </table>
        
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="javascript:save()">
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
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
</body>


<script language="JavaScript" type="text/javascript">

  function save() {
  	var frm = document.forms[0];
  	if(verifyForm(frm)){
	    frm.submit();
	 }
  
  }

	
	// 返回到查询页面
	function goBack() {
		window.location.href = "teachWorkManage.prBookManage.orderList.do";
	}
	
	//保存增加的记录
    function confirmFrom() { 
    	var frm = document.opeForm;
    	var OrderTitle = frm.elements["TextbookOrder/OrderTitle"].value;
    	if(verifyForm(frm)){
    	document.frames["verifyFrame"].location.href = "teachWorkManage.prBookManage.orderVerify.do?TextbookOrder/OrderTitle=" + OrderTitle;
   		}
    }
    
    // 校验表单数据的合法性
    function verifyForm(frm)
    {
    	var frm = document.opeForm;
    	var OrderTitle = frm.elements["TextbookOrder/OrderTitle"].value.trim();
    	
    	var objTable = document.all['listdetail'];  
    	var rowIndexId = 0;
    	var rowObj;
    	
    	
    	if(isEmpty(frm.elements["TextbookOrder/Yearth"].value.trim())){
    	 	alert("年度不能为空，请选择");
    		return false;
    	}
    	if(isEmpty(frm.elements["TextbookOrder/Season"].value.trim())){
    	 	alert("时期不能为空，请选择");
    		return false;
    	}
    	if(isEmpty(OrderTitle)){
    	 	alert("订购名称不能为空，请填写");
    		return false;
    	}

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
    	var OrderNum = listName + rowIndexId + "']/OrderNum";
		var TextbookID = listName + rowIndexId + "']/TextbookID";
    	
    	// 书名
    	var textbookName = listNameUpdate + rowIndexId + "']/Title";
    	var title = rowObj.all[textbookName].value;
        if (!isNumeric(rowObj.all[OrderNum].value)||isEmpty(rowObj.all[OrderNum].value)) {
        	alert("书名为'"+title+"'的教材购数必须不为空且为数字");
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
		
		// 遍历rowArray，然后删除每一条入库单明细表记录
		
		for (var i=0; i<rowArray.length; ++i) {
			var objTable = document.all['listdetail']; // 入库单明细表
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
		nameArray[i++] = "Publisher";
		nameArray[i++] = "Price";
		nameArray[i++] = "UseClasses";
		nameArray[i++] = "ChooseClasses";
		nameArray[i++] = "Stock";
		nameArray[i++] = "OrderNum";
		addRecordToTable(objTable, nameArray);		
	}
	var checkboxIndex = <%=count+1%>;  //递增索引号
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
				colHTML += "<input type=\"text\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/Title\" onkeydown=\"javascript:f_OnKeyDown(this,event," + checkboxIndex + ")\" onkeyup=\"f_OnKeyUp(this,event)\" onblur=\"f_OnBlur()\" style=\"width:100%\" class=\"input_text\" />";
		  		colHTML += "<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/TextbookID\"/>";
		  		colHTML += "<input type=\"hidden\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/TextbookID\"/>";
		  		break;
		  	case 1: // 出版社  
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/Publisher\" style=\"width:100%\" class=\"input_readonly\" readonly />";
				break;	
			case 2: // 单价
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\"  />";
				colHTML += "<input type=\"hidden\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/Price\"/>";
				break;
				
			case 3: // 班别
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\" readonly />";
				break;
		    case 4: // 选择班别
				colHTML += "<td  align=\"center\" nowrap>";
				colHTML += "<input type =\"button\" class=\"button_02\" value=\"选 择\"   onClick=\"javascript:selectClass("+checkboxIndex+")\"/>";
				break;
			case 5: // 库存
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\" readonly />";
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
	
	 function selectClass(index){
 	 var frm = document.opeForm;
     var loc="teachWorkManage.prBookManage.selectClass.do";

     var acceptValue="";
     var ids="";
     var names="";
     try{
       acceptValue=window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=480px;status:no;scroll:yes");  
       ids=acceptValue[0];
       names=acceptValue[1];
     }catch(e){}

     var UseClasses = listName + index + "'" + "]/UseClasses"
     frm.elements[UseClasses].value=names;

  }
</script>