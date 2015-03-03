<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prBookManage.inventoryModifyDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable" >
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教材管理—&gt;教材盘点修改</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		<html:hidden property="TextbookInventoryDetail/_order/col1/field"/>
		<html:hidden property="TextbookInventoryDetail/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table" >
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">

        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"  id="sortTable">
        
             
         <tr class="td_title"> 
                 
                  <td width="20%" align="center" nowrap rowspan="2" id="TextbookInventoryDetail.Title" onClick="talentsort()">书 名</td>
                  <td width="15%" align="center" nowrap rowspan="2" id="TextbookInventoryDetail.Author" onClick="talentsort()">作 者</td>
                  <td width="15%" align="center" nowrap rowspan="2" id="TextbookInventoryDetail.Publisher" onClick="talentsort()">出版社</td>
                  <td width="5%" align="center" nowrap rowspan="2" id="TextbookInventoryDetail.TextbookType" onClick="talentsort()">出版时间</td>
                   <td width="12%" align="center" nowrap rowspan="2" id="TextbookInventoryDetail.StockTime" onClick="talentsort()">盘点时间</td>
                   <td width="5%" align="center" nowrap rowspan="2">期初<br/>结存</td>
                  <td width="5%" align="center" nowrap rowspan="2">入库</td>
                  <td width="5%" align="center" nowrap colspan="2">出库</td>
                  <td width="5%" align="center" nowrap rowspan="2">帐面<br/>库存</td>
                  <td width="5%" align="center" nowrap rowspan="2">盘点<br/>库存</td>
                  <td width="5%" align="center" nowrap rowspan="2">差额</td>
                  <td width="15%" align="center" nowrap rowspan="2" id="TextbookInventoryDetail.Remarks" onClick="talentsort()">备 注</td>
                </tr>
                <tr class="td_title"> 
                <td width="5%" align="center" nowrap >发放</td>
                <td width="5%" align="center" nowrap >报废</td>
                </tr> 
              <tr class="td1" onClick="changeTRBgColor(this)" >  
              <html:hidden name="TextbookInventory/InventoryID" property="TextbookInventoryDetail/InventoryID"/>
                <td nowrap>&nbsp;<bean:write  property='TextbookInventoryDetail/Title'/></td>
                 <td nowrap>&nbsp;<bean:write  property='TextbookInventoryDetail/Author'/></td>
                <td nowrap>&nbsp;<bean:write  property='TextbookInventoryDetail/Publisher'/></td>
                <td nowrap>&nbsp;<bean:write  property='TextbookInventoryDetail/PublishTime' formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td nowrap>&nbsp;<bean:write  property='TextbookInventoryDetail/StockTime' formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td nowrap>&nbsp;<html:text  name="TextbookInventory/Balance" property="TextbookInventoryDetail/Balance" attributesText='class="input" width="100%"  size="4"' readonly= "true" /></td>
                <td nowrap>&nbsp;<html:text  name="TextbookInventory/Entry" property='TextbookInventoryDetail/Entry' attributesText='class="input" width="100%" ValidateType="int" Msg="入库只能为数字" size="4"' readonly= "true"/></td>
                <td nowrap>&nbsp;<html:text  name="TextbookInventory/Delivery" property="TextbookInventoryDetail/Delivery" attributesText='class="input" width="100%" ValidateType="int" Msg="发放出库只能为数字" size="4"' readonly= "true"/></td>
                <td nowrap>&nbsp;<html:text  name="TextbookInventory/DeliveryDestroy" property="TextbookInventoryDetail/DeliveryDestroy" attributesText='class="input" width="100%" ValidateType="int" Msg="报废出库只能为数字" size="4"' readonly= "true"/></td>
                <td nowrap>&nbsp;<html:text name="TextbookInventory/NominalNum" property="TextbookInventory/NominalNum" attributesText='class="input" width="100%" ValidateType="int" Msg="盘点数只能为数字" size="4"' readonly= "true"/></td>
                <td nowrap>&nbsp;<html:text name="TextbookInventory/StockNum" property="TextbookInventoryDetail/StockNum" attributesText='class="input" width="100%" ValidateType="int" Msg="盘点数只能为数字" size="4"' onkeyup="changeStock()"/></td>
                <td nowrap>&nbsp;<html:text  name="TextbookInventory/Diff" property="TextbookInventoryDetail/Diff" attributesText='class="input" width="100%"  size="4"' readonly= "true" /></td>
                <td nowrap>&nbsp;<html:text  name="TextbookInventory/Remarks" property="TextbookInventoryDetail/Remarks" maxlength="50" attributesText='class="input" size="10"' /></td>
              
              <html:hidden  name="TextbookInventory/TextbookID" property="TextbookInventoryDetail/TextbookID"  />
              </tr>

                
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
</body>


<script language="JavaScript" type="text/javascript">

  function save() {
  	var frm = document.forms[0];
  	if(validater(frm)){
	 	frm.submit();
	 }
  
  }
	
	// 返回到查询页面
	function goBack() {
		window.location.href = "teachWorkManage.prBookManage.inventoryList.do";
	}

		var frm = document.opeForm;
		var balance = opeForm.elements["TextbookInventory/Balance"].value;
		var entry = opeForm.elements["TextbookInventory/Entry"].value;
		var Delivery = opeForm.elements["TextbookInventory/Delivery"].value;
		var DeliveryDestroy = opeForm.elements["TextbookInventory/DeliveryDestroy"].value;
		var NominalNum_value = parseInt(balance) + parseInt(entry) - parseInt(Delivery) - parseInt(DeliveryDestroy);
		opeForm.elements["TextbookInventory/NominalNum"].value = NominalNum_value;
	function changeStock() {

		var StockNum_value = opeForm.elements["TextbookInventory/StockNum"].value;
		var Diff_value = StockNum_value -   NominalNum_value ;
		opeForm.elements["TextbookInventory/Diff"].value = Diff_value;
	
	}
</script>