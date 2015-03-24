<%@include file="/internet/common.jsp"%>

	<head>
		<title>���˽�����ϸ</title>
		<link  href="/internet/css/standard.css" rel="stylesheet" type="text/css" >
		<script language="JScript" src="/internet/scripts/Toolbar.js"></script>
		<script language="JScript" src="/internet/scripts/TableController.js"></script>
		<script language="JavaScript" src="/internet/scripts/SelectPrint.js"></script>
		<script language="javascript" src="/internet/scripts/date2string.js"></script>
		<script language="javascript" src="/internet/scripts/Check2.js"></script>
		<%	int j=0; %>
		<script language="JavaScript">
		var selectedRow = null;
		var check_len=0;
		var printer;
		var rownum=0;
		var colnum=7;
		
		function setPrintArray(){
		cardcontrol.Init(0);	//��ʼ������
		
		if(businessLogsForm.actstr.value=="teacherdetailview")	//��ʾ�̹�ѡ���
		teacherdiv.style.display="block";
		
		if(businessLogsForm.actstr.value=="studentdetailview")	//��ʾѧԱѡ���
		studentdiv.style.display="block";
		
		if(businessLogsForm.actstr.value=="greencarddetailview")	//��ʾ�̿�ѡ���
		greendiv.style.display="block";
		
		conditions.style.display="block";	//���������������û�������Ϣ
		
		var data = new Array();
		var title = new Array();
		
		//��ȡtitle����
		for (var ptr = 0; colnum > ptr; ptr++)
		title[ptr]=new Array(listdetail.rows[0].children[ptr].innerText,true);
		
		//��ȡ��������
		for(var row = 0; rownum > row; row++){
		data[row] = new Array();
		data[row][0]=listdetail.rows[row+1].children[0].children[2].innerText;
		for(var col = 1; colnum > col; col++){
		data[row][col]=listdetail.rows[row+1].children[col].children[0].innerText;
		}
		}
		
		var printPaper = "�������A4ֽ�����ӡ��";
		printer = new SelectPrint("printer", "_printSetting", printPaper, -1, 45, data,title);
		printer.layout();
		}
		
		function onDClick(thisObject){
			checkRedundance();
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
		
		function invoicedGroup(){
			var checkFlag = false;	
			var sum=0;
			var j=0;
			var i=0;
			var checkObj = businessLogsForm.elements["list[@name='update']/QueryBizLogsByIds[@hciTagIndex='0']/businessLogsid"];
			
			while (checkObj != undefined) {
			    if (checkObj.checked) {
			       checkFlag = true;
			       if (checkObj.parentNode.parentNode.children[7].children[0].value=="yes") {
			          sum+=checkObj.parentNode.parentNode.children[4].children[0].innerText*1;
			       }
			    }
			    i++;
			    checkObj = businessLogsForm.elements["list[@name='update']/QueryBizLogsByIds[@hciTagIndex='"+i+"']/businessLogsid"];
			}
				
			if(!checkFlag){
				alert("��ѡ��Ҫ����Ʊ�Ľ��׼�¼��");
				return;
			}			
					
			var code = prompt("�� �� Ա��"+businessLogsForm.operatorname.value+"\n��Ʊ��"+formatSum(sum)+"  (ȷ���������������������֤��)","");
			if(code==null)return;
			if(code == "3015"){
				businessLogsForm.action="ICCard.prFinance.prDoInvoiced.do"; 
				businessLogsForm.submit();
			}else{
				alert("��֤�벻��ȷ��");
			}
		}
		
		function doCardQuery(){
		var id=cardcontrol.GetCardID();
		if(id>0){
		var data2=cardcontrol.ReadData(7,2);
		if(data2.length==0){
		alert("�˿���δע���뵳У���⣬�޷����д���ԭ��");
		return;
		}
		if((businessLogsForm.fromCardData0.value=cardcontrol.ReadData(7,0)).length==0){
		alert("�˿���δע���δ��ʼʹ�ã��޷����д���ԭ��");
		}
		else if((businessLogsForm.fromCardData1.value=cardcontrol.ReadData(7,1)).length==0){
		alert("�˿���δע���δ��ʼʹ�ã��޷����д���ԭ��");
		}
		else{
		businessLogsForm.action="ICCard.prFinance.prPersonDetail.do";
		businessLogsForm.elements["QueryBizLogsByIds/cardid/criteria/value"].value=id;
		businessLogsForm.submit();
		cardcontrol.Quit();
		}
		}
		}
		
		function doTeacherQuery(){
		businessLogsForm.action="ICCard.prFinance.prTeacherDetail.do";
		businessLogsForm.elements("actstr").value="teacherdetailview";
		talentquery();
		}
		
		function doStudentQuery(){
		businessLogsForm.action="ICCard.prFinance.prStudentDetail.do";
		businessLogsForm.elements("actstr").value="studentdetailview";
		talentquery();
		}
		
		function doGreenQuery(){
		businessLogsForm.action="ICCard.prFinance.prGreenCardDetail.do";
		businessLogsForm.elements("actstr").value="greencarddetailview";
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
		
		function studentQuery(){
		if(studentdiv.style.display=="none"){
		teacherdiv.style.display="none";
		studentdiv.style.display="block";
		greendiv.style.display="none";
		businessLogsForm.elements("actstr").value="studentdetailview";
		}
		else{
		teacherdiv.style.display="none";
		studentdiv.style.display="none";
		greendiv.style.display="none";
		businessLogsForm.elements("actstr").value="begin";
		}
		}
		
		function greenQuery(){
		if(greendiv.style.display=="none"){
		teacherdiv.style.display="none";
		studentdiv.style.display="none";
		greendiv.style.display="block";
		businessLogsForm.elements("actstr").value="greencarddetailview";
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
		return "<center><h2>"+businessLogsForm.currentusername.value+"���˽�����ϸ��</h2></center>";
		}
		
		function printFooter(){
		return "";
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
		form.action="/businesslogs.do?action="+form.actionString.value;
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
		</script>
	</head>
	<body topmargin="0" leftmargin="0" style="overflow-y:scroll" onload="setPrintArray()" onunload="cardcontrol.Quit()">
<!-- ������ -->
<form id="businessLogsForm" method="post">
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length" />
<html:hidden property="QueryBizLogsByIds/businessLogsid" />
<html:hidden property="QueryBizLogsByIds/type" value="person"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ϸ����&gt;���˽�����ϸ</td>
          </tr>
      </table></td>
    </tr>
  </table>
		<!-- ������ -->
		<table width="100%"  border="0" cellspacing="1" cellpadding="1">
			<tr><td class="text">&nbsp;&nbsp;
			<input name="B1" type="button" class="button_02" value="ˢ����ѯ" title="��IC�����ڷ�������Ӧ���ڲ�ѯ�ֿ��˵Ľ��׼�¼" onClick="doCardQuery()">&nbsp;
			<input name="B2" type="button" class="button_02" value="�̹���ѯ" title="������̹����ź�������ѯ�û��Ľ��׼�¼" onClick="teacherQuery()">&nbsp;
			<input name="B3" type="button" class="button_02" value="ѧԱ��ѯ" title="������ѧԱ�༶��������ѯ�û��Ľ��׼�¼" onClick="studentQuery()">&nbsp;
			<input name="B4" type="button" class="button_02" value="�̿���ѯ" title="�������̿������Ų�ѯ�û��Ľ��׼�¼" onClick="greenQuery()">&nbsp;
			<qx:talentButton property="B5" type="button" styleClass="button_02" title="�����ѡ��¼�Ƿ��������" value="�������" onclick="checkRedundance()" operation="DX_CWGL_Detail_Man.DX_CWGL_Detail_Man_Redundancy"/>&nbsp;
			<qx:talentButton property="B6" type="button" styleClass="button_02" title="Ϊѡ�еĽ��׼�¼����Ʊ" value="����Ʊ" onclick="invoicedGroup()" operation="DX_CWGL_Detail_Man.DX_CWGL_Detail_Man_Invoice"/>&nbsp;
			<input name="B7" type="button" class="button_02" value="��ӡ��" title="��/�رմ�ӡ�������" onClick="print()">
			</td></tr>
		</table>
		
		<div id="printdiv" style="display:none">
			<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr><td><div id="_printSetting"></div></td></tr>
			</table>
		</div>
		
		<!-- ����� -->
		<table width="96%" align="center" border="0" cellpadding="1" cellspacing="0" style="border-collapse:collapse">
				<tr>
					<td>
						<div id="teacherdiv" style="display:none">							
							<table width="100%" class="table">
								<tr>
									<td class="text">
										���ţ�
										<html:select property="QueryTeacher/DepartmentID" onchange="doTeacherQuery()"> 
			                            <html:option  value="-1">---��ѡ��---</html:option> 
			                            <html:options property="list[@type='teacherorg']/EOSORG_T_Organization/orgID" labelProperty="list[@type='teacherorg']/EOSORG_T_Organization/orgName"/> 
		                                </html:select>
										<logic:match property="actstr" value="teacherdetailview">
										<%
			                          if (base.util.TalentContext.getEntity(pageContext,null,"list[@type='teacherList']")!=null) {	
			                            %>
												&nbsp;&nbsp;&nbsp;
												������<html:select property="QueryBizLogsByIds/userid/criteria/value" onchange="doTeacherQuery()">
													<option value="0">---��ѡ��---</option>
													<html:options property="list[@type='teacherList']/QueryTeacher/TeacherID" labelProperty="list[@type='teacherList']/QueryTeacher/operatorname" />
												    </html:select>
									    <% } %>
										</logic:match>
									</td>
								</tr>
							</table>
						</div>
						<div id="studentdiv" style="display:none">
							<table width="100%" class="table">
								<tr>
									<td class="text">
										�༶��
										<html:select property="QueryStudentSimple/ClassID" onchange="doStudentQuery()"> 
                                        <html:option value="-1">--��ѡ��༶--</html:option> 
                                        <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
                                        </html:select>
										<logic:match property="actstr" value="studentdetailview">
										<%
			                          if (base.util.TalentContext.getEntity(pageContext,null,"list[@type='studentList']")!=null) {	
			                            %>
												&nbsp;&nbsp;&nbsp;
												������<html:select property="QueryBizLogsByIds/userid/criteria/value" onchange="doStudentQuery()">
													  <option value="0">&lt;��ѡ��&gt;</option>
													  <html:options property="list[@type='studentList']/QueryStudentSimple/StudentID" labelProperty="list[@type='studentList']/QueryStudentSimple/operatorname" />
												      </html:select>
										<% } %>
										</logic:match>
									</td>
								</tr>
							</table>
						</div>
						<div id="greendiv" style="display:none">
							<table width="100%" class="table">
								<tr>
									<td class="text">
										�����ţ�
										<html:text property="QueryBizLogsByIds/cardcoverno/criteria/value" styleClass="input" size="10"/>&nbsp;&nbsp;
										<input type="button" value="ȷ��" onclick="doGreenQuery()">
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<html:hidden property="QueryBizLogsByIds/cardid/criteria/value"/>
				<html:hidden property="fromCardData0"/>
				<html:hidden property="fromCardData1"/>
				<logic:present property="User/operatorName">
				    <input type="hidden" name="operatorname" value="<bean:write property='User/operatorName' filter='true'/>">
					<input type="hidden" name="currentusername" value="<bean:write property='User/operatorName' filter='true'/>">
				</logic:present>
				<logic:notPresent property="User/operatorName">
					<input type="hidden" name="currentusername" value="">
					<input type="hidden" name="operatorname" value="">
				</logic:notPresent>
				<html:hidden property="actstr"/>
		</table>
		
		<!-- ��ҳ������ -->
		<table height=3>
			<tr><td></td></tr>
		</table>
		<div id="conditions" style="display:none;" align="center">
		<logic:present property="User/operatorName">
		<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
			<tr>
			  <td colspan='6' class="text">
				<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1">
					<tr>
						<td class="text">
							�û�������
							<input type="text" value="<bean:write property='User/operatorName' filter='true'/>" class="Standard-InputStyle" readonly size="8">
						</td>
						<td class="text">
							�û����ͣ�
							<input type="text" value="<bean:write property='User/userTypeID' filter='true'/>" class="Standard-InputStyle" readonly size="14">
						</td>
						<logic:notMatch property="User/CardCoverNO" value="">
							<td>
								�����ţ�
								<input type="text" value="<bean:write property='User/CardCoverNO' filter='true'/>" class="Standard-InputStyle" readonly size="8">
							</td>
						</logic:notMatch>
						<td class="text">
							��ǰ��
							<logic:notPresent property="BizForm/balance">
								<input type="text" name="Card/CardLastSum" value="��δ֪��" class="input" readonly size="8" title="ֻ��ˢ����ѯʱ�ſ��Ի�ȡ��ǰ���">
							</logic:notPresent>
							<logic:present property="BizForm/balance">
								<input type="text" value="<bean:write property='BizForm/balance' />" class="input" readonly size="8">
							</logic:present>
						</td>
						<td class="text">
							��ǰʹ�ô�����
							<logic:notPresent property="BizForm/usingTime">
								<input type="text" name="Card/CardUsingTimes" value="��δ֪��" class="input" readonly size="8" title="ֻ��ˢ����ѯʱ�ſ��Ի�ȡ��ǰʹ�ô���">
							</logic:notPresent>
							<logic:present property="BizForm/usingTime">
								<input type="text" value="<bean:write property="BizForm/usingTime"/>" class="input" readonly size="8">
							</logic:present>
						</td>
					</tr>
				</table>
			</td></tr>
		</table>
		</logic:present></div>
		<table height=5>
			<tr><td></td></tr>
		</table>
		<!-- ��ҳ������ -->
		
		<table id="listdetail" width="96%" border="0" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" align="center">
			<tr align='center' class="td_title">
				<td id="dataEntity.me1" nowrap onClick="talentsort()">ˢ������</td>
				<td id="dataEntity.me2" nowrap onClick="talentsort()">ʱ��</td>
				<td id="dataEntity.me3" nowrap onClick="talentsort()">��������</td>
				<td id="dataEntity.me4" nowrap onClick="talentsort()">����Ա/POS</td>
				<td id="dataEntity.me5" nowrap onClick="talentsort()">���׽��</td>
				<td id="dataEntity.me6" nowrap onClick="talentsort()">�����</td>
				<td id="dataEntity.me7" nowrap onClick="talentsort()">�ſ����</td>
				<td nowrap onclick='checkall()' title='���ѡ�л���ѡ��ȫ��ѡ���' style='cursor:hand;'>�Ƿ��ѿ���Ʊ</th>
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
							<SCRIPT>
								var temp='<bean:write id="businesslogs" property="QueryBizLogsByIds/businessmoney" filter="true"/>';
								if(parseFloat(temp) == temp) 
								temp = Math.round(temp * 100) / 100; 
								document.write(temp);
							</SCRIPT>							
						</div>
					</td>
					<td nowrap align="center">
						<div>
							<SCRIPT>
								var temp='<bean:write id="businesslogs" property="QueryBizLogsByIds/balance" filter="true"/>';
								if(parseFloat(temp) == temp) 
								temp = Math.round(temp * 100) / 100; 
								document.write(temp);
							</SCRIPT>	
						</div>
					</td>
					<td nowrap align="center">
						<div>
							<logic:equal id="businesslogs" property="QueryBizLogsByIds/businesstypeid" value="8"><%--���ͱ��Ϊ8��ʾ�ſ�ת��--%>
								<bean:write id="businesslogs" property="QueryBizLogsByIds/backupdata" filter="true"/>
							</logic:equal>
						</div>
					</td>
					<td nowrap align="center">
						<logic:equal id="businesslogs" property="QueryBizLogsByIds/invoiced" value="1">
							<input type="hidden" value="no"/>
							�ѿ���Ʊ
						</logic:equal> 
						<logic:equal id="businesslogs" property="QueryBizLogsByIds/invoiced" value="0">
							<input type="hidden" value="yes"/>
							<html:checkbox id="businesslogs" name="list[@name='update']/QueryBizLogsByIds/businessLogsid" property="QueryBizLogsByIds/businessLogsid" indexed="true"/>
							<script language="javascript">
								check_len++;
							</script>
						</logic:equal>
					</td>
					</tr>
				<script language="JavaScript">
					rownum++;
				</script>
				</logic:iterate>
			<% }  else {%>
			<tr class='Standard-ListDoubleTRStyle'>
				<td colspan="8">��û���κν��׼�¼��</td>
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
<OBJECT ID="Card Control" WIDTH="" HEIGHT="" CLASSID="CLSID:AEA5E7AD-4A2F-44BE-88FE-0CF9A8E648D4" codebase="http://192.168.0.196:8080/DXCard/ActiveX/card.cab" name="cardcontrol">
</OBJECT>