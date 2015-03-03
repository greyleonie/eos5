<%@include file="/internet/common.jsp"%>
<script>
function initOnLoad(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("书名\"<bean:write property="message"/>\"已存在，请修改书名或删除该行！");
		</logic:greaterThan>
	</logic:present>
	<logic:notPresent property="only">
			insertDetail();
	</logic:notPresent>
}
</script>
<body onload="initOnLoad()">
<form method="post" action="teachWorkManage.prBookManage.textbookAddDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教材管理—&gt;教材信息管理</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="Textbook/_order/col1/field"/>
		<html:hidden property="Textbook/_order/col1/asc" />
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
            <td height="30" class="text">
                <input name="add" type="button" class="button_02" value="新 增" onClick="insertDetail()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="deleteDetails()">
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="20%" align="center" nowrap id="Textbook.Title" onClick="talentsort()">书名</td>
                  <td width="20%" align="center" nowrap id="Textbook.Author" onClick="talentsort()">作者</td>
                  <td width="20%" align="center" nowrap id="Textbook.Publisher" onClick="talentsort()">出版社</td>
                  <td width="22%" align="center" nowrap id="Textbook.PublishTime" onClick="talentsort()">出版日期</td>
                  <td width="5%" align="center" nowrap id="Textbook.Price" onClick="talentsort()">价格</td>
                  <td width="10%" align="center" nowrap id="Textbook.TextbookType" onClick="talentsort()">类别</td>
                 
                </tr>
                 <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='textbook']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" id="row_<%=count%>"\>
                <td align="center"><input type="checkbox" name="BookCheckBox" value=<%=count%> /></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Title" value="<bean:write id="resultset" property="Textbook/Title"/>" class="input" size="25" style="100%" maxlength="50" ValidateType="notempty" Msg="书名不能为空" /> </td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Author" value="<bean:write id="resultset" property="Textbook/Author"/>" class="input" size="25" style="100%" maxlength="20"   /></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Publisher" value="<bean:write id="resultset" property="Textbook/Publisher"/>" class="input" size="25" style="100%"  maxlength="50"  /></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/PublishTime[@pattern='yyyy-MM-dd']" value="<bean:write id="resultset" property="Textbook/PublishTime[@pattern='yyyy-MM-dd']"/>" class="input" size="10" style="100%" />
                			<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["booklist/Textbook[@hciTagIndex='<%=count%>']/PublishTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Price" value="<bean:write id="resultset" property="Textbook/Price"/>" class="input" size="10" style="100%"  ValidateType="money" Msg="价格必须为数字" /></td>
                <td nowrap ><select name="booklist/Textbook[@hciTagIndex='<%=count%>']/TextbookType"  class="input" style="100%" >
                				<logic:notPresent id="resultset" property="Textbook/TextbookType" ><option value="-1" selected>请选择</option><option value="党建" selected>党建</option><option value="哲学">哲学</option><option value="政治">政治</option><OPTION value="经济">经济</OPTION><OPTION value="法学">法学</OPTION>
                				<OPTION value="行政">行政</OPTION><OPTION value="管理">管理</OPTION><OPTION value="其他">其他</OPTION></logic:notPresent>
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="党建"><option value="-1" >请选择</option><option value="党建" selected>党建</option><option value="哲学">哲学</option><option value="政治">政治</option><OPTION value="经济">经济</OPTION><OPTION value="法学">法学</OPTION>
                				<OPTION value="行政">行政</OPTION><OPTION value="管理">管理</OPTION><OPTION value="其他">其他</OPTION></logic:equal>
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="哲学"><option value="-1" >请选择</option><option value="党建" selected>党建</option><option value="哲学">哲学</option><option value="政治">政治</option><OPTION value="经济">经济</OPTION><OPTION value="法学">法学</OPTION>
                				<OPTION value="行政">行政</OPTION><OPTION value="管理">管理</OPTION><OPTION value="其他">其他</OPTION></logic:equal>
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="政治"><option value="-1" >请选择</option><option value="党建" selected>党建</option><option value="哲学">哲学</option><option value="政治">政治</option><OPTION value="经济">经济</OPTION><OPTION value="法学">法学</OPTION>
                				<OPTION value="行政">行政</OPTION><OPTION value="管理">管理</OPTION><OPTION value="其他">其他</OPTION></logic:equal>
                			</select>		
                			</td>
              
              </tr>
                </logic:iterate> 
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
    </table>    </td>
  </tr>
</table>
</form>
  <div style="display:none">
  <Iframe name="verifyFrame"></Iframe>
  </div>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}
