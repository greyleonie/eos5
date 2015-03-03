<%@ include file="/internet/common.jsp" %>
<%
java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String curdate = sdf.format(date);
%>

<script>
//得到计量单位SELECT
function createUnitOption(name){
	var result = "";
	result += "<select name=\""+name+"\">";
	<logic:iterate id="set"  property="list[type='Unit']" >
	result +=  "<option  value='<bean:write id="set" property="Unit/businID"/>'><bean:write id="set" property="Unit/businName"/></option>";
	</logic:iterate>
	result += "</select>";
	return result;

}

function Good(COMMID,TYPEID,COMMNAME,SPECIA,UNITID,PRICE,STORAGE,REMARK,UNITNAME,TYPENAME,BEGINTIME,BEGINNUM,STOCKTIME,DELIVERY,ENTRY,NOMINALNUM) {  //物品对象
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
	this.BEGINTIME = BEGINTIME;
	this.BEGINNUM = BEGINNUM;
	this.STOCKTIME = STOCKTIME;
	this.DELIVERY = DELIVERY;
	this.ENTRY = ENTRY;
	this.NOMINALNUM = NOMINALNUM;
	function compareByID(patternStr) {
		return this.COMMID==patternStr;
	}
	this.isMatch = compareByID;
}
var goodsArray = new Array();
<logic:iterate id="allgoods" property="list[@type='COMM_INFO']">

	goodsArray[goodsArray.length] = new Good('<bean:write id="allgoods" property="COMM_INFO/COMMID"/>','<bean:write id="allgoods" property="COMM_INFO/TYPEID"/>','<bean:write id="allgoods" property="COMM_INFO/COMMNAME"/>','<bean:write id="allgoods" property="COMM_INFO/SPECIA"/>','<bean:write id="allgoods" property="COMM_INFO/UNITID"/>','<bean:write id="allgoods" property="COMM_INFO/PRICE"/>','<bean:write id="allgoods" property="COMM_INFO/STORAGE"/>','<bean:write id="allgoods" property="COMM_INFO/REMARK"/>','<bean:write id="allgoods" property="COMM_INFO/UNITNAME"/>','<bean:write id="allgoods" property="COMM_INFO/TYPENAME"/>','<bean:write id="allgoods" property="COMM_INFO/BEGINTIME"/>','<bean:write id="allgoods" property="COMM_INFO/BEGINNUM"/>','<bean:write id="allgoods" property="COMM_INFO/STOCKTIME"/>','<bean:write id="allgoods" property="COMM_INFO/DELIVERY"/>','<bean:write id="allgoods" property="COMM_INFO/ENTRY"/>','<bean:write id="allgoods" property="COMM_INFO/NOMINALNUM"/>');
