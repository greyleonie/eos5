<%@include file="/internet/common.jsp"%>
<body>
	<form method="post" action="OMM.prCAPT.prToITDeviceList.do">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id="printTable">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">运维管理—&gt;IT设备管理—&gt;设备库
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5"><input type="hidden" name="queryaction" value="OMM.prCAPT.prToITDeviceList.do"> <input type="hidden"
						name="addaction" value="OMM.prCAPT.prToCAPTList.do"> <input type="hidden" name="modifyaction" value=""> <input
						type="hidden" name="deleteaction" value="OMM.pr.prDelType.do"> <input type="hidden" name="viewaction" value=""> <input
						type="hidden" name="modifytoSave" value="OMM.pr.prUpdateType.do">
					<html:hidden property="QITDevice/_order/col1/field" />
					<html:hidden property="QITDevice/_order/col1/asc" />
					<html:hidden property="QITDevice/DevCode/criteria/value" />
					<html:hidden property="QITDevice/DevCode" />
					<html:hidden property="QITDevice/TypeName" />
					<html:hidden property="QITDevice/CAPTNAME" />
					<html:hidden property="PageCond/begin" />
					<html:hidden property="PageCond/count" />
					<html:hidden property="PageCond/length" />
					<INPUT value="like" type="hidden" name="QITDevice/DevCode/criteria/operator"> <INPUT value="center" type="hidden"
						name="QITDevice/DevCode/criteria/likeRule"></td>
			</tr>
		</table>
		<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
			<tr>
				<td>
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="8"></td>
						</tr>
						<tr>
							<td height="30" class="text"><input name="add" type="button" class="button_02" value="导入设备" onClick="typeAdd()">&nbsp;&nbsp;&nbsp;&nbsp;<input
									name="new" type="button" class="button_02" value="新增设备" onClick="newDev()"><BR>
								<BR>
								<a title='关键字可以是"设备编号"' id="keytitle">设备编号</a>：
								<html:text property="QITDevice/DevCode/criteria/value" attributesText='class="input"' />
								<input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()"> 
								<!--<input name="ieprint"
									type="button" class="button_02" value="打 印" onClick="iePrint()"> <input name="export" type="button"
									class="button_02" value="导 出" onClick="exporttoexcel()"> 服务端排序：<input type="checkbox" name="checkbox"
									onClick="servertoorder()" marked=""></td>-->
						</tr>
						<tr>
							<td height="8"></td>
						</tr>
						<tr>
							<td valign="top" class="text">
								<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
									<tr class="td_title">
										<td width="8%" align="center" nowrap id="QITDevice.TypeName" onClick="talentsort()">设备类型</td>
										<td width="8%" align="center" nowrap id="QITDevice.DevCode" onClick="talentsort()">设备编号</td>
										<td width="12%" align="center" nowrap id="QITDevice.CAPTNAME" onClick="talentsort()">设备名称</td>
										<td width="8%" align="center" nowrap>详细信息</td>
										<td width="5%" align="center" nowrap>操作</td>
									</tr>
									<%
        int count = 0;
        String trClass = "result_content";

        %>
									<logic:iterate id="resultset" property="list[@type='QITDevice']">
										<%if (count % 2 == 0)
            trClass = "td1";
        else
            trClass = "td2";
        count++;
        %>
										<tr class="<%=trClass%>" onClick="changeTRBgColor(this)"
											onDblClick="talentviewf('<bean:write id="resultset" property="QITDevice/DevCode"/>','false')">
											<td nowrap align="center">
												<bean:write id="resultset" property="QITDevice/TypeName" />
											</td>
											<td nowrap align="center">
												<bean:write id="resultset" property="QITDevice/DevCode" />
											</td>
											<td nowrap align="center">
												<SCRIPT>
													var str='<bean:write id="resultset" property="QITDevice/CAPTNAME" />';
													if(str.length<1){
														document.write("<font style='color:red;'>该设备不属于固定资产范围</font>");
													}else{
														document.write(str);
													}
												</SCRIPT>
												
											</td>
											<td nowrap align="center">&nbsp; <A
													href='OMM.prCAPT.prGetInfo.do?OMM_ITDevice/DeviceID=<bean:write id="resultset" property="QITDevice/DeviceID" />'>详细信息</A></td>
											<TD nowrap align="center">
												<img  onClick="delDev('<bean:write id="resultset" property="QITDevice/DeviceID" />');" src="/internet/image/delete1.gif" style="cursor: hand">
											</TD>
										</tr>
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

	function delDev(obj){
		if(confirm("是否从设备库中删除该设备记录？")==true){
			window.location.href="OMM.prCAPT.prDelDev.do?OMM_ExtProperty/DeviceID="+obj+"&OMM_ITDevice/DeviceID="+obj;
		}
	}

	function typeAdd() {
		window.location.href="OMM.prCAPT.prToCAPTList.do";
	}

	function newDev() {
		window.location.href="OMM.prCAPT.prToNewDev.do";
	}
</script>