</script>
<script>
	loadOrderImg(document.forms[0],'Textbook');
</script>

<script>
  var listName = "booklist/Textbook[@hciTagIndex='"; 
  function save() {
  	var frm = document.forms[0];
 	if(verifyForm(frm)){
	    frm.submit();
	 }
  
  }

	// 返回到查询页面
	function goBack() {
		window.location.href = "teachWorkManage.prBookManage.textbookList.do";
	}
	
	//保存增加的记录
    function confirmFrom() { 
    	var frm = document.opeForm;
    	frm.action= "teachWorkManage.prBookManage.textbookVerify.do";
    	frm.submit();
    	/*
    	if(verifyForm(frm)){
	   document.frames["verifyFrame"].location.href = "teachWorkManage.prBookManage.textbookVerify.do";
	   }
	   */
    	
    }
	 // 校验表单数据的合法性
    function verifyForm(frm)
    {
    	var frm = document.opeForm;
    	
    	
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
    
    	var title = listName + rowIndexId + "']/Title";  
    	var price = listName + rowIndexId + "']/Price";
    	
    	// 书名不能为空
        if (isEmpty(rowObj.all[title].value.trim())) {
        	alert("第" + (parseInt(rowIndexId)+1) + "行的书名不能为空，请重新输入，或者将该行删除！");
        	return false;	
        }
        
        //价格必须为数字
        
        if (!isMoney(rowObj.all[price].value)) {
        	alert("第" + (parseInt(rowIndexId)+1) + "行的价格不能为字母！");
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
		
		// 遍历rowArray，然后删除明细表记录
		
		for (var i=0; i<rowArray.length; ++i) {
			var objTable = document.all['listdetail']; // 明细表
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
		nameArray[i++] = "PublishTime[@pattern='yyyy-MM-dd']";
		nameArray[i++] = "Price";
		nameArray[i++] = "TextbookType";
		addRecordToTable(objTable, nameArray);		
	}
	var checkboxIndex = <%=count%>;  //递增索引号
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

		    case 3: // 出版日期
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:80%\" class=\"input_text\" readonly />";
          	    colHTML += "&nbsp;<img src=\"/internet/image/date.gif\" width=\"13\" height=\"20\" align=\"absmiddle\" onClick=calendar(document.forms[0].elements[\""+listName + checkboxIndex + "'" + "]/" + nameArray[i]+"\"],\"yyyy-MM-dd\")>";
				break;
		   case 5: // 类型
				colHTML += "<td  nowrap>";
				colHTML += "<select  name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\"  />";
          	    colHTML += "<option value=\"-1\"  />请选择</option>";
          	    colHTML += "<option value=\"党建\"  />党建</option>";
          	    colHTML += "<option value=\"哲学\"  />哲学</option>";
          	    colHTML += "<option value=\"政治\"  />政治</option>";
          	    colHTML += "<option value=\"经济\"  />经济</option>";
          	    colHTML += "<option value=\"法学\"  />法学</option>";
          	    colHTML += "<option value=\"行政\"  />行政</option>";
          	    colHTML += "<option value=\"管理\"  />管理</option>";
          	    colHTML += "<option value=\"管理\"  />其他</option>";
          	    colHTML += "</select>";
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
</script>