</logic:iterate>
</script>
<body>
<form method="post" action="oa.prThingsManage.checkModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;用品管理—&gt;<span id="printTable">用品盘点修改</span></td>
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
	
		<html:hidden property="COMM_CHECK/_order/col1/field"/>
		<html:hidden property="COMM_CHECK/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
		
		
		<input type="hidden" name="COMM_CHECK/CHECKID" >
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
                  <td width="10%" align="right" class="td2">盘点编号：</td>
                  <td width="20%"  class="td1">&nbsp;<bean:write property="COMM_CHECK/CHECKCODE"/> 
                    <html:hidden property="COMM_CHECK/CHECKCODE"/></td>
                  <td width="10%" align="right" class="td2">盘点日期：</td>
                  <td width="20%"  class="td1"><bean:write  property="COMM_CHECK/CHECKDATE" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                  <td width="10%" align="right" class="td2">盘 点 人：</td>
                  <td width="30%" class="td1"><bean:write  property="COMM_CHECK/operatorName"/> </td>
                </tr>
                <tr> 
                  <td align="right" class="td2">备注：</td>
                  <td colspan="5"  class="td1">
				  <html:textarea property="COMM_CHECK/REMARK" attributesText='rows="3" cols="60"'/>
				  </td>
                </tr>
              </table>
            
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
         
            <tr>
              <td align="right"> 
                                 <input type="button" class="button_02" value="新 增" onClick="selectGoods(1)">
                                 <input type="button" class="button_02"  value="删 除" onClick="deleteDetails()">
                &nbsp; </td>
            </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="chkall" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="17%" align="center" nowrap id="COMM_COMMODITYINFO.COMMNAME" onClick="talentsort()">品名</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.UNIT" onClick="talentsort()">计量<br/>单位</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.SPECIA" onClick="talentsort()">规格</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.PRICE" onClick="talentsort()">单价（元)</td>
                  <td width="5%" align="center" nowrap id="COMM_COMMODITYINFO.STORAGE" onClick="talentsort()">期初<br/>库存</td>
                  <td width="5%" align="center" nowrap id="COMM_COMMODITYINFO.STORAGE" onClick="talentsort()">本期<br/>入库</td>
                  <td width="5%" align="center" nowrap id="COMM_COMMODITYINFO.STORAGE" onClick="talentsort()">本期<br/>出库</td>
                  <td width="5%" align="center" nowrap id="COMM_COMMODITYINFO.STORAGE" onClick="talentsort()">帐面<br/>库存</td>
                  <td width="5%" align="center" nowrap id="COMM_COMMODITYINFO.STORAGE" onClick="talentsort()">实际<br/>库存</td>
                  <td width="5%" align="center" nowrap id="COMM_COMMODITYINFO.BALANCE" onClick="talentsort()">差额</td>
                  <td width="5%" align="center" nowrap id="COMM_COMMODITYINFO.REMARK" onClick="talentsort()">合计<br/>金额</td>
                  <td width="30%" align="center" nowrap id="COMM_COMMODITYINFO.REMARK" onClick="talentsort()">备注</td>
                </tr>
                 <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type=COMM_CHECKDETAILVIEW']"> 
                
                	<html:hidden name="listOld/COMM_CHECKDETAIL/DETAILID" id="resultset" property="COMM_CHECKDETAILVIEW/DETAILID" indexed="true"/>
               		<html:hidden name="listOld/COMM_CHECKDETAIL/COMMID" id="resultset" property="COMM_CHECKDETAILVIEW/COMMID" indexed="true"/>
               		<html:hidden name="listOld/COMM_CHECKDETAIL/STOCKNUM" id="resultset"  property="COMM_CHECKDETAILVIEW/STOCKNUM" indexed="true"/>
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
               <tr class="td1" onClick="changeTRBgColor(this)" id="row_<%=count %>">  
                <td align="center"> 
				<input type="checkbox" name="GoodCheckBox" value="<%=count%>" />
				</td>
                <td nowrap><input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/COMMNAME" value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/COMMNAME'/>" style="width:100%"  readonly="readonly"  class="inputOA" />
               				<input type="hidden" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/COMMID"  value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/COMMID'/>"   />
               				</td> 
                <td nowrap> <input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/UNIINAME"  value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/UNITNAME'/>"  style="width:100%" readonly="readonly" class="inputOA" /></td>
                <td nowrap><input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/SPECIA"  value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/SPECIA' />" style="width:100%"  readonly="readonly" class="inputOA"/></td>
                <td nowrap><input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/PRICE"  value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/PRICE'/>"  style="width:100%" class="inputOA"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/BEGINNUM"  value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/BEGINNUM'/>" style="width:100%" readonly="readonly" class="inputOA" /></td>
                <td nowrap> <input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/ENTRY"  value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/ENTRY'/>" style="width:100%" readonly="readonly" class="inputOA" /></td>
                <td nowrap> <input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/DELIVERY"  value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/DELIVERY'/>" style="width:100%" readonly="readonly" class="inputOA"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/NOMIALNUM"  value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/NOMIALNUM'/>" style="width:100%" readonly="readonly" class="inputOA"  /></td>
                <td nowrap> <input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/STOCKNUM"  value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/STOCKNUM'/>" style="width:100%"  class="inputOA"  onkeyup="sumFee(<%=count %>)"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/BALANCE"  value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/BALANCE'/>" style="width:100%" readonly="readonly" class="inputOA" /></td>
                <td nowrap> <input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/AMOUNT"  value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/AMOUNT'/>"style="width:100%" readonly="readonly" readonly="readonly" class="inputOA"/></td>
                <td nowrap> <input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/REMARK" value="<bean:write id="resultset" property='COMM_CHECKDETAILVIEW/REMARK'/>"   maxlength="50" style="width:100%" class="inputOA"/></td>
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
 var listName = "listInsert/COMM_CHECKDETAIL[@hciTagIndex='"; 
  function save() {
  	var frm = document.forms[0];
  	if(verifyForm(frm)){
	    frm.submit();
	 }
  
  }

  function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prThingsManage.checkManage.do";
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
    	var quantityName = listName + rowIndexId + "']/STOCKNUM";

    	
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
 	 var quantityName = listName + index +"']/STOCKNUM";
 	 var amountName = listName + index +"']/AMOUNT";
 	 var balanceName = listName + index +"']/BALANCE";
 	 var nominalnumName = listName + index +"']/NOMINALNUM";
 	 var price = frm.elements[priceName].value;
 	 var quantity = frm.elements[quantityName].value;
 	 var nominalnum = frm.elements[nominalnumName].value;
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
	frm.elements[balanceName].value=quantity - nominalnum;

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
			insertDetail(getGoodInfo(ret[goods].COMMID));
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
		nameArray[i++] = "BEGINNUM";
		nameArray[i++] = "ENTRY";
		nameArray[i++] = "DELIVERY";
		nameArray[i++] = "NOMINALNUM";
		nameArray[i++] = "STOCKNUM";
		nameArray[i++] = "BALANCE";
		nameArray[i++] = "AMOUNT";
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
		  		colHTML += "<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/BEGINTIME\"  value=\""+good.BEGINTIME+"\"  />";
		  		colHTML += "<input type=\"hidden\" name=\"" + listName + checkboxIndex + "'" + "]/STOCKTIME\"  value=\""+good.STOCKTIME+"\"  />";
		  		break;
			case 3: // 单价
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  value=\""+good.PRICE+"\" style=\"width:100%\" class=\"inputOA\"  />";
				break;
			case 8: // 盘点库存
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"inputOA\" onkeyup=\"sumFee("+checkboxIndex+")\"/>";
				break;
		   case 9: // 差额
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"  style=\"width:100%\" class=\"inputOA\" />";
				break;
		   case 10: //合计金额
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" id=\"account\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\"   style=\"width:100%\" class=\"inputOA\" readonly />";
				break;
		  case 11: //备注
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
  
</script>







	