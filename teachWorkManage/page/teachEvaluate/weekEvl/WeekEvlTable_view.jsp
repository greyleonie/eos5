<%@include file="/internet/common.jsp"%>
<STYLE type="text/css">
	.style2 {
		FONT-FAMILY: "宋体";
		FONT-SIZE: 13px;
	}
	
	.STYLE3 {
		FONT-WEIGHT: bold;
		FONT-SIZE: 24px;
		FONT-FAMILY: "新宋体"
	}
	
	.STYLE4 {
		FONT-WEIGHT: bold;
		FONT-SIZE: x-large;
		FONT-FAMILY: "新宋体"
	}
	
	.STYLE5 {
		FONT-WEIGHT: bold;
		FONT-SIZE: 16px;
		FONT-FAMILY: "新宋体"
	}
	
	.STYLE6 {
		FONT-WEIGHT: bold;
		FONT-SIZE: 14px;
		FONT-FAMILY: "新宋体"
	}
	
	.STYLE9 {
		FONT-SIZE: 12px
	}
	
	.noinput {
		BORDER-RIGHT: #a3a3a3 1px solid;
		BORDER-TOP: #636562 1px solid;
		DISPLAY: none;
		FONT-SIZE: 12px;
		BORDER-LEFT: #636562 1px solid;
		WIDTH: 600px;
		COLOR: #000000;
		BORDER-BOTTOM: #a3a3a3 1px solid;
		HEIGHT: 25px
	}
	
	.showinput {
		BORDER-RIGHT: #a3a3a3 1px solid;
		BORDER-TOP: #636562 1px solid;
		DISPLAY: block;
		FONT-SIZE: 12px;
		BORDER-LEFT: #636562 1px solid;
		WIDTH: 600px;
		COLOR: #000000;
		BORDER-BOTTOM: #a3a3a3 1px solid;
		HEIGHT: 25px
	}
	
	.showversion {
		FONT-SIZE: 12px;
		WIDTH: 50px;
		COLOR: #000000;
	}
	
	.noversion {
	    DISPLAY: none;
		FONT-SIZE: 12px;
		WIDTH: 50px;
		COLOR: #000000;
	}
	</STYLE>
<SCRIPT language="javascript" type="text/javascript">

	function formatLevText(objname,levname) {
	   var tmpText = "";
	   for (var i=0;i<levname.length;i++) {
         tmpText += levname.substr(i, 1) + "<br>";
       }
       document.getElementById(objname).innerHTML = tmpText;
	}
	
	function formatItemText(objname,itemName) {
	   var name_tmp = "";
	   if (itemName.length <= 6) {
          for (var i=0;i < itemName.length;i++) {
             name_tmp = name_tmp + itemName.substr(i,1) + " ";
          }
          document.getElementById(objname).innerHTML = name_tmp + "<br>";
          return;
       }
       if (itemName.length > 8) {
          document.getElementById(objname).innerHTML = itemName.substring(0,Math.floor(itemName.length/2)) + "<br>" + itemName.substring(Math.floor(itemName.length/2),itemName.length) + "<br>";
          return;
       }
       document.getElementById(objname).innerHTML = itemName + "<br>";
	}
</SCRIPT>
<FORM id="addWeekEvlForm" method="post" action="">
<html:hidden property="Evaluation/EvaluationID" />
<html:hidden property="Evaluation/Period" />
<html:hidden property="Evaluation/IsNeedAdvice" />
<input type="hidden" id="oldvalue" value=""> 
<IFRAME id="modifyframe" src="" style="display: none;"></IFRAME>
	<TABLE width="100%" cellPadding="0" border="0" cellSpacing="0">
		<TBODY>
			<TR>
				<TD height="24" background="/internet/image/lz_bg.gif">
					<TABLE width="100%" cellPadding="0" border="0" cellSpacing="0">
						<TBODY>
							<TR>
								<TD width="15"></TD>
								<TD class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;新增主体班每周评估表</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	<TABLE width="1000" cellPadding="0" align="center" border="0" cellSpacing="0">
		<TBODY>
			<TR>
				<TD height="20" align="center"><p class="STYLE3">中共广州市委党校&nbsp;&nbsp;广州行政学院</p>
