<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos"%>
<%@ taglib uri="/WEB-INF/hci-dict.tld" prefix="dict"%>
<%@ taglib uri="/WEB-INF/hci-info.tld" prefix="info"%>
<%@ taglib uri="/WEB-INF/hci-pagecom.tld" prefix="pagecom"%>
<%@ taglib uri="/WEB-INF/workflow.tld" prefix="workflow"%>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree"%>
<%@ taglib uri="/WEB-INF/hci-richclient.tld" prefix="richclient"%>
<%@ taglib uri="/WEB-INF/hci-datacell.tld" prefix="datacell"%>
<%@page import="talent.core.*"%>
<%
		response.setContentType("application/msword;charset=gb2312");%>
<%
		int i, k, j = 0;
		int flag = 0, levlen = 0, courseID = 0, cid = 0, courseNO = 0;
		String advice = "", levname = "", lname = "";
%>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	SCROLLBAR-FACE-COLOR: #D4D0C8 ;
 	SCROLLBAR-HIGHLIGHT-COLOR: #FFFFFF;
	SCROLLBAR-SHADOW-COLOR: #FFFFFF;
	SCROLLBAR-3DLIGHT-COLOR: #5385A5;
	SCROLLBAR-ARROW-COLOR: #000000;
	SCROLLBAR-TRACK-COLOR: #efefef;
	SCROLLBAR-DARKSHADOW-COLOR: #5385A5;
}

.text {
	font-size: 12px;
	color: #000000;
	line-height: 20px;
}
.textb {
	font-size: 12px;
	color: #000000;
	line-height: 20px;
	font-weight: bold;
}
.text_wirte {
	font-size: 12px;
	color: #FFFFFF;
}
.text_red {
	font-size: 12px;
	color: #ff0000;
}
.table {
	border: 1px solid #DCDCDC;
}
.td_title {
	background-color: #FFFFFF;
	font-size: 12px;
	line-height: 26px;
	color: #000000;
}
.td1 {
	background-color: #FFFFFF;
	font-size: 12px;
	line-height: 22px;
	color: #000000;
}
.td2 {
	background-color: #E8F5FF;
	font-size: 12px;
	line-height: 22px;
	color: #000000;
}
-->
</style>
<body>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="listdetail">
		<tr>
			<td align="center" class="text_title">
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td align="center" class="text_title"><b><span id="printTable" class="MsoNormalIndent"
									style="font-family:����;mso-ascii-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;">
									<bean:write property="Class/ClassName" />
									�ۺ��������� </span></b></td>
					</tr>
					<tr>
						<td height="30" align="left" class="text">
							<bean:write property="Class/ClassName" />
							��
							<bean:write property="Survey/amount" />
							�ˣ����������ʾ�
							<bean:write property="Survey/amount" />
							�ݣ�����
							<bean:write property="Survey/ballot" />
							�ݣ�������
							<bean:write property="Survey/precent" />
							%���������д
							<bean:write property="Survey/suggest" />
							�ݡ�ͳ���ʾ���й���Ϣ���£�</td>
					</tr>
					<tr>
						<td height="30" align="left" class="text">һ��������Ϣ</td>
					</tr>
					<tr>
						<td height="30" align="left" class="text"><span id="degree"> ���ѧ����
								<logic:iterate id="degree" property="list[@type='degrees']">
									<bean:write id="degree" property="degrees/Degree" />
									<bean:write id="degree" property="degrees/amount" />�ˣ�
            </logic:iterate>
							</span> <br>
							<span id="sex">�Ա�
								<logic:iterate id="sex" property="list[@type='sexs']">
									<bean:write id="sex" property="sexs/sex" />
									<bean:write id="sex" property="sexs/amount" />�ˣ�
            </logic:iterate>
							</span><br>
							<logic:iterate id="age" property="list[@type='ages']">
            ���䣺40������<bean:write id="age" property="ages/major" />�ˣ�
            40-50��<bean:write id="age" property="ages/wrinkly" />�ˣ�
            50������<bean:write id="age" property="ages/old" />�ˡ�
            </logic:iterate>
						</td>
					</tr>
					<tr>
						<td height="30" align="left" class="text"><span style="font-family:����;mso-ascii-font-family:&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;">
									�����Ա��ڰ�����������</span></td>
					</tr>
				</table>
				<table width="98%" border="0" align="center" cellpadding="2" cellspacing="3" bgcolor="#000000">
					<tr align="center" class="td_title">
						<td rowspan="2" align="center">����̶�</td>
						<%j = 0;%>
						<logic:iterate id="level" property="list[@type='finaLevels']">
							<td colspan="2">
								<bean:write id="level" property="finaLevels/LevelName" />
							</td>
							<%j++;%>
						</logic:iterate>
					</tr>
					<tr class="td1" bgcolor="#FFFFFF">
						<logic:iterate id="level" property="list[@type='finaLevels']">
							<td width="10%" align="center">Ʊ��</td>
							<td width="9%" align="center">%</td>
						</logic:iterate>
					</tr>
					<%i = 0;%>
					<logic:iterate id="item" property="list[@type='finalItems']">
						<tr bgcolor="#FFFFFF" onclick="changeTRBgColor(this)">
							<td width="9%">
								<bean:write id="item" property="finalItems/Title"/>
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
					<tr class="td1">
						<td align="center">����ͽ���</td>
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
			%>
										<tr>
											<td height="22" class="text"><%=k%>��
												<bean:write id="advice" property="finalAdvices/Advice" />
											</td>
										</tr>
										<%}%>
									</logic:iterate>
								</logic:iterate>
							</table>
						</td>
					</tr>
				</table>
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td height="30" align="left" class="text"><span style="font-family:����;mso-ascii-font-family:
&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;">������ר��ε�����</span></td>
					</tr>
				</table>
				<table width="98%" border="0" align="center" cellpadding="2" cellspacing="3" bgcolor="#000000">
					<tr align="center" class="td_title">
						<td width="10%" rowspan="2" align="center">������</td>
						<td width="20%" rowspan="2">����</td>
						<td width="10%" rowspan="2">���գ��ݣ�</td>
						<logic:iterate id="level" property="list[@type='courseLevels']">
							<td width="11%" colspan="2">
								<bean:write id="level" property="courseLevels/LevelName" />
							</td>
						</logic:iterate>
					</tr>
					<tr bgcolor="#FFFFFF" class="td1">
						<%levlen = 0;%>
						<logic:iterate id="level" property="list[@type='courseLevels']">
							<td width="6%" align="center">Ʊ��</td>
							<td width="5%" align="center">%</td>
							<%levlen++;%>
						</logic:iterate>
					</tr>
					<%i = 1;%>
					<logic:iterate id="ztk" property="list[@type='ztkReports']">
						<tr bgcolor="#FFFFFF" onclick="changeTRBgColor(this)">
							<td width="10%">
								<bean:write id="ztk" property="ztkReports/TeacherName" />
							</td>
							<td width="20%">
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
		cid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,
				"ztkDetail", "ztkDetails/CourseID"));
		lname = base.util.TalentContext.getValue(pageContext, "ztkDetail",
				"ztkDetails/LevelName").trim();
		if (cid == courseID && lname.equals(levname)) {

			%>
									<td width="6%" align="center">
										<bean:write id="ztkDetail" property="ztkDetails/ballot" />
									</td>
									<td width="5%" align="center">
										<bean:write id="ztkDetail" property="ztkDetails/precent" />
									</td>
									<%flag = 1;
		}%>
								</logic:iterate>
								<%if (flag == 0) {%>
								<td width="6%" align="center">0</td>
								<td width="5%" align="center">0</td>
								<%}%>
							</logic:iterate>
						</tr>
						<%i++;%>
					</logic:iterate>
				</table>
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td height="20" align="left" class="text">�������</td>
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
								<td height="30" align="left" class="text"><%=k%>��<%=advice%></td>
							</tr>
						</logic:iterate>
					</logic:iterate>
				</table>
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr bgcolor="#FFFFFF">
						<td height="30" align="left" class="text"><span
									style="font-family:����;mso-ascii-font-family:
