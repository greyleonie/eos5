<%@ include file="/internet/common.jsp" %>
 <logic:present property="Msg">
 <script>
 alert('<bean:write property="Msg"/>');
 </script>
  </logic:present>
<%
java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String curdate = sdf.format(date);
%>

<body>
<form method="post" action="oa.prThingsManage.checkAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;用品管理—&gt;<span id="printTable">用品盘点</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" >
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction" >
		<input type="hidden" name="deleteaction" >
	
		<html:hidden property="COMM_INFO/_order/col1/field"/>
		<html:hidden property="COMM_INFO/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="COMM_CHECK/CHECKCODE" />
		
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
        <td valign="top" class="text" >
                       <table width="96%"  border="0" cellpadding="0" cellspacing="0"><tr>
				<td align="right" class="td1" align="center">
				 <!--期初时间--><input type="hidden" name="COMM_CHECK/BEGINDATE[@pattern='yyyy-MM-dd']" value="2007-08-10">
				盘点时间：<%=curdate%> <input type="hidden" name="COMM_CHECK/CHECKDATE[@pattern='yyyy-MM-dd']" value="<%=curdate%>">              
				  </td>
				  <td align="right" class="td1" align="right">
				盘点人：<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/> 
                    <html:hidden name="COMM_CHECK/CHECKER"  property="SessionEntity/operatorID" /> 
				  </td>
				</tr>
     </table>
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title">
                  <td width="3%" align="center" nowrap id="COMM_INFO.ID" onClick="talentsort()">序号</td>
                  <td width="17%" align="center" nowrap id="COMM_INFO.COMMNAME" onClick="talentsort()">品名</td>
                  <td width="5%" align="center" nowrap id="COMM_INFO.UNIT" onClick="talentsort()">计量<br/>单位</td>
                  <td width="10%" align="center" nowrap id="COMM_INFO.SPECIA" onClick="talentsort()">规格</td>
                  <td width="10%" align="center" nowrap id="COMM_INFO.PRICE" onClick="talentsort()">单价（元)</td>
                  <td width="5%" align="center" nowrap id="COMM_INFO.STORAGE" onClick="talentsort()">期初<br/>库存</td>
                  <td width="5%" align="center" nowrap id="COMM_INFO.STORAGE" onClick="talentsort()">本期<br/>入库</td>
                  <td width="5%" align="center" nowrap id="COMM_INFO.STORAGE" onClick="talentsort()">本期<br/>出库</td>
                  <td width="5%" align="center" nowrap id="COMM_INFO.STORAGE" onClick="talentsort()">帐面<br/>库存</td>
                  <td width="5%" align="center" nowrap id="COMM_INFO.STORAGE" onClick="talentsort()">实际<br/>库存</td>
                  <td width="5%" align="center" nowrap id="COMM_INFO.BALANCE" onClick="talentsort()">差额</td>
                  <td width="5%" align="center" nowrap id="COMM_INFO.REMARK" onClick="talentsort()">差额<br/>金额</td>
                  <td width="30%" align="center" nowrap id="COMM_INFO.REMARK" onClick="talentsort()">备注</td>
                </tr>
                    <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_INFO']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td nowrap align="center"><%=count%></td>
                <td nowrap><bean:write id="resultset" property='COMM_INFO/COMMNAME'/>
               				<input type="hidden" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/COMMID"  value="<bean:write id="resultset" property='COMM_INFO/COMMID'/>"   />
               				</td> 
                <td nowrap><bean:write id="resultset" property='COMM_INFO/UNITNAME'/></td>
                <td nowrap><bean:write id="resultset" property='COMM_INFO/SPECIA' /></td>
                <td nowrap align="right"><bean:write id="resultset" property='COMM_INFO/PRICE' /> 
                <input type="hidden" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/PRICE"  value="<bean:write id="resultset" property='COMM_INFO/PRICE' />" /></td>     
                <td nowrap align="right"><bean:write id="resultset" property='COMM_INFO/BEGINNUM'/>
                	<input type="hidden" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/BEGINNUM"  value="<bean:write id="resultset" property='COMM_INFO/BEGINNUM' />" /></td>
                <td nowrap align="right"><bean:write id="resultset" property='COMM_INFO/ENTRY' />
 					<input type="hidden" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/ENTRY"  value="<bean:write id="resultset" property='COMM_INFO/ENTRY' />" /></td>
                <td nowrap align="right"><bean:write id="resultset" property='COMM_INFO/DELIVERY'/>
 					<input type="hidden" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/DELIVERY"  value="<bean:write id="resultset" property='COMM_INFO/DELIVERY' />" /></td>
                <td nowrap align="right"><bean:write id="resultset" property='COMM_INFO/NOMINALNUM'/>
                    <input type="hidden" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/NOMINALNUM"  value="<bean:write id="resultset" property='COMM_INFO/NOMINALNUM' />" /></td>
                <td nowrap align="right"><input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/STOCKNUM"  value="<bean:write id="resultset" property='COMM_INFO/NOMINALNUM'/>" style="width:100%"  class="inputOA"  onkeyup="sumFee(<%=count %>)"/></td>
                <td nowrap align="right"><input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/BALANCE"  value="<bean:write id="resultset" property='COMM_INFO/BALANCE'  />" style="width:100%"  class="inputOA" readonly="readonly" /></td>
                <td nowrap align="right"><input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/AMOUNT"  value="<bean:write id="resultset" property='COMM_INFO/AMOUNT' />" style="width:100%"  class="inputOA" readonly="readonly" /></td>
                <td nowrap><input type="text" name="listInsert/COMM_CHECKDETAIL[@hciTagIndex='<%=count%>']/REMARK"    maxlength="50" style="width:100%"  style="width:100%"  class="inputOA"/></td>
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
  //	if(verifyForm(frm)){
	    frm.submit();
	// }
  
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
	var tprice =new String(parseInt(quantity - nominalnum)*parseFloat(price));
	if(tprice.indexOf(".")!=-1){
		tprice = tprice.substring(0,tprice.indexOf(".")+3);
	}
	total.value = tprice;
	if(isNaN(total.value)) total.value="";
	frm.elements[balanceName].value=quantity - nominalnum;

  }
</script>







	