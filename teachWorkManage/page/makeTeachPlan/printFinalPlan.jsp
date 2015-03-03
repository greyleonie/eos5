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
		<td width="88%" colspan="2" align="center" class="td1">中共广州市委党校</td>
	</tr>
	<tr class="td1">

		<td class="td1" align="center" colspan="2">
			<bean:write property="TeachingPlan/PlanName" />
		</td>
	</tr>
	<tr align="center" class="td1">
		<td align="center" class="td1" colspan="2">教学计划</td>

	</tr>

	<tr class="td1">

		<td colspan="2" class="td1">一、目的要求：</td>

	</tr>
	<tr class="td1">

		<td class="td1" colspan="2">
			<bean:write property="TeachingPlan/Purpose" />
		</td>
	</tr>

	<tr>

		<td colspan="2" class="td1">二、学习安排：</td>

	</tr>
	<tr>

		<td class="td1" colspan="2">
			<bean:write property="TeachingPlan/Arrange" />
		</td>
	</tr>

	<tr>
		<td colspan="2" class="td1">三、学习方法：</td>

	</tr>
	<tr>
		<td colspan="2" class="td1">
			<bean:write property="TeachingPlan/Method" />
		</td>
	</tr>

	<tr class="td1">
		<td align="left" class="td1" colspan="2">四、实施要求：</td>

	</tr>
	<tr class="td1">
		<td class="td1" colspan="2">
			<bean:write property="TeachingPlan/Implement" />
			&nbsp;</td>
	</tr>
	<tr class="td1">
		<td align="left" class="td1" colspan="2">五、课程安排：</td>

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
				&nbsp;&nbsp; 开始时间:
				<bean:write property="entity/BeginTime" id="resultSet"
								formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"  />
				&nbsp; 结束时间:
				<bean:write property="entity/EndTime" id="resultSet"
								formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"  />
				<BR>
				教学要求:</td>
		</tr>
		<tr class="td1">
			<td width="10%" align="center">日期</td>
			<td width="5%" align="center">午别</td>
			<td width="5%" align="center">星期</td>
			<td width="15%" colspan="8" align="center">学习内容</td>

			<td width="7%" align="center">授课人</td>
			<td width="6%" align="center">主持人</td>
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
								上午
							</logic:notEqual>
							<logic:equal id="courseResult" property="Course/ClassNoon" value="1" >
								下午
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