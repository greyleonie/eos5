<%@include file="/internet/common.jsp"%>
<body >
<form method="post" action="ICCard.prPark.monthCardList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;停车管理—&gt;月保卡充值记录              </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prPark.monthCardList.do">
		<input type="hidden" name="viewaction" value="ICCard.prPark.monthCardView.do">
		
		<html:hidden property="QueryMonthCard/_order/col1/field"/>
		<html:hidden property="QueryMonthCard/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<input type="hidden" name="Card/fromCardData0" />
		<input type="hidden" name="Card/fromCardData1" />
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
	   持卡人：
	    <html:text property="QueryMonthCard/operatorName/criteria/value" attributesText='class="input"' size="15"/>
        
&nbsp; 卡编号：
	    <html:text property="QueryMonthCard/CardID/criteria/value" attributesText='class="input"  ' size="15" onchange="if(/\D/.test(this.value)){alert('请输入正确的数字格式');this.value='';}"/>

&nbsp; 开始使用时间：从 <html:text property="QueryMonthCard/StartTime/criteria/min" attributesText='class="input" size="15"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["QueryMonthCard/StartTime/criteria/min"],"yyyy-MM-dd")>
	    	至 <html:text property="QueryMonthCard/StartTime/criteria/max" attributesText='class="input" size="15"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["QueryMonthCard/StartTime/criteria/max"],"yyyy-MM-dd")>
			<INPUT type="hidden" name="QueryMonthCard/StartTime/criteria/operator" value="between">
			<INPUT type="hidden" name="QueryMonthCard/StartTime/criteria/criteriaPattern" value="yyyy-MM-dd">

	  

				</td>
	    </tr>
	  <tr>
	    <td height="30" class="text">
	    车牌号：
	    <html:text property="QueryMonthCard/CarNO/criteria/value" attributesText='class="input"' size="15"/>
	    &nbsp;
<input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()">
<input name="view" type="button" class="button_02" value="查 看" onclick="talentview()">
<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
	服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked="">	
		</td>
	    </tr>
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap ><input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" ></td>
            <td width="12%" align="center" nowrap id="QueryMonthCard.CardID" onClick="talentsort()">卡编号</td>
            <td width="12%" align="center" nowrap id="QueryMonthCard.operatorName" onClick="talentsort()">持卡人</td>
            <td width="12%" align="center" nowrap id="QueryMonthCard.CarNO" onClick="talentsort()">车牌号</td>
            <td width="12%" align="center" nowrap id="QueryMonthCard.MonthCount" onClick="talentsort()">充卡月数</td>
            <td width="15%" align="center" nowrap id="QueryMonthCard.StartTime" onClick="talentsort()">开始使用时间</td>
            <td width="15%" align="center" nowrap id="QueryMonthCard.BusinessMoney" onClick="talentsort()">停止使用时间</td>
            <td width="12%" align="center" nowrap id="QueryMonthCard.BusinessType" onClick="talentsort()">交纳费用</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryMonthCard']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
						
			       %>
            <tr class="<%=trClass%>" onclick="changeTRBgColor(this)"  onDblClick="talentviewf('<bean:write id="resultset" property="QueryMonthCard/MonthCardID"/>','true')"> 
                 
              <td nowrap align="center">
			  <html:checkbox name="list[@name='update']/MonthCard/MonthCardID" id="resultset" property="QueryMonthCard/MonthCardID" indexed="true" /> </td>
	            <td nowrap align="center"><bean:write id="resultset" property="QueryMonthCard/CardID"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryMonthCard/operatorName" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryMonthCard/CarNO"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryMonthCard/MonthCount"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryMonthCard/StartTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryMonthCard/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryMonthCard/BusinessMoney"/></td>
            </tr>
          </logic:iterate>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>			  </td>
            </tr>
          </table>		  </td>
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