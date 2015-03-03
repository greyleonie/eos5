<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/internet/scripts/common.js" ></SCRIPT>
<SCRIPT language="JavaScript" src="/internet/scripts/autoFinish.js" ></SCRIPT>
<link href="/internet/css/autoFinish.css" rel="stylesheet" type="text/css">
<SCRIPT language="JavaScript" >

 var textbookArray = new Array();
 <logic:iterate id="resultset" property="list[@type='textbook']">
	textbookArray[textbookArray.length] = new Array('<bean:write id="resultset" property="QueryTextbook/TextbookID" />','<bean:write id="resultset" property="QueryTextbook/Title" />','<bean:write id="resultset" property="QueryTextbook/Author" />','<bean:write id="resultset" property="QueryTextbook/Publisher" />','<bean:write id="resultset" property="QueryTextbook/Price" />','<bean:write id="resultset" property="QueryTextbook/StockNum" />','<bean:write id="resultset" property="QueryTextbook/PublishTime" />');
 </logic:iterate>
  var  listName= "booklist/TextbookBuy[@hciTagIndex='"; 
  var  listNameUpdate= "booklistupdate/Textbook[@hciTagIndex='"; 
  var g_BookIdObject = null;
  var g_BookPriceObject = null;
  var g_BookPublisherObject = null;
  var g_BookPublishTimeObject = null;
  var g_BookStockObject = null;
    
  function f_OnKeyDown(obj, event, index) {  
  	var bookID = listName + index + "']/TextbookID";
  	var bookPrice = listName + index + "']/Price";
  	
  	var bookPublisher = listNameUpdate + index + "']/Publisher";
  	var bookPublishTime = listNameUpdate + index + "']/PublishTime";
  	var bookStock = listNameUpdate + index + "']/Stock";
  	
  	var bookIDObj = document.all[bookID];
  	var rowId = "row_" + index;
  	var rowObj = document.all['listdetail'].rows[rowId];
  	var bookPublisherObj = rowObj.all[bookPublisher];
  	var bookPublishTimeObj = rowObj.all[bookPublishTime];
  	var bookPriceObj = rowObj.all[bookPrice];
  	var bookStockObj = rowObj.all[bookStock];
  	
    if (obj != g_InputObject) {
      if (g_MainDiv != null) {
        g_MainDiv.innerHTML = "";
        g_MainDiv = null;
      }
      g_OldInnerTxt = "";
      g_NewInnerTxt = "";
      g_FirstTd = null;
      g_CurrentTd = null;
      // ��obj����ʼֵ
      g_InputObject = obj;
      g_BookIdObject = bookIDObj;
      g_BookPublisherObject = bookPublisherObj;
      g_BookPublishTimeObject = bookPublishTimeObj;
      g_BookPriceObject = bookPriceObj;
      g_BookStockObject = bookStockObj;

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
  
  
  // ѡ����ʵ�����������
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
    // �ŵ�������е�����
    g_InputObject.value = s + g_ArrBookList[i][1];
    g_BookIdObject.value = g_ArrBookList[i][0];
    g_BookPublisherObject.value =  g_ArrBookList[i][3];
    
    g_BookPriceObject.value =  g_ArrBookList[i][4];
    g_BookStockObject.value =  g_ArrBookList[i][5];
    g_BookPublishTimeObject.value =  g_ArrBookList[i][6];
    
    f_SetDivDisplay(false);
    g_CurrentTd = null;
  }
  
</SCRIPT>

<body onload="pageOnLoad()">
<form method="post" action="teachWorkManage.prBookManage.buyAddDo.do" name="opeForm">
<input type="hidden" name="OrderTitle"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable" >
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�̲Ĺ���&gt;�̲Ĳɹ�</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">

		
	  </td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" >
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
      		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1">
      		<tr><td nowrap class="td1">

		  
		  		<input name="read" type="button" class="button_02" value="������" onClick="readOrderDetail(1)">
                <input name="add" type="button" class="button_02" value="������ϸ" onClick="insertDetail()">
              	<input name="delete" type="button" class="button_02" value="ɾ����ϸ" onClick="deleteDetails()">

			</td></tr>
			 <tr>
      <td height="8"> </td>
    </tr>
     <tr>
      <td class="td1">  ���ʱ�䣺
            	<html:text property="TextbookBuy/EnterTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="10" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TextbookBuyDetail/EnterTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")> 
           		
            �����ˣ�
            <input type="text" name="TextbookBuy/Handler"  value= "<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>" class="input" size="10"/>
            </td>
    </tr>
			                
			
			
			</table>
			</td>
      </tr>
      <tr><td class="td1" align="center"><b>�ɹ���ϸ</b> </td></tr>
      <tr>
        <td valign="top" class="text" >
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"  id="listdetail">
        
         <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
                  <td width="32%" align="center" nowrap id="TextbookBuyDetail.Title" onClick="talentsort()">�� ��</td>
                  <td width="20%" align="center" nowrap id="TextbookBuyDetail.Publisher" onClick="talentsort()">������</td>
                  <td width="10%" align="center" nowrap id="TextbookBuyDetail.PublishTime" onClick="talentsort()">����ʱ��</td>
                  <td width="5%" align="center" nowrap id="TextbookBuyDetail.Price" onClick="talentsort()">����</td>
                  <td width="5%" align="center" nowrap id="TextbookBuyDetail.Stock" onClick="talentsort()">�����</td>
                  <td width="5%" align="center" nowrap id="TextbookBuyDetail.BuyNum" onClick="talentsort()">�ɹ���</td>
                  <td width="20%" align="center" nowrap id="TextbookBuyDetail.Remarks" onClick="talentsort()">�� ע</td>
                </tr>
                  <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='textbookorderdetail']"> 
                <%
						count++;
			       %>
              <tr class="td1" onClick="changeTRBgColor(this)" id="row_<%=count %>">  
                <td align="center"> 
				<input type="checkbox" name="BookCheckBox" value="<%=count%>" />
				</td>
                <td nowrap><input type="text" name="booklistupdate/Textbook[@hciTagIndex='<%=count%>']/Title" value="<bean:write id="resultset" property='TextbookOrderDetail/Title'/>" style="width:100%"  onkeydown="javascript:f_OnKeyDown(this,event,<%=count %>)" onkeyup="f_OnKeyUp(this,event)" onblur="f_OnBlur()" style="width:100%" class="input_text" />
                <input type="hidden" name="booklist/TextbookBuy[@hciTagIndex='<%=count%>']/TextbookID"  value="<bean:write id="resultset" property='TextbookOrderDetail/TextbookID'/>"   /></td> 
                <td nowrap> <input type="text" name="booklistupdate/Textbook[@hciTagIndex='<%=count%>']/Publisher"  value="<bean:write id="resultset" property='TextbookOrderDetail/Publisher'/>"  style="width:100%" readonly="readonly"/></td>
                <td nowrap><input type="text" name="booklistupdate/Textbook[@hciTagIndex='<%=count%>']/PublishTime"  value="<bean:write id="resultset" property='TextbookOrderDetail/PublishTime' formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>" style="width:100%"  readonly="readonly"/></td>
                <td nowrap><input type="text" name="booklist/TextbookBuy[@hciTagIndex='<%=count%>']/Price"  value="<bean:write id="resultset" property='TextbookOrderDetail/Price'/>"  style="width:100%" /></td>
                <td nowrap> <input type="text" name="booklistupdate/Textbook[@hciTagIndex='<%=count%>']/Stock"  value="<bean:write id="resultset" property='TextbookOrderDetail/Stock'/>" style="width:100%" readonly="readonly"/></td>
                <td nowrap> <input type="text" name="booklist/TextbookBuy[@hciTagIndex='<%=count%>']/BuyNum"  value="<bean:write id="resultset" property='TextbookOrderDetail/OrderNum'/>"style="width:100%" /></td>
                <td nowrap> <input type="text" name="booklist/TextbookBuy[@hciTagIndex='<%=count%>']/Remarks"  maxlength="50" style="width:100%"/></td>
              </tr>
                </logic:iterate> 
                
                
                
                
              </table>    
          <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="javascript:save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:goBack()"></td>
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
  
 <p><font color="#C0C0C0"><b>˵����</b></font></p>
