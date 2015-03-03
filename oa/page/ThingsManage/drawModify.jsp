<%@ include file="/internet/common.jsp" %>
<SCRIPT language="JavaScript" src="/internet/scripts/autoSelect.js" ></SCRIPT>
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
<form method="post" action="oa.prThingsManage.drawModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;用品管理—&gt;<span id="printTable">用品出库修改</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" >
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction" >
		<input type="hidden" name="deleteaction" >
		<input type="hidden" name="viewaction" >
	
		<html:hidden property="COMM_DRAW/_order/col1/field"/>
		<html:hidden property="COMM_DRAW/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
		
		
		<html:hidden name="COMM_DRAW/DRAWID" property="COMM_DRAWVIEW/DRAWID"  />
		
								<!--传递给选择用品层的参数-->
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
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td class="text">
          <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1"  bgcolor="#A2C4DC">
                <tr> 
                  <td width="10%"  align="right" class="td2">发放编号：</td>
                  <td width="20%"  class="td1">&nbsp;<bean:write property="COMM_DRAWVIEW/DRAWCODE"/> </td>
                  <td width="10%"  align="right" class="td2">发放日期：</td>
                  <td width="20%"  class="td1">&nbsp;<bean:write property="COMM_DRAWVIEW/DRAWDATE"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                  <td width="10%"  align="right" class="td2">操 作 人：</td>
                  <td width="30%"  class="td1" > <bean:write  property="COMM_DRAWVIEW/OPERATORNAME" /> </td>
                </tr>
                <tr > 
                  <td align="right" class="td2">领用部门：</td>
                  <td class="td1"><bean:write   property="COMM_DRAWVIEW/BRANCHNAME" /> 
                   </td>
                  <td align="right" class="td2">领 用 人：</td>
                  <td class="td1" colspan="3"><bean:write  property="COMM_DRAWVIEW/PROPOSERNAME"/>
                </tr>
              </table>
            
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
         
            <tr>
        <td height="30" class="td1" align="right"><input name="add" type="button" class="button_eight" value="增加用品输入栏" onClick="insertDetail()"></td>
            </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="30%" align="center" nowrap id="COMM_DRAWDETAILVIEW.COMMNAME" onClick="talentsort()">品名</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAILVIEW.SPECIA" onClick="talentsort()">规格</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAILVIEW.PRICE" onClick="talentsort()">单价（元)</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAILVIEW.QUANTITY" onClick="talentsort()">数量</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWDETAILVIEW.UNIT" onClick="talentsort()">单位</td>
                  <td width="5%" align="center" nowrap id="COMM_DRAWDETAILVIEW.AMOUNT" onClick="talentsort()">合计金额（元)</td>
                  <td width="20%" align="center" nowrap id="COMM_DRAWDETAILVIEW.REMARK" onClick="talentsort()">备注</td>
                  <td width="5%" align="center" nowrap id="COMM_DRAWDETAIL.REMARK" onClick="talentsort()">操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type=COMM_DRAWDETAILVIEW']"> 
                
                	<html:hidden name="listOld/COMM_DRAWDETAIL/DETAILID" id="resultset" property="COMM_DRAWDETAILVIEW/DETAILID" indexed="true"/>
               		<html:hidden name="listOld/COMM_DRAWDETAIL/COMMID" id="resultset" property="COMM_DRAWDETAILVIEW/COMMID" indexed="true"/>
               		<html:hidden name="listOld/COMM_DRAWDETAIL/QUANTITY" id="resultset"  property="COMM_DRAWDETAILVIEW/QUANTITY" indexed="true"/>
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
               <tr class="td1" onClick="changeTRBgColor(this)" id="row_<%=count %>">  
                <td nowrap><input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/COMMNAME" value="<bean:write id="resultset" property='COMM_DRAWDETAILVIEW/COMMNAME'/>" style="width:100%"  readonly="readonly"  class="inputOA" />
               				<input type="hidden" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/COMMID"  value="<bean:write id="resultset" property='COMM_DRAWDETAILVIEW/COMMID'/>"   />
               				</td>
                <td nowrap><input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/SPECIA"  value="<bean:write id="resultset" property='COMM_DRAWDETAILVIEW/SPECIA' />" style="width:100%"  readonly="readonly" class="inputOA"/></td>
                <td nowrap><input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/PRICE"  value="<bean:write id="resultset" property='COMM_DRAWDETAILVIEW/PRICE'/>"  style="width:100%" class="inputOA"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/QUANTITY"  value="<bean:write id="resultset" property='COMM_DRAWDETAILVIEW/QUANTITY'/>" style="width:100%" class="inputOA"  onkeyup="sumFee(<%=count %>)"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/UNIINAME"  value="<bean:write id="resultset" property='COMM_DRAWDETAILVIEW/UNITNAME'/>"  style="width:100%" readonly="readonly" class="inputOA" /></td>
                <td nowrap> <input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/AMOUNT"  value="<bean:write id="resultset" property='COMM_DRAWDETAILVIEW/AMOUNT'/>"style="width:100%"  readonly="readonly" class="inputOA"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_DRAWDETAIL[@hciTagIndex='<%=count%>']/REMARK" value="<bean:write id="resultset" property='COMM_DRAWDETAILVIEW/REMARK'/>"   maxlength="50" style="width:100%" class="inputOA"/></td>
                <td nowrap align="center"><img  onClick="removeRowFromTable(document.all['listdetail'], 'row_ <%=count%>')" src="/internet/image/delete1.gif" style="cursor: hand"></td>
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
    	var quantityName = listName + rowIndexId + "']/QUANTITY";
    	var priceName = listName + rowIndexId + "']/PRICE";
    	
    	// 购数
        if (!isNumeric(rowObj.all[quantityName].value)||isEmpty(rowObj.all[quantityName].value)) {
        	alert("数字不能为空且必须是数字");
        	return false;	
        }
        //单价
        if (!isNumeric(rowObj.all[priceName].value)||isEmpty(rowObj.all[priceName].value)) {
        	alert("单价不能为空且必须是数字");
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
	frm["detailName"].value = "COMM_DRAWDETAIL";
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
		formHTML += "<tr class=\"td1\" id=\"row_" + checkboxIndex + "\">";
		for (var i=0; i<nameArray.length; i++) {
			var colHTML = "";
			switch (i) {
			case  0: // 用品名称
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/COMMNAME\"  onclick=\"selectGood(this,"+checkboxIndex+")\"  onkeyup=\"selectGood(this,"+checkboxIndex+")\" onblur=\"f_OnBlur()\"    style=\"width:100%\" class=\"inputOA\"  />";
		  		colHTML += "<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/COMMID\"      id=\"goodID\" />";
		  		break;
			case 2: // 单价
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"inputOA\" onkeyup=\"sumFee("+checkboxIndex+")\"  />";
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
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"inputOA\"  />";
				break;
	      case 8: //操作
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
		var objTable = document.all['listdetail']; // 明细表
		
		// 递增 checkboxIndex
		checkboxIndex ++ ;
	}
	// 从表格中删除id为rowId的行
	function removeRowFromTable(objTable, rowId) {
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