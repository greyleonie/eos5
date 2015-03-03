<%@include file="/internet/common.jsp"%>
<%
java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
java.text.SimpleDateFormat stf = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
String curdate = sdf.format(date);
String kbSn="KB"+stf.format(date);
%>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<style>
.inp{ padding:0px 0 0 2px;height:23px; line-height:23px; border:solid 1px red;}
</style>
<script>

	var i=1

	function insertFile() {
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
		C1.innerHTML = "<input  type='file' name='file' class='input' size='30'>&nbsp;<input class='button_02' type='button' value='删 除' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'>";
	}
</script>
<body>
	<form method="post" name="myform" action="OMM.prRequest.prRequestProcessDo.do" enctype="multipart/form-data">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">运维管理—&gt;运维申请—&gt;会议申请处理流程—&gt;
								<bean:write property="WFWorkItem/workItemName" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5">
					<html:hidden property="OMM_Request/_order/col1/field" />
					<html:hidden property="OMM_Request/_order/col1/asc" />
					<html:hidden property="temptype" />
					<html:hidden property="PageCond/begin" />
					<html:hidden property="PageCond/length" />

					<html:hidden property="WFWorkItem/submitType" />

					<html:hidden property="WFWorkItem/workItemID" />

					<html:hidden property="WFWorkItem/processInstID" />
					<html:hidden property="WFWorkItem/processDefID" />
					<html:hidden property="WFWorkItem/processDefName" />


					<html:hidden property="WFWorkItem/activityDefID" />
					<html:hidden property="WFWorkItem/activityInstID" />
					<html:hidden property="OMM_Request/RequestID" />
					<html:hidden property="OMM_Request/participant" />
					<html:hidden property="OMM_Request/passParticipant" />
					<html:hidden property="OMM_Request/ProposerID" />
					<html:hidden property="OMM_Request/processInstID" />
					<html:hidden property="OMM_Request/activityDefID" />
					<html:hidden property="OMM_Request/ReqTypeID" />
					<html:hidden property="OMM_Request/RoomID" />
					<input type="hidden" name="SetTypeList/type[@num='0']"  value="1"/>
					<input type="hidden" name="SetTypeList/type[@num='1']"   value="2"/>
					<input type="hidden" name="SetTypeList/type[@num='2']"   value="3"/>
					
					<input type="hidden" name="OMM_KnowledgeBase/AuthorID" value='<bean:write property="SessionEntity/operatorID"/>'/>
					<input type="hidden" name="OMM_KnowledgeBase/IsNew" value="1"/>

				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse">
			<tr>
				<td></td>
			</tr>
			<tr>
				<td height="100%" valign="top" nowrap bgcolor="#FFFFFF" style="border:1px #000000 solid;border-top:none">


					<table width="96%" height="20" border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
						<tr>
							<td height="10"></td>
						</tr>
					</table>
					<!------------------------------  文头  ----------------------------->
					<table width="96%" height="20" border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
						<tr>
							<td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">广州市委党校IT运维受理单</td>
						</tr>
					</table>
					<!------------------------------  表单意见  ----------------------------->
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr>
							<th width="20%" align="center" nowrap style="background-color:white;height:24px;font-size: 12px;">申请编号</th>
							<th width="20%" align="center" nowrap style="background-color:white;height:24px;font-size: 12px;">申报时间</th>
							<th width="20%" align="center" nowrap style="background-color:white;height:24px;font-size: 12px;">申报地点</th>
							<th width="20%" align="center" nowrap style="background-color:white;height:24px;font-size: 12px;">故障类型</th>
							<th width="20%" align="center" nowrap style="background-color:white;height:24px;font-size: 12px;">故障时间</th>
							
						</tr>
						<tr>
							<td width="20%" align="center" nowrap style="background-color:white;font-size: 12px;height:24px;">
								<bean:write property="OMM_Request/ReqSN" />
							</td>
							
							<td width="20%" align="center" nowrap style="background-color:white;font-size: 12px;height:24px;">
								<bean:write property="OMM_Request/CreateTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/>
							</td>
							
							<td width="20%" align="center" nowrap style="background-color:white;font-size: 12px;height:24px;">
								<bean:write property="BuildingRoomInfo" />
							</td>
							
							<td width="20%" align="center" nowrap style="background-color:white;font-size: 12px;height:24px;">
								<bean:write property="OMM_ReqType/TypeName" />
							</td>
							
							<td width="20%" align="center" nowrap style="background-color:white;font-size: 12px;height:24px;">
								<bean:write property="OMM_Request/DownTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/>
							</td>
						</tr>
						<tr>
							<th width="20%" align="center" nowrap style="background-color:white;height:24px;font-size: 12px;">故障主题</th>
							<TD colspan="4" align="center" nowrap style="background-color:white;font-size: 12px"><bean:write property="OMM_Request/Title" /></TD>
						</tr>
						<tr>
							<th width="20%" align="center" nowrap style="background-color:white;height:24px;font-size: 12px;">故障描述</th>
							<TD colspan="4" align="center" nowrap style="background-color:white;font-size: 12px"><TEXTAREA style="width: 100%"  readonly="readonly" name="description" rows="5"><bean:write property="name" />;<bean:write property="OMM_Request/DownTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="MM月dd日HH时mm分"/><bean:write property="BuildingRoomInfo" />出现故障:<bean:write property="OMM_Request/Description" /></TEXTAREA></TD>
						</tr>
						<!--
						<tr>
							<th width="20%" align="center" nowrap style="background-color:white;height:24px;font-size: 12px;">备注</th>
							<TD colspan="4" align="center" nowrap style="background-color:white;font-size: 12px"><TEXTAREA style="width: 100%" name="Remarks" rows="5"></TEXTAREA></TD>
						</tr>
						-->
					</table>
					<DIV id="listInfo" style="display:none;">
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr>
							<td width="15%" align="center" nowrap class="td2">申请编号</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<bean:write property="OMM_Request/ReqSN" />
								<input type="hidden" name="OMM_Request/ReqSN" value='<bean:write property="OMM_Request/ReqSN"/>' /></td>
							<td width="15%" align="center" nowrap class="td2">请求状态</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<SCRIPT type="text/javascript">

									var temp='<bean:write property="OMM_Request/ReqState"/>';
									if (temp==1) 
										temp='草稿';
									if (temp==2) 
										temp='等待验证';
									if (temp==3) 
										temp='拒绝受理';
									if (temp==4) 
										temp='已受理';
									if (temp==5) 
										temp='已完成';
									document.write(temp);
								</SCRIPT>
								<input type="hidden" name="OMM_Request/ReqState" value='<bean:write property="OMM_Request/ReqState"/>' /></td>
						</tr>
						<tr>
							<td width="15%" align="center" nowrap class="td2">创建时间</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<bean:write property="OMM_Request/CreateTime" />
								<input type="hidden" name="OMM_Request/CreateTime"
									value='<bean:write property="OMM_Request/CreateTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/>' /></td>
							<td width="15%" align="center" nowrap class="td2">紧急程度</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<SCRIPT type="text/javascript">

									var temp='<bean:write property="OMM_Request/Urgency"/>';
									if (temp==1) 
										temp='一般';
									if (temp==2) 
										temp='紧急';
									if (temp==3) 
										temp='特急';
									document.write(temp);
								</SCRIPT>
								<input type="hidden" name="OMM_Request/Urgency" value='<bean:write property="OMM_Request/Urgency"/>' /></td>
						</tr>
						<tr>
							<td width="15%" align="center" nowrap class="td2">请求类型</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<bean:write property="OMM_ReqType/TypeName"/>
							</td>
							<td width="15%" align="center" nowrap class="td2">优先级别</td>
							<td width="35%" 1align="center" nowrap class="td1">
							<SCRIPT type="text/javascript">
									var temp='<bean:write property="OMM_Request/PriorityLevel"/>';
									if (temp==1) 
										temp='低';
									if (temp==2) 
										temp='中';
									if (temp==3) 
										temp='高';
									document.write(temp);
								</SCRIPT>
								<input type="hidden" name="OMM_Request/PriorityLevel" value='<bean:write property="OMM_Request/PriorityLevel"/>' />
							</td>
						</tr>
						<tr>
							<td width="15%" align="center" nowrap class="td2">申报地点</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<bean:write property="BuildingRoomInfo" />
								<input type="hidden" name="OMM_Request/DeviceID" value='<bean:write property="OMM_Request/DeviceID"/>' /></td>
							<td width="15%" align="center" nowrap class="td2">故障时间</td>
							<td width="35%" 1align="center" nowrap class="td1">
								<bean:write property="OMM_Request/DownTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"
									formatType="yyyy-MM-dd" />
								<input type="hidden" name="OMM_Request/DownTime" value='<bean:write property="OMM_Request/DownTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/>' /></td>
						</tr>
						<tr>
							<td align="center" nowrap class="td2">标题</td>
							<td nowrap class="td1" colspan="3">	<bean:write property="OMM_Request/Title" /><input type="hidden" name="OMM_Request/Title" value='<bean:write property="OMM_Request/Title"/>' />
							</td>
						</tr>
						<tr>
							<td align="center" nowrap class="td2">故障描述</td>
							<td nowrap class="td1" colspan="3"><bean:write property="OMM_Request/Description" /><input type="hidden" name="OMM_Request/Description" value='<bean:write property="OMM_Request/Description"/>' />
							</td>
						</tr>
					</table>
					</DIV>
					<BR>
					<!--
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr>
							<td width="30%" align="center" nowrap class="td2">使用人</td>
							<td width="30%" align="center" nowrap class="td2">类型</td>
							<td width="30%" align="center" nowrap class="td2">资产名称</td>
							<td width="10%" align="center" nowrap class="td2">详细信息</td>
						</tr>
						<logic:iterate id="item" property="list[@type='DevLogsInfo']"></logic:iterate>
						<tr>
							<td width="30%" align="center" nowrap class="td1">
								<bean:write id="item" property="DevLogsInfo/operatorName" />
							</td>
							<td width="30%" align="center" nowrap class="td1">
								<bean:write id="item" property="DevLogsInfo/TypeName" />
							</td>
							<td width="30%" align="center" nowrap class="td1">
								<SCRIPT>

									var temp='<bean:write id="item" property="DevLogsInfo/CAPTNAME"/>';
									if (temp.length<1) {
										temp='<font color="red">该设备不属于固定资产范围</font>';
									}
									document.write(temp);
								</SCRIPT>
							</td>
							<td width="10%" align="center" nowrap class="td1"><A
									href='OMM.prCAPT.prGetInfo.do?OMM_ITDevice/DeviceID=<bean:write property="OMM_Request/DevicdID" />'>详细信息</A></td>
						</tr>
					</table>
					-->
					<BR>
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1">
						<tr>
							<td width="15%" align="left" nowrap class="td1" colspan="4" style="background-color: white;">知识库关键字:
								<input name="textinput"  tabindex="1"  type="text" size="45" class="inp" islist=true list="0" value=""  id="inputer" />&nbsp;&nbsp;
								<input type="button" name="btnSearch" class="button_02" value="查询" onclick="GetKnow('inputer');"/>
							</td>
						</tr>
					</table>
					<BR>
					<div id="knowledgeBasePanel">
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr>
							<td width="15%" align="center" nowrap class="td2">知识编号</td>
							<td width="35%" 1align="center" nowrap class="td1"><input type="text" name="OMM_KnowledgeBase/KnowledgeSN" value='<%=kbSn %>' readonly="readonly"/>
					<input type="hidden" name="OMM_KnowledgeBase/KnowledgeBaseID"/></td>
							<td width="15%" align="center" nowrap class="td2">知识类别</td>
							<td width="35%" 1align="center" nowrap class="td1" style="border:solid 1px red;">
								<SELECT name="OMM_KnowledgeBase/KnowledgeTypeID" style="width: 152px;">
									<logic:iterate id="item" property="list[@type='OMM_KnowledgeType']">
									<option value='<bean:write id="item" property="OMM_KnowledgeType/TypeID"/>'><bean:write id="item" property="OMM_KnowledgeType/TypeName"/></option>
									</logic:iterate>
								</SELECT>
							</td>
						</tr>
						<tr>
							<td width="15%" align="center" nowrap class="td2">标题</td>
							<td width="35%" 1align="center" nowrap class="td1" style="border:solid 1px red;"><input size="46" type="text" name="OMM_KnowledgeBase/Title" value='<bean:write property="OMM_Request/Title" />'/></td>
							<td width="15%" align="center" nowrap class="td2">知识作者</td>
							<td width="35%" 1align="center" nowrap class="td1"><input type="text" name="AuthorName" readonly="readonly" value='<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>'/></td>
						</tr>
						<tr>
							<td width="15%" align="center" nowrap class="td2">知识评价</td>
							<td 1align="center" nowrap class="td1" colspan="3">
							<input style="margin-left: 20px;" type="radio" name="OMM_KnowledgeBase/Evaluate" value="1"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/>
							<input style="margin-left: 20px;" type="radio" name="OMM_KnowledgeBase/Evaluate" value="2"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/>
							<input style="margin-left: 20px;" type="radio" name="OMM_KnowledgeBase/Evaluate" value="3" checked="checked"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/>
							<input style="margin-left: 20px;" type="radio" name="OMM_KnowledgeBase/Evaluate" value="4"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/>
							<input style="margin-left: 20px;" type="radio" name="OMM_KnowledgeBase/Evaluate" value="5"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/><img src="/internet/image/star.jpg" width="14" height="13" style="margin-left: 5px;"/>
							</td>
						</tr>
						<tr>
							<td width="15%" align="center" nowrap class="td2">关键字</td>
							<td 1align="center" nowrap class="td1" colspan="3" style="border:solid 1px red;">
								<input size="81" type="text" name="OMM_KnowledgeBase/KeyWords" style="width:100%;" /><BR><span class="text_red">多个关键字之间请用英文符号(|)分隔</span>
							</td>
						</tr>
						<tr>
							<td align="center" nowrap class="td2">故障描述</td>
							<td 1align="center" nowrap class="td1" colspan="3" valign="middle" style="border:solid 1px red;"><TEXTAREA style="width:100%;" name="OMM_KnowledgeBase/Description" rows="5" cols="80"><bean:write property="OMM_Request/Description" /></TEXTAREA></td>
						</tr>
						<tr>
							<td align="center" nowrap class="td2">处理方式</td>
							<td 1align="center" nowrap class="td1" colspan="3" valign="middle" style="border:solid 1px red;"><TEXTAREA style="width:100%;" name="OMM_KnowledgeBase/ProcessMethod" rows="5" cols="80"></TEXTAREA></td>
						</tr>
					</table>
					<BR>
					</div>
					<!------------------------------  流转  ----------------------------->

					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="participant">
						<tr>
							<td width="19%" align="right" nowrap colspan="2" bgcolor="#FFFFFF"><iframe
									src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0"
									name="graphID" onload="document.all['graphID'].style.height=graphID.document.body.scrollHeight + 20"
									scrolling="auto"></iframe></td>

						</tr>
						<tr>
							<td width="19%" align="right" nowrap class="td2">下环节流转选择：</td>
							<td width="81%" class="td1" style="border:solid 1px red;"><%
        int i = 0;
        %>
								<logic:iterate id="resultset" property="list[@type='nextnodes']">
									<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>'
										nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%>>
									<bean:write id="resultset" property="Activity/actDefName" />&nbsp;
			<%
				i++;
			%>
								</logic:iterate>
							</td>
						</tr>
						<logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
							<tr>
								<td width="19%" align="right" nowrap class="td2">下环节人员选择：</td>
								<td class="td1" style="border:solid 1px red;">
									<html:text property="OMM_Request/nextParticipantName"
										attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"' />
									<html:hidden property="OMM_Request/nextParticipantId" />
									<input name="select" type="button" class="button_02" value="选 择"
										onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','OMM_Request/nextParticipantName','OMM_Request/nextParticipantId')">

								</td>
							</tr>
						</logic:notEqual>
					</table>

					<table width="96%" height="100" border="0" align="center" cellpadding="0" cellspacing="1" id="spacedown">
						<tr>
							<td></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
					<logic:notEqual property="WFWorkItem/activityDefID" value="DX5">
						<input name="wfsend" type="button" class="button_02" value="发 送" onClick="send()">
					</logic:notEqual>
					<logic:equal property="WFWorkItem/activityDefID" value="DX5">
						<input name="wfsend" type="button" class="button_02" value="结束流程" onClick="send()">
					</logic:equal>
					<input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()"> <input name="wfcancel"
						type="button" class="button_02" value="返 回" onClick="history.back()"></td>
			</tr>
		</table>
	</form>
	<div id="pubLemma"
		style="position:absolute; top:301px; width:185px; height:85px; z-index:1; left: 385px; visibility: visible;display:none"
		onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
		<table width="98%" align="center" border="0" cellpadding="0" cellspacing="1" bgcolor="#CAD6E8">
			<logic:iterate id="pubLemmas" property="list[@type='pubLemmas']">
				<tr class="td1">
					<td><a href="javascript:setValue('<bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION'/>');">
							<bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION' />
						</a></td>
				</tr>
			</logic:iterate>
		</table>
	</div>
