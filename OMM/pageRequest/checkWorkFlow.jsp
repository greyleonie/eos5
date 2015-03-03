<%@include file="/internet/common.jsp"%>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<script type="text/javascript">var x=0;
		function loadNew() {
		var sub = new HiddenSubmit('OMM.biz.bizCheckWorkFlow');
		var maxId=document.getElementById('maxId').value;
		sub.add("PageCond/init", "init");
		sub.add("OMM_Request/RequestID/criteria/value", maxId);
		sub.add("OMM_Request/RequestID/criteria/operator", ">");
		if (sub.submit()) {
			if (sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request").length<1) {
			} else{
				var begin=sub.getValues("root/data/PageCond/begin");
				var length=sub.getValues("root/data/PageCond/length");
				var count=sub.getValues("root/data/PageCond/count");
				for (var i=0;i<sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request").length;i++) {
					var name=sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request[@rowNum='"+i+"']/Name");
					var dep=sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request[@rowNum='"+i+"']/Dep");
					if(dep.length>=20){
						dep=dep.substring(0,17)+'...';
					}
					var address=sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request[@rowNum='"+i+"']/address");
					var requestID=sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request[@rowNum='"+i+"']/RequestID");
					var reqSN=sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request[@rowNum='"+i+"']/ReqSN");
					var title=sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request[@rowNum='"+i+"']/Title");
					if(title.length>=20){
						title=title.substring(0,17)+'...';
					}
					var temp=sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request[@rowNum='"+i+"']/CreateTime")+"";
					var createTime="";
					createTime=temp.substring(0,4)+temp.substring(4,6)+temp.substring(6);
					var reqState=sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request[@rowNum='"+i+"']/ReqState");
					if (reqState==1) 
						reqState='�ݸ�';
					if (reqState==2) 
						reqState='�ȴ���֤';
					if (reqState==3) 
						reqState='�ܾ�����';
					if (reqState==4) 
						reqState='������';
					if (reqState==5) 
						reqState='�����';
					var participant=sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request[@rowNum='"+i+"']/participant");
					var processInstID=sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request[@rowNum='"+i+"']/RequestID");
					var buildingid=sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request[@rowNum='"+i+"']/buildingid");
					var layerno=sub.getValues("root/data/list[@type='OMM_Request']/OMM_Request[@rowNum='"+i+"']/layerno");
					document.getElementById('maxId').value=requestID;
					add_r(i,name,dep,address,reqSN,title,createTime,reqState,participant,processInstID);
					x++;
				}
				x=x+1;
				var img="showImg"+x;
				document.getElementById(img).click();
			}
		}
		setTimeout("loadNew()",5000);
	}

	function add_r(i,name,dep,address,reqSN,title,createTime,reqState,participant,processInstID,buildingid,layerno) {
		var t=document.getElementById("listdetail");
		t.insertRow(1);
		if (window.attachEvent)
    	{
        //֧�� IE
        	t.rows[1].attachEvent("onclick", function () { changeTRBgColor(t.rows[1]) });
    	}
    	else
    	{
        //֧�� FF
        	t.rows[1].addEventListener("click", function () { changeTRBgColor(t.rows[1]) }, false);
    	}
		if(i%2==0){
			t.rows[1].className="td2";
		}else{
			t.rows[1].className="td1";
		}
		t.rows[1].style.color="red";
    	for(var k=0;k<8;k++){
			t.rows[1].insertCell(0);
		}
		t.rows[1].cells[0].innerHTML=name;
		t.rows[1].cells[0].align="center";
		t.rows[1].cells[1].innerHTML=dep;
		t.rows[1].cells[1].align="center";
		t.rows[1].cells[2].innerHTML=address;
		t.rows[1].cells[2].align="center";
		t.rows[1].cells[3].innerHTML=title;
		t.rows[1].cells[3].align="center";
		t.rows[1].cells[4].innerHTML=createTime;
		t.rows[1].cells[4].align="center";
		//t.rows[1].cells[5].innerHTML=reqState;
		//t.rows[1].cells[5].align="center";
		t.rows[1].cells[5].innerHTML=participant;
		t.rows[1].cells[5].align="center";
		t.rows[1].cells[6].innerHTML="<a href=\"/oa/page/shareFolder/downloadFile.jsp?filePath=/primeton/audio-rec-files/data"+"&&fileName="+reqSN+".wav\" ><SPAN style=\"color:#003681;font-weight:bold;\">����</SPAN></a>";
		t.rows[1].cells[6].align="center";
		var j=x+2;
		t.rows[1].cells[7].innerHTML="<a id='showImg"+j+"' href='#' onmousedown=\"getWfView("+processInstID+")\" onclick=\"getWfView("+processInstID+")\">���̼��</a>&nbsp;<a id='_showImg"+j+"' href='#' onmousedown=\"getRoom4Day("+buildingid+","+layerno+")\" onclick=\"getRoom4Day("+buildingid+","+layerno+")\">ס����Ϣ</a>";
		t.rows[1].cells[7].align="center";	
	}</script>
