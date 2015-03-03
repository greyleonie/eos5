 <%@include file="/internet/common.jsp"%>
 <SCRIPT language="JavaScript" src="/internet/scripts/autoSelect2.js" ></SCRIPT>
  <logic:present property="Msg">
	 <script>
	 	alert("<bean:write property="Msg"/>");
	 </script>
 </logic:present>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>
<body>
<form method="post" action="oa.prAssetsManage.borrowModifyDo.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;资产管理—&gt;<span id="printTable">资产领用修改</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="CAPT_BORROW/_order/col1/field"/>
		<html:hidden  property="CAPT_BORROW/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden name="CAPT_BORROW/BORROWID"  property="CAPT_BORROWVIEW/BORROWID" />
		
		
						<!--传递给选择用品层的参数-->
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
          <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                
               <tr > 
                  <td width="10%"  align="right" class="td2" nowrap="nowrap">使用部门：</td>
                  <td width="15%"  class="td1" nowrap="nowrap"><select  name="CAPT_BORROW/DepID"   id="select1" bizAction="oa.bizAssetsManage.selectAllGroup"   paramXML="" listXpath="list[@type='TeachGroup']" entityName="TeachGroup" valueField="orgID"    textField="orgName"        childID="select2"  nullLable="true" nullLableText="<bean:write property="SessionEntity/orgName"/>" nullLableValue="<bean:write property="SessionEntity/orgID"/>" onchange="refreshChild_DS(this)" ></select> 
                   </td>
                  <td width="10%"  align="right" class="td2" nowrap="nowrap">使 用 人：</td>
                  <td width="15%"  class="td1"><select name="CAPT_BORROW/BORROWERID"        id="select2" bizAction="oa.bizAssetsManage.selectTeacher"    paramXML="" listXpath="list[@type='Teacher']"     entityName="Teacher"    valueField="TeacherID" textField="operatorName"  childID=""       mainSelectID="select1" nullLable="true" nullLableText="<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/> " nullLableValue=" <bean:write property="SessionEntity/operatorID" /> "   onchange="queryTeaching()"></select>
                  </td>
				 <script language="JavaScript" type="text/JavaScript">	 	
					initSel_DS(document.getElementById("select1"));
				</script>
                  <td width="10%" align="right" class="td2" nowrap="nowrap">领用日期：</td>
                  <td width="15%" class="td1" nowrap="nowrap">
                  <html:text name="CAPT_BORROW/BORROWDATE[@pattern='yyyy-MM-dd']" property="CAPT_BORROWVIEW/BORROWDATE" attributesText='class="input" size="12" ValidateType="notempty" Msg="借用日期不能为空"' readonly="true"/>
             	  <img src="/internet/image/date.gif" width="13" height="20"  align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_BORROW/BORROWDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")> 
                  
                  </td>
              <td width="10%" align="right" class="td2" nowrap="nowrap">归还日期：</td>
                  <td width="15%" class="td1" nowrap="nowrap">
                  <html:text name="CAPT_BORROW/RETURNDATE[@pattern='yyyy-MM-dd']" property="CAPT_BORROWVIEW/RETURNDATE" attributesText='class="input" size="12"' readonly="true"/>
             	  <img src="/internet/image/date.gif" width="13" height="20"  align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_BORROW/RETURNDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")> 
                  
                  </td>
                </tr>
              </table>
              </td></tr>  
            <tr><td>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="listdetail">
                <tr class="td_title">
                  <td width="37%" align="center">品名</td>
                  <td width="10%" align="center">编码</td>
                  <td width="20%" align="center">规格</td>
                  <td width="10%" align="center">单价（元）</td>
                  <td width="*" align="center">备注</td><!--
                  <td width="5%" align="center">操作</td>
                --></tr>
                    <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type=CAPT_BORROWDETAILVIEW']"> 
                
                	<html:hidden name="listOld/CAPT_BORROWDETAIL/DETAILID" id="resultset" property="CAPT_BORROWDETAILVIEW/DETAILID" indexed="true"/>
               		<html:hidden name="listOld/CAPT_BORROWDETAIL/CAPTID" id="resultset" property="CAPT_BORROWDETAILVIEW/CAPTID" indexed="true"/>
               		
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
               <tr class="td1" onClick="changeTRBgColor(this)" id="row_<%=count %>"> 
                <td nowrap><input type="text" name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/CAPTNAME" value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/CAPTNAME'/>" style="width:100%"  readonly="readonly"  class="inputOA" />
               				<input type="hidden" id="goodID"   name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/CAPTID"  value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/CAPTID'/>"   />
               				<input type="hidden" name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/GOODNAME"  value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/GOODNAME'/>"   />
               				</td> 
                <td nowrap> <input type="text" name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/CAPTCODE"  value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/CAPTCODE'/>"  style="width:100%" readonly="readonly" class="inputOA" /></td>
                <td nowrap><input type="text" name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/SPECIA"  value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/SPECIA' />" style="width:100%"  readonly="readonly" class="inputOA"/></td>
                <td nowrap><input type="text" name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/PRICE"  value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/PRICE'/>"  style="width:100%" class="inputOA"/></td>
                <td nowrap> <input type="text" name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/REMARK" value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/REMARK'/>"   maxlength="50" style="width:100%" class="inputOA"/></td><!--
             	<td nowrap align="center"> <img  onClick="removeRowFromTable(document.all['listdetail'], 'row_<%=count%>')" src="/internet/image/delete1.gif" style="cursor: hand"></td>
              --></tr>
				</logic:iterate>
                
                
              </table>
              
                 <table width="96%" height="30"  border="0" align="center" cellpadding="0" cellspacing="1" >
     <tr class="td2"> 
                  <td align="right" class="td1">备注：</td>
                  <td  class="td1"><html:textarea name="CAPT_BORROW/REMARK" property="CAPT_BORROWVIEW/REMARK" attributesText='class="input" cols="80" rows="3"'/>     
                  </td><!--
                  <td align="center" valign="top" class="td1" >
				<input name="add" type="button" class="button_eight" value="增加资产输入栏"  onClick="insertDetail()">
				</td>
                --></tr>
  </table>
			  </td>
        </tr>
