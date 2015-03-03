<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prField.receptionList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;场地管理—&gt;<span id="printTable">收支明细表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prField.accountDetailList.do">
		<html:hidden property="AccountDetail/_order/col1/field"/>
		<html:hidden property="AccountDetail/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
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
            	日 期：从<html:text property="AccountDetail/CreatedTime/criteria/min" attributesText='class="input" size="12" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["AccountDetail/CreatedTime/criteria/min"],"yyyy-MM-dd")> 
                到<html:text property="AccountDetail/CreatedTime/criteria/max" attributesText='class="input" size="12" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["AccountDetail/CreatedTime/criteria/max"],"yyyy-MM-dd")> 
                 <html:hidden  property="AccountDetail/CreatedTime/criteria/operator" value="between" />
                <input name="query" type="button" class="button_02" value="收支明细" onClick="queryDetail()"> 
                <input name="query" type="button" class="button_02" value="收支汇总" onClick="queryTotal()">  
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">		
			</td>
      </tr>
      
       <tr>
        <td class="td1" align="center"><span id="printTable"><b>收支明细表</b><br/><logic:notEqual property="AccountDetail/CreatedTime/criteria/min" value="">(<bean:write property="AccountDetail/CreatedTime/criteria/min" />至<bean:write property="AccountDetail/CreatedTime/criteria/max" />)</logic:notEqual></span></td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap id="AccountDetail.Author" onClick="talentsort()">序号</td>
                  <td width="10%" align="center" nowrap id="AccountDetail.Range" onClick="talentsort()">住宿费（现金）</td>
                  <td width="10%" align="center" nowrap id="AccountDetail.Date" onClick="talentsort()">住宿费（支票）</td>
                  <td width="10%" align="center" nowrap id="AccountDetail.Date" onClick="talentsort()">会议费</td>
                  <td width="10%" align="center" nowrap id="AccountDetail.Date" onClick="talentsort()">电话/传真费</td>
                  <td width="10%" align="center" nowrap id="AccountDetail.Date" onClick="talentsort()">其它费用</td>
                  <td width="10%" align="center" nowrap id="AccountDetail.Date" onClick="talentsort()">合计</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='AccountDetail']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" > 
                  <td align="center"><%=count %></td>
				  <td  align="center" nowrap><bean:write id="resultset" property="AccountDetail/HousingCash" language="zh" country="CN" /></td>
				  <td  align="center" nowrap><bean:write id="resultset" property="AccountDetail/HousingCheck" language="zh" country="CN" /></td>
				  <td  align="center" nowrap><bean:write id="resultset" property="AccountDetail/MeetingCost" language="zh" country="CN" /></td>
				  <td  align="center" nowrap><bean:write id="resultset" property="AccountDetail/TelecomCost" language="zh" country="CN" /></td>
				  <td  align="center" nowrap><bean:write id="resultset" property="AccountDetail/OtherCost" language="zh" country="CN" /></td>
				  <td  align="center" nowrap><bean:write id="resultset" property="AccountDetail/TotalCost" language="zh" country="CN" /></td> 
                </tr>
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
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
function queryDetail() {
	var frm =document.forms[0];
	processError(frm);
	if(frm.elements["PageCond/begin"] && frm.elements["PageCond/count"] && frm.elements["PageCond/length"]) {
		frm.elements["PageCond/begin"].value=0;
		frm.elements["PageCond/count"].value=-1;
		if(frm.elements["PageCond/talentlength"]) {
			frm.elements["PageCond/length"].value = frm.elements["PageCond/talentlength"].value;
		}else{
			frm.elements["PageCond/length"].value=10;
		}
		if(frm.elements["queryaction"]) {
			frm.action = frm.elements["queryaction"].value;
		}
		event.srcElement.blur();
		frm.submit();
	}

}

function queryTotal() {
	var frm =document.forms[0];
	var BeginDate = frm["AccountDetail/CreatedTime/criteria/min"].value;
	var EndDate = frm["AccountDetail/CreatedTime/criteria/max"].value
	frm.action="ICCard.prField.accountTotalList.do?BeginDate="+BeginDate+"&EndDate="+EndDate;
		frm.submit();
}
</script>
<script>
	loadOrderImg(document.forms[0],'AccountDetail');
</script>