<body>
	<form method="post" action="OMM.prRequest.prCheckWorkFlow.do"><input type="hidden" id="maxId" value="0" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id="printTable">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">��ά����&gt;��ά�б�</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5"><input type="hidden" name="queryaction" value="OMM.prRequest.prCheckWorkFlow.do"> <input
						type="hidden" name="addaction" value="OMM.prRequest.prRequestAdd.do"> <input type="hidden" name="modifyaction"
						value=""> <input type="hidden" name="deleteaction" value="OMM.prRequest.prRequestDel.do"> <input type="hidden"
						name="viewaction" value="OMM.prRequest.prRequestView.do">
					<html:hidden property="OMM_Request/_order/col1/field" />
					<html:hidden property="OMM_Request/_order/col1/asc" />
					<html:hidden property="PageCond/begin" />
					<html:hidden property="PageCond/count" />
					<html:hidden property="PageCond/length" />
					<INPUT value="like" type="hidden" name="OMM_Request/Title/criteria/operator"> <INPUT value="center" type="hidden"
						name="OMM_Request/Title/criteria/likeRule"> <INPUT value="like" type="hidden"
						name="OMM_Request/ReqSN/criteria/operator"> <INPUT value="center" type="hidden"
						name="OMM_Request/ReqSN/criteria/likeRule"></td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
			<tr>
				<td>
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="10"></td>
						</tr>
						<tr>
							<td height="10"></td>
						</tr>
						<tr>
							<td valign="top" class="text">
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
									<tr class="td_title">
										<td width="10%" align="center" nowrap >����</td>
										<td width="10%" align="center" nowrap >����</td>
										<td width="10%" align="center" nowrap >���ϵص�</td>
										<td width="15%" align="center" nowrap id="OMM_Request.Title" onClick="talentsort()">����</td>
										<td width="15%" align="center" nowrap id="OMM_Request.CreateTime" onClick="talentsort()">����ʱ��</td>
										<!--<td width="10%" align="center">��ǰ���ڣ�״̬��</td>-->
										<td width="15%" align="center">��ǰ���ڲ�����</td>
										<td width="10%" align="center" nowrap id="OMM_Request.ReqSN">������¼</td>
										<td width="15%" align="center">����</td>
									</tr>
									<%
        int count = 0;
        String trClass = "result_content";
		int index=0;
        %>
									<logic:iterate id="resultset" property="list[@type='OMM_Request']">
										<%if (count % 2 == 0)
            trClass = "td1";
        else
            trClass = "td2";
        count++;
        %>
										<tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
											<td nowrap align="center">
												<SCRIPT type="text/javascript">

													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5) 
														document.write("<font color='red'>");
												</SCRIPT>
												<bean:write id="resultset" property="OMM_Request/Name" />
												<SCRIPT type="text/javascript">

													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5) 
														document.write("</font>");
												</SCRIPT>
											</td>
											<td nowrap align="center">
												<SCRIPT type="text/javascript">

													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5) 
														document.write("<font color='red'>");
												</SCRIPT>
												<bean:write id="resultset" property="OMM_Request/Dep"  maxLength="20" />
												<SCRIPT type="text/javascript">

													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5) 
														document.write("</font>");
												</SCRIPT>
											</td>
											<td nowrap align="center">
												<SCRIPT type="text/javascript">

													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5) 
														document.write("<font color='red'>");
												</SCRIPT>
												<bean:write id="resultset" property="OMM_Request/address" />
												<SCRIPT type="text/javascript">

													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5) 
														document.write("</font>");
												</SCRIPT>
											</td>
											<td nowrap align="center" title="<bean:write id='resultset' property='OMM_Request/Title'/>">&nbsp;
												<SCRIPT type="text/javascript">

													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5) 
														document.write("<font color='red'>");
												</SCRIPT>
												<bean:write id="resultset" property="OMM_Request/Title" maxLength="20" />
												<SCRIPT type="text/javascript">

													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5) 
														document.write("</font>");
												</SCRIPT>
											</td>
											<td nowrap align="center">
												<SCRIPT type="text/javascript">

													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5) 
														document.write("<font color='red'>");
												</SCRIPT>
												<bean:write id="resultset" property="OMM_Request/CreateTime"
													formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd hh:mm:ss" />
												<SCRIPT type="text/javascript">

													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5) 
														document.write("</font>");
												</SCRIPT>
											</td>
											<!--
											<td nowrap align="center"><bean:write id="resultset" property="OMM_Request/workItemName"/>
												<SCRIPT type="text/javascript">
													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp==1) 
														temp="<font color='red'>�ݸ�</font>";
													if (temp==2) 
														temp="<font color='red'>�ȴ���֤</font>";
													if (temp==3) 
														temp="<font color='red'>�ܾ�����</font>";
													if (temp==4) 
														temp="<font color='red'>������</font>";
													if (temp==5) 
														temp='�����';
													document.write(temp);
												</SCRIPT>
											</td>
											-->
											<td nowrap align="center">
											<SCRIPT type="text/javascript">
													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5)
													document.write("<font color='red'>");
												</SCRIPT>
												<bean:write id='resultset' property='OMM_Request/participant' />
												<SCRIPT type="text/javascript">
													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5)
													document.write("</font>");
												</SCRIPT>
											</td>
											<td nowrap align="center">
												<SCRIPT type="text/javascript">

													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5) 
														document.write("<font color='red'>");
												</SCRIPT>
												<SCRIPT>
													var tmp='<bean:write id="resultset" property="OMM_Request/ReqSN"/>';
													document.write("<a href=\"/oa/page/shareFolder/downloadFile.jsp?filePath=/primeton/audio-rec-files/data"+"&&fileName="+tmp+".wav\" ><SPAN style=\"color:#003681;font-weight:bold;\">����</SPAN></a>");
													
												</SCRIPT>
												<SCRIPT type="text/javascript">

													var temp='<bean:write id="resultset" property="OMM_Request/ReqState"/>';
													if (temp!=5) 
														document.write("</font>");
												</SCRIPT>
											</td>
											<td nowrap align="center"><a id="showImg<%=count %>" href="#"
													onmousedown="getWfView(<bean:write id="resultset" property="OMM_Request/RequestID"/>)"
													onclick="getWfView(<bean:write id="resultset" property="OMM_Request/RequestID"/>)">���̼��</a>
													<a id="_showImg<%=count %>" href="#"
													onmousedown="getRoom4Day(<bean:write id="resultset" property="OMM_Request/buildingid" />,<bean:write id="resultset" property="OMM_Request/layerno" />)"
													onclick="getRoom4Day(<bean:write id="resultset" property="OMM_Request/buildingid" />,<bean:write id="resultset" property="OMM_Request/layerno" />)">ס����Ϣ</a>
											</td>
										</tr>
										<%if (count == 1) {
        %>
										<SCRIPT type="text/javascript">

											var temp='<bean:write id="resultset" property="OMM_Request/RequestID"/>';
											document.getElementById('maxId').value=temp;
										</SCRIPT>
										<%}
    %>
									</logic:iterate>
								</table>
								<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
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
					</table>
				</td>
			</tr>
		</table>
	</form>
	<form name="exportform" method="post" target="_blank"><input type="hidden" name="title"> <input type="hidden"
			name="xmlfcc"></form>
</body>
<script>

	loadOrderImg(document.forms[0],'OMM_Request');
	var userID = "<bean:write property="SessionEntity/userName"/>";

	function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName) {
		if (currentState == 4) {
			if (confirm("��ȷ��Ҫ��������������")==false) {
				return ;
			}
		}
		var stUrl = url+"?OMM_Request/RequestID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
		if (currentState == 10 &&WFparticipant != null && WFparticipant != "" && userID != WFparticipant ) {
			if (confirm("��ҵ���ѱ�"+WFparticipantName+"��ȡ�ˣ��Ƿ�Ҫ��ȡ���Լ�������")==false) {
				return ;
			}
			stUrl = stUrl + "&WFWorkItem/reProcess=1";
		}
		location.href = stUrl ;
		//var frm = document.forms[0];
		//frm.action = stUrl;
		//frm.submit();
	}

	var begin=document.getElementById('PageCond/begin').value;
	if(begin==0){
		loadNew();
	}
	document.getElementById("showImg1").click();
</script>