<SPAN class="STYLE4" id="titleText"><bean:write property="Evaluation/Title"/></SPAN><BR>
<SPAN class="STYLE5">第**期******班（第*周：**月**日至**月**日）</SPAN><BR>
<SPAN id="remarksText" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<bean:write property="Evaluation/Remarks"/></SPAN>
<div id="version" width="100%" align="right">版本:<bean:write property="Evaluation/Version"/></div>
</TD>
			</TR>
			<TR>
				<TD valign="top" class="text">
					<TABLE width="100%" cellPadding="1" height="100%" border="0" cellSpacing="1" id="weekEvl" bgColor="#000000">
						<TBODY>
							<TR>
								<TD class="STYLE6" align="center" width="120" valign="middle" bgColor="#ffffff">
									教师及课题<BR>（辅导课）></TD>
								<TD width="880" valign="top" align="center" bgColor="#ffffff">
									<TABLE width="100%" cellPadding="0" height="100%" border="0" cellSpacing="1" id="tutorship" bgColor="#000000">
										<TBODY>
											<TR class="STYLE6">
											  <% 
											    int fdkLen = 0;
											    int fwidth = 0;
											    int fdkItemLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"ItemsLen/fdklen"));
											  %>
											  <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
											  <% fdkLen++; 
											     fwidth = 880/fdkItemLen;%>
												<TD width="<%=fwidth%>" align="center" id="tutorship<%=fdkLen%>_td" bgColor="#ffffff">
												<TABLE height="100%" width="100%" cellPadding="0" align="center" border="0" cellSpacing="1" bgColor="#000000">
											    <tr><td width="100%" height="25%" align="center" bgColor="#ffffff">
											    <SPAN id="tutorship<%=fdkLen%>_text">
												<script>formatItemText("tutorship<%=fdkLen%>_text","<bean:write id="fdkItem" property="fdkItems/Name"/>");</script>
												</SPAN>
											    </td></tr>
											    <tr><td width="100%" height="50%" align="center" bgColor="#ffffff" class="style2">
											    <SPAN class="STYLE9" id="tutorship<%=fdkLen%>_descText">
												<logic:notEqual id="fdkItem" property="fdkItems/Explain" value="">
												<bean:write id="fdkItem" property="fdkItems/Explain"/><BR>
												</logic:notEqual></SPAN>
												<SPAN id="tutorship<%=fdkLen%>_scoreText">(<bean:write id="fdkItem" property="fdkItems/Score"/>)<BR></SPAN>
											    </td></tr>
											    </TABLE>
												</TD>
												</logic:iterate>
												<logic:equal property="Evaluation/IsNeedAdvice" value="1">
												<TD width="200" align="center" rowspan="2" id="tutorship_suggest" bgColor="#ffffff">具体意见和建议</TD>
												</logic:equal>
											</TR>
											<TR>
											  <% fdkLen = 0; %>
											  <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
											  <% 
											   int itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkItem","fdkItems/ItemID")); 
											    fdkLen++;
											  %>
												<TD width="<%=fwidth%>" valign="top" align="center" id="tutorship<%=fdkLen%>_lev_td" bgColor="#ffffff">
													<TABLE width="100%" cellPadding="0" height="100%" border="0" cellSpacing="1" bgColor="#000000">
														<TBODY>
															<TR height="100%" class="STYLE9">
															<%
															  int fdkLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkItem","fdkItems/levlen"));
															  for (int i=1;i<=fdkLevLen;i++) {
															      int fpwidth = fwidth/fdkLevLen;
															%>
															<logic:iterate id="fdklev" property="list[@type='fdkLevs']">
															   <%
															     int levItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdklev","fdkLevs/ItemID"));
															     int levOrder =  Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdklev","fdkLevs/OrderNO"));
															     if (levItemId==itemId && levOrder==i) {
															   %>
																<TD width="<%=fpwidth%>" valign="top" align="center" id="tutorship<%=fdkLen%>_lev<%=i%>_td" bgColor="#ffffff">
																<SPAN id="tutorship<%=fdkLen%>_lev<%=i%>_text">
																<script>formatLevText("tutorship<%=fdkLen%>_lev<%=i%>_text","<bean:write id="fdklev" property="fdkLevs/LevelName"/>");</script>
																</SPAN>
																<SPAN id="tutorship<%=fdkLen%>_lev<%=i%>_scoreText">(<bean:write id="fdklev" property="fdkLevs/Score"/>)</SPAN>
																</TD>
																<% } %>
															</logic:iterate>
															<% } %>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
												</logic:iterate>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR class="STYLE6">
								<TD width="120" bgColor="#ffffff">2008-6-2<BR>某老师<BR>
									（教研部）：<BR>
									经济开放的模式转换与格局调整</TD>
								<TD width="880" valign="top" align="center" bgColor="#ffffff">
									<TABLE width="100%" height="100%" border="0" bgColor="#000000">
										<TBODY>
											<TR>
											  <% fdkLen = 0; %>
											  <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
											  <% fdkLen++; %>
												<TD width="<%=fwidth%>" id="row1_tutorship<%=fdkLen%>_checkboxes" bgColor="#ffffff">
													<TABLE width="100%" border="0" id="row1_tutorship<%=fdkLen%>_tb">
														<TBODY>
															<TR>
											  <%
											    int fdkLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkItem","fdkItems/levlen"));
												for (int i=1;i<=fdkLevLen;i++) {
												    int fpwidth = fwidth/fdkLevLen;
											  %>
																<TD width="<%=fpwidth%>" align="middle"><INPUT value="checkbox" type="checkbox" name="checkbox"></TD>
											  <% } %>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											   </logic:iterate>
											    <logic:equal property="Evaluation/IsNeedAdvice" value="1">
												<TD width="200" id="row1_tutorship_suggest" bgColor="#ffffff">&nbsp;</TD>
												</logic:equal>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD width="120" align="middle" bgColor="#ffffff">.<BR>
									.<BR>
									.<BR>
									.<BR>
									.<BR>
									.<BR>
									.</TD>
								<TD width="880" valign="top" align="center" bgColor="#ffffff">
									<TABLE width="100%" height="100%" border="0" bgColor="#000000">
										<TBODY>
											<TR>
											  <% fdkLen = 0; %>
											  <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
											  <% fdkLen++; %>
												<TD width="<%=fwidth%>" id="row2_tutorship<%=fdkLen%>_checkboxes" bgColor="#ffffff">
													<TABLE width="100%" border="0" id="row2_tutorship<%=fdkLen%>_tb">
														<TBODY>
															<TR>
											  <%
											    int fdkLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkItem","fdkItems/levlen"));
												for (int i=1;i<=fdkLevLen;i++) {
												    int fpwidth = fwidth/fdkLevLen;
											  %>
																<TD width="<%=fpwidth%>" align="center"><INPUT value="checkbox" type="checkbox" name="checkbox"></TD>
											  <% } %>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											   </logic:iterate>
											   <logic:equal property="Evaluation/IsNeedAdvice" value="1">
												<TD width="200" id="row2_tutorship_suggest" bgColor="#ffffff"></TD>
												</logic:equal>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD class="STYLE6" align="center" width="120" valign="middle" bgColor="#ffffff">教师及课题<BR>
									（互动式教学）</TD>
								<TD width="880" valign="top" align="center" bgColor="#ffffff">
									<TABLE width="100%" cellPadding="0" height="100%" border="0" cellSpacing="1" id="active" bgColor="#000000">
										<TBODY>
											<TR class="STYLE6">
											  <% int hdkLen = 0; 
											   int hwidth = 0;
											   int hdkItemLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"ItemsLen/hdklen"));
											  %>
											  <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
											  <% hdkLen++; 
											     hwidth = 880/hdkItemLen;
											  %>
												<TD width="<%=hwidth%>" align="center" id="active<%=hdkLen%>_td" bgColor="#ffffff">
												<TABLE height="100%" width="100%" cellPadding="0" align="center" border="0" cellSpacing="1" bgColor="#000000">
											    <tr><td width="100%" height="25%" align="center" bgColor="#ffffff">
												<SPAN id="active<%=hdkLen%>_text">
												<script>formatItemText("active<%=hdkLen%>_text","<bean:write id="hdkItem" property="hdkItems/Name"/>");</script>
												</SPAN>
											    </td></tr>
											    <tr><td width="100%" height="50%" align="center" bgColor="#ffffff" class="style2">
												<SPAN class="STYLE9" id="active<%=hdkLen%>_descText">
												<logic:notEqual id="hdkItem" property="hdkItems/Explain" value="">
												<bean:write id="hdkItem" property="hdkItems/Explain"/><BR>
												</logic:notEqual></SPAN>
												<SPAN id="active<%=hdkLen%>_scoreText">(<bean:write id="hdkItem" property="hdkItems/Score"/>)<BR></SPAN>
											    </td></tr>
											    </TABLE>
												</TD>
												</logic:iterate>
												<logic:equal property="Evaluation/IsNeedAdvice" value="1">
												<TD width="200" align="center" rowspan="2" id="active_suggest" bgColor="#ffffff">具体意见和建议</TD>
												</logic:equal>
											</TR>
											<TR>
											  <% hdkLen = 0; %>
											  <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
											  <% 
											   int hdkItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkItem","hdkItems/ItemID")); 
											    hdkLen++;
											  %>
												<TD width="<%=hwidth%>" valign="top" align="center" id="active<%=hdkLen%>_lev_td" bgColor="#ffffff">
													<TABLE width="100%" cellPadding="0" height="100%" border="0" cellSpacing="1" bgColor="#000000">
														<TBODY>
															<TR height="100%" class="STYLE9">
															<%
															  int hdkLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkItem","hdkItems/levlen"));
															  
															  for (int i=1;i<=hdkLevLen;i++) {
															       int hpwidth = hwidth/hdkLevLen;
															%>
															<logic:iterate id="hdklev" property="list[@type='hdkLevs']">
															   <%
															     int levItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdklev","hdkLevs/ItemID"));
															     int levOrder =  Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdklev","hdkLevs/OrderNO"));
															     if (levItemId==hdkItemId && levOrder==i) {
															   %>
																<TD width="<%=hpwidth%>" valign="top" align="center" id="active<%=hdkLen%>_lev<%=i%>_td" bgColor="#ffffff">
																<SPAN id="active<%=hdkLen%>_lev<%=i%>_text">
																<script>formatLevText("active<%=hdkLen%>_lev<%=i%>_text","<bean:write id="hdklev" property="hdkLevs/LevelName"/>");</script>
																</SPAN>
																<SPAN id="active<%=hdkLen%>_lev<%=i%>_scoreText">(<bean:write id="hdklev" property="hdkLevs/Score"/>)</SPAN>
																</TD>
																<% } %>
															</logic:iterate>
															<% } %>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
												</logic:iterate>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD width="120" class="STYLE6" bgColor="#ffffff">2008-6-2<BR>某老师<BR>
									（教研部）：<BR>
									危机管理模拟训练</TD>
								<TD width="880" valign="top" align="center" bgColor="#ffffff">
									<TABLE width="100%" height="100%" border="0" bgColor="#000000">
										<TBODY>
											<TR>
											  <% hdkLen = 0; %>
											  <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
											  <% hdkLen++; %>
												<TD align="center" width="<%=hwidth%>" id="row1_active<%=hdkLen%>_checkboxes" bgColor="#ffffff">
													<TABLE width="100%" height="100%" border="0" id="row1_active<%=hdkLen%>_tb">
														<TBODY>
															<TR>
											  <% 
									           int hdkLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkItem","hdkItems/levlen"));
				                             for (int i=1;i<=hdkLevLen;i++) {
				                                 int hpwidth = hwidth/hdkLevLen;
											  %>
																<TD width="<%=hpwidth%>" align="middle"><INPUT value="checkbox" type="checkbox" name="checkbox52"></TD>
											  <% } %>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
												</logic:iterate>
												<logic:equal property="Evaluation/IsNeedAdvice" value="1">
												<TD width="200" id="row1_active_suggest" bgColor="#ffffff"></TD>
												</logic:equal>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD width="120" align="center" valign="middle" bgColor="#ffffff">.<BR>
									.<BR>
									.<BR>
									.<BR>
									.<BR>
									.<BR>
									.</TD>
								<TD width="880" valign="top" align="center" bgColor="#ffffff">
									<TABLE width="100%" height="100%" border="0" bgColor="#000000">
										<TBODY>
											<TR>
											  <% hdkLen = 0; %>
											  <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
											  <% hdkLen++; %>
												<TD align="center" width="<%=hwidth%>" id="row2_active<%=hdkLen%>_checkboxes" bgColor="#ffffff">
													<TABLE width="100%" height="100%" border="0" id="row2_active<%=hdkLen%>_tb">
														<TBODY>
															<TR>
											  <% 
									           int hdkLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkItem","hdkItems/levlen"));
				                             for (int i=1;i<=hdkLevLen;i++) {
				                                 int hpwidth = hwidth/hdkLevLen;
											  %>
																<TD width="<%=hpwidth%>" align="center"><INPUT value="checkbox" type="checkbox" name="checkbox52"></TD>
											  <% } %>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
												</logic:iterate>
												<logic:equal property="Evaluation/IsNeedAdvice" value="1">
												<TD width="200" id="row2_active_suggest" bgColor="#ffffff">&nbsp;</TD>
												</logic:equal>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</FORM>
<P class="STYLE6" align="right">教 务 处</P>
<div align="center"><INPUT type="button" class="button_02" value="完成" onclick="window.history.go(-1);"></div>