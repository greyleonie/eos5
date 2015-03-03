<%@include file="/internet/common.jsp"%>
<%@page import="java.util.*;" %>
<%
Calendar now = Calendar.getInstance();
int year = now.get(Calendar.YEAR);
Date time = new Date();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>广州市委党校信息一体化平台</title>
<script>
	var tabbox1=new TabControl("tab1c",1)
	<qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_MainRank">
	tabbox1.add('1','主体班排名汇总','teachWorkManage.prTeachEvaluate.prMainClassRanking.do','testframe',0)
	</qx:talentModule>
	<qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_WeekRank">
	tabbox1.add('2','主体班每周汇总','teachWorkManage.prTeachEvaluate.prWeekReport.do?AssignMark/ClassID=0&week/begin=<%=talent.core.TalentFunctions.formatUtilDate(time)%>&week/end=<%=talent.core.TalentFunctions.formatUtilDate(time)%>&week/endWeekLength=<%=talent.core.TalentFunctions.formatUtilDate(time)%>','testframe',0)
	</qx:talentModule>
	<qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_UnitRank">
	tabbox1.add('3','主体班单元汇总','teachWorkManage.prTeachEvaluate.prUnitReport.do?AssignMark/ClassID=0&AssignMark/CourseID=0','testframe',0)
	</qx:talentModule>
	<qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_FinalRank">
	tabbox1.add('4','主体班期末汇总','teachWorkManage.prTeachEvaluate.prFinalReport.do?AssignMark/ClassID=0','testframe',0)
	</qx:talentModule>
	<qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_ShortRank">
	tabbox1.add('5','短训班评估汇总','teachWorkManage.prTeachEvaluate.prShortReport.do?AssignMark/ClassID=0','testframe',0)
	</qx:talentModule>
	<qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_ExtraRank">
	tabbox1.add('6','外请课评估汇总','teachWorkManage.prTeachEvaluate.prExtraReport.do?AssignMark/ClassID=0','testframe',0)
    </qx:talentModule>
    <qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_DataAlys">
	tabbox1.add('7','课题数据分析','teachWorkManage.prTeachEvaluate.prWDetailReport.do?AssignMark/ClassID=0','testframe',0)
    </qx:talentModule>
</script>
</head>

<body>
<table cellspacing="1" cellpadding="0" width="100%" height="1" border="0">
  <tr>
    <td height="1"></td>
  </tr>
</table>
<table border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse">
	<tr>
		<td>
			<script>
			 tabbox1.init()
			</script>
		</td>
	</tr>
	<tr>
		<td style="border:1px #DCDCDC solid;border-top:none" nowrap>
			<table border="0">
			  <tr>
				<td align="center">
				<iframe src="" name="testframe" frameborder="0" ></iframe>
				</td>
			  </tr>
			</table>
		</td>
	</tr>
</table> 
	
<script>
	tabbox1.initPage(1,'testframe');
</script>
</body>
</html>