<p><font color="#C0C0C0">������ϸ�� ���ո��������ʾȫ���鱾</font></p>
</body>


<script language="JavaScript" type="text/javascript">

  function save() {
  	var frm = document.forms[0];
  	if(verifyForm(frm)){
	    frm.submit();
	 }
  
  }
	// ҳ���ʼ������
	function pageOnLoad() {
    	var frm = document.opeForm;
    	frm.elements["TextbookBuy/EnterTime[@pattern='yyyy-MM-dd']"].value = getCurDateValue2();
	}
	
	// ���ص���ѯҳ��
	function goBack() {
		window.location.href = "teachWorkManage.prBookManage.buyList.do";
	}
	
	//�������ӵļ�¼
    function confirmFrom() { 
    	var frm = document.opeForm;
    	var OrderTitle = frm.elements["TextbookOrder/OrderTitle"].value;
    	document.frames["verifyFrame"].location.href = "teachWorkManage.prBookManage.buyVerify.do?TextbookOrder/OrderTitle=" + OrderTitle;
    }
    
    	

	
    
    // У������ݵĺϷ���
    function verifyForm(frm)
    {
    	var frm = document.opeForm;
    	var objTable = document.all['listdetail'];  
    	var rowIndexId = 0;
    	var rowObj;
    	
    	
    	if(isEmpty(frm.elements["TextbookBuy/EnterTime[@pattern='yyyy-MM-dd']"].value.trim())){
    	 	alert("���ʱ�䲻��Ϊ��");
    		return false;
    	}
    	if(isEmpty(frm.elements["TextbookBuy/Handler"].value.trim())){
    	 	alert("�����˲���Ϊ��");
    		return false;
    	}


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
    	var BuyNum = listName + rowIndexId + "']/BuyNum";
		var TextbookID = listName + rowIndexId + "']/TextbookID";
    	
    	// ����
    	var textbookName = listNameUpdate + rowIndexId + "']/Title";
    	var title = rowObj.all[textbookName].value;
        if (!isNumeric(rowObj.all[BuyNum].value)||isEmpty(rowObj.all[BuyNum].value)) {
        	alert("����Ϊ'"+title+"'�Ľ̲Ĳɹ������벻Ϊ����Ϊ����");
        	return false;	
        }
        
         //TextbookID
    	
        if (!isNumeric(rowObj.all[TextbookID].value)||isEmpty(rowObj.all[TextbookID].value)) {
        	alert("����Ϊ'"+title+"'�Ľ̲��ڿ��в����ڣ����ڽ̲���Ϣ�����м���");
        	return false;	
        }
        return true;
    }
    
    // �ж�һ�����Ƿ���һ�������д���
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
    



	// ɾ����ϸ���¼
	function deleteDetails() {
		
		var objForm = document.forms['opeForm'];
    	var rowArray = new Array;
    	// ����objForm�����еĿؼ�����ֻ�Ƕ�checkbox���д���
    	// �ҳ�ѡ�е�checkbox����Ϊcheckbox��value�м�¼���������е�id
    	for (var i=0; i<objForm.length; ++i) {
    		if (objForm.elements[i].type == "checkbox" && 
    		    objForm.elements[i].checked == true && objForm.elements[i].name != "chkall") {
    			rowArray[rowArray.length] = objForm.elements[i].value;
    		}
    	}
		if (rowArray.length == 0) {
			alert("���ٱ���ѡ��һ�У�");
    		return;
		}
		
		if(confirm("�Ƿ�ȷ��ɾ��ָ����¼��") == false) { 
			return ;
		}  
		
		// ����rowArray��Ȼ��ɾ��ÿһ��ҩ����ⵥ��ϸ���¼
		
		for (var i=0; i<rowArray.length; ++i) {
			var objTable = document.all['listdetail']; // ҩ����ⵥ��ϸ��
			var rowId = "row_" + rowArray[i]; 
			removeRowFromTable(objTable, rowId);
		}
	}
	 
	
 // ������ϸ���¼
	function insertDetail() {
		
		var objTable = document.all['listdetail']; // ��ϸ��
		var nameArray = new Array();  //Ҫ��ʾ�ֶ�����
		var i = 0;
		nameArray[i++] = "Title"; 
		nameArray[i++] = "Publisher";
		nameArray[i++] = "PublishTime";
		nameArray[i++] = "Price";
		nameArray[i++] = "Stock";
		nameArray[i++] = "BuyNum";
		nameArray[i++] = "Remark";
		addRecordToTable(objTable, nameArray);		
	}
	var checkboxIndex = <%=count+1%>;  //����������
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
			case  0: // ����
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/Title\" onkeydown=\"javascript:f_OnKeyDown(this,event," + checkboxIndex + ")\" onkeyup=\"f_OnKeyUp(this,event)\" onblur=\"f_OnBlur()\" style=\"width:100%\" class=\"input_text\" />";
		  		colHTML += "<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/TextbookID\"/>";
		  		break;
		  	case 1: // ������  
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/Publisher\" style=\"width:100%\" class=\"input_readonly\" readonly />";
				break;	
			case 2: // ����ʱ��
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/PublishTime\"  class=\"input_readonly\" size=\"10\" style=\"100%\" />";
				break;	
			case 3: // ����
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\"  />";
				break;
				
			case 4: // ���
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameUpdate + checkboxIndex + "'" + "]/Stock\" style=\"width:100%\" class=\"input_text\" readonly />";
				break;
		    case 5: // ���
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\"  />";
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
		var objTable = document.all['listdetail']; // ��ϸ��
		// ���� checkboxIndex
		checkboxIndex ++ ;
	}
	
	// �ӱ����ɾ��idΪrowId����
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
	//��ȡ������
   function readOrderDetail(flag) {
		var url="teachWorkManage.prBookManage.selectOrder.do?flag="+flag;
		createWindow(url,100,100,800,500);
	}
</script>