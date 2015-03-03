<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prField.accountTotalList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;场地管理—&gt;收支汇总表</td>
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
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>

            
            <td height="30" class="text">
            	日 期：从<html:text property="BeginDate" attributesText='class="input" size="12"  ValidateType="notempty" Msg="开始日期不能为空"'  readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["BeginDate"],"yyyy-MM-dd")> 
                到<html:text property="EndDate" attributesText='class="input" size="12"  ValidateType="notempty" Msg="结束日期不能为空" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["EndDate"],"yyyy-MM-dd")> 
                 
                 <input name="query" type="button" class="button_02" value="收支汇总" onClick="queryTotal()"> 
                 <input name="query" type="button" class="button_02" value="收支明细" onClick="queryDetail()"> 
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">		
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
  <logic:notPresent property="isFirst">
      <tr>
        <td class="td1" align="center"><span id="printTable"><b>收支汇总表</b><br/><logic:notEqual property="BeginDate" value="">(<bean:write property="BeginDate" />至<bean:write property="EndDate" />)</logic:notEqual></span></td>
      </tr>
      <tr>
        <td valign="top" class="text">

		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="20%" align="center" nowrap id="AccountDetail.Author" onClick="talentsort()">住宿费</td>
                  <td width="20%" align="center" nowrap id="AccountDetail.Range" onClick="talentsort()">会议费</td>
                  <td width="20%" align="center" nowrap id="AccountDetail.Date" onClick="talentsort()">电话/传真费</td>
                  <td width="20%" align="center" nowrap id="AccountDetail.Date" onClick="talentsort()">其他费</td>
                  <td width="20%" align="center" nowrap id="AccountDetail.Date" onClick="talentsort()">合计</td>
                </tr>
			<tr class="td1" onClick="changeTRBgColor(this)"  > 
                  <td align="center"><bean:write property="AccountTotal/HousingCost" language="zh" country="CN"/></td>
				 <td align="center"><bean:write property="AccountTotal/MeetingCost" language="zh" country="CN"/></td>
				 <td align="center"><bean:write property="AccountTotal/TelecomCost" language="zh" country="CN"/></td>
				 <td align="center"><bean:write property="AccountTotal/OtherCost" language="zh" country="CN"/></td>
				 <td align="center"><bean:write property="AccountTotal/TotalCost" language="zh" country="CN"/></td>
                </tr>
              </table>

		  
		  </td>
      </tr>
</logic:notPresent>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
  function queryDetail() {
	var frm =document.forms[0];
	var BeginDate = frm["BeginDate"].value;
	var EndDate = frm["EndDate"].value
	frm.action="ICCard.prField.accountDetailList.do?AccountDetail/CreatedTime/criteria/min="+BeginDate+"&AccountDetail/CreatedTime/criteria/max="+EndDate+"&AccountDetail/CreatedTime/criteria/operator=between";
		frm.submit();

}

function queryTotal() {
	var frm =document.forms[0];
	var BeginDate = frm["BeginDate"].value;
	var EndDate = frm["EndDate"].value
	frm.action="ICCard.prField.accountTotalList.do?BeginDate="+BeginDate+"&EndDate="+EndDate;
		frm.submit();
}

</script>