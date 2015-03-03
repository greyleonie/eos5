<%@include file="/internet/common.jsp"%>
<%
String info=base.util.TalentContext.getValue(pageContext,null,"successForm/info");		//获取info参数
String url=base.util.TalentContext.getValue(pageContext,null,"successForm/url");		//获取即将转向的url
%>
	<head>
		<title>系统消息</title>
		<link  href="/internet/css/standard.css" rel="stylesheet" type="text/css" >
		<style type="text/css">
			TD {
			FONT-SIZE: 10pt; COLOR: #000000 ; line-height:117%;
			}
			A:visited {
			COLOR: #000000; TEXT-DECORATION: none
			}
			A:link {
			COLOR: #000000; TEXT-DECORATION: none
			}
			A:hover {
			COLOR: #a4373c; TEXT-DECORATION: none
			}
			.pageButton
			{
			background-repeat:no-repeat;
			border: 0px ;
			cursor:hand;
			background-color:#D6EFFF;
			background-image:url(/internet/images/functionframe/button6.gif);
			width:52px;
			height:19px;
			padding-top:3px;
			letter-spacing:3px;
			}
		</style>
		<script language="JavaScript">
			　　function goBack(a)
			　　{
			window.navigate(a);
			　　}
			function AutoClose()
			{
			window.close();
			}
			　　function AutoForword()
			　　{
			window.navigate("<%=url%>");
			　　}
		</script>
		
	</head>
	
	<body class='Standard-BodyStyle' leftMargin=0 topMargin=0 onunload="Exit()">
		
		<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TR>
				<TD >
					<table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td background="/internet/images/functionframe/errorTitle.gif" style="background-repeat:no-repeat;">
								<table width="100%" height="22" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="4%" valign="top"><img src="/internet/images/functionframe/Bar_lable.gif" width="12" height="18">
										</td>
										<td width="96%"><FONT
											face="Arial, Helvetica, sans-serif" color="#FF0000">系统消息</font></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td background="/internet/images/functionframe/errorContent.gif"  style="background-repeat:no-repeat;">
								<table width="100%" height="130" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="16%" height="108" valign="top">
											<div align="right">
												<img src="/internet/images/functionframe/inform.gif" width="42" height="56">
											</div>
										</td>
										<td width="84%" height="100" valign="top">
											<div style="overflow:auto;height:96px;width:96%" >
												<table width="89%" height="70" border="0" align="center" cellpadding="0" cellspacing="0">
													<tr>
														<td valign="bottom">
															<table border=0 width="100%" height="70%" align=left>
																<tr><td valign="bottom">
																		<br><br>
																		<b><%=info%></b>
																	</td></tr>
															</table>
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<td height="15" colspan="2" valign="top">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="25%">&nbsp;</td>
													<td width="50%" valign="top">
														<div align="center">
														    <logic:equal property="successForm/buttonType" value="0">
																<script>
																	AutoNavigateToClose();
																</script>
																<input type="button" onclick="AutoClose()" value="确定" Class="pageButton"/>
															</logic:equal>
															<logic:equal property="successForm/buttonType" value="1">
																<script>
																	//setTimeout("submitCheckOut();",12000);
																</script>
																<input type="button" onclick="submitCheckOut()" value="确定" Class="pageButton"/>
															</logic:equal>
														</div>
													</td>
													<td width="25%" height="56">&nbsp;</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table></TD>
			</TR></TABLE>
			<FORM name="checkoutfrm" action="<%=url%>" method="post">
			<html:hidden property="actstr" value="daysettlementview"/>
			<INPUT name="QueryDayBizLogCols/ChargeDepartmentID/criteria/value" value="<bean:write property='QueryBizLogsByIds/departmentid'/>">
			<INPUT name="QueryDayBizLogCols/HappeningDate/criteria/min" value="<bean:write property='QueryBizLogsByIds/happeningtime/min'/>">
			<INPUT name="QueryDayBizLogCols/HappeningDate/criteria/max" value="<bean:write property='QueryBizLogsByIds/happeningtime/max'/>">
			</FORM>
	</body>
<script type="text/javascript">
function submitCheckOut() {
document.forms["checkoutfrm"].submit();
}
</script>