</body>
<script>
	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>
<script>
function GetKnow(obj){
	var keyWord=document.getElementById(obj).value;
		var sub = new HiddenSubmit('OMM.bizKownledgeBase.bizGetKnowledgeByKeyWord');
			sub.add("keyword", keyWord);
			if (sub.submit()) {
				if (sub.getValues("root/data/list[@type='KnowledgeInfo']/KnowledgeInfo").length<1) {
					if(confirm("知识库中没有你所需要的知识记录,是否创建一条新的知识?")==true){
						document.getElementById('OMM_KnowledgeBase/IsNew').value=1;
						document.getElementById('OMM_KnowledgeBase/KnowledgeSN').value='<%=kbSn %>';
						document.getElementById('OMM_KnowledgeBase/AuthorID').value='<bean:write property="SessionEntity/operatorID"/>';
						document.getElementById('AuthorName').value='<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>';
						document.getElementById('OMM_KnowledgeBase/KnowledgeBaseID').value="";
						document.getElementById('OMM_KnowledgeBase/Title').value='<bean:write property="OMM_Request/Title" />';
						document.getElementById('OMM_KnowledgeBase/Description').innerText='<bean:write property="OMM_Request/Description" />';
						document.getElementById('OMM_KnowledgeBase/ProcessMethod').innerText="";
					}
				} else{
						document.getElementById('OMM_KnowledgeBase/IsNew').value=0;
						var id=sub.getValues("root/data/list[@type='KnowledgeInfo']/KnowledgeInfo[@rowNum='0']/KnowledgeBaseID");
						var sn=sub.getValues("root/data/list[@type='KnowledgeInfo']/KnowledgeInfo[@rowNum='0']/KnowledgeSN");
						var typeId=sub.getValues("root/data/list[@type='KnowledgeInfo']/KnowledgeInfo[@rowNum='0']/KnowledgeTypeID");
						var authorId=sub.getValues("root/data/list[@type='KnowledgeInfo']/KnowledgeInfo[@rowNum='0']/AuthorID");
						var authorName=sub.getValues("root/data/list[@type='KnowledgeInfo']/KnowledgeInfo[@rowNum='0']/operatorName");
						var title=sub.getValues("root/data/list[@type='KnowledgeInfo']/KnowledgeInfo[@rowNum='0']/Title");
						var evaluate=sub.getValues("root/data/list[@type='KnowledgeInfo']/KnowledgeInfo[@rowNum='0']/Evaluate");
						var keyWords=sub.getValues("root/data/list[@type='KnowledgeInfo']/KnowledgeInfo[@rowNum='0']/KeyWords");
						var description=sub.getValues("root/data/list[@type='KnowledgeInfo']/KnowledgeInfo[@rowNum='0']/Description");
						var processMethod=sub.getValues("root/data/list[@type='KnowledgeInfo']/KnowledgeInfo[@rowNum='0']/ProcessMethod");
						var list=document.getElementsByName(' checked="checked"');
						for(var j=0;j<list.length;j++){
							if(list[j].value==evaluate){
								list[j].checked=true;
								break;
							}
						}
						var typeList=document.getElementById('OMM_KnowledgeBase/KnowledgeTypeID');
						for(var j=0;j<typeList.options.length;j++){
							if(typeList.options[j].value==typeId){
								typeList.options[j].selected=true;
								break;
							}
						}
						document.getElementById('OMM_KnowledgeBase/KnowledgeBaseID').value=id;
						document.getElementById('OMM_KnowledgeBase/KnowledgeSN').value=sn;
						document.getElementById('OMM_KnowledgeBase/AuthorID').value=authorId;
						document.getElementById('AuthorName').value=authorName;
						document.getElementById('OMM_KnowledgeBase/Title').value=title;
						document.getElementById('OMM_KnowledgeBase/KeyWords').value=keyWords;
						document.getElementById('OMM_KnowledgeBase/Description').innerText=description;
						document.getElementById('OMM_KnowledgeBase/ProcessMethod').innerText=processMethod;
				}
			}
}

