<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic"%>
<%
        response.setContentType("application/msword;charset=gb2312");
%>
<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" height="369" bordercolordark="#FFFFFF"
	bordercolorlight="#A2C4DC">
	<tr class="td1">
		<td width="88%" colspan="2" align="center" class="td1">�й�������ί��У</td>
	</tr>
	<tr class="td1">

		<td class="td1" align="center" colspan="2">
			<bean:write property="TeachingPlan/PlanName" />
		</td>
	</tr>
	<tr align="center" class="td1">
		<td align="center" class="td1" colspan="2">��ѧ�ƻ�</td>

	</tr>

	<tr class="td1">

		<td colspan="2" class="td1">һ��Ŀ��Ҫ��</td>

	</tr>
	<tr class="td1">

		<td class="td1" colspan="2">
			<bean:write property="TeachingPlan/Purpose" />
		</td>
	</tr>

	<tr>

		<td colspan="2" class="td1">����ѧϰ���ţ�</td>

	</tr>
	<tr>

		<td class="td1" colspan="2">
			<bean:write property="TeachingPlan/Arrange" />
		</td>
	</tr>

	<tr>
		<td colspan="2" class="td1">����ѧϰ������</td>

	</tr>
	<tr>
		<td colspan="2" class="td1">
			<bean:write property="TeachingPlan/Method" />
		</td>
	</tr>

	<tr class="td1">
		<td align="left" class="td1" colspan="2">�ġ�ʵʩҪ��</td>

	</tr>
	<tr class="td1">
		<td class="td1" colspan="2">
			<bean:write property="TeachingPlan/Implement" />
			&nbsp;</td>
	</tr>
	<tr class="td1">
		<td align="left" class="td1" colspan="2">�塢�γ̰��ţ�</td>

	</tr>
</table>
<logic:iterate id="resultSet" property="list[@type='TeachingPlanUnitTemp']">
	<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" height="369" bordercolordark="#FFFFFF"
		bordercolorlight="#A2C4DC">
		<tr class="td1">
			<td colspan="13">
				<bean:write property="entity/UnitName" id="resultSet" />
				&nbsp;&nbsp;
				<bean:write property="entity/UnitTitle" id="resultSet" />
				&nbsp;&nbsp; ��ʼʱ��:
				<bean:write property="entity/BeginTime" id="resultSet"
								formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"  />
				&nbsp; ����ʱ��:
				<bean:write property="entity/EndTime" id="resultSet"
								formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"  />
				<BR>
				��ѧҪ��:</td>
		</tr>
		<tr class="td1">
			<td width="10%" align="center">����</td>
			<td width="5%" align="center">���</td>
			<td width="5%" align="center">����</td>
			<td width="15%" colspan="8" align="center">ѧϰ����</td>

			<td width="7%" align="center">�ڿ���</td>
			<td width="6%" align="center">������</td>
		</tr>
		<logic:iterate id="courseResult" property="list[@type='Course']">
			<logic:greaterEqual valueType="variable" valueId="resultSet" value="entity/BeginTime"
				propertyId="courseResult" property="Course/ClassDate">
				<logic:lessEqual valueType="variable" valueId="resultSet" value="entity/EndTime" propertyId="courseResult"
					property="Course/ClassDate">
					<tr class="td1">
						<td align="center">
							<bean:write id="courseResult" property="Course/ClassDate"
								formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd" />
						</td>
						<td align="center">
							<logic:notEqual id="courseResult" property="Course/ClassNoon" value="1" >
								����
							</logic:notEqual>
							<logic:equal id="courseResult" property="Course/ClassNoon" value="1" >
								����
							</logic:equal>
						</td>
						<td align="center">
							<bean:write id="courseResult" property="Course/weekDate" />
						</td>
						<td colspan="8">&nbsp;
							<bean:write id="courseResult" property="Course/CourseTitle" />
						</td>
						<td align="center">&nbsp;
							<bean:write id="courseResult" property="Course/teachIngMan" />
						</td>
						<td align="center">&nbsp;
							<bean:write id="courseResult" property="Course/dj" />
						</td>

					</tr>
				</logic:lessEqual>
			</logic:greaterEqual>
		</logic:iterate>
	</table>
</logic:iterate>