<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prThingsManage.typeManager.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;用品管理—&gt;<span id="printTable">用品类别列表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prThingsManage.typeManager.do">
		
		<input type="hidden" name="modifytoSave" value="oa.prThingsManage.typeModifyToSave.do">
		
		<html:hidden property="COMM_TYPE/_order/col1/field"/>
		<html:hidden property="COMM_TYPE/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" />
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
				<a>类别名称</a>： 
			    <html:text property="COMM_TYPE/TYPENAME/criteria/value" attributesText='class="input"'/>
			    <html:hidden property="COMM_TYPE/TYPENAME/criteria/operator" value="like"/>
			    <html:hidden property="COMM_TYPE/TYPENAME/criteria/likeRule" value="center"/>
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
                <input name="add" type="button" class="button_02" value="新 增" onClick="insertDetail()">
                <input name="delete" type="button" class="button_02" value="删 除" onClick="deleteDetails()">
                <input name="modifytoSave" type="button" class="button_02" value="修改保存" onClick="saveDetail('listdetail')">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
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
                  <td width="30%" align="center" nowrap id="COMM_TYPE.TYPEID" onClick="talentsort()">编号</td>
                  <td width="30%" align="center" nowrap id="COMM_TYPE.TYPENAME" onClick="talentsort()">类别名称</td>
                  <td width="37%" align="center" nowrap id="COMM_TYPE.REMARKS" onClick="talentsort()">备 注</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_TYPE']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td align="center">&nbsp;</td>
                <td nowrap onDblClick="toEditable()">&nbsp;<bean:write id="resultset" property="COMM_TYPE/TYPEID"/></td>
                <td nowrap onDblClick="toEditable()">&nbsp;<bean:write id="resultset" property="COMM_TYPE/TYPENAME"/></td>
                <td nowrap onDblClick="toEditable()">&nbsp;<bean:write id="resultset" property="COMM_TYPE/REMARK"/></td>
                </logic:iterate> 
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>
			  </td>
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
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="用品类别列表">
<input type="hidden" name="xmlfcc">
</form>
<p><font color="#C0C0C0"><b>说明：</b></font></p>
<p><font color="#C0C0C0">双击鼠标修改，修改完后点“修改保存”按钮</font></p>
</body>

<script>
    var listNameInsert = "list[@type='insert']/COMM_TYPE[@hciTagIndex='"; 
    var listNameUpdate = "list[@type='update']/COMM_TYPE[@hciTagIndex='"; 
    var nameArray = new Array();  //要显示字段名称
	nameArray[0] = "TYPEID"; 
	nameArray[1] = "TYPENAME";
	nameArray[2] = "REMARK"; 
//在列表页面修改并保存
function saveDetail(tableName) {
	var tableObj = document.getElementById(tableName);
	var frm = document.forms[0];
	if(!tableObj) return;
	var rowsObj = tableObj.rows;
	for(var i = 1; i < rowsObj.length; i++) {
		
		if(rowsObj[i].getAttribute("modify")!=null && rowsObj[i].getAttribute("modify") == "yes") {
			var tds = rowsObj[i].cells;
			for(var j = 0; j < tds.length; j++) {
				if(j == 0) {
					var checkBoxObj = tds[j].childNodes[0];
					//var newElemnt = document.createElement("<input type='hidden' name='"+elementName+"' value='" + checkBoxObj.value + "'>");
					//frm.appendChild(newElemnt);
				}else{
					var elementName = listNameUpdate + i +  "']/" + nameArray[j-1];
					var pattern1 = /&nbsp;/gi;
					var pattern2 = /<INPUT .*?>/gi;
					var pattern3 = /(< *IMG [^>]*>)/gi;
					var tdObjValue = tds[j].innerText.replace(pattern1,"");
					tdObjValue = tdObjValue.replace(pattern2,"");
					tdObjValue = tdObjValue.replace(pattern3,"");
					alert("<input type='hidden' name="+elementName+" value='" + tdObjValue + "'>");
					var newElemnt = document.createElement("<input type='hidden' name="+elementName+" value='" + tdObjValue + "'>");
					frm.appendChild(newElemnt);
				}
			}//for
		}//if
	}//for
  	frm.action = "oa.prThingsManage.typeModifyToSave.do";
	frm.submit();
  
  }



function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}


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
	
	 
	
 // 增加明细表记录
	function insertDetail() {
		
		var objTable = document.all['listdetail']; // 明细表

	
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
			default:
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameInsert + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\" />";
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
<script>
	loadOrderImg(document.forms[0],'COMM_TYPE');
</script>