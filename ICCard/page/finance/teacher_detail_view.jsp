<%@include file="/internet/common.jsp"%>
<%@page import="java.lang.*,java.sql.*,java.text.*,java.util.*"%>

	<head>
		<title>个人交易明细</title>
		<link  href="/internet/css/standard.css" rel="stylesheet" type="text/css" >
		<script language="JScript" src="/internet/scripts/Toolbar.js"></script>
		<script language="JScript" src="/internet/scripts/TableController.js"></script>
		<script language="JavaScript" src="/internet/scripts/SelectPrint.js"></script>
		<script language="javascript" src="/internet/scripts/date2string.js"></script>
		<script language="javascript" src="/internet/scripts/Check2.js"></script>
		<%	int j=0; 
		    String cdid = base.util.TalentContext.getValue(pageContext,null,"QueryBizLogsByIds/poschargedepartmentid/criteria/value");
		    Calendar today = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String now = sdf.format(today.getTime());
		%>
		<script language="JavaScript">
		var selectedRow = null;
		var check_len=0;
		var printer;
		var rownum=0;
		var colnum=7;
		
		function setPrintArray(){
		
		var data = new Array();
		var title = new Array();
		
		//获取title名称
		for (var ptr = 0; colnum > ptr; ptr++)
		title[ptr]=new Array(listdetail.rows[0].children[ptr].innerText,true);
		
		//获取表体内容
		for(var row = 0; rownum > row; row++){
		data[row] = new Array();
		data[row][0]=listdetail.rows[row+1].children[0].children[2].innerText;
		for(var col = 1; colnum > col; col++){
		data[row][col]=listdetail.rows[row+1].children[col].children[0].innerText;
		}
		}
		
		var printPaper = "建议采用A4纸纵向打印。";
		printer = new SelectPrint("printer", "_printSetting", printPaper, -1, 45, data,title);
		printer.layout();
		}
		
		function onDClick(thisObject){
			checkRedundance();
		}
		
		function checkRedundance(){
			if(selectedRow ==null){
				alert("请选择一条记录!");
				return;
			}
			businessLogsForm.elements["QueryBizLogsByIds/businessLogsid"].value = selectedRow.childNodes.item(0).childNodes.item(0).value;
			businessLogsForm.action="ICCard.prFinance.prCheckRedundance.do";
			businessLogsForm.submit();
		}
		
		function checkall(){
		var j=0;
		var checkobj = businessLogsForm.elements["list[@name='update']/QueryBizLogsByIds[@hciTagIndex='0']/businessLogsid"];
		
		while (checkobj != undefined) {
		   if (!checkobj.checked) {
		      checkobj.checked = true;
		   } else {
		      checkobj.checked = false;
		   }
		   j++;
		   checkobj = businessLogsForm.elements["list[@name='update']/QueryBizLogsByIds[@hciTagIndex='" + j + "']/businessLogsid"];
		}
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
		
		function doTeacherQuery(){
		businessLogsForm.action="ICCard.prFinance.prTeacherDetail.do";
		businessLogsForm.elements("actstr").value="teacherdetailview";
		talentquery();
		}
		
		function teacherQuery(){
		if(teacherdiv.style.display=="none"){
		teacherdiv.style.display="block";
		studentdiv.style.display="none";
		greendiv.style.display="none";
		businessLogsForm.elements("actstr").value="teacherdetailview";
		}
		else{
		teacherdiv.style.display="none";
		studentdiv.style.display="none";
		greendiv.style.display="none";
		businessLogsForm.elements("actstr").value="begin";
		}
		}
		
		function print(){
		if(printdiv.style.display=="none")
		printdiv.style.display="block";
		else
		printdiv.style.display="none";
		}
		
		function printHeader(){
		return "<center><h2>"+businessLogsForm.currentusername.value+"个人交易明细表</h2></center>";
		}
		
		function printFooter(){
		return "";
		}
		
		function setRowsPage(){
		// 检查输入的合法性
		var temp1=parseInt(document.all.cond_RowsPage.value);
		if(isNaN(temp1)){
		window.alert("每页信息的行数设置框内请输入阿拉伯数字！");
		return;
		}
		var form = document.businessLogsForm;
		// 检查用户的输入，使得值在[1,totalLines]之间
		if(temp1<1)
		form.linePerPage.value=20;
		else
		form.linePerPage.value=temp1;
		form.currPage.value=1;
		form.action="/businesslogs.do?action="+form.actionString.value;
		form.submit();
		}
						
		function viewAll()
		{
		    var form = document.businessLogsForm;   
		    form.linePerPage.value=form.totalLines.value;
		    form.currPage.value=1;
		    form.action="/businesslogs.do?action="+form.actionString.value;
			form.submit();
		}
		
		function dayPopUpCalendarDlg(ctrlobj){
			showx = event.screenX - event.offsetX+10; // + deltaX;
			showy = event.screenY - event.offsetY+10; // + deltaY;
			newWINwidth = 220 + 4 + 18;
			retval = window.showModalDialog("ICCard.prFinance.prCalendar.do", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
			if( retval!= null ){
			businessLogsForm.elements[ctrlobj].value = retval;
			if(businessLogsForm.elements["QueryBizLogsByIds/happeningtime/criteria/min"].value>businessLogsForm.elements["QueryBizLogsByIds/happeningtime/criteria/max"].value){
			alert("开始日期不可以大于结束日期！");
			businessLogsForm.elements["QueryBizLogsByIds/happeningtime/criteria/min"].value=retval;
			businessLogsForm.elements["QueryBizLogsByIds/happeningtime/criteria/max"].value=retval;
			}
			//if (ctrlobj == 'QueryBizLogsByIds/happeningtime/max') {
		       document.forms[0].elements["PageCond/begin"].value = 0;
		       document.forms[0].elements["PageCond/count"].value = 0;
			   document.forms[0].submit();
			//}
		}
		}
		
		function redirect() {
		   var frm = document.forms[0];
		   
		   frm.elements["PageCond/begin"].value = 0;
		   frm.elements["PageCond/count"].value = 0;
		   frm.submit();
		}
		</script>
	</head>
	<body topmargin="0" leftmargin="0" style="overflow-y:scroll" onload="setPrintArray()">
<!-- 导航条 -->
<form id="businessLogsForm" method="post">
<input type="hidden" name="operatorname" value="<bean:write property='SessionEntity/userID' filter='true'/>">
<input type="hidden" name="currentusername" value="<bean:write property='SessionEntity/userName' filter='true'/>">
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length" />
<html:hidden property="QueryBizLogsByIds/businessLogsid" />
<html:hidden property="QueryBizLogsByIds/type" value="person"/>
<html:hidden property="QueryBizLogsByIds/happeningtime/criteria/operator" value="between"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;自助管理—&gt;自助查询</td>
          </tr>
      </table></td>
    </tr>
  </table>
		
		<table width="96%"  border="0" cellspacing="1" cellpadding="1" align="center">
		<tr><td height="5"> </td></tr>
			<tr><td class="text">
			交易部门：
						<select name="QueryBizLogsByIds/poschargedepartmentid/criteria/value"  onchange="redirect();">
						<option value="1" <% if (cdid.equals("1")) { %>selected <% } %>>饭堂</option>
						<option value="2" <% if (cdid.equals("2")) { %>selected <% } %>>康乐园</option>
						<option value="3" <% if (cdid.equals("3")) { %>selected <% } %>>羽毛球场</option>
						<option value="4" <% if (cdid.equals("4")) { %>selected <% } %>>停车场</option>
						</select>&nbsp;&nbsp;
			日期：<html:text property="QueryBizLogsByIds/happeningtime/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
                 <input type="button" value="..." onclick="dayPopUpCalendarDlg('QueryBizLogsByIds/happeningtime/criteria/min')" title="选择起始日期">
					－ <html:text property="QueryBizLogsByIds/happeningtime/criteria/max" attributesText='class="input" size="10"' value="<%=now%>" readonly="true"/>
           <input type="button" value="..." onclick="dayPopUpCalendarDlg('QueryBizLogsByIds/happeningtime/criteria/max')" title="选择截止日期">
			&nbsp;&nbsp;
			<input name="B7" type="button" class="button_02" value="打印…" title="打开/关闭打印设置面板" onClick="iePrint()">
			</td></tr>
			<tr><td height="5"> </td></tr>
		</table>
		
		<table id="listdetail" width="96%" border="0" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" align="center">
			<tr align='center' class="td_title">
				<td id="dataEntity.me1" nowrap onClick="talentsort()">刷卡次数</td>
				<td id="dataEntity.me2" nowrap onClick="talentsort()">时间</td>
				<td id="dataEntity.me3" nowrap onClick="talentsort()">交易类型</td>
				<td id="dataEntity.me4" nowrap onClick="talentsort()">操作员/POS</td>
				<td id="dataEntity.me5" nowrap onClick="talentsort()">交易金额</td>
				<td id="dataEntity.me6" nowrap onClick="talentsort()">卡余额</td>
			</tr>
			<%
			  if (base.util.TalentContext.getEntity(pageContext,null,"list[@type='bizLogs']")!=null) {	
			%>
				<logic:iterate id="businesslogs" property="list[@type='bizLogs']">
					<%
					      j++;
					      if((j%2)==0)
					        out.println("<tr value='unselected' class='td1' onmouseover='mouseoverRow(this)' onmouseout='mouseoutRow(this)' onclick='selectRow(this)'>");
					      else
					        out.println("<tr value='unselected' class='td2' onmouseover='mouseoverRow(this)' onmouseout='mouseoutRow(this)' onclick='selectRow(this)'>");
					%>
					<td nowrap align="center">
					        <html:hidden id="businesslogs" name="list[@name='bizLogs']/QueryBizLogsByIds/businessLogsid" property="QueryBizLogsByIds/businessLogsid" indexed="true"/>
					        <html:hidden id="businesslogs" name="list[@name='bizLogs']/QueryBizLogsByIds/userid" property="QueryBizLogsByIds/userid" indexed="true"/>
							<div><bean:write id="businesslogs" property="QueryBizLogsByIds/cardusingtimes"/></div>
					</td>
					<td nowrap align='center' valign='middle'>
						<div><bean:write id="businesslogs" property="QueryBizLogsByIds/happeningtime" filter="true" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yy-MM-dd HH:mm:ss"/></div>
					</td>
					<td nowrap align="center">
						<div>
							<bean:write id="businesslogs" property="QueryBizLogsByIds/businesstype" filter="true"/>
						</div>
					</td>
					<td nowrap align="center">
						<div>
							<bean:write id="businesslogs" property="QueryBizLogsByIds/operatorname" filter="true"/>
							<bean:write id="businesslogs" property="QueryBizLogsByIds/shortname" filter="true"/>
						</div>
					</td>
					<td nowrap align="center">
						<div>
							<bean:write id="businesslogs" property="QueryBizLogsByIds/businessmoney" filter="true"/>
						</div>
					</td>
					<td nowrap align="center">
						<div>
							<bean:write id="businesslogs" property="QueryBizLogsByIds/balance" filter="true"/>
						</div>
					</td>
					</tr>
				<script language="JavaScript">
					rownum++;
				</script>
				</logic:iterate>
			<% }  else {%>
			<tr class='Standard-ListDoubleTRStyle'>
				<td colspan="8">（没有任何交易记录）</td>
			</tr>
		<% } %>
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
		</form>
	</body>