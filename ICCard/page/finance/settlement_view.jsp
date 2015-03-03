<%@include file="/internet/common.jsp"%>
<%
  String[] POSTYPE_STRING = { "就餐收费机", "运动收费机","其他收费机" };
%>
	<head>
		<title>交易结算</title>
		<link  href="/internet/css/standard.css" rel="stylesheet" type="text/css" >
		<script language="JScript" src="/internet/scripts/Toolbar.js"></script>
		<script language="JScript" src="/internet/scripts/TableController.js"></script>
		<script language="JavaScript" src="/internet/scripts/SelectPrint.js"></script>
		<script language="javascript" src="/internet/scripts/date2string.js"></script>
		<script language="javascript" src="/internet/scripts/Check2.js"></script>
		<%int j=0;%>
		<script language="JavaScript">
			var selectedRow = null;
			var stylenum=0;
			var printer;
			var rownum=0;
			var colnum=9;
			var businessmoneySum=0;	//交易总金额
			var cardcostSum=0;		//卡工本费总额
			var notCheckouSum=0;//未结帐金额
			var POSbusinessmoneySum=0;	//POS交易金额
			var otherPOSbusinessmoneySum=0;	//其他POS交易金额
			
			function setPrintArray(){
			var data = new Array();
			var title = new Array();
			
			//获取title名称
			for (var ptr = 0; colnum > ptr; ptr++)
			title[ptr]=new Array(listdetail.rows[0].children[ptr].innerText,true);
			
			//获取表体内容
			if(rownum>0)
			var currentDate=listdetail.rows[1].children[0].children[1].innerText;	//初始化日期
			
			for(var row = 0; rownum > row; row++){
			//设置表的样式
			if(currentDate!=listdetail.rows[row+1].children[0].children[1].innerText){
			stylenum++;
			currentDate=listdetail.rows[row+1].children[0].children[1].innerText;
			}
			//if(stylenum%2==0)
			//printTable.rows[row+1].className="Standard-ListSampleTRStyle";
			//
			//累加总额
			var _businessmoney=listdetail.rows[row+1].children[2].children[2].value*1;
			var _countbusinessmoney=0;	//用于累加的金额
			var _iscashbusiness=listdetail.rows[row+1].children[2].children[3].value;
			var _cardcost=listdetail.rows[row+1].children[3].children[1].value*1;
			var _postypeid=listdetail.rows[row+1].children[4].children[1].value*1;
			
			cardcostSum+=_cardcost;
			
			if(_iscashbusiness=="1"){
			_countbusinessmoney=_businessmoney;
			listdetail.rows[row+1].children[2].children[1].innerText=formatSum(_businessmoney);
			}else{
			_countbusinessmoney=0;
			listdetail.rows[row+1].children[2].children[0].innerText=formatSum(_businessmoney);
			}
			businessmoneySum+=_countbusinessmoney;
			
			if(_postypeid>=1 && 2>=_postypeid)//就餐/运动收费机
			POSbusinessmoneySum+=_businessmoney;
			
			if(_postypeid==3||_postypeid==4)//其他收费机
			otherPOSbusinessmoneySum+=_businessmoney;
			
			if(listdetail.rows[row+1].children[7].children[0].innerText.match("否"))//是否已经结帐
			notCheckouSum+=(_countbusinessmoney+_cardcost);
			//
			data[row] = new Array();
			data[row][0]=currentDate;
			for(var col =1; colnum > col; col++){
			if(col==2)
			data[row][col]=formatSum(_businessmoney);
			else
			data[row][col]=listdetail.rows[row+1].children[col].children[0].innerText;
			}
			}
			
			if(rownum>0){
			//输出总额
			businessmoneySum=formatSum(businessmoneySum);
			statistics.rows[0].children[1].children[0].innerText="现金充值："+businessmoneySum;
			cardcostSum=formatSum(cardcostSum);
			statistics.rows[0].children[2].children[0].innerText="现金发卡："+cardcostSum;
			notCheckouSum=formatSum(notCheckouSum);
			statistics.rows[0].children[3].children[0].innerText="未结帐金额："+notCheckouSum;
			POSbusinessmoneySum=formatSum(POSbusinessmoneySum);
			if(businessLogsForm.elements["QueryDayBizLogCols/ChargeDepartmentID/criteria/value"].value==1){	//饭堂为就餐收费机
			statistics.rows[2].children[1].children[0].innerText="就餐消费："+POSbusinessmoneySum;
			statistics.rows[2].children[2].children[0].innerText="运动消费：0.00";
			}
			else{	//非饭堂为运动收费机
			statistics.rows[2].children[1].children[0].innerText="就餐消费：0.00";
			statistics.rows[2].children[2].children[0].innerText="运动消费："+POSbusinessmoneySum;
			}
			otherPOSbusinessmoneySum=formatSum(otherPOSbusinessmoneySum);
			statistics.rows[2].children[3].children[0].innerText="其他消费："+otherPOSbusinessmoneySum;
			//
			}
			
			var printPaper = "建议采用A4纸纵向打印。";
			printer = new SelectPrint("printer", "_printSetting", printPaper, -1, 45, data,title);
			printer.layout();
			}
			
			function formatSum(_businessmoneySum){
			//规范总金额格式
			pointindex=_businessmoneySum.toString().indexOf(".");
			len=_businessmoneySum.toString().length;
			if(pointindex>=0 && len>=pointindex+3)//多于2位小数的四舍五入
			_businessmoneySum=_businessmoneySum.toString().substring(0,pointindex+3);
			else if(0>pointindex)//没有小数点的补两位小数
			_businessmoneySum=_businessmoneySum.toString()+".00";
			else//其他的补一位小数
			_businessmoneySum=_businessmoneySum.toString()+"0";
			//
			return _businessmoneySum;
			}
			
			function onDClick(thisObject){
			checkout();
			}
			
			function monthPopUpCalendarDlg(ctrlobj){
			showx = event.screenX - event.offsetX+10; // + deltaX;
			showy = event.screenY - event.offsetY+10; // + deltaY;
			newWINwidth = 220 + 4 + 18;
			retval = window.showModalDialog("ICCard.prFinance.prCalendar.do", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
			if( retval!= null ){
			if(businessLogsForm.elements[ctrlobj].value != retval.substring(0,7)){
			businessLogsForm.elements[ctrlobj].value = retval;
			redirect();
			}
			}
			}
			
			function dayPopUpCalendarDlg(ctrlobj){
			showx = event.screenX - event.offsetX+10; // + deltaX;
			showy = event.screenY - event.offsetY+10; // + deltaY;
			newWINwidth = 220 + 4 + 18;
			retval = window.showModalDialog("ICCard.prFinance.prCalendar.do", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
			if( retval!= null ){
			businessLogsForm.elements[ctrlobj].value = retval;
			if(businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/min"].value>businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/max"].value){
			alert("开始日期不可以大于结束日期！");
			businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/min"].value=retval;
			businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/max"].value=retval;
			}
			//if (ctrlobj == 'QueryDayBizLogCols/HappeningDate/criteria/max') {
			   redirect();
			//} 
			}
		    }
			
			function print(){
			if(printdiv.style.display=="none")
			printdiv.style.display="block";
			else
			printdiv.style.display="none";
			}
			
			function getHeadTitleNO(val){
				switch(val*1){
					case 1:
						return "三";
					case 2:
						return "二";
					case 3:
						return "一";
				}
				return "";
			}
			
			function printHeader(){
			var returnString= "<center><h2>中共广州市委党校";
					
					if(businessLogsForm.actionString.value=="月")
					returnString+=(businessLogsForm.elements["QueryDayBizLogCols/consumemonth"].value.substring(0,4)+"年"
					+businessLogsForm.elements["QueryDayBizLogCols/consumemonth"].value.substring(5,7)+"月");
					else if(businessLogsForm.actionString.value=="日"){
					if(businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/min"].value==businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/max"].value)
					returnString+=("("+businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/min"].value+")日");
					else
					returnString+=("("+businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/min"].value+"至"+businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/max"].value+")日");
					}
					
					returnString+="交易结算表";
					
					returnString+=getHeadTitleNO(businessLogsForm.elements["QueryDayBizLogCols/ChargeDepartmentID/criteria/value"].value);
					
					returnString+="</h2></center><table width='100%' border=0 cellpadding=0 cellspacing=0><tr><td align='left' valign='middle'>制表人："
						+businessLogsForm.operatorname.value+"</td><td align='right' valign='middle'>金额单位：（人民币）元 </td></tr></table>";
			return returnString;
			}
						
			function printFooter(){
			if(rownum>0)
			var returnString="<hr><table width='100%' height=30 border=0 align=center cellpadding=0 cellspacing=0 style='font-weight:600'><tr><td width='15%'align=center valign='middle'>现金合计：</td><td width='25%' align=left valign='middle'>"
						+statistics.rows[0].children[1].children[0].innerText+"</td><td width='25%' align=left valign='middle'>"
						+statistics.rows[0].children[2].children[0].innerText+"</td><td width='35%' align=left valign='middle'>"
						+statistics.rows[0].children[3].children[0].innerText+"</td></tr><tr><td width='15%'align=center valign='middle'>POS合计：</td><td width='25%' align=left valign='middle'>"
						+statistics.rows[2].children[1].children[0].innerText+"</td><td width='25%' align=left valign='middle'>"
						+statistics.rows[2].children[2].children[0].innerText+"</td><td width='35%' align=left valign='middle'>"
						+statistics.rows[2].children[3].children[0].innerText+"</td></tr></table><hr>";
			else
			var returnString="";
			return returnString;
			}
			
			function redirect(){
			businessLogsForm.submit();
			}
			
			function checkout(){
			if(selectedRow == null){
			alert("请选择一条信息！");
			return;
			}
			var _businesslogscollectid=selectedRow.childNodes.item(0).childNodes.item(0).value;
			if(_businesslogscollectid==0)//现金合计的结帐
			{
			 if(notCheckouSum>0){
			   var sum=notCheckouSum*1;
			 }
			 else{
			   alert("没有记录可结帐！");
			   return;
			 }
			}
			else
			{
			   checkoutvalue=selectedRow.childNodes.item(7).childNodes.item(0).innerText;
			   if(checkoutvalue.match("是")){
			      alert("该记录已结帐！");
			      return;
			   }else if(checkoutvalue.match("否")){
			   if(selectedRow.childNodes.item(2).childNodes.item(4).value=="1")//现金交易
			      var businessmoney=selectedRow.childNodes.item(2).childNodes.item(2).value;
			   else
			      var businessmoney=0;
			      var cardcost=selectedRow.childNodes.item(3).childNodes.item(1).value;
			      var sum=businessmoney*1+cardcost*1;
			   }
			   else
			      return;
			}
			var code = prompt("出 纳 员："+businessLogsForm.operatorname.value+"\n收入金额："+formatSum(sum)+"  (确定无误后请在下面输入验证码)","");
			if(code==null)return;
			if(code == "3015"){
			  if(businessLogsForm.actionString.value=="月")
			    businessLogsForm.action="ICCard.prFinance.prMonthCheckOut.do";
			  else
			    businessLogsForm.action="ICCard.prFinance.prDayCheckOut.do";
			businessLogsForm.businesslogscollectid.value=_businesslogscollectid;
			businessLogsForm.submit();
			}else{
			alert("验证码不正确！");
			}
			}
		</script>
	</head>
