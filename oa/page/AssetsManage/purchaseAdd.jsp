 <%@include file="/internet/common.jsp"%>
 <logic:present property="Msg">
	 <script>
	 	alert("<bean:write property="Msg"/>");
	 </script>
 </logic:present>
<%
java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
java.text.SimpleDateFormat stf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String curdate = sdf.format(date);
date.setHours(date.getHours()+8);
String curTime=stf.format(date);
%>
<script>
//得到计量单位SELECT
function createUnitOption(name){
var result = "";
	result += "<select name=\""+name+"\" style=\"width:100%\" class=\"inputOA\" >";
	<logic:iterate id="set"  property="list[type='Unit']" >
	result +=  "<option  value='<bean:write id="set" property="Unit/businID"/>'><bean:write id="set" property="Unit/businName"/></option>";
	</logic:iterate>
	result += "</select>";
	return result;

}

//var tabbox1 = new TabComponent("tab1c")
//tabbox1.add("basedata","基础数据",1,"document.getElementById('tail').style.display = 'inline'");
//tabbox1.add("attachment","附 件",0,"document.getElementById('tail').style.display = 'none'");

//			 tabbox1.init()
</script>

<body>
<form method="post" action="oa.prAssetsManage.purchaseAddDo.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;资产管理—&gt;<span id="printTable">采购申请新增</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="CAPT_PURCHASEVIEW/_order/col1/field"/>
		<html:hidden  property="CAPT_PURCHASEVIEW/_order/col1/asc" />
		
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
		
	  </td>
    </tr>
  </table>
      	<script>
		</script>
          <!------------------------------  文头  ----------------------------->
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">广州市党校资产采购申请</td>
				</tr>
			</table>
			<DIV id="basedata">
     <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0" class="table">
      <tr>
      <td height="8">
	  </td>
      </tr>
      
        <tr>
          <td>
		<!------------------------------  表单意见  ----------------------------->
          <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                 <tr> 
                  <td  width="10%" align="right" class="td2">申请单编号：</td>
                  <td width="10%" class="td1">&nbsp;<bean:write property="CAPT_PURCHASE/PURCHASECODE"/> 
                    <html:hidden property="CAPT_PURCHASE/PURCHASECODE"/> </td>
                  <td width="10%" align="right" class="td2">申请日期：</td>
                  <td width="10%" class="td1">&nbsp;<%=curdate%> <input type="hidden" name="CAPT_PURCHASE/PURCHASEDATE[@pattern='yyyy-MM-dd HH:mm:ss']" value="<%=curTime%>"></td>
                  <td width="10%" align="right" class="td2">申请部门：</td>
                  <td width="20%" class="td1">&nbsp; <bean:write property="SessionEntity/orgName"/>
                  <html:hidden name="CAPT_PURCHASE/DepID" property="SessionEntity/orgID"/> </td>
                  <td width="10%" align="right" class="td2">申 请 人：</td>
                  <td width="20%" class="td1">&nbsp;<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/> 
                    <html:hidden name="CAPT_PURCHASE/RequestID"  property="SessionEntity/operatorID" /> 
                  </td>
                </tr>
             
              </table>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="listdetail">
                <tr class="td_title">
                  <td width="30%" nowrap="nowrap" align="center">品名</td>
                  <td width="5%" nowrap="nowrap" align="center">单位</td>
                  <td width="10%" nowrap="nowrap" align="center">规格</td>
                  <td width="10%" nowrap="nowrap" align="center">数量</td>
                  <td width="10%" nowrap="nowrap" align="center">供应商1报价</td>
                  <td width="10%" nowrap="nowrap" align="center">供应商2报价</td>
                  <td width="10%" nowrap="nowrap" align="center">供应商3报价</td>
                  <td width="5%" nowrap="nowrap" align="center">操作</td>
                </tr>
                
                     <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="listInsert"> 
                <%
					count++;
			       %>
              <tr class="td1" id="row_<%=count%>">
                <td nowrap ><input type="text" name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/CAPTNAME" onkeydown="javascript:f_OnKeyDown(this,event,<%=count %>)"  onkeyup="f_OnKeyUp(this,event)" onblur="f_OnBlur()" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/CAPTNAME" />'/> </td>
                <td nowrap ><input type="text" name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/UNITNAME" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/UNITNAME"/>'/></td>
                <td nowrap ><input type="text" name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/SEPCIFICATION" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/SEPCIFICATION"/>'/></td>
                <td nowrap ><input type="text" name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/QUANTITY" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/QUANTITY"/>'/></td>
                <td nowrap ><input type="text" name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/PRICE1" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/PRICE1"/>'/></td>
				<td nowrap ><input type="text" name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/PRICE2" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/PRICE2"/>'/></td>
				<td nowrap ><input type="text" name="listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='<%=count%>']/PRICE3" style="width:100%" class="inputOA"  value='<bean:write id="resultset" property="CAPT_PURCHASEDETAIL/PRICE3"/>'/></td>
				<td nowrap align="center"><img  onClick='removeRowFromTable(document.all["listdetail"], "row_<%=count %>")' src="/internet/image/delete1.gif" style="cursor: hand"></td>
				</tr>
				</logic:iterate>          
              </table>

        <table width="96%" height="30"  border="0" align="center" cellpadding="0" cellspacing="1" >
       		<tr class="td2"> 
                  <td align="right" nowrap="nowrap" class="td2">申请事由：</td>
                  <td colspan="7" class="td1"><textarea name="CAPT_PURCHASE/Reason" rows="3" cols="80"></textarea> 
                  </td>

                  <td align="center" valign="top" class="td1" >
				<input name="add" type="button" class="button_eight" value="增加资产输入栏"  onClick="insertDetail()">
				</td>
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
		  <html:text property="CAPT_PURCHASE/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="CAPT_PURCHASE/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','CAPT_PURCHASE/nextParticipantName','CAPT_PURCHASE/nextParticipantId')">
		  </td>
        </tr>
      </table>
