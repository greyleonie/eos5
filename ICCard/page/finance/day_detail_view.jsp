<%@include file="/internet/common.jsp"%>
<%
  String[] USERTYPE_STRING={"��ְ�̹�","�����ݽ̹�","���������ѧԱ","�ǳ��������ѧԱ","ί�а��ѧԱ","�̿��û�","��ʱ��"};
%>
	<head>
		<title>�ս�����ϸ</title>
		<link  href="/internet/css/standard.css" rel="stylesheet" type="text/css" >
		<script language="JScript" src="/internet/scripts/Toolbar.js"></script>
		<script language="JScript" src="/internet/scripts/TableController.js"></script>
		<script language="JavaScript" src="/internet/scripts/SelectPrint.js"></script>
		<script language="javascript" src="/internet/scripts/date2string.js"></script>
		<script language="javascript" src="/internet/scripts/Check2.js"></script>
		<%	int j=0; %>
		<script language="JavaScript">
		var selectedRow = null;
		var printer;
		var rownum=0;
		var colnum=9;

		function setPrintArray(){
		var data = new Array();
		var title = new Array();

		if(businessLogsForm.elements["QueryBizLogsByIds/useCondition"].value=="true")
			conditions.style.display="block";	//���������������û�������Ϣ

		//��ȡtitle����
		for (var ptr = 0; colnum > ptr; ptr++)
		title[ptr]=new Array(listdetail.rows[0].children[ptr].innerText,true);

		var businessmoneySum=0;
		var cardcostSum=0;

		//��ȡ��������
		for(var row = 0; rownum > row; row++){
		data[row] = new Array();
		data[row][0]=listdetail.rows[row+1].children[0].children[1].innerText;

		//�ۼ��ܶ�
		businessmoneySum=businessmoneySum+listdetail.rows[row+1].children[6].children[0].innerText*1;
		cardcostSum=cardcostSum+listdetail.rows[row+1].children[7].children[0].innerText*1;

		for(var col = 1; colnum > col; col++){
		data[row][col]=listdetail.rows[row+1].children[col].children[0].innerText;
		}
		}

		if(rownum>0){
			//����ܶ�
			businessmoneySum=formatSum(businessmoneySum);
			statistics.rows[0].children[1].children[0].innerText="�����ܽ�"+businessmoneySum;
			cardcostSum=formatSum(cardcostSum);
			statistics.rows[0].children[2].children[0].innerText="�������ܶ"+cardcostSum;
			statistics.rows[0].children[3].children[0].innerText="�������˴Σ�"+rownum;
		}

		var printPaper = "�������A4ֽ�����ӡ��";
		printer = new SelectPrint("printer", "_printSetting", printPaper, -1, 45, data,title);
		printer.layout();
		}

		function onDClick(thisObject){
		checkRedundance();
		}

		

		function redirect(){
		var usertype = businessLogsForm.elements["QueryBizLogsByIds/usertypeid"];
		var utid = usertype.options[usertype.selectedIndex].value;
		
		switch (utid) {
		   case "3" :
		        businessLogsForm.elements["Class/ClassTypeID"].value = 1;
		        break;
		   case "4" :
		        businessLogsForm.elements["Class/ClassTypeID"].value = 2;
		        break;
		   case "5" :
		        businessLogsForm.elements["Class/ClassTypeID"].value = 3;
		        break;
		   default : 
		        businessLogsForm.elements["Class/ClassTypeID"].value = 5;
		}
		
		businessLogsForm.submit();
		}

		function docondition(){
		if(conditions.style.display=="none"){
		conditions.style.display="block";	//���������������û�������Ϣ
		businessLogsForm.elements["QueryBizLogsByIds/useCondition"].value=true;
		}
		else{
		conditions.style.display="none";	//���������������û�������Ϣ
		businessLogsForm.elements["QueryBizLogsByIds/useCondition"].value=false;
		}
		}

		function settlementThisDate(){
		businessLogsForm.action="ICCard.prFinance.prDaySettlement.do";
		businessLogsForm.submit();
		}

		function reSettlementThisDate(){
		businessLogsForm.action="ICCard.prFinance.prDayReSettlement.do";
		businessLogsForm.submit();
		}

		function checkoutData(){
        if (document.getElementById("listdetail").rows.length<2) {
		   alert("��ѡ��У���¼��");
		   return false;
		}
		if(businessLogsForm.currentuserid.value!="sysadmin"){
		alert("�Բ�������ȨУ�����ݡ�");
		return;
		}
		businessLogsForm.action="ICCard.prFinance.prCheckupData.do";
		businessLogsForm.submit();
		}

		function checkRedundance(){
		if(selectedRow ==null){
		alert("��ѡ��һ����¼!");
		return;
		}
		
		businessLogsForm.elements["QueryBizLogsByIds/businessLogsid"].value = selectedRow.childNodes.item(0).childNodes.item(0).value;
		businessLogsForm.action="ICCard.prFinance.prCheckRedundance.do";
		businessLogsForm.submit();
		}
		function print(){
		if(printdiv.style.display=="none")
		printdiv.style.display="block";
		else
		printdiv.style.display="none";
		}

		function printHeader(){
		returnString="<center><h2>������ί��У";

		if(businessLogsForm.elements["QueryBizLogsByIds/usertypeid"].value>=3 && businessLogsForm.elements["QueryBizLogsByIds/usertypeid"].value<=5){
			returnString+=businessLogsForm.elements["QueryBizLogsByIds/classid"].options[businessLogsForm.elements["QueryBizLogsByIds/classid"].selectedIndex].innerText;
		}else if(businessLogsForm.elements["QueryBizLogsByIds/businessTypeid"].value>0){
			returnString+=businessLogsForm.elements["QueryBizLogsByIds/usertypeid"].options[businessLogsForm.elements["QueryBizLogsByIds/usertypeid"].selectedIndex].innerText;
		}

		if(businessLogsForm.elements["QueryBizLogsByIds/businessTypeid"].value==3 && businessLogsForm.elements["QueryBizLogsByIds/posid"].value>0){
			returnString+="��";
			returnString+=businessLogsForm.elements["QueryBizLogsByIds/posid"].options[businessLogsForm.elements["QueryBizLogsByIds/posid"].selectedIndex].innerText;
			returnString+="���ѵ�";
		}else if(businessLogsForm.elements["QueryBizLogsByIds/businessTypeid"].value>0){
			returnString+=businessLogsForm.elements["QueryBizLogsByIds/businessTypeid"].options[businessLogsForm.elements["QueryBizLogsByIds/businessTypeid"].selectedIndex].innerText;
		}

		returnString+="������ϸ��<br>";

		if(businessLogsForm.elements["QueryBizLogsByIds/happeningtime/min"].value==businessLogsForm.elements["QueryBizLogsByIds/happeningtime/max"].value)
			returnString+=("("+businessLogsForm.elements["QueryBizLogsByIds/happeningtime/min"].value);
		else
			returnString+=("("+businessLogsForm.elements["QueryBizLogsByIds/happeningtime/min"].value+"��"+businessLogsForm.elements["QueryBizLogsByIds/happeningtime/max"].value);

		if(businessLogsForm.elements["QueryBizLogsByIds/timeid"].value>0){
			returnString+=" "+businessLogsForm.elements["QueryBizLogsByIds/timeid"].options[businessLogsForm.elements["QueryBizLogsByIds/timeid"].selectedIndex].innerText+"ʱ��";
		}

		returnString+=")</h2></center><table width='100%' border=0 cellpadding=0 cellspacing=0><tr><td align='left' valign='middle'>���ײ��ţ�"
						+businessLogsForm.elements["QueryBizLogsByIds/departmentid"].options[businessLogsForm.elements["QueryBizLogsByIds/departmentid"].value-1].innerText+"</td><td align='right' valign='middle'>��λ��������ң�Ԫ </td></tr></table>";

		return returnString;
		}

		function printFooter(){
			if(rownum>0)
			var returnString="<hr><table width='100%' height=30 border=0 align=center cellpadding=0 cellspacing=0 style='font-weight:600'><tr><td width='15%'align=center valign='middle'>��  �ƣ�</td><td width='25%' align=left valign='middle'>"
						+statistics.rows[0].children[1].children[0].innerText+"</td><td width='25%' align=left valign='middle'>"
						+statistics.rows[0].children[2].children[0].innerText+"</td><td width='35%' align=left valign='middle'>"
						+statistics.rows[0].children[3].children[0].innerText+"</td></tr></table><hr>";
			else
			var returnString="";
			return returnString;
		}

		function gotoPage(num){
		var form = document.businessLogsForm;
		if(form.totalLines.value == 0){
		window.alert("��ǰû���κν��׼�¼��");
		return;
		}
		//��ȡ��Ҫ����
		currentPageNum=form.currPage.value*1;
		totalPagesNum=form.totalPages.value*1;
		//
		if(num=="FirstPage")
		form.currPage.value=1;
		else if(num=="LastPage")
		form.currPage.value=totalPagesNum;
		else if(num=="BackPage")
		form.currPage.value=((currentPageNum-1)>1)?(currentPageNum-1):1;
		else if(num=="NextPage")
		form.currPage.value=(totalPagesNum>(currentPageNum+1))?(currentPageNum+1):totalPagesNum;
		else if(num=="numPage"){
		// �������ĺϷ���
		var temp1=parseInt(document.all.cond_GotoPage.value);
		if(isNaN(temp1)){
		window.alert("ҳ�����ÿ��������밢�������֣�");
		return;
		}
		// ����û������룬ʹ��ֵ��[1,totalPages]֮��
		if(temp1<1)
		form.currPage.value=1;
		else if(temp1>totalPagesNum)
		form.currPage.value=totalPagesNum;
		else
		form.currPage.value=temp1;
		}
		form.linePerPage.value=document.all.cond_RowsPage.value;
		form.submit();
		}

		function setRowsPage(){
		// �������ĺϷ���
		var temp1=parseInt(document.all.cond_RowsPage.value);
		if(isNaN(temp1)){
		window.alert("ÿҳ��Ϣ���������ÿ��������밢�������֣�");
		return;
		}
		var form = document.businessLogsForm;
		// ����û������룬ʹ��ֵ��[1,totalLines]֮��
		if(temp1<1)
		form.linePerPage.value=20;
		else
		form.linePerPage.value=temp1;
		form.currPage.value=1;
		form.submit();
		}

		function viewAll()
		{
		    var form = document.businessLogsForm;
		    form.linePerPage.value=form.totalLines.value;
		    form.currPage.value=1;
			form.submit();
		}
		
		function dayPopUpCalendarDlg(ctrlobj){
			showx = event.screenX - event.offsetX+10; // + deltaX;
			showy = event.screenY - event.offsetY+10; // + deltaY;
			newWINwidth = 220 + 4 + 18;
			retval = window.showModalDialog("ICCard.prFinance.prCalendar.do", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
			if( retval!= null ){
			businessLogsForm.elements[ctrlobj].value = retval;
			if(businessLogsForm.elements["QueryBizLogsByIds/happeningtime/min"].value>businessLogsForm.elements["QueryBizLogsByIds/happeningtime/max"].value){
			alert("��ʼ���ڲ����Դ��ڽ������ڣ�");
			businessLogsForm.elements["QueryBizLogsByIds/happeningtime/min"].value=retval;
			businessLogsForm.elements["QueryBizLogsByIds/happeningtime/max"].value=retval;
			}
			//if (ctrlobj == 'QueryBizLogsByIds/happeningtime/max') {
			   redirect();
			//}
		}
		}
		</script>
	</head>
<body topmargin="0" leftmargin="0" style="overflow-y:scroll" onload="setPrintArray()">
<form id="businessLogsForm" method="post">
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length" />
<html:hidden property="Class/ClassTypeID" />
<html:hidden property="QueryBizLogsByIds/businessLogsid" />
<html:hidden property="QueryBizLogsByIds/type" value="day"/>
		<!-- ������ -->
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ϸ����&gt;�ս�����ϸ</td>
          </tr>
      </table></td>
    </tr>
  </table>
		<!-- ������ -->
		<table width="96%" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr valign="middle"><td class="text">
			<qx:talentButton property="B1" type="button" styleClass="button_02" title="���㵱�ս��׼�¼" value="���ս���" onclick="settlementThisDate()" operation="DX_CWGL_Detail_Day.DX_CWGL_Detail_Day_Check"/>&nbsp;
			<qx:talentButton property="B2" type="button" styleClass="button_02" title="���½��㵱�ս��׼�¼" value="���½���" onclick="reSettlementThisDate()" operation="DX_CWGL_Detail_Day.DX_CWGL_Detail_Day_Recheck"/>&nbsp;
			<qx:talentButton property="B3" type="button" styleClass="button_02" title="У�����������Ƿ���ȷ" value="У������" onclick="checkoutData()" operation="DX_CWGL_Detail_Day.DX_CWGL_Detail_Day_Data"/>&nbsp;
			<qx:talentButton property="B3" type="button" styleClass="button_02" title="�����ѡ��¼�Ƿ��������" value="�������" onclick="checkRedundance()" operation="DX_CWGL_Detail_Day.DX_CWGL_Detail_Day_Redundancy"/>&nbsp;
			<input name="B5" type="button" class="button_02" value="ɸѡ��ѯ" title="����ɸѡ�������в�ѯ" onClick="docondition()">&nbsp;
			<input name="B6" type="button" class="button_02" value="��ӡ��" title="��/�رմ�ӡ�������" onClick="print()">
			</td></tr>
		</table>

		<div id="printdiv" style="display:none">
			<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr><td><div id="_printSetting"></div></td></tr>
			</table>
		</div>
		<!-- ����� -->
		<table height=2>
			<tr><td></td></tr>
		</table>
		<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
			<tr><td>
			<!-- ����� -->
			<table align="center" width="96%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td valign="bottom" class="text">���ײ��ţ�
					<%String cdid = base.util.TalentContext.getValue(pageContext,null,"QueryBizLogsByIds/departmentid");%>
						<select name="QueryBizLogsByIds/departmentid"  onchange="redirect()">
						<option value="1" <% if (cdid.equals("1")) { %>selected <% } %>>����</option>
						<option value="2" <% if (cdid.equals("2")) { %>selected <% } %>>����԰</option>
						<option value="3" <% if (cdid.equals("3")) { %>selected <% } %>>��ë��</option>
						<option value="4" <% if (cdid.equals("4")) { %>selected <% } %>>ͣ����</option>
						</select>&nbsp;&nbsp;
					���ڣ�<html:text property="QueryBizLogsByIds/happeningtime/min" attributesText='class="input" size="10"' readonly="true"/>
           <input type="button" value="..." onclick="dayPopUpCalendarDlg('QueryBizLogsByIds/happeningtime/min')" title="ѡ����ʼ����">
					�� <html:text property="QueryBizLogsByIds/happeningtime/max" attributesText='class="input" size="10"' readonly="true"/>
           <input type="button" value="..." onclick="dayPopUpCalendarDlg('QueryBizLogsByIds/happeningtime/max')" title="ѡ���ֹ����">
					&nbsp;&nbsp;<%String tid = base.util.TalentContext.getValue(pageContext,null,"QueryBizLogsByIds/timeid");%>
					ʱ�Σ�<select name="QueryBizLogsByIds/timeid" onchange="redirect()">
					<option value="0" <% if (tid.equals("0")) { %>selected <% } %>>ȫ��</option>
					<option value="1" <% if (tid.equals("1")) { %>selected <% } %>>���</option>
					<option value="2" <% if (tid.equals("2")) { %>selected <% } %>>�в�</option>
					<option value="3" <% if (tid.equals("3")) { %>selected <% } %>>���</option></select>
					<input type="hidden" name="operatorname" value="<bean:write property='SessionEntity/userID' formatClass='username' formatType='userid'/>"/>
					<input type="hidden" name="currentuserid" value="<bean:write property='SessionEntity/userID' formatClass='userid' formatType='userid'/>"/>
					</td>
				</tr>
			</table>

		<!-- ��ҳ������ -->
		<table height=3>
			<tr><td></td></tr>
		</table>
		<html:hidden property="QueryBizLogsByIds/useCondition"/>
	    <div id="conditions" style="display:none;" class="text">&nbsp;&nbsp;
					<%
					  if (base.util.TalentContext.getEntity(pageContext,null,"list[@type='bizTypes']")!=null) {	
					%>
							�������ͣ�
							<html:select property="QueryBizLogsByIds/businessTypeid" onchange="redirect()">
							<html:option value="0">ȫ��</html:option>
							<html:options property="list[@type='bizTypes']/bizTypes/BusinessTypeID" labelProperty="list[@type='bizTypes']/bizTypes/BusinessType"/>
							</html:select>
					<% } %>
					<logic:equal property="QueryBizLogsByIds/businessTypeid" value="3">&nbsp;&nbsp;
					POS���ͣ�<html:select property="posType/typeID" onchange="redirect()">
							<html:option value="-1">ȫ��</html:option>
							<html:option value="0">����һ¥POS��</html:option>
							<html:option value="1">���ö�¥��ڵ�բ��</html:option>
							<html:option value="2">���ö�¥���ڵ�բ��</html:option>
							</html:select>&nbsp;&nbsp;
						POS��<html:select property="QueryBizLogsByIds/posid" onchange="redirect()">
							<html:options property="list[@type='Poses']/Poses/POSID" labelProperty="list[@type='Poses']/Poses/ShortName" />
							</html:select>
					</logic:equal>
					<logic:notEqual property="QueryBizLogsByIds/businessTypeid" value="3">
					<input type="hidden" id="QueryBizLogsByIds/posid" name="QueryBizLogsByIds/posid" value="0">
					</logic:notEqual>
					&nbsp;�û����ͣ�<%String utid = base.util.TalentContext.getValue(pageContext,null,"QueryBizLogsByIds/usertypeid");%>
					<select name="QueryBizLogsByIds/usertypeid" onchange="redirect()">
					<option value="0" <% if (utid.equals("0")) { %>selected <% } %>>ȫ��</option>
					<option value="1" <% if (utid.equals("1")) { %>selected <% } %>>��ְ�̹�</option>
					<option value="2" <% if (utid.equals("2")) { %>selected <% } %>>�����ݽ̹�</option>
					<option value="3" <% if (utid.equals("3")) { %>selected <% } %>>���������ѧԱ</option>
					<option value="4" <% if (utid.equals("4")) { %>selected <% } %>>�ǳ��������ѧԱ</option>
					<option value="5" <% if (utid.equals("5")) { %>selected <% } %>>ί�а��ѧԱ</option>
					<option value="6" <% if (utid.equals("6")) { %>selected <% } %>>�̿��û�</option>
					<option value="7" <% if (utid.equals("7")) { %>selected <% } %>>��ʱ��</option>
					</select>
					<%
			         if (base.util.TalentContext.getEntity(pageContext,null,"list[@type='studentclass']/studentclass")!=null) {	
			        %>
					&nbsp;�༶��<html:select property="QueryBizLogsByIds/classid" onchange="redirect()">
						<html:option value="0">&lt;��ѡ��&gt;</html:option>
						<html:options property="list[@type='studentclass']/studentclass/ClassID" labelProperty="list[@type='studentclass']/studentclass/ClassName"/>
						</html:select>
					<% } %></div>
		<!-- ��ҳ������ -->
		<table height=5>
			<tr><td></td></tr>
		</table>
		</td></tr></table>

		<table id="listdetail" width="96%" border="0" cellspacing="1" cellpadding="0" align="center" bgcolor="#A2C4DC">
			<tr align='center' class="td_title">
				<td id="dataEntity.me1" nowrap onClick="talentsort()">ʱ��</td>
				<td id="dataEntity.me2" nowrap onClick="talentsort()">��������</td>
				<td id="dataEntity.me3" nowrap onClick="talentsort()">����Ա/POS</td>
				<td id="dataEntity.me4" nowrap onClick="talentsort()">�û�����</td>
				<td id="dataEntity.me5" nowrap onClick="talentsort()">������</td>
				<td id="dataEntity.me6" nowrap onClick="talentsort()">�û�����</td>
				<td id="dataEntity.me7" nowrap onClick="talentsort()">���׽��</td>
				<td id="dataEntity.me8" nowrap onClick="talentsort()">��������</td>
				<td id="dataEntity.me9" nowrap onClick="talentsort()">�ſ����</td>
			</tr>
			<%
			  if (base.util.TalentContext.getEntity(pageContext,null,"list[@type='bizLogs']")!=null) {
			%>
				<logic:iterate id="businesslogs" property="list[@type='bizLogs']">
					<%
					      j++;
					      if((j%2)==0)
					        out.println("<tr value='unselected' class='td1' onmouseover='mouseoverRow(this)' onmouseout='mouseoutRow(this)' onclick='selectRow(this)' onDblClick='onDClick(this)' title='˫����������¼'>");
					      else
					        out.println("<tr value='unselected' class='td2' onmouseover='mouseoverRow(this)' onmouseout='mouseoutRow(this)' onclick='selectRow(this)' onDblClick='onDClick(this)' title='˫����������¼'>");
					%>
					<td nowrap align='middle' valign='middle'>
						<html:hidden id="businesslogs" name="list[@name='bizLogs']/QueryBizLogsByIds/businessLogsid" property="entity/BusinessLogsID" indexed="true"/>
						<div>
						    <bean:write id="businesslogs" property="entity/HappeningTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss" />
						</div>
					</td>
					<td align="center">
	
						<div>
							<bean:write id="businesslogs" property="entity/BusinessType" filter="true"/>
						</div>
					</td>
					<td align="center">
						<div>
							<bean:write id="businesslogs" property="entity/OperatorName" filter="true"/>
							<bean:write id="businesslogs" property="entity/shortname" filter="true"/>
						</div>
					</td>
					<td align="center">
						<div>
							<bean:write id="businesslogs" property="entity/username" filter="true"/>
						</div>
					</td>
					<td align="center">
						<div>
							<logic:present id="businesslogs" property="entity/cardid">
								<bean:write id="businesslogs" property="entity/cardcoverno" />
							</logic:present>
							<logic:notPresent id="businesslogs" property="entity/cardid">
								(ȱ��)
							</logic:notPresent>
						</div>
					</td>
					<td align="center">
					<%
					  String usertype = "";
					  String uid = base.util.TalentContext.getValue(pageContext,"businesslogs","entity/usertypeid");
					  if (uid != null && !"".equals(uid)) {
					     int usertypeid = Integer.parseInt(uid);
					      if (usertypeid>=1 && usertypeid<=7){
					           usertype = USERTYPE_STRING[usertypeid-1];
		                   } else {
			                   usertype = "(δ֪)";
		                   }  
					  }
					%>
						<div>
							<%=usertype%>
						</div>
					</td>
					<td align="center">
						<div>
							<bean:write id="businesslogs" property="entity/BusinessMoney" filter="true"/>
						</div>
					</td>
					<td align="center">
						<div>
							<bean:write id="businesslogs" property="entity/CardCost" filter="true"/>
						</div>
					</td>
					<td align="center">
						<div>
							<logic:equal id="businesslogs" property="entity/BusinessTypeID" value="8"><%--���ͱ��Ϊ8��ʾ�ſ�ת��--%>
								<bean:write id="businesslogs" property="entity/BackupData" filter="true"/>
							</logic:equal>
						</div>
					</td>
					</tr>
				<script language="JavaScript">
					rownum++;
				</script>
				</logic:iterate>
		</table>
			<% }
			if(j>0) {
			    out.println("<table id='statistics' width='96%' border='0' cellspacing='1' cellpadding='0' align='center' bgcolor='#A2C4DC'>");
				out.println("<tr class=\'Standard-StatisticsMessageStyle\' value='unselected' onmouseover='mouseoverRow(this)' onmouseout='mouseoutRow(this)'>"
					+"<td colspan=1 align=center valign=middle>��ҳ�ϼƣ�</td>"
					+"<td colspan=2 align=left valign=middle><div></div></td>"
					+"<td colspan=2 align=left valign=middle><div></div></td>"
					+"<td colspan=4 align=left valign=middle><div></div></td>"
				+"</tr></table>");
			}
			%>
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