<body topmargin="0" leftmargin="0" style="overflow-y:scroll" onload="setPrintArray()">
<form id="businessLogsForm" method="post">
		<!-- 导航条 -->
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td id="printTable" class="text_wirte"><div id="bannerURL"></div></td>
          </tr>
      </table></td>
    </tr>
  </table>
		<!-- 工具栏 
		<table>
			<tr><td>
			<input name="B1" type="button" class="button_02" value="结　帐" title="对所选记录进行结帐处理" onClick="checkout()">
			<input name="B2" type="button" class="button_02" value="打印…" title="打开/关闭打印设置面板" onClick="print()">
			</td></tr>
		</table>-->
		
		<div id="printdiv" style="display:none">
			<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr><td><div id="_printSetting"></div></td></tr>
			</table>
		</div>
		
		<!-- 间隔栏 -->
		<table height=3>
			<tr><td></td></tr>
		</table>
		<table width="96%" align="center">
			<tr>
				<logic:equal property="actstr" value="monthsettlementview">
						<td class="text" width="20%" align="left">部门：
						<%String cdid = base.util.TalentContext.getValue(pageContext,null,"QueryDayBizLogCols/ChargeDepartmentID/criteria/value");%>
						<select name="QueryDayBizLogCols/ChargeDepartmentID/criteria/value" onchange="redirect()">
						<option value="1" <% if (cdid.equals("1")) { %>selected <% } %>>饭堂</option>
						<option value="2" <% if (cdid.equals("2")) { %>selected <% } %>>康乐园</option>
						<option value="3" <% if (cdid.equals("3")) { %>selected <% } %>>羽毛球场</option>
						<option value="4" <% if (cdid.equals("4")) { %>selected <% } %>>停车场</option>
						</select>&nbsp;&nbsp;
						月份：
						<html:text property="QueryDayBizLogCols/consumemonth" styleClass="Standard-InputStyle" size="6" readonly="true"/>
						&nbsp;&nbsp;<input type="button" value="..." onclick="monthPopUpCalendarDlg('QueryDayBizLogCols/consumemonth')" title="选择要选月份的任意一天即可选中该月">
						&nbsp;&nbsp;<qx:talentButton property="B1" type="button" styleClass="button_02" title="对所选记录进行结帐处理" value="结　帐" onclick="checkout()" operation="DX_CWGL_Foot_Day.DX_CWGL_Foot_Day_Check"/>
			            <input name="B2" type="button" class="button_02" value="打印…" title="打开/关闭打印设置面板" onClick="print()">
						<input name="B2" type="button" class="button_02" value="导出" onClick="exportexcel()">
						</td>
						<logic:present property="SessionEntity/userID">
						<input type="hidden" name="operatorname" value="<bean:write property='SessionEntity/userID'/>">
						</logic:present>
						<logic:notPresent property="SessionEntity/userID">
						<input type="hidden" name="operatorname" value="">
						</logic:notPresent>
						<input type="hidden" name="businesslogscollectid">
						<input type="hidden" name="actionString" value="月">
				</logic:equal>
				
				<logic:equal property="actstr" value="daysettlementview">
						<td class="text" width="20%" align="left">部门：
						<%String cdid = base.util.TalentContext.getValue(pageContext,null,"QueryDayBizLogCols/ChargeDepartmentID/criteria/value");%>
						<select name="QueryDayBizLogCols/ChargeDepartmentID/criteria/value"  onchange="redirect()">
						<option value="1" <% if (cdid.equals("1")) { %>selected <% } %>>饭堂</option>
						<option value="2" <% if (cdid.equals("2")) { %>selected <% } %>>康乐园</option>
						<option value="3" <% if (cdid.equals("3")) { %>selected <% } %>>羽毛球场</option>
						<option value="4" <% if (cdid.equals("4")) { %>selected <% } %>>停车场</option>
						</select>&nbsp;&nbsp;
						日期：
						<html:text property="QueryDayBizLogCols/HappeningDate/criteria/min" styleClass="Standard-InputStyle" size="10" readonly="true"/>
						<input type="button" value="..." onclick="dayPopUpCalendarDlg('QueryDayBizLogCols/HappeningDate/criteria/min')" title="选择起始日期">
						－
						<html:text property="QueryDayBizLogCols/HappeningDate/criteria/max" styleClass="Standard-InputStyle" size="10" readonly="true"/>
						<input type="button" value="..." onclick="dayPopUpCalendarDlg('QueryDayBizLogCols/HappeningDate/criteria/max')" title="选择截止日期">
						&nbsp;&nbsp;<qx:talentButton property="B1" type="button" styleClass="button_02" title="对所选记录进行结帐处理" value="结　帐" onclick="checkout()" operation="DX_CWGL_Foot_Month.DX_CWGL_Foot_Month_Check"/>
			            &nbsp;&nbsp;<input name="B2" type="button" class="button_02" value="打印…" title="打开/关闭打印设置面板" onClick="print()">
			            &nbsp;&nbsp;<input name="B2" type="button" class="button_02" value="导出" onClick="exportexcel()">
						</td>
						<logic:present property="SessionEntity/userID">
						<input type="hidden" name="operatorname" value="<bean:write property='SessionEntity/userID'/>">
						</logic:present>
						<input type="hidden" name="businesslogscollectid">
						<input type="hidden" name="actionString" value="日">
				</logic:equal>
			</tr>
		</table>
		
		<script language="JavaScript">
			//输出导航条url
			bannerURL.innerHTML="首页 > 财务管理 > 结算报表 > <strong><font color=#FFC104>" + businessLogsForm.actionString.value+"交易结算</font></strong>";
		</script>
		
		<!-- 间隔栏 -->
		<table height=5 class="Standard-TileTableStyle">
			<tr><td></td></tr>
		</table>
		
		<table id="listdetail" WIDTH="96%" border="0" cellspacing="1" cellpadding="0" bgcolor="#A2C4DC" align="center">
			<tr align="center" class="td_title">
				<td id="dataEntity.me1" nowrap onClick="talentsort()">交易日期</td>
				<td id="dataEntity.me2" nowrap onClick="talentsort()">交易类型</td>
				<td id="dataEntity.me3" nowrap onClick="talentsort()">交易金额</td>
				<td id="dataEntity.me4" nowrap onClick="talentsort()">卡工本费</td>
				<td id="dataEntity.me5" nowrap onClick="talentsort()">操作员/POS机</td>
				<td id="dataEntity.me6" nowrap onClick="talentsort()">结算人</td>
				<td id="dataEntity.me7" nowrap onClick="talentsort()">出纳员</td>
				<td id="dataEntity.me8" nowrap onClick="talentsort()">是否结帐</td>
				<td id="dataEntity.me9" nowrap onClick="talentsort()">结帐时间</td>
			</tr>
			<%
			  if (base.util.TalentContext.getEntity(pageContext,null,"list[@type='bizLogCols']")!=null) {
			%>
				<logic:iterate id="businesslogscoll" property="list[@type='bizLogCols']">
				    <%
					      j++;
					      if((j%2)==0)
					        out.println("<tr value='unselected' class='td1' onmouseover='mouseoverRow(this)' onmouseout='mouseoutRow(this)' onclick='selectRow(this)' onDblClick='onDClick(this)' title='双击进行结帐处理'>");
					      else
					        out.println("<tr value='unselected' class='td2' onmouseover='mouseoverRow(this)' onmouseout='mouseoutRow(this)' onclick='selectRow(this)' onDblClick='onDClick(this)' title='双击进行结帐处理'>");
					%>
						<td nowrap align='center' valign='middle'>
							<html:hidden id="businesslogscoll" name="list[@name='bizLogCols']/QueryDayBizLogCols/BusinessLogsCollectID" property="QueryDayBizLogCols/BusinessLogsCollectID" indexed="true"/>
							<div>
								<bean:write id="businesslogscoll" property="QueryDayBizLogCols/HappeningDate" filter="true" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yy-MM-dd"/>
							</div>
						</td>
						<td nowrap align='center' valign='middle'>
							<div>
								<logic:present id="businesslogscoll" property="QueryDayBizLogCols/BusinessTypeID">
									<bean:write id="businesslogscoll" property="QueryDayBizLogCols/BusinessType" filter="true"/>
								</logic:present>
							</div>
						</td>
						<td nowrap align='center' valign='middle'>
							<font color="#B6BDC3"></font>
							<font color="#000000"></font>
							<html:hidden id="businesslogscoll" name="list[@name='bizLogCols']/QueryDayBizLogCols/BusinessMoney" property="QueryDayBizLogCols/BusinessMoney" indexed="true"/>
							<html:hidden id="businesslogscoll" name="list[@name='bizLogCols']/QueryDayBizLogCols/IsCashBusiness" property="QueryDayBizLogCols/IsCashBusiness" indexed="true"/>
						</td>
						<td nowrap align='center' valign='middle'>
							<div>
								<bean:write id="businesslogscoll" property="QueryDayBizLogCols/CardCost" filter="true"/>
							</div>
							<html:hidden id="businesslogscoll" name="list[@name='bizLogCols']/QueryDayBizLogCols/CardCost" property="QueryDayBizLogCols/CardCost"/>
						</td>
						<td nowrap align='center' valign='middle'>
							<div>
								<bean:write id="businesslogscoll" property="QueryDayBizLogCols/Operator" filter="true"/>
								<%
								String postype = base.util.TalentContext.getValue(pageContext,"businesslogscoll","QueryDayBizLogCols/POSTypeID");
								if (postype != null) {
								   int postypeid = Integer.parseInt(postype);
								   if (postypeid >= 1 && postypeid <= 3) {
								      out.println(POSTYPE_STRING[postypeid-1]);
								   } else {
								      out.println("(未知)");
								   }
								}
								%>
							</div>
							<html:hidden id="businesslogscoll" name="list[@name='bizLogCols']/QueryDayBizLogCols/POSTypeID" property="QueryDayBizLogCols/POSTypeID" indexed="true"/>
						</td>
						<td nowrap align='center' valign='middle'>
							<div>
								<bean:write id="businesslogscoll" property="QueryDayBizLogCols/Accountant" filter="true"/>
							</div>
						</td>
						<td nowrap align='center' valign='middle'>
							<div>
								<bean:write id="businesslogscoll" property="QueryDayBizLogCols/Cashier" filter="true"/>
							</div>
						</td>
						<td nowrap align='center' valign='middle'>
							<div>
							<%
							  String bizType = base.util.TalentContext.getValue(pageContext,"businesslogscoll","QueryDayBizLogCols/BusinessTypeID");
							  String isCheck = base.util.TalentContext.getValue(pageContext,"businesslogscoll","QueryDayBizLogCols/IsCheckOut");
							  String cardCost = base.util.TalentContext.getValue(pageContext,"businesslogscoll","QueryDayBizLogCols/CardCost");
							  
							  if (bizType != null && ("1,2,4,6,7".indexOf(bizType)>=0 || cardCost != null)) 
							     if ("1".equals(isCheck)) out.print("是"); else out.print("<font color='#FF0000'>否</font>");
							  if (bizType != null && "3,5,8".indexOf(bizType)>=0) out.print("－");
							  
							%>
							</div>
						</td>
						<td nowrap align='center' valign='middle'>
							<div>
								<bean:write id="businesslogscoll" property="QueryDayBizLogCols/CheckOutTime" filter="true" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yy-MM-dd"/>
							</div>
						</td>
					</tr>
					<script language="JavaScript">
						rownum++;
					</script>
				</logic:iterate>
			<% } %>
			</table>
			<%
				if(j>0) {
				    out.println("<table id='statistics' width='96%' border='0' cellspacing='1' cellpadding='0' align='center' bgcolor='#A2C4DC'>");
					out.println("<tr class=\'Standard-StatisticsMessageStyle\' value='unselected' onmouseover='mouseoverRow(this)' onmouseout='mouseoutRow(this)' onclick='selectRow(this)' onDblClick='onDClick(this)' title='双击进行结帐处理'>"
						+"<td colspan=1 align=center valign=middle><input type='hidden' name='businesslogscollectid' value=0><div>现金合计：</div></td>"
						+"<td colspan=3 align=left valign=middle><div></div></td>"
						+"<td colspan=2 align=left valign=middle><div></div></td>"
						+"<td colspan=3 align=left valign=middle><div></div></td>"
					+"</tr>"
					+"<tr><td colspan=9 class=\'Standard-ListDoubleTRStyle\'></td></tr>"
					+"<tr class=\'Standard-StatisticsMessageStyle\'>"
						+"<td colspan=1 align=center valign=middle><div>POS合计：</div></td>"
						+"<td colspan=3 align=left valign=middle><div></div></td>"
						+"<td colspan=2 align=left valign=middle><div></div></td>"
						+"<td colspan=3 align=left valign=middle><div></div></td>"
					+"</tr>"
					+"</table>"
					+"<table width=90% height=30 border=0 align=center vlign=middle cellpadding=0 cellspacing=0>"
					+"<tr><td><font size='2'>（备注：灰色部分的金额无需进行现金结帐）</font></td></tr></table>");
				}
				else {
				    out.println("<table id='statistics' width='96%' border='0' cellspacing='1' cellpadding='0' align='center' bgcolor='#A2C4DC'>");
					out.println("<tr class='Standard-ListDoubleTRStyle'><td colspan='10'>（还未结算，没有结算记录！）</td></tr></table>");
				}
			%>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
