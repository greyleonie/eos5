<%@include file="/internet/common.jsp"%>
<%
  String[] POSTYPE_STRING = { "�Ͳ��շѻ�", "�˶��շѻ�","�����շѻ�" };
%>
	<head>
		<title>���׽���</title>
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
			var businessmoneySum=0;	//�����ܽ��
			var cardcostSum=0;		//���������ܶ�
			var notCheckouSum=0;//δ���ʽ��
			var POSbusinessmoneySum=0;	//POS���׽��
			var otherPOSbusinessmoneySum=0;	//����POS���׽��
			
			function setPrintArray(){
			var data = new Array();
			var title = new Array();
			
			//��ȡtitle����
			for (var ptr = 0; colnum > ptr; ptr++)
			title[ptr]=new Array(listdetail.rows[0].children[ptr].innerText,true);
			
			//��ȡ��������
			if(rownum>0)
			var currentDate=listdetail.rows[1].children[0].children[1].innerText;	//��ʼ������
			
			for(var row = 0; rownum > row; row++){
			//���ñ����ʽ
			if(currentDate!=listdetail.rows[row+1].children[0].children[1].innerText){
			stylenum++;
			currentDate=listdetail.rows[row+1].children[0].children[1].innerText;
			}
			//if(stylenum%2==0)
			//printTable.rows[row+1].className="Standard-ListSampleTRStyle";
			//
			//�ۼ��ܶ�
			var _businessmoney=listdetail.rows[row+1].children[2].children[2].value*1;
			var _countbusinessmoney=0;	//�����ۼӵĽ��
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
			
			if(_postypeid>=1 && 2>=_postypeid)//�Ͳ�/�˶��շѻ�
			POSbusinessmoneySum+=_businessmoney;
			
			if(_postypeid==3||_postypeid==4)//�����շѻ�
			otherPOSbusinessmoneySum+=_businessmoney;
			
			if(listdetail.rows[row+1].children[7].children[0].innerText.match("��"))//�Ƿ��Ѿ�����
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
			//����ܶ�
			businessmoneySum=formatSum(businessmoneySum);
			statistics.rows[0].children[1].children[0].innerText="�ֽ��ֵ��"+businessmoneySum;
			cardcostSum=formatSum(cardcostSum);
			statistics.rows[0].children[2].children[0].innerText="�ֽ𷢿���"+cardcostSum;
			notCheckouSum=formatSum(notCheckouSum);
			statistics.rows[0].children[3].children[0].innerText="δ���ʽ�"+notCheckouSum;
			POSbusinessmoneySum=formatSum(POSbusinessmoneySum);
			if(businessLogsForm.elements["QueryDayBizLogCols/ChargeDepartmentID/criteria/value"].value==1){	//����Ϊ�Ͳ��շѻ�
			statistics.rows[2].children[1].children[0].innerText="�Ͳ����ѣ�"+POSbusinessmoneySum;
			statistics.rows[2].children[2].children[0].innerText="�˶����ѣ�0.00";
			}
			else{	//�Ƿ���Ϊ�˶��շѻ�
			statistics.rows[2].children[1].children[0].innerText="�Ͳ����ѣ�0.00";
			statistics.rows[2].children[2].children[0].innerText="�˶����ѣ�"+POSbusinessmoneySum;
			}
			otherPOSbusinessmoneySum=formatSum(otherPOSbusinessmoneySum);
			statistics.rows[2].children[3].children[0].innerText="�������ѣ�"+otherPOSbusinessmoneySum;
			//
			}
			
			var printPaper = "�������A4ֽ�����ӡ��";
			printer = new SelectPrint("printer", "_printSetting", printPaper, -1, 45, data,title);
			printer.layout();
			}
			
			function formatSum(_businessmoneySum){
			//�淶�ܽ���ʽ
			pointindex=_businessmoneySum.toString().indexOf(".");
			len=_businessmoneySum.toString().length;
			if(pointindex>=0 && len>=pointindex+3)//����2λС������������
			_businessmoneySum=_businessmoneySum.toString().substring(0,pointindex+3);
			else if(0>pointindex)//û��С����Ĳ���λС��
			_businessmoneySum=_businessmoneySum.toString()+".00";
			else//�����Ĳ�һλС��
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
			alert("��ʼ���ڲ����Դ��ڽ������ڣ�");
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
						return "��";
					case 2:
						return "��";
					case 3:
						return "һ";
				}
				return "";
			}
			
			function printHeader(){
			var returnString= "<center><h2>�й�������ί��У";
					
					if(businessLogsForm.actionString.value=="��")
					returnString+=(businessLogsForm.elements["QueryDayBizLogCols/consumemonth"].value.substring(0,4)+"��"
					+businessLogsForm.elements["QueryDayBizLogCols/consumemonth"].value.substring(5,7)+"��");
					else if(businessLogsForm.actionString.value=="��"){
					if(businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/min"].value==businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/max"].value)
					returnString+=("("+businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/min"].value+")��");
					else
					returnString+=("("+businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/min"].value+"��"+businessLogsForm.elements["QueryDayBizLogCols/HappeningDate/criteria/max"].value+")��");
					}
					
					returnString+="���׽����";
					
					returnString+=getHeadTitleNO(businessLogsForm.elements["QueryDayBizLogCols/ChargeDepartmentID/criteria/value"].value);
					
					returnString+="</h2></center><table width='100%' border=0 cellpadding=0 cellspacing=0><tr><td align='left' valign='middle'>�Ʊ��ˣ�"
						+businessLogsForm.operatorname.value+"</td><td align='right' valign='middle'>��λ��������ң�Ԫ </td></tr></table>";
			return returnString;
			}
						
			function printFooter(){
			if(rownum>0)
			var returnString="<hr><table width='100%' height=30 border=0 align=center cellpadding=0 cellspacing=0 style='font-weight:600'><tr><td width='15%'align=center valign='middle'>�ֽ�ϼƣ�</td><td width='25%' align=left valign='middle'>"
						+statistics.rows[0].children[1].children[0].innerText+"</td><td width='25%' align=left valign='middle'>"
						+statistics.rows[0].children[2].children[0].innerText+"</td><td width='35%' align=left valign='middle'>"
						+statistics.rows[0].children[3].children[0].innerText+"</td></tr><tr><td width='15%'align=center valign='middle'>POS�ϼƣ�</td><td width='25%' align=left valign='middle'>"
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
			alert("��ѡ��һ����Ϣ��");
			return;
			}
			var _businesslogscollectid=selectedRow.childNodes.item(0).childNodes.item(0).value;
			if(_businesslogscollectid==0)//�ֽ�ϼƵĽ���
			{
			 if(notCheckouSum>0){
			   var sum=notCheckouSum*1;
			 }
			 else{
			   alert("û�м�¼�ɽ��ʣ�");
			   return;
			 }
			}
			else
			{
			   checkoutvalue=selectedRow.childNodes.item(7).childNodes.item(0).innerText;
			   if(checkoutvalue.match("��")){
			      alert("�ü�¼�ѽ��ʣ�");
			      return;
			   }else if(checkoutvalue.match("��")){
			   if(selectedRow.childNodes.item(2).childNodes.item(4).value=="1")//�ֽ���
			      var businessmoney=selectedRow.childNodes.item(2).childNodes.item(2).value;
			   else
			      var businessmoney=0;
			      var cardcost=selectedRow.childNodes.item(3).childNodes.item(1).value;
			      var sum=businessmoney*1+cardcost*1;
			   }
			   else
			      return;
			}
			var code = prompt("�� �� Ա��"+businessLogsForm.operatorname.value+"\n�����"+formatSum(sum)+"  (ȷ���������������������֤��)","");
			if(code==null)return;
			if(code == "3015"){
			  if(businessLogsForm.actionString.value=="��")
			    businessLogsForm.action="ICCard.prFinance.prMonthCheckOut.do";
			  else
			    businessLogsForm.action="ICCard.prFinance.prDayCheckOut.do";
			businessLogsForm.businesslogscollectid.value=_businesslogscollectid;
			businessLogsForm.submit();
			}else{
			alert("��֤�벻��ȷ��");
			}
			}
		</script>
	</head>