/////////////////////////
function suckerfish(type, tag, parentId)
{
        if (window.attachEvent)
        {
                window.attachEvent("onload", function()
                {
                        var sfEls = (parentId==null)?

document.getElementsByTagName(tag):document.getElementById(parentId).getElementsByTagName(tag);
                        type(sfEls);
                });
        }
}
sfFocus = function(sfEls)
{
        for (var i=0; i<sfEls.length; i++)
        {
                sfEls[i].onfocus=function()
                {
                        this.className+=" sffocus";
                        if( this.value == this.defaultValue ) { this.value = ""; }
                }
                sfEls[i].onblur=function()
                {
                        this.className=this.className.replace(new RegExp(" sffocus\\b"), "");
                        if( this.value == "" ) { this.value = this.defaultValue; }
                                        }
        }
}
//suckerfish(sfFocus, "INPUT");
//suckerfish(sfFocus, "TEXTAREA"); 
//suckerfish(sfFocus, "Select"); 


function smanPromptList(strList,objInputId){
arrList = new Array();
this.style = "background:#EEEEEE;cursor: hand;color:blue;font-size:12px;"
window.onload =function() {
        var tmpStr1 = strList.split(",");
        for(i=0;i<tmpStr1.length;i++){
            arrList[i] = eval(tmpStr1[i])
            arrList[i].sort(function(a,b){
            if(a.length>b.length)return 1;
            else if(a.length==b.length)return a.localeCompare(b);
            else return -1;
            })
        }   
var selectedIndex=-1;
var intTmp; //循环用的:)
var objouter=document.getElementById("__smanDisp") //显示的DIV对象
var objInput = document.getElementById(objInputId); //文本框对象
var objInput2 = document.getElementById("inputer2"); //文本框对象
var tmpStr = objInputId.split(",");
for(i=0;i<tmpStr.length;i++){
    var objInput = document.getElementById(tmpStr[i]); //文本框对象
//if (objInput==null) {alert('smanPromptList初始化失败:没有找到"'+objInputId+'"文本框');return ;}
//文本框失去焦点
objInput.onblur=function(){
objouter.style.display='none';
}
window.onfocus=function(){
objouter.style.display='none';
}
//文本框按键抬起
objInput.onkeyup=checkKeyCode;
//文本框得到焦点
objInput.onfocus=checkAndShow;
}
function checkKeyCode(obj){
var ie = (document.all)? true:false
if (ie){
var keyCode=event.keyCode
if (keyCode==40||keyCode==38){ //下上
  var isUp=false
  if(keyCode==40) isUp=true ;
  chageSelection(isUp)
}else if (keyCode==13){//回车
  outSelection(selectedIndex);
}else{
  checkAndShow()
}
}else{
checkAndShow()
}
divPosition()
}

function checkAndShow(){
    var objInput=null;
    var objList;
    for(i=0;i<document.all.tags('INPUT').length;i++) 
    {
        if(document.activeElement.islist=="true"){
            var objInput=document.activeElement;
            var objInputId = objInput.id;
            objList = arrList[objInput.list];
            //alert(objList.length)
        }
    }
    if(objInput!=null){
  var strInput = objInput.value
  if (strInput!=""){
  divPosition();
  selectedIndex=-1;
  objouter.innerHTML ="";
  for (intTmp=0;intTmp<objList.length;intTmp++){
  for(i=0;i<objList[intTmp].length;i++){ 
if (objList[intTmp].substr(i, strInput.length).toUpperCase()==strInput.toUpperCase()){
    addOption(objList[intTmp],strInput);
  }
}
  }
  objouter.style.display='';
  }else{
  objouter.style.display='none';
  }
}
function addOption(value,keyw){
var v=value.replace(keyw,"<b><font color=blue>"+keyw+"</font></b>");
  objouter.innerHTML +="<div style='margin:2px;' onmouseover=\"this.className='sman_selectedStyle'\" onmouseout=\"this.className=''\" onmousedown=\"document.getElementById('"+objInputId+"').value='" + value + "';window.focus();\">" + v + "</div>" 
}
}
function chageSelection(isUp){
if (objouter.style.display=='none'){
objouter.style.display='';
}else{
if (isUp)
  selectedIndex++
else
  selectedIndex--
}
var maxIndex = objouter.children.length-1;
if (selectedIndex<0){selectedIndex=0}
if (selectedIndex>maxIndex) {selectedIndex=maxIndex}
for (intTmp=0;intTmp<=maxIndex;intTmp++){

if (intTmp==selectedIndex){
  objouter.children[intTmp].className="sman_selectedStyle";
}else{
  objouter.children[intTmp].className="";
}
}
}
function outSelection(Index){
if(!objouter.children[Index])return;
objInput.value = objouter.children[Index].innerText;
objouter.style.display='none';
}
function divPosition(){
    var objInput=null;
    for(i=0;i<document.all.tags('INPUT').length;i++) 
    {
        if(document.activeElement.islist=="true"){
            var objInput=document.activeElement;
        }
    }
    if(objInput!=null){
objouter.style.top =getAbsoluteHeight(objInput)+getAbsoluteTop(objInput);
objouter.style.left =getAbsoluteLeft(objInput); 
objouter.style.width=getAbsoluteWidth(objInput)
}
}
}
document.write("<div id='__smanDisp' style='position:absolute;display:none;border:solid 1px #817B88;" + this.style + "' onbulr> </div>");
document.write("<style>.sman_selectedStyle{background-Color:#C4E4FF;color:blue;font-size:12px;}</style>");
function getAbsoluteHeight(ob){
return ob.offsetHeight
}
function getAbsoluteWidth(ob){
return ob.offsetWidth
}
function getAbsoluteLeft(ob){
var s_el=0;el=ob;while(el){s_el=s_el+el.offsetLeft;el=el.offsetParent;}; return s_el
}


function getAbsoluteTop(ob){
var s_el=0;el=ob;while(el){s_el=s_el+el.offsetTop ;el=el.offsetParent;}; return s_el
}
}