function exportexcel() {
	var exportTime = new Date().getTime();
	var pwidth = screen.width - 10;
	var pheight = screen.height - 60;
	var etitle = "";
	var exml = "";
	var reportTitle = document.all.printTable;
	var reportTable = document.all.listdetail;
	//var reportFileName = document.all.reportFileName
	if(reportTitle.tagName == "TABLE" || reportTitle.tagName == "table") {
		etitle = printTable.rows(0).innerText;
	}else if(reportTitle.tagName == "SELECT" || reportTitle.tagName == "select") {
		var tempValue = reportTitle.value;
		for(var i = 0; i < reportTitle.options.length; i++) {
			if(reportTitle.options[i].value == tempValue) {
				etitle = reportTitle.options[i].text;
				break;
			}
		}
	}else{
		etitle = reportTitle.innerText;
	}
	
	exml = tablexml(reportTable);
	

	var frm = document.forms[1];
	if(!frm) {
		alert("不能导出，没有导出form");
		return;
	}
	frm.elements["title"].value = etitle
	frm.elements["xmlfcc"].value = exml;
	
	var url = "common.pr.domtoexcel.do?exportTime=" + exportTime;
	frm.action = url;
	//frm.target = "_top";
	frm.submit();
}

function tablexml(tableObj) {
	var result = "<table>";
	var allrows = tableObj.rows;
	for(var i = 0; i < allrows.length; i++) {
		var somerow = allrows[i];
		result += "<tr";
		if(somerow.className!=null ) result += " class=\"" + somerow.className + "\"";
		result +=">";
		for(var j = 0; j < somerow.cells.length; j++) {
			var somecell = somerow.cells[j];
			var somecellvalue = "";

			if (i>0 && j==0) somecellvalue = somecell.children.item(1).innerText;
			else if (i>0 &&j==2) somecellvalue = somecell.children.item(2).value;
			else if (i>0 && (j!=0 || j!=2)) somecellvalue = somecell.children.item(0).innerText;
			else somecellvalue = somecell.innerHTML;
			//alert(somecellvalue);
			re=/(< *a [^>]*>)|(< *\/ *a *>)/gi;   //去除文字上面的链接
			somecellvalue = somecellvalue.replace(re,"");
			//somecellvalue = somecellvalue.replace(/(< *FONT [^>]*>)/gi,"");
			somecellvalue = somecellvalue.replace(/(< *FONT [^>]*>)|(< *\/ *FONT *>)/gi,"");
			if(i == 0 ) {
				somecellvalue = somecellvalue.replace(/<br>/gi,"");
				
				somecellvalue = somecellvalue.replace(/<INPUT .*?>/gi,"序号");
				somecellvalue = somecellvalue.replace(/(< *IMG [^>]*>)/gi,"序号");
			}else{
				somecellvalue = somecellvalue.replace(/<br>/gi,"");
				somecellvalue = somecellvalue.replace(/<input\s+type=hidden.*?>/gi,"");
				somecellvalue = somecellvalue.replace(/<INPUT .*?>/gi,i);
				somecellvalue = somecellvalue.replace(/(< *IMG [^>]*>)/gi,"");
			}

			somecellvalue = somecellvalue.replace(/&nbsp;/gi,"");
			result += "<td";
			if(somecell.getAttribute("colspan")!=null && somecell.getAttribute("colspan")!=1) result += " colspan=\"" + somecell.getAttribute("colspan") + "\"";
			if(somecell.getAttribute("rowspan")!=null && somecell.getAttribute("rowspan")!=1) result += " rowspan=\"" + somecell.getAttribute("rowspan") + "\"";

			result += ">";
			result += somecellvalue;
			result += "</td>"
		}//for j
		result +="</tr>";
	}//for i

	result += "</table>";
	return result;

}
</script>