</table>

	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				  <input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="goBack()"></td>
				</tr>
     </table>
</form>
</body>
<script language="JavaScript" type="text/javascript">
  var listName = "listInsert/CAPT_BORROWDETAIL[@hciTagIndex='"; 
  function save() {
  	var frm = document.forms[0];
  	if(verifyForm(frm)){
	    frm.submit();
	 }
  
  }
  
  function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prAssetsManage.borrowList.do";
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
        return true;
    }

 function getGoodIDs() {  //得到已加入的物品
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
  /*选择物品
  */
   function selectGood(obj,index) {  //选择物品
   var frm = document.forms[0];
   var goodIDs = getGoodIDs();
	frm["detailName"].value = "CAPT_BORROWDETAIL";
	frm["index"].value = index;
	frm["goodIDs"].value = goodIDs;
	f_InitDivData(obj); //此函数在autoSelect文件中
	
	
}
	
 // 增加明细表记录
function insertDetail() {
		var objTable = document.all['listdetail']; // 明细表
		var nameArray = new Array();  //要显示字段名称
		var i = 0;
		nameArray[i++] = "CAPTNAME"; 
		nameArray[i++] = "CAPTCODE";
		nameArray[i++] = "SPECIA";
		nameArray[i++] = "PRICE";
		nameArray[i++] = "REMARK";
		nameArray[i++] = "OP";
		addRecordToTable(objTable, nameArray);		
	}
	var checkboxIndex = <%=count+1%>;  //递增索引号
	function addRecordToTable(objTable, nameArray) {
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
			case  0: // 资产名称
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/CAPTNAME\"     onclick=\"selectGood(this,"+checkboxIndex+")\"  onkeyup=\"selectGood(this,"+checkboxIndex+")\" onblur=\"f_OnBlur()\"  style=\"width:100% ;cursor:hand\" class=\"inputOA\"  readonly/>";
		  		colHTML += "<input type=\"hidden\" id=\"goodID\" name=\"" + listName + checkboxIndex + "'" + "]/CAPTID\"  />";
		  		colHTML += "<input type=\"hidden\"  name=\"" + listName + checkboxIndex + "'" + "]/GOODNAME\"  />";
		  		break;
		    case 4: //备注
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"inputOA\"  />";
				break;
		    case 5: //操作
				colHTML += "<td  nowrap align=\"center\">";
				colHTML += "<img  onClick=\"removeRowFromTable(document.all['listdetail'], 'row_"+ checkboxIndex + "')\" src=\"/internet/image/delete1.gif\" style=\"cursor: hand\"> ";
				break;	
			default:
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"    style=\"width:100%\" class=\"inputOA\" readonly/>";
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
		
		// 遍历rowArray，然后删除每一条入库单明细表记录
		
		for (var i=0; i<rowArray.length; ++i) {
			var objTable = document.all['listdetail']; // 入库单明细表
			var rowId = "row_" + rowArray[i]; 
			removeRowFromTable(objTable, rowId);
		}
	}
	 
	// 从表格中删除id为rowId的行
	var selectedRowIndex;
	function removeRowFromTable(objTable, rowId) {
		
		var tableHTML = objTable.outerHTML; 
		var locOfRowId = tableHTML.indexOf(rowId);
		var beginHTML = tableHTML.substr(0, locOfRowId);
		var endHTML = tableHTML.substr(locOfRowId+1, tableHTML.length-locOfRowId-1);
		var lastTRLoc = beginHTML.lastIndexOf("<TR");
		var beforeHTML = beginHTML.substr(0, lastTRLoc);
		var firstTRLoc = endHTML.indexOf("</TR>");
		var latterHTML = endHTML.substr(firstTRLoc+5, endHTML.length-firstTRLoc);
		
		//改变颜色
	    if (document.getElementById(selectedRowIndex)) {
	    document.getElementById(selectedRowIndex).style.backgroundColor="#FFFFFF"; }
	    selectedRowIndex = rowId;
		document.getElementById(rowId).style.backgroundColor="#999999";
		
		if (confirm("确定删除该记录吗")==true){ 
		objTable.outerHTML = beforeHTML + latterHTML; }

	}
	
		// 从表格中删除品名为空的行
	function removeRowNull(objTable) {
		var nullRowArr = new Array();
		var length = objTable.rows.length;
		for (var i=1; i< length; i++) {
    		rowObj = objTable.rows[i];
    		var rowId = rowObj.id;
    		var rowIndexId = rowId.substr(4, rowId.length-4);  
    		var goodName = listName + rowIndexId + "']/CAPTNAME";
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