<body topmargin="0" leftmargin="0" style="overflow-y:scroll" onload="setPrintArray()">
<form id="businessLogsForm" method="post">
		<!-- ������ -->
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
		<!-- ������ 
		<table>
			<tr><td>
			<input name="B1" type="button" class="button_02" value="�ᡡ��" title="����ѡ��¼���н��ʴ���" onClick="checkout()">
			<input name="B2" type="button" class="button_02" value="��ӡ��" title="��/�رմ�ӡ�������" onClick="print()">
			</td></tr>
		</table>-->
		
		<div id="printdiv" style="display:none">
			<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr><td><div id="_printSetting"></div></td></tr>
			</table>
		</div>
		
		<!-- ����� -->
		<table height=3>
			<tr><td></td></tr>
		</table>
		<table width="96%" align="center">
			<tr>
				<logic:equal property="actstr" value="monthsettlementview">
						<td class="text" width="20%" align="left">���ţ�
						<%String cdid = base.util.TalentContext.getValue(pageContext,null,"QueryDayBizLogCols/ChargeDepartmentID/criteria/value");%>
						<select name="QueryDayBizLogCols/ChargeDepartmentID/criteria/value" onchange="redirect()">
						<option value="1" <% if (cdid.equals("1")) { %>selected <% } %>>����</option>
						<option value="2" <% if (cdid.equals("2")) { %>selected <% } %>>����԰</option>
						<option value="3" <% if (cdid.equals("3")) { %>selected <% } %>>��ë��</option>
						<option value="4" <% if (cdid.equals("4")) { %>selected <% } %>>ͣ����</option>
						</select>&nbsp;&nbsp;
						�·ݣ�
						<html:text property="QueryDayBizLogCols/consumemonth" styleClass="Standard-InputStyle" size="6" readonly="true"/>
						&nbsp;&nbsp;<input type="button" value="..." onclick="monthPopUpCalendarDlg('QueryDayBizLogCols/consumemonth')" title="ѡ��Ҫѡ�·ݵ�����һ�켴��ѡ�и���">
						&nbsp;&nbsp;<qx:talentButton property="B1" type="button" styleClass="button_02" title="����ѡ��¼���н��ʴ���" value="�ᡡ��" onclick="checkout()" operation="DX_CWGL_Foot_Day.DX_CWGL_Foot_Day_Check"/>
			            <input name="B2" type="button" class="button_02" value="��ӡ��" title="��/�رմ�ӡ�������" onClick="print()">
						<input name="B2" type="button" class="button_02" value="����" onClick="exportexcel()">
						</td>
						<logic:present property="SessionEntity/userID">
						<input type="hidden" name="operatorname" value="<bean:write property='SessionEntity/userID'/>">
						</logic:present>
						<logic:notPresent property="SessionEntity/userID">
						<input type="hidden" name="operatorname" value="">
						</logic:notPresent>
						<input type="hidden" name="businesslogscollectid">
						<input type="hidden" name="actionString" value="��">
				</logic:equal>
				
				<logic:equal property="actstr" value="daysettlementview">
						<td class="text" width="20%" align="left">���ţ�
						<%String cdid = base.util.TalentContext.getValue(pageContext,null,"QueryDayBizLogCols/ChargeDepartmentID/criteria/value");%>
						<select name="QueryDayBizLogCols/ChargeDepartmentID/criteria/value"  onchange="redirect()">
						<option value="1" <% if (cdid.equals("1")) { %>selected <% } %>>����</option>
						<option value="2" <% if (cdid.equals("2")) { %>selected <% } %>>����԰</option>
						<option value="3" <% if (cdid.equals("3")) { %>selected <% } %>>��ë��</option>
						<option value="4" <% if (cdid.equals("4")) { %>selected <% } %>>ͣ����</option>
						</select>&nbsp;&nbsp;
						���ڣ�
						<html:text property="QueryDayBizLogCols/HappeningDate/criteria/min" styleClass="Standard-InputStyle" size="10" readonly="true"/>
						<input type="button" value="..." onclick="dayPopUpCalendarDlg('QueryDayBizLogCols/HappeningDate/criteria/min')" title="ѡ����ʼ����">
						��
						<html:text property="QueryDayBizLogCols/HappeningDate/criteria/max" styleClass="Standard-InputStyle" size="10" readonly="true"/>
						<input type="button" value="..." onclick="dayPopUpCalendarDlg('QueryDayBizLogCols/HappeningDate/criteria/max')" title="ѡ���ֹ����">
						&nbsp;&nbsp;<qx:talentButton property="B1" type="button" styleClass="button_02" title="����ѡ��¼���н��ʴ���" value="�ᡡ��" onclick="checkout()" operation="DX_CWGL_Foot_Month.DX_CWGL_Foot_Month_Check"/>
			            &nbsp;&nbsp;<input name="B2" type="button" class="button_02" value="��ӡ��" title="��/�رմ�ӡ�������" onClick="print()">
			            &nbsp;&nbsp;<input name="B2" type="button" class="button_02" value="����" onClick="exportexcel()">
						</td>
						<logic:present property="SessionEntity/userID">
						<input type="hidden" name="operatorname" value="<bean:write property='SessionEntity/userID'/>">
						</logic:present>
						<input type="hidden" name="businesslogscollectid">
						<input type="hidden" name="actionString" value="��">
				</logic:equal>
			</tr>
		</table>
		
		<script language="JavaScript">
			//���������url
			bannerURL.innerHTML="��ҳ > ������� > ���㱨�� > <strong><font color=#FFC104>" + businessLogsForm.actionString.value+"���׽���</font></strong>";
		</script>
		
		<!-- ����� -->
		<table height=5 class="Standard-TileTableStyle">
			<tr><td></td></tr>
		</table>
		
		<table id="listdetail" WIDTH="96%" border="0" cellspacing="1" cellpadding="0" bgcolor="#A2C4DC" align="center">
			<tr align="center" class="td_title">
				<td id="dataEntity.me1" nowrap onClick="talentsort()">��������</td>
				<td id="dataEntity.me2" nowrap onClick="talentsort()">��������</td>
				<td id="dataEntity.me3" nowrap onClick="talentsort()">���׽��</td>
				<td id="dataEntity.me4" nowrap onClick="talentsort()">��������</td>
				<td id="dataEntity.me5" nowrap onClick="talentsort()">����Ա/POS��</td>
				<td id="dataEntity.me6" nowrap onClick="talentsort()">������</td>
				<td id="dataEntity.me7" nowrap onClick="talentsort()">����Ա</td>
				<td id="dataEntity.me8" nowrap onClick="talentsort()">�Ƿ����</td>
				<td id="dataEntity.me9" nowrap onClick="talentsort()">����ʱ��</td>
			</tr>
			<%
			  if (base.util.TalentContext.getEntity(pageContext,null,"list[@type='bizLogCols']")!=null) {
			%>
				<logic:iterate id="businesslogscoll" property="list[@type='bizLogCols']">
				    <%
					      j++;
					      if((j%2)==0)
					        out.println("<tr value='unselected' class='td1' onmouseover='mouseoverRow(this)' onmouseout='mouseoutRow(this)' onclick='selectRow(this)' onDblClick='onDClick(this)' title='˫�����н��ʴ���'>");
					      else
					        out.println("<tr value='unselected' class='td2' onmouseover='mouseoverRow(this)' onmouseout='mouseoutRow(this)' onclick='selectRow(this)' onDblClick='onDClick(this)' title='˫�����н��ʴ���'>");
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
								      out.println("(δ֪)");
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
							     if ("1".equals(isCheck)) out.print("��"); else out.print("<font color='#FF0000'>��</font>");
							  if (bizType != null && "3,5,8".indexOf(bizType)>=0) out.print("��");
							  
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
					out.println("<tr class=\'Standard-StatisticsMessageStyle\' value='unselected' onmouseover='mouseoverRow(this)' onmouseout='mouseoutRow(this)' onclick='selectRow(this)' onDblClick='onDClick(this)' title='˫�����н��ʴ���'>"
						+"<td colspan=1 align=center valign=middle><input type='hidden' name='businesslogscollectid' value=0><div>�ֽ�ϼƣ�</div></td>"
						+"<td colspan=3 align=left valign=middle><div></div></td>"
						+"<td colspan=2 align=left valign=middle><div></div></td>"
						+"<td colspan=3 align=left valign=middle><div></div></td>"
					+"</tr>"
					+"<tr><td colspan=9 class=\'Standard-ListDoubleTRStyle\'></td></tr>"
					+"<tr class=\'Standard-StatisticsMessageStyle\'>"
						+"<td colspan=1 align=center valign=middle><div>POS�ϼƣ�</div></td>"
						+"<td colspan=3 align=left valign=middle><div></div></td>"
						+"<td colspan=2 align=left valign=middle><div></div></td>"
						+"<td colspan=3 align=left valign=middle><div></div></td>"
					+"</tr>"
					+"</table>"
					+"<table width=90% height=30 border=0 align=center vlign=middle cellpadding=0 cellspacing=0>"
					+"<tr><td><font size='2'>����ע����ɫ���ֵĽ����������ֽ���ʣ�</font></td></tr></table>");
				}
				else {
				    out.println("<table id='statistics' width='96%' border='0' cellspacing='1' cellpadding='0' align='center' bgcolor='#A2C4DC'>");
					out.println("<tr class='Standard-ListDoubleTRStyle'><td colspan='10'>����δ���㣬û�н����¼����</td></tr></table>");
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
		alert("���ܵ�����û�е���form");
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
			re=/(< *a [^>]*>)|(< *\/ *a *>)/gi;   //ȥ���������������
			somecellvalue = somecellvalue.replace(re,"");
			//somecellvalue = somecellvalue.replace(/(< *FONT [^>]*>)/gi,"");
			somecellvalue = somecellvalue.replace(/(< *FONT [^>]*>)|(< *\/ *FONT *>)/gi,"");
			if(i == 0 ) {
				somecellvalue = somecellvalue.replace(/<br>/gi,"");
				
				somecellvalue = somecellvalue.replace(/<INPUT .*?>/gi,"���");
				somecellvalue = somecellvalue.replace(/(< *IMG [^>]*>)/gi,"���");
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