var intIndex=0;arrList1 = new Array();
<logic:iterate id="item" property="list[@type='OMM_KnowledgeBase']">
	arrList1[intIndex++] = '<bean:write id="item" property="OMM_KnowledgeBase/KeyWords" />';
</logic:iterate>
smanPromptList("arrList1","inputer")





//////////////////////////////////////////

function IsInput(obj){
	if(obj.checked==true){
		obj.value=1;
		document.getElementById('knowledgeBasePanel').disabled=false;
		document.getElementById('OMM_KnowledgeBase/Title').disabled=false;
		document.getElementById('OMM_KnowledgeBase/Description').disabled=false;
		document.getElementById('OMM_KnowledgeBase/ProcessMethod').disabled=false;
	}else{
		obj.value=0;
		document.getElementById('knowledgeBasePanel').disabled=true;
		document.getElementById('OMM_KnowledgeBase/Title').disabled=true;
		document.getElementById('OMM_KnowledgeBase/Description').disabled=true;
		document.getElementById('OMM_KnowledgeBase/ProcessMethod').disabled=true;
	}
}

function ReChoose1(obj){
	if(obj.checked==true){
		document.getElementById('chkChoose2').checked=true;
		document.getElementById('panel').style.display="none";
		document.getElementById('npanel').style.display="block";
	}else{
	document.getElementById('OMM_Request/ReqTypeID').value=document.getElementById('tempTypeId').value;
		document.getElementById('chkChoose2').checked=false;
		document.getElementById('panel').style.display="block";
		document.getElementById('npanel').style.display="none";
	}
}

