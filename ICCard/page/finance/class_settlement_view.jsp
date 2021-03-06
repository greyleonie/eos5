<%@include file="/internet/common.jsp"%>
<%
  String[] CHARGEDEPARTMENT_STRING = { "饭堂", "康乐园", "羽毛球场" };
  String[] POSTYPE_STRING = { "就餐收费机", "运动收费机","其他收费机" };
%>
	<head>
		<title>班级结算</title>
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
			var colnum=6;
			var businessmoneySum=0;	//交易总金额
			var cardcostSum=0;		//卡工本费总额
			var cashSum=0;			//现金交易总额
			var repastPOSbusinessmoneySum=0;	//就餐POS交易金额
			var sportPOSbusinessmoneySum=0;	//运动POS交易金额
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
			if(stylenum%2==0)
			listdetail.rows[row+1].className="Standard-ListSampleTRStyle";
			//
			//累加总额
			var _businessmoney=listdetail.rows[row+1].children[2].children[2].value*1;
			var _countbusinessmoney=0;	//用于累加的金额
			var _iscashbusiness=listdetail.rows[row+1].children[2].children[3].value;
			var _cardcost=listdetail.rows[row+1].children[3].children[1].value*1;
			var _postypeid=listdetail.rows[row+1].children[5].children[1].value*1;
			
			cardcostSum+=_cardcost;
			
			if(_iscashbusiness=="1"){
			_countbusinessmoney=_businessmoney;
			cashSum+=_businessmoney;
			listdetail.rows[row+1].children[2].children[1].innerText=formatSum(_businessmoney);
			}else{
			_countbusinessmoney=0;
			listdetail.rows[row+1].children[2].children[0].innerText=formatSum(_businessmoney);
			}
			businessmoneySum+=_countbusinessmoney;
			
			if(_postypeid==1)//就餐收费机
			repastPOSbusinessmoneySum+=_businessmoney;
			
			if(_postypeid==2)//运动收费机
			sportPOSbusinessmoneySum+=_businessmoney;
			
			if(_postypeid==3)//其他收费机
			otherPOSbusinessmoneySum+=_businessmoney;
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
			statistics.rows[0].children[1].children[0].innerText="总交易金额："+businessmoneySum;
			cardcostSum=formatSum(cardcostSum);
			statistics.rows[0].children[2].children[0].innerText="工本费总额："+cardcostSum;
			cashSum=formatSum(cashSum);
			statistics.rows[0].children[3].children[0].innerText="现金交易金额："+cashSum;
			repastPOSbusinessmoneySum=formatSum(repastPOSbusinessmoneySum);
			statistics.rows[2].children[1].children[0].innerText="就餐收费机："+repastPOSbusinessmoneySum;
			sportPOSbusinessmoneySum=formatSum(sportPOSbusinessmoneySum);
			statistics.rows[2].children[2].children[0].innerText="运动收费机："+sportPOSbusinessmoneySum;
			otherPOSbusinessmoneySum=formatSum(otherPOSbusinessmoneySum);
			statistics.rows[2].children[3].children[0].innerText="其他收费机："+otherPOSbusinessmoneySum;
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
			
			}
			
			function dayPopUpCalendarDlg(ctrlobj){
			showx = event.screenX - event.offsetX+10; // + deltaX;
			showy = event.screenY - event.offsetY+10; // + deltaY;
			newWINwidth = 220 + 4 + 18;
			retval = window.showModalDialog("ICCard.prFinance.prCalendar.do", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
			if( retval!= null ){
			businessLogsForm.elements[ctrlobj].value = retval;
			if(businessLogsForm.elements["QueryClassBizLogCols/HappeningDate/criteria/min"].value>businessLogsForm.elements["QueryClassBizLogCols/HappeningDate/criteria/max"].value){
			alert("开始日期不可以大于结束日期！");
			businessLogsForm.elements["QueryClassBizLogCols/HappeningDate/criteria/min"].value=retval;
			businessLogsForm.elements["QueryClassBizLogCols/HappeningDate/criteria/max"].value=retval;
			}
			//if (ctrlobj == 'QueryClassBizLogCols/HappeningDate/criteria/max') {
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
			
			function printHeader(){
			var returnString= "<center><h2>"+businessLogsForm.elements["QueryClassBizLogCols/ClassID/criteria/value"].options[businessLogsForm.elements["QueryClassBizLogCols/ClassID/criteria/value"].selectedIndex].innerText+"交易结算表<br>";
					if(businessLogsForm.elements["QueryClassBizLogCols/HappeningDate/criteria/min"].value==businessLogsForm.elements["QueryClassBizLogCols/HappeningDate/criteria/max"].value)
					returnString+=("("+businessLogsForm.elements["QueryClassBizLogCols/HappeningDate/criteria/min"].value+")日");
					else
					returnString+=("("+businessLogsForm.elements["QueryClassBizLogCols/HappeningDate/criteria/min"].value+"至"+businessLogsForm.elements["QueryClassBizLogCols/HappeningDate/criteria/max"].value+")");
					
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
		</script>
	</head>
<body topmargin="0" leftmargin="0" style="overflow-y:scroll" onload="setPrintArray()">
<form id="businessLogsForm" method="post">
					<logic:present property="SessionEntity/userID">
					<input type="hidden" name="operatorname" value="<bean:write property='SessionEntity/userID'/>">
					</logic:present>
					<logic:notPresent property="SessionEntity/userID">
					<input type="hidden" name="operatorname" value="">
					</logic:notPresent>
<!-- 导航条 -->
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td id="printTable" class="text_wirte">首页 > 财务管理 > 结算报表 > <strong><font color="#FFC104">班级结算</font></strong></td>
          </tr>
      </table></td>
    </tr>
 </table>
		<!-- 工具栏 -->
		<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr><td height="20">
					<input name="B2" type="button" class="button_02" value="打印…" title="打开/关闭打印设置面板" onClick="print()">
					&nbsp;&nbsp;<input name="B2" type="button" class="button_02" value="导出" onClick="exportexcel()">
				</td></tr>
		</table>
		
		<div id="printdiv" style="display:none">
			<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr><td><div id="_printSetting"></div></td></tr>
			</table>
		</div>
		
		<!-- 间隔栏 -->
		<table height=3>
			<tr><td></td></tr>
		</table>
		<table width="96%" class="table" align="center">
			<tr>
					<td class="text">班别：
					    <html:select property="QueryClassBizLogCols/ClassID/criteria/value" onchange="redirect()">
						<html:option value="0">&lt;请选择&gt;</html:option>
						<html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/>
						</html:select>&nbsp;
						日期：
						<html:text property="QueryClassBizLogCols/HappeningDate/criteria/min" size="10" readonly="true"/>
						<input type="button" value="..." onclick="dayPopUpCalendarDlg('QueryClassBizLogCols/HappeningDate/criteria/min')" title="选择起始日期">
						－
						<html:text property="QueryClassBizLogCols/HappeningDate/criteria/max" styleClass="Standard-InputStyle" size="10" readonly="true"/>
						<input type="button" value="..." onclick="dayPopUpCalendarDlg('QueryClassBizLogCols/HappeningDate/criteria/max')" title="选择截止日期">
					</td>
			</tr>
		</table>
		
		<!-- 间隔栏 -->
		<table height=5>
			<tr><td></td></tr>
		</table>
		
		<table id="listdetail" WIDTH="96%" border="0" cellspacing="1" cellpadding="0" align="center" bgcolor="#A2C4DC">
			<tr align="center" class="td_title">
				<td id="dataEntity.me1" nowrap onClick="talentsort()">交易日期</td>
				<td id="dataEntity.me2" nowrap onClick="talentsort()">交易类型</td>
				<td id="dataEntity.me3" nowrap onClick="talentsort()">交易金额</td>
				<td id="dataEntity.me4" nowrap onClick="talentsort()">卡工本费</td>
				<td id="dataEntity.me5" nowrap onClick="talentsort()">交易部门</td>
				<td id="dataEntity.me6" nowrap onClick="talentsort()">操作员/POS机</td>
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
							<html:hidden id="businesslogscoll" name="list[@name='bizLogCols']/QueryClassBizLogCols/BusinessLogsCollectID" property="QueryClassBizLogCols/BusinessLogsCollectID" indexed="true"/>
							<div>
								<bean:write id="businesslogscoll" property="QueryClassBizLogCols/HappeningDate" filter="true" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yy-MM-dd"/>
							</div>
						</td>
						<td nowrap align='center' valign='middle'>
							<div>
								<logic:present id="businesslogscoll" property="QueryClassBizLogCols/BusinessTypeID">
									<bean:write id="businesslogscoll" property="QueryClassBizLogCols/BusinessType" filter="true"/>
								</logic:present>
							</div>
						</td>
						<td nowrap align='center' valign='middle'>
							<font color="#B6BDC3"></font>
							<font color="#000000"></font>
							<html:hidden id="businesslogscoll" name="list[@name='bizLogCols']/QueryClassBizLogCols/BusinessMoney" property="QueryClassBizLogCols/BusinessMoney" indexed="true"/>
							<html:hidden id="businesslogscoll" name="list[@name='bizLogCols']/QueryClassBizLogCols/IsCashBusiness" property="QueryClassBizLogCols/IsCashBusiness" indexed="true"/>
						</td>
						<td nowrap align='center' valign='middle'>
							<div>
								<bean:write id="businesslogscoll" property="QueryClassBizLogCols/CardCost" filter="true"/>
							</div>
							<html:hidden id="businesslogscoll" name="list[@name='bizLogCols']/QueryClassBizLogCols/CardCost" property="QueryClassBizLogCols/CardCost"/>
						</td>
						<td nowrap align='center' valign='middle'>
							<div>
								<%
								String department = base.util.TalentContext.getValue(pageContext,"businesslogscoll","QueryClassBizLogCols/ChargeDepartmentID");
								if (department != null) {
								   int dpid = Integer.parseInt(department);
								   if (dpid >= 1 && dpid <= 3) {
								      out.println(CHARGEDEPARTMENT_STRING[dpid-1]);
								   } else {
								      out.println("(未知)");
								   }
								}
								%>
							</div>
						</td>
						<td nowrap align='center' valign='middle'>
							<div>
								<bean:write id="businesslogscoll" property="QueryClassBizLogCols/Operator" filter="true"/>
								<%
								String postype = base.util.TalentContext.getValue(pageContext,"businesslogscoll","QueryClassBizLogCols/POSTypeID");
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
							<html:hidden id="businesslogscoll" name="list[@name='bizLogCols']/QueryClassBizLogCols/POSTypeID" property="QueryClassBizLogCols/POSTypeID" indexed="true"/>
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
					out.println("<tr class=\'Standard-StatisticsMessageStyle\'>"
						+"<td colspan=1 align=center valign=middle><input type='hidden' name='businesslogscollectid' value=0><div>现金合计：</div></td>"
						+"<td colspan=1 align=left valign=middle><div></div></td>"
						+"<td colspan=1 align=left valign=middle><div></div></td>"
						+"<td colspan=3 align=left valign=middle><div></div></td>"
					+"</tr>"
					+"<tr><td colspan=9 class=\'Standard-ListDoubleTRStyle\'></td></tr>"
					+"<tr class=\'Standard-StatisticsMessageStyle\'>"
						+"<td colspan=1 align=center valign=middle><div>POS合计：</div></td>"
						+"<td colspan=1 align=left valign=middle><div></div></td>"
						+"<td colspan=1 align=left valign=middle><div></div></td>"
						+"<td colspan=3 align=left valign=middle><div></div></td>"
					+"</tr>"
					+"</table>"
					+"<br>"
					+"<table width=90% border=0 align=center cellpadding=0 cellspacing=0>"
					+"<tr><td><font size='2'>（备注：黑色部分的金额为现金交易）</font>");
					out.println("</td></tr></table>");
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