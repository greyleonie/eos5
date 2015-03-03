<%@include file="/internet/common.jsp"%>
<body >
<form method="post" action="ICCard.prPark.parkRecordList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;停车管理—&gt;停车记录              </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prPark.parkRecordList.do">
		<input type="hidden" name="viewaction" value="ICCard.prPark.parkRecordView.do">
		
		<html:hidden property="QueryParkRecord/_order/col1/field"/>
		<html:hidden property="QueryParkRecord/_order/col1/asc" />
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
	    <html:text property="QueryParkRecord/operatorName/criteria/value" attributesText='class="input"' size="15"/>
        
&nbsp; 卡编号：
	    <html:text property="QueryParkRecord/CardID/criteria/value" attributesText='class="input"  ' size="15" onchange="if(/\D/.test(this.value)){alert('请输入正确的数字格式');this.value='';}"/>

&nbsp; 卡类型：
	    <html:select property="QueryParkRecord/CardType/criteria/value" styleClass="input">
	    	<html:option value="">全部</html:option>
	    	<html:option value="1">学员卡</html:option>
	    	<html:option value="2">教师卡</html:option>
	    	<html:option value="3">学校办公用车</html:option>
	    	<html:option value="4">月保卡</html:option>
	    	<html:option value="5">临时卡</html:option>
	    	<html:option value="6">绿卡</html:option>
	    </html:select>
	   &nbsp;    
<input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()">
<input name="view" type="button" class="button_02" value="查 看" onclick="talentview()">
<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
	
				</td>
	    </tr>
	  <tr>
	    <td height="30" class="text">
	  入校时间：从 <html:text property="QueryParkRecord/ComeTime/criteria/min" attributesText='class="input" size="15"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["QueryParkRecord/ComeTime/criteria/min"],"yyyy-MM-dd")>
	    	至 <html:text property="QueryParkRecord/ComeTime/criteria/max" attributesText='class="input" size="15"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["QueryParkRecord/ComeTime/criteria/max"],"yyyy-MM-dd")>
			<INPUT type="hidden" name="QueryParkRecord/ComeTime/criteria/operator" value="between">
			<INPUT type="hidden" name="QueryParkRecord/ComeTime/criteria/criteriaPattern" value="yyyy-MM-dd">
	    &nbsp; 出校时间：从 <html:text property="QueryParkRecord/LeaveTime/criteria/min" attributesText='class="input" size="15"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["QueryParkRecord/LeaveTime/criteria/min"],"yyyy-MM-dd")>
	    	至 <html:text property="QueryParkRecord/LeaveTime/criteria/max" attributesText='class="input" size="15"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["QueryParkRecord/LeaveTime/criteria/max"],"yyyy-MM-dd")>
			<INPUT type="hidden" name="QueryParkRecord/LeaveTime/criteria/operator" value="between">
			<INPUT type="hidden" name="QueryParkRecord/LeaveTime/criteria/criteriaPattern" value="yyyy-MM-dd">
	
		</td>
	    </tr>
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap ><input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" ></td>
            <td width="16%" align="center" nowrap id="QueryParkRecord.CardID" onClick="talentsort()">卡编号</td>
            <td width="16%" align="center" nowrap id="QueryParkRecord.operatorName" onClick="talentsort()">持卡人</td>
            <td width="20%" align="center" nowrap id="QueryParkRecord.ComeTime" onClick="talentsort()">入校时间</td>
            <td width="20%" align="center" nowrap id="QueryParkRecord.BusinessMoney" onClick="talentsort()">出校时间</td>
            <td width="14%" align="center" nowrap id="QueryParkRecord.BusinessType" onClick="talentsort()">收费金额</td>
            <td width="14%" align="center" nowrap id="QueryParkRecord.BusinessType" onClick="talentsort()">卡类型</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryParkRecord']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						int CardType= talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,"resultset","QueryParkRecord/CardType"));
						
			       %>
            <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
              <td nowrap align="center">
			  <html:checkbox name="list[@name='update']/ParkReadCardRecord/RecordID" id="resultset" property="QueryParkRecord/RecordID" indexed="true" /> </td>
	            <td nowrap align="center"><bean:write id="resultset" property="QueryParkRecord/CardID"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryParkRecord/operatorName" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryParkRecord/ComeTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryParkRecord/LeaveTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryParkRecord/ArtualMoney"/></td>
	            <td  nowrap align="center">
	            <%
	             if(CardType == 0 ) out.print("无效卡");
	             if(CardType == 1 ) out.print("学员卡");
	             if(CardType == 2 ) out.print("教师卡");
	             if(CardType == 3 ) out.print("学校办公用车");
	             if(CardType == 4 ) out.print("月保卡");
	             if(CardType == 5 ) out.print("临时卡");
	             if(CardType == 6 ) out.print("绿卡");
	             
	             %>	            </td>
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