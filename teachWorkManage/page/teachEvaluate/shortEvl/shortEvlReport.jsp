<%@include file="/internet/common.jsp"%>
<%@page import="talent.core.*;"%>
<%
		int i, k, j = 0;
		int flag=0,levlen=0,courseID=0,cid=0,courseNO=0;
		String advice="",levname="",lname="";
%>
<style type="text/css">
	<!--
	.style2 {
		font-family: "宋体"
	}
	-->
</style>
<script type="text/javascript">

	function submitForm() {
		document.forms[0].submit();
	}

	function formatLevText(objname,levname) {
		var tmpText = "";
		for (var i=0;i<levname.length;i++) {
			tmpText += levname.substr(i, 1) + "<br>";
		}
		document.getElementById(objname).innerHTML = tmpText;
	}
	
	function exportToWord() {
       document.forms[0].action = "teachWorkManage.prTeachEvaluate.prShortEvlExport.do";
       document.forms[0].target = "_blank";
       document.forms[0].submit();
    } 

	function formatItemText(objname,itemName) {
		var name_tmp = "";
		if (itemName.length < 6) {
			for (var i=0;i < itemName.length;i++) {
				name_tmp = name_tmp + itemName.substr(i,1) + " ";
			}
			document.getElementById(objname).innerHTML = name_tmp + "<br>";
			return;
		}
		if (itemName.length >= 8) {
			document.getElementById(objname).innerHTML = itemName.substring(0,Math.floor(itemName.length/2)) + "<br>" + itemName.substring(Math.floor(itemName.length/2),itemName.length) + "<br>";
			return;
		}
		document.getElementById(objname).innerHTML = itemName + "<br>";
	}
</script>
<body>
	<form>
	<input type="hidden" name="dataEntity/_order/col1/field" value="me"> 
	<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
		<html:hidden property="Class/ClassID" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="/internet/image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;短训班评估汇总</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="8"></td>
			</tr>
			<tr>
				<td class="text">
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="30" class="text"><SELECT name="AssignMark/ClassID" id="AssignMark/ClassID" onchange="submitForm();">
									<option value="-1">--请选择班级--</option>
									<logic:iterate id="class" property="list[@type='studentclass']">
										<%String classno = base.util.TalentContext.getValue(pageContext, null,
				"Class/ClassID");
		String classid = base.util.TalentContext.getValue(pageContext, "class",
				"Class/ClassID");
		if (classid.equals(classno)) {
		%>
										<option value="<bean:write id="class" property="Class/ClassID"/>" selected>
											<bean:write id="class" property="Class/ClassName" />
										</option>
										<%} else {
		%>
										<option value="<bean:write id="class" property="Class/ClassID"/>">
											<bean:write id="class" property="Class/ClassName" />
										</option>
										<%}
		%>
									</logic:iterate>
								</SELECT><b> <input name="B32" type="button" class="button_02" value="汇 总"> 
								        <input name="B3" type="button" class="button_02" value="导 出" onClick="exportToWord()"> 
										<input name="B3" type="button" class="button_02" value="打 印" onClick="exportToWord()"> 
										<input type="hidden" name="queryaction"> <input type="hidden" name="viewaction"> </b></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="text">
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="listdetail">
				<tr>
				   <td align="center" class="text_title">
				   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center" class="text_title">
							<b><span id="printTable" class="MsoNormalIndent" style="font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;">
							<bean:write property="Class/ClassName" />综合评估汇总
							</span></b></td>
						</tr>
						<tr>
							<td height="30" align="left" class="text">
								<bean:write property="Class/ClassName" />共
								<bean:write property="Survey/amount" />人，发放评估问卷
								<bean:write property="Survey/amount" />份，回收
								<bean:write property="Survey/ballot" />份，回收率
								<bean:write property="Survey/precent" />%，意见栏填写
								<bean:write property="Survey/suggest" />份。统计问卷的有关信息如下：</td>
						</tr>
						<tr>
							<td height="30" align="left" class="text_red">一、基本信息</td>
						</tr>
						<tr>
							<td height="30" align="left" class="text"><span id="degree"> 最高学历：
									<logic:iterate id="degree" property="list[@type='degrees']">
										<bean:write id="degree" property="degrees/Degree" />
										<bean:write id="degree" property="degrees/amount" />人；
            </logic:iterate>
								</span> <br>
								<span id="sex">性别：
									<logic:iterate id="sex" property="list[@type='sexs']">
										<bean:write id="sex" property="sexs/sex" />
										<bean:write id="sex" property="sexs/amount" />人；
            </logic:iterate>
								</span><br>
								<logic:iterate id="age" property="list[@type='ages']">
            年龄：40岁以下<bean:write id="age" property="ages/major" />人；
            40-50岁<bean:write id="age" property="ages/wrinkly" />人；
            50岁以上<bean:write id="age" property="ages/old" />人。
            </logic:iterate>
							</td>
						</tr>
						<tr>
							<td height="30" align="left" class="text"><span class="text_red">
							<span style="font-family:宋体;mso-ascii-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;">
                            二、对本期班各方面的评价</span></span></td>
						</tr>
					</table>
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr align="center" class="td_title">
							<td rowspan="2" align="center">满意程度</td>
							<%j = 0;%>
							<logic:iterate id="level" property="list[@type='finaLevels']">
								<td colspan="2">
									<bean:write id="level" property="finaLevels/LevelName" />
								</td>
								<%j++;%>
							</logic:iterate>
						</tr>
						<tr class="td2">
							<logic:iterate id="level" property="list[@type='finaLevels']">
								<td width="10%" align="center">票数</td>
								<td width="9%" align="center">%</td>
							</logic:iterate>
						</tr>
						<%i = 0;%>
						<logic:iterate id="item" property="list[@type='finalItems']">
							<tr <% if (i%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %>
								onclick="changeTRBgColor(this)">
								<td id="item<%=i%>_text" width="9%">
									<script>formatItemText("item<%=i%>_text","<bean:write id="item" property="finalItems/Title"/>");
									</script>
								</td>
								<logic:iterate id="level" property="list[@type='finaLevels']">
									<logic:iterate id="report" property="list[@type='finalReports']">
		<%
		int itemId = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "item", "finalItems/ItemID"));
		int orderNo = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "level", "finaLevels/OrderNO"));
		int iid = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "report", "finalReports/ItemID"));
		int ono = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "report", "finalReports/OrderNO"));
		if (iid == itemId && ono == orderNo) {
		%>
										<td align="center">
											<bean:write id="report" property="finalReports/ballot" />
										</td>
										<td align="center">
											<bean:write id="report" property="finalReports/precent" />
										</td>
										<%}%>
									</logic:iterate>
								</logic:iterate>
							</tr>
							<%i++;%>
						</logic:iterate>
						<tr class="td2">
							<td align="center">意见和建议</td>
							<td colspan="<%=j*2%>">
								<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
									<logic:iterate id="item" property="list[@type='finalItems']">
										<tr>
											<td height="22" class="textb">
												<bean:write id="item" property="finalItems/Title" />
											</td>
										</tr>
										<%k = 1;%>
										<logic:iterate id="advice" property="list[@type='allAdvices']">
		<%int itemID = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "item", "finalItems/ItemID"));
		int itemid = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "advice", "finalAdvices/ItemID"));
		if (itemid == itemID) {
		    String suggest = base.util.TalentContext.getValue(pageContext,"advice","finalAdvices/Advice");
		    if (!"".equals(suggest)) {
		    suggest = TalentFunctions.transformHtmlTags(suggest);
			%>
											<tr>
												<td height="22" class="text"><%=k++%>、<%=suggest%>
												</td>
											</tr>
											<%} }%>
										</logic:iterate>
									</logic:iterate>
								</table>
							</td>
						</tr>
					</table>
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="30" align="left" class="text"><span class="text_red"><span
										style="font-family:宋体;mso-ascii-font-family:
&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;">三、对专题课的评价</span></span></td>
						</tr>
					</table>
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr align="center" class="td_title">
							<td width="10%" rowspan="2" align="center">主讲人</td>
							<td width="20%" rowspan="2">课题</td>
							<td width="10%" rowspan="2">回收（份）</td>
							<logic:iterate id="level" property="list[@type='courseLevels']">
								<td width="12%" colspan="2">
									<bean:write id="level" property="courseLevels/LevelName" />
								</td>
							</logic:iterate>
						</tr>
						<tr class="td2">
							<%levlen = 0;%>
							<logic:iterate id="level" property="list[@type='courseLevels']">
								<td width="6%" align="center">票数</td>
								<td width="6%" align="center">%</td>
								<%levlen++;%>
							</logic:iterate>
						</tr>
						<%i = 1;%>
						<logic:iterate id="ztk" property="list[@type='ztkReports']">
							<tr <% if (i%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %>
								onclick="changeTRBgColor(this)">
								<td width="12%">
									<bean:write id="ztk" property="ztkReports/TeacherName" />
								</td>
								<td width="32%">
									<bean:write id="ztk" property="ztkReports/CourseTitle" />
								</td>
								<td width="10%" align="center">
									<bean:write id="ztk" property="ztkReports/ballot" />
								</td>
								<logic:iterate id="level" property="list[@type='courseLevels']">
									<%flag = 0; %>
									<logic:iterate id="ztkDetail" property="list[@type='ztkDetails']">
			<%courseID = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "ztk", "ztkReports/CourseID"));
		levname = base.util.TalentContext.getValue(pageContext, "level",
				"courseLevels/LevelName").trim();
		cid = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "ztkDetail", "ztkDetails/CourseID"));
		lname = base.util.TalentContext.getValue(pageContext,
				"ztkDetail", "ztkDetails/LevelName").trim();
		if (cid == courseID && lname.equals(levname)) {

			%>
										<td width="6%" align="center">
											<bean:write id="ztkDetail" property="ztkDetails/ballot" />
										</td>
										<td width="6%" align="center">
											<bean:write id="ztkDetail" property="ztkDetails/precent" />
										</td>
										<%flag = 1;}%>
									</logic:iterate>
									<%if (flag == 0) {%>
									<td width="6%" align="center">0</td>
									<td width="6%" align="center">0</td>
									<%}%>
								</logic:iterate>
							</tr>
							<%i++;%>
						</logic:iterate>
					</table>
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="20" align="left" class="text_red">意见建议</td>
						</tr>
						<logic:iterate id="ztk" property="list[@type='ztkReports']">
							<tr>
								<td height="15" align="left" class="text">
									<bean:write id="ztk" property="ztkReports/CourseTitle" />
								</td>
							</tr>
							<%k = 1;%>
							<logic:iterate id="ztkAdvice" property="list[@type='ztkAdvices']">
		<%courseID = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "ztk", "ztkReports/CourseID"));
		courseNO = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "ztkAdvice", "ztkAdvices/CourseID"));
		if (courseNO == courseID) {
			advice = base.util.TalentContext.getValue(pageContext, "ztkAdvice",
					"ztkAdvices/Advice");
			advice = TalentFunctions.transformHtmlTags(advice);
			k++;
		}
		%>
								<tr>
									<td height="30" align="left" class="text"><%=k%>、<%=advice%></td>
								</tr>
							</logic:iterate>
						</logic:iterate>
					</table>
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="30" align="left" class="text"><span class="text_red">
							<span style="font-family:宋体;mso-ascii-font-family:
&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;">四、对外请课的评价</span></span></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="text">
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr align="center" class="td_title">
							<td width="10%" rowspan="2" align="center">主讲人</td>
							<td width="20%" rowspan="2">课题</td>
							<td width="10%" rowspan="2">回收（份）</td>
							<logic:iterate id="level" property="list[@type='courseLevels']">
								<td width="12%" colspan="2">
									<bean:write id="level" property="courseLevels/LevelName" />
								</td>
							</logic:iterate>
						</tr>
						<tr class="td2">
							<%levlen = 0;%>
							<logic:iterate id="level" property="list[@type='courseLevels']">
								<td width="6%" align="center">票数</td>
								<td width="6%" align="center">%</td>
								<%levlen++;%>
							</logic:iterate>
						</tr>
						<%i = 1;%>
						<logic:iterate id="wqk" property="list[@type='wqkReports']">
							<tr <% if (i%2!=0) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %>
								onclick="changeTRBgColor(this)">
								<td width="12%">
									<bean:write id="wqk" property="wqkReports/TeacherName" />
								</td>
								<td width="32%">
									<bean:write id="wqk" property="wqkReports/CourseTitle" />
								</td>
								<td width="10%" align="center">
									<bean:write id="wqk" property="wqkReports/ballot" />
								</td>
								<logic:iterate id="level" property="list[@type='courseLevels']">
									<%flag = 0; %>
									<logic:iterate id="wqkDetail" property="list[@type='wqkDetails']">
			<%courseID = Integer.parseInt(base.util.TalentContext.getValue(pageContext, "wqk", "wqkReports/CourseID"));
		      levname = base.util.TalentContext.getValue(pageContext, "level","courseLevels/LevelName").trim();
		      cid = Integer.parseInt(base.util.TalentContext.getValue(pageContext, "wqkDetail", "wqkDetails/CourseID"));
		      lname = base.util.TalentContext.getValue(pageContext,"wqkDetail", "wqkDetails/LevelName").trim();
		     if (cid == courseID && lname.equals(levname)) {
			%>
										<td width="6%" align="center">
											<bean:write id="wqkDetail" property="wqkDetails/ballot" />
										</td>
										<td width="6%" align="center">
											<bean:write id="wqkDetail" property="wqkDetails/precent" />
										</td>
										<%flag = 1;}%>
									</logic:iterate>
									<%if (flag == 0) {%>
									<td width="6%" align="center">0</td>
									<td width="6%" align="center">0</td>
									<%}%>
								</logic:iterate>
							</tr>
							<%i++;%>
						</logic:iterate>
					</table>
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="20" align="left" class="text_red">意见建议</td>
						</tr>
						<logic:iterate id="ztk" property="list[@type='wqkReports']">
							<tr>
								<td height="15" align="left" class="text">
									<bean:write id="ztk" property="wqkReports/CourseTitle" />
								</td>
							</tr>
							<%k = 1;%>
							<logic:iterate id="wqkAdvice" property="list[@type='wqkAdvices']">
		<%courseID = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "wqk", "wqkReports/CourseID"));
		courseNO = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "wqkAdvice", "wqkAdvices/CourseID"));
		if (courseNO == courseID) {
			advice = base.util.TalentContext.getValue(pageContext, "wqkAdvice",
					"wqkAdvices/Advice");
			advice = TalentFunctions.transformHtmlTags(advice);
			k++;
		}
		%>
								<tr>
									<td height="30" align="left" class="text"><%=k%>、<%=advice%></td>
								</tr>
							</logic:iterate>
						</logic:iterate>
					</table>
				   </td>
				</tr>
				</table>
				</td>
			</tr>
		</table>
	</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>