&quot;Times New Roman&quot;;mso-hansi-font-family:&quot;Times New Roman&quot;">�ġ�������ε�����</span></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="text">
				<table width="98%" border="0" align="center" cellpadding="2" cellspacing="3" bgcolor="#000000">
					<tr bgcolor="#FFFFFF" align="center" class="td_title">
						<td width="10%" rowspan="2" align="center">������</td>
						<td width="20%" rowspan="2">����</td>
						<td width="10%" rowspan="2">���գ��ݣ�</td>
						<logic:iterate id="level" property="list[@type='courseLevels']">
							<td width="11%" colspan="2">
								<bean:write id="level" property="courseLevels/LevelName" />
							</td>
						</logic:iterate>
					</tr>
					<tr bgcolor="#FFFFFF" class="td1">
						<%levlen = 0;%>
						<logic:iterate id="level" property="list[@type='courseLevels']">
							<td width="6%" align="center">Ʊ��</td>
							<td width="5%" align="center">%</td>
							<%levlen++;%>
						</logic:iterate>
					</tr>
					<%i = 1;%>
					<logic:iterate id="wqk" property="list[@type='wqkReports']">
						<tr bgcolor="#FFFFFF" onclick="changeTRBgColor(this)">
							<td width="10%">
								<bean:write id="wqk" property="wqkReports/TeacherName" />
							</td>
							<td width="20%">
								<bean:write id="wqk" property="wqkReports/CourseTitle" />
							</td>
							<td width="10%" align="center">
								<bean:write id="wqk" property="wqkReports/ballot" />
							</td>
							<logic:iterate id="level" property="list[@type='courseLevels']">
								<%flag = 0; %>
								<logic:iterate id="wqkDetail" property="list[@type='wqkDetails']">
									<%courseID = Integer.parseInt(base.util.TalentContext.getValue(
				pageContext, "wqk", "wqkReports/CourseID"));
		levname = base.util.TalentContext.getValue(pageContext, "level",
				"courseLevels/LevelName").trim();
		cid = Integer.parseInt(base.util.TalentContext.getValue(pageContext,
				"wqkDetail", "wqkDetails/CourseID"));
		lname = base.util.TalentContext.getValue(pageContext, "wqkDetail",
				"wqkDetails/LevelName").trim();
		if (cid == courseID && lname.equals(levname)) {
			%>
									<td width="6%" align="center">
										<bean:write id="wqkDetail" property="wqkDetails/ballot" />
									</td>
									<td width="5%" align="center">
										<bean:write id="wqkDetail" property="wqkDetails/precent" />
									</td>
									<%flag = 1;
		}%>
								</logic:iterate>
								<%if (flag == 0) {%>
								<td width="6%" align="center">0</td>
								<td width="5%" align="center">0</td>
								<%}%>
							</logic:iterate>
						</tr>
						<%i++;%>
					</logic:iterate>
				</table>
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td height="20" align="left" class="text">�������</td>
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
								<td height="30" align="left" class="text"><%=k%>��<%=advice%></td>
							</tr>
						</logic:iterate>
					</logic:iterate>
				</table>
			</td>
		</tr>
	</table>
</body>