<!------------------------------  文尾  ----------------------------->			
	   <table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="spacedown">
				<tr><td></td></tr>
		</table>
	</td></tr>
</table>

     </DIV>
	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				  <input name="wfsend" type="button" class="button_02" value="发 送" onClick="send()">
				  <input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="goBack()"></td>
				</tr>
     </table>
     <!------------------------------  编辑正文  开始 ----------------------------->
			  <!--<DIV id="attachment">
			  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
				<tr><td width="100%" height="600px" align="center">
				<iframe src='/iWebOffice/SendArchive/DocumentEdit3.jsp?Purview=edit&FileType=.doc&Template=' frameborder="0" width="100%" name="sendText" style=" height: 100%" scrolling="no"></iframe>
				</td></tr>
				<tr valign="top"> 
				<td width="100%" height="50" align="center" valign="middle">
				  <input name="wfcancel" type="button" class="button_02" value="保 存" onClick="document.getElementById('tab1c_tabcon1').click()">
				</td>
			    </tr>
        	  </table>
        	  </DIV>-->
        	  <!------------------------------  编辑正文  结束 ----------------------------->
        	  
        	  <script>
			</script>
</form>
</body>
<script>
			//tabbox1.inithidetab();
	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>



<script language="JavaScript" type="text/javascript">
  var listName = "listInsert/CAPT_PURCHASEDETAIL[@hciTagIndex='"; 
  function save() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "0";
		if(verifyForm(frm)) {
			getWFData(frm);
			//saveFile();
			frm.submit();	
		}

}
function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(verifyForm(frm)) {
				if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["CAPT_PURCHASE/nextParticipantId"].value == ""){
					alert("请选择下环节人员");
					return;
				}
			}
			getWFData(frm);
			//saveFile();
			frm.submit();	
		}

}

function saveFile() {
   var webOffice = document.getElementById("sendText").contentWindow.document.getElementById("WebOffice");
   if (!webOffice.WebSave()){
     alert(webOffice.Status);
     return false;
   }
   var webform = document.getElementById("sendText").contentWindow.document.webform;
   webform.submit();
}

 function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prAssetsManage.purchaseList.do";
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
    	var commName = listName + rowIndexId + "']/CAPTNAME";
    	var price1 = listName + rowIndexId + "']/PRICE1";
    	var price2 = listName + rowIndexId + "']/PRICE2";
    	var price3 = listName + rowIndexId + "']/PRICE3";
    	
       // 品名
        if (isEmpty(rowObj.all[commName].value)) {
        	alert("品名不能为空");
        	return false;	
        }
    	// 数量
        if (!isNumeric(rowObj.all[quantityName].value)||isEmpty(rowObj.all[quantityName].value)) {
        	alert("数量不能为空且必须是数字");
        	return false;	
        }
            	// 报价
        if (!isNumeric(rowObj.all[price1].value)||!isNumeric(rowObj.all[price2].value)||!isNumeric(rowObj.all[price3].value)) {
        	alert("报价不能有字母");
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
		var nameArray = new Array();  //要显示字段名称
		var i = 0;
		nameArray[i++] = "CAPTNAME"; 
		nameArray[i++] = "UNITCODE";
		nameArray[i++] = "SPECIA";
		nameArray[i++] = "QUANTITY";
		nameArray[i++] = "PRICE1";
		nameArray[i++] = "PRICE2";
		nameArray[i++] = "PRICE3";
		nameArray[i++] = "OP";
		addRecordToTable(objTable, nameArray);		
	}
	var checkboxIndex = 0;  //递增索引号
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
			case  0: // 用品名称
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/CAPTNAME\"  style=\"width:100%\" class=\"inputOA\" />";
		  		break;
		  		
		  case  1: //单位
				colHTML += "<td  nowrap>";
				colHTML += createUnitOption(listName + checkboxIndex + "'" + "]/" + nameArray[i] );
				break;
		 case 7: //操作
				colHTML += "<td  nowrap align=\"center\">";
				colHTML += "<img  onClick=\"removeRowFromTable(document.all['listdetail'], 'row_"+checkboxIndex+"')\" src=\"/internet/image/delete1.gif\" style=\"cursor: hand\"> ";
				break;	
			default:
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName+ checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"inputOA\" />";
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
		var cells;
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
		   objTable.outerHTML = beforeHTML + latterHTML;
	    }

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
	
		function onLoad(){
		for(var i = 0 ;i<5 ;i++){ //初进入页面默认5行
		insertDetail();
	}
	}
	onLoad();
</script>