function ReChoose2(obj){
	if(obj.checked==true){
		document.getElementById('chkChoose1').checked=true;
		document.getElementById('panel').style.display="none";
		document.getElementById('npanel').style.display="block";
	}else{
	document.getElementById('OMM_Request/ReqTypeID').value=document.getElementById('tempTypeId').value;
		document.getElementById('chkChoose1').checked=false;
		document.getElementById('panel').style.display="block";
		document.getElementById('npanel').style.display="none";
	}
}

var flag=false;
 function catch_keydown(sel){
	switch(event.keyCode)
	{
		case 13:
			//Enter;
			sel.options[sel.length] = new Option("","",false,true);
			event.returnValue = false;
			break;
		case 27:
			//Esc;
			alert("text:" + sel.options[sel.selectedIndex].text + ", value:" + sel.options[sel.selectedIndex].value + ";");
			event.returnValue = false;
			break;
		case 46:
			//Delete;
			if(confirm("确定删除当前选项吗?"))
			{
				sel.options[sel.selectedIndex] = null;
				if(sel.length>0)
				{
					sel.options[0].selected = true;
				}
			}
			event.returnValue = false;
			break;
		case 8:
			//Back Space;
			var s = sel.options[sel.selectedIndex].text;
			sel.options[sel.selectedIndex].text = s.substr(0,s.length-1);
			event.returnValue = false;
			break;
	}	
}

	function catch_press(sel){
	try{
		sel.options[sel.selectedIndex].text = sel.options[sel.selectedIndex].text + String.fromCharCode(event.keyCode);
		sel.options[sel.selectedIndex].value=sel.options[sel.selectedIndex].text;
		event.returnValue = false;
		}catch(e){}
	}

	function GetRoomInfo(){
	    	var loc="OMM.prRequest.prRoomList.do";
		    window.open(loc,"","width=700px,height=380,status=yes,top=180,left=180,scroll=yes");
	}
	
	function SetValue(roomId,buildingName,roomName){
		document.getElementById('RoomId').value=roomId;
		document.getElementById('RoomName').value=buildingName+roomName;
		GetDevList(roomId);
	}

	function GetTitle(obj){
		if(obj.value!=-1){document.getElementById('OMM_Request/ReqTypeID').value=obj.value;}
		else{document.getElementById('OMM_Request/ReqTypeID').value=document.getElementById('tempTypeId').value;}
		var objTitle=document.getElementById('OMM_Request/Title');
		for (var i = objTitle.options.length; i > -1 ; i--) {
			objTitle.options.remove(i);
		}
		var varItem = new Option('', -1);
		objTitle.options.add(varItem);
		var reqTypeId=obj.value;
		if (reqTypeId!=-1) {
			var sub = new HiddenSubmit('OMM.bizRequest.bizGetTitleList');
			sub.add("TitleList/ReqTypeID/criteria/value", reqTypeId);
			if (sub.submit()) {
				if (sub.getValues("root/data/list[@type='TitleList']/TitleList").length<1) {
					alert("标题查询错误，请重新查询或直接输入！");
				} else{
					for (var i=0;i<sub.getValues("root/data/list[@type='TitleList']/TitleList").length;i++) {
						var value=sub.getValues("root/data/list[@type='TitleList']/TitleList[@rowNum='"+i+"']/Title");
						var tempItem = new Option(value, value);
						objTitle.options.add(tempItem);
					}
				}
			}
		}
	}

	var checkboxIndex = 0;
	function GetDevList(roomId){
		checkboxIndex=0;
		document.getElementById('DevList').innerText="";
		var sub = new HiddenSubmit('OMM.bizRequest.bizGetDevLogsInfo');
			sub.add("DevLogsInfo/RoomID/criteria/value", roomId);
			sub.add("DevLogsInfo/EndTime/criteria/operator", 'match');
			sub.add("DevLogsInfo/EndTime/criteria/value", 'NULL');
			if (sub.submit()) {
				if (sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo").length<1) {
					flag=false;
				} else{
					flag=true;
					for (var i=0;i<sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo").length;i++) {
						var deviceId=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/DeviceID");
						var captName=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/CAPTNAME");
						var operatorName=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/operatorName");
						var typeName=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/TypeName");
						var userId=sub.getValues("root/data/list[@type='DevLogsInfo']/DevLogsInfo[@rowNum='"+i+"']/UserID");
						insertDetail(deviceId,captName,operatorName,typeName,userId,i);
					}
				}
			}
	}
	
	
	
	 // 增加明细表记录
	function insertDetail(deviceId,captName,operatorName,typeName,userId,index) {
		
		var objTable = document.all['DevList']; // 明细表
		var nameArray = new Array();  //要显示字段名称
		var i = 0;
		nameArray[i++] = "deviceId"; 
		nameArray[i++] = "operatorName"; 
		nameArray[i++] = "typeName"; 
		nameArray[i++] = "captName";
		addRecordToTable(objTable, nameArray,deviceId,captName,operatorName,typeName,userId,index);	
	}
	  //递增索引号
	function addRecordToTable(objTable, nameArray,deviceId,captName,operatorName,typeName,userId,index) {
		
		var formHTML = "";
		var bodyHTML = objTable.innerHTML;
		bodyHTML = bodyHTML.replace("<TBODY>", "");
		bodyHTML = bodyHTML.replace("</TBODY>", "");
		formHTML += "<table width =\"96%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\"  bgcolor=\"#A2C4DC\" id=\"DevList\">";
		formHTML += bodyHTML;
		formHTML += "<tr class=\"td1\" id=\"row_" + checkboxIndex + "\" onClick='changeTRBgColor(this)'>";
		for (var i=0; i<nameArray.length; i++) {
			var colHTML = "";
			switch (i) {
			case 0: 
				colHTML += "<td width=\"10%\" align=\"center\" nowrap class=\"td1\">";
				if(index==0){
					colHTML += "<input type='radio' name=\"DeviceID\" value='"+deviceId+","+userId+"' checked=\"checked\" />";
				}else{
				colHTML += "<input type='radio' name=\"DeviceID\" value='"+deviceId+","+userId+"' />";}
				break;
			case 2: 
				colHTML += "<td width=\"30%\" align=\"center\" nowrap class=\"td1\">";
				colHTML += typeName;
				break;
		 	case 3: //操作
				colHTML += "<td width=\"30%\" align=\"center\" nowrap class=\"td1\">";
				if(captName==''){captName='<font color="red">该设备不属于固定资产范围</font>';}
				colHTML += captName;
				break;	
			default:
				colHTML += "<td width=\"30%\" align=\"center\" nowrap class=\"td1\">";
				colHTML += operatorName;
				break;
			}
			
			colHTML += "</td>";
			formHTML += colHTML;		
		}
		formHTML += "</tr>";
		formHTML += "</table>";  
		objTable.outerHTML = formHTML;
		var objTable = document.all['DevList']; // 明细表
		
		// 递增 checkboxIndex
		checkboxIndex ++ ;
	}
	////////////////////////////////////////////////////////////////

	function GetRoomID(obj) {
		var objRoomId=document.getElementById('RoomId');
		for (var i = objRoomId.options.length; i > -1 ; i--) {
			objRoomId.options.remove(i);
		}
		var varItem = new Option('请选择房号', -1);
		objRoomId.options.add(varItem);
		var layerNo=obj.value;
		var buildingId=document.getElementById('BuildingID').value;
		if (layerNo!=-1) {
			var sub = new HiddenSubmit('OMM.bizRequest.bizGetRoom');
			sub.add("Room/LayerNO/criteria/value", layerNo);
			sub.add("Room/BuildingID/criteria/value", buildingId);
			if (sub.submit()) {
				if (sub.getValues("root/data/list[@type='Room']/Room").length<1) {
					alert("房号查询错误，请重新查询！");
				} else{
					for (var i=0;i<sub.getValues("root/data/list[@type='Room']/Room").length;i++) {
						var value=sub.getValues("root/data/list[@type='Room']/Room[@rowNum='"+i+"']/RoomID");
						var option=sub.getValues("root/data/list[@type='Room']/Room[@rowNum='"+i+"']/RoomName");
						var tempItem = new Option(option, value);
						objRoomId.options.add(tempItem);
					}
				}
			}
		}
	}

	function GetLayerNo(obj) {
		var objLayerNo=document.getElementById('LayerNo');
		for (var i = objLayerNo.options.length; i > -1 ; i--) {
			objLayerNo.options.remove(i);
		}
		var varItem = new Option('请选择层号', -1);
		objLayerNo.options.add(varItem);
		var buildingID=obj.value;
		if (buildingID!=-1) {
			var sub = new HiddenSubmit('OMM.bizRequest.bizGetLayerNo');
			sub.add("LayerNo/BuildingID/criteria/value", buildingID);
			if (sub.submit()) {
				if (sub.getValues("root/data/list[@type='LayerNo']/LayerNo").length<1) {
					alert("层号查询错误，请重新查询！");
				} else{
					for (var i=0;i<sub.getValues("root/data/list[@type='LayerNo']/LayerNo").length;i++) {
						var no=sub.getValues("root/data/list[@type='LayerNo']/LayerNo[@rowNum='"+i+"']/LayerNO");
						var tempItem = new Option(no, no);
						objLayerNo.options.add(tempItem);
					}
				}
			}
		}
	}
function save() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "0";
		if(validater(frm)) {
			getWFData(frm);
			frm.submit();	
		}

}

function send() {
	var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
			if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["OMM_Request/nextParticipantId"].value == ""){
					alert("请选择下环节人员");
					return;
				}
			}
			getWFData(frm);
			frm.submit();	
		}
}
</script>
<script language="javascript">function menuControl(obj,show)
{
window.event.cancelBubble=true;
inputobj = event.srcElement;
var objID=event.srcElement.id;
var index=objID.indexOf("_");
var mainID=objID.substring(0,index);
var numID=objID.substring(index+1,objID.length);

if(show==1)
{
eval("showMenu("+obj+")");
}
else
{
eval("hideMenu("+obj+")");
}


}

var nbottom=0,speed=11;
function displayMenu(obj)
{
obj.style.clip="rect(0 100% "+nbottom+"% 0)";
nbottom+=speed;
if(nbottom<=100) 
{
timerID=setTimeout("displayMenu("+obj.id+"),70");
}
else clearTimeout(timerID);
}
function showMenu(obj)
{var parent = event.srcElement;
obj.style.display="block";
//obj.style.clip="rect(0 0 0 0)";
obj.style.top = ylib_getPageY(parent)+18;
obj.style.left = ylib_getPageX(parent);
//nbottom=5;
//displayMenu(obj);
}
function hideMenu(obj)
{
nbottom=0;
obj.style.display="none";
}
function keepMenu(obj)
{
obj.style.display="block";
}

function ylib_getPageX(o) { 
	var x=0;
	{ while(eval(o)) { 
		x+=o.offsetLeft; o=o.offsetParent; 
	} 
  } 
return x; 
}
function ylib_getPageY(o) {
 	var y=0; 
 	{ while(eval(o)) {
		 y+=o.offsetTop; o=o.offsetParent;
		  } 
	} 
	return y;
 }
 
function setValue(value) {
inputobj.value = inputobj.value + value;
}</script>