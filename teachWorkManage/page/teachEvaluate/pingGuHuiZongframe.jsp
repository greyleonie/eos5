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
<title>������ί��У��Ϣһ�廯ƽ̨</title>
<script>
	var tabbox1=new TabControl("tab1c",1)
	<qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_MainRank">
	tabbox1.add('1','�������������','teachWorkManage.prTeachEvaluate.prMainClassRanking.do','testframe',0)
	</qx:talentModule>
	<qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_WeekRank">
	tabbox1.add('2','�����ÿ�ܻ���','teachWorkManage.prTeachEvaluate.prWeekReport.do?AssignMark/ClassID=0&week/begin=<%=talent.core.TalentFunctions.formatUtilDate(time)%>&week/end=<%=talent.core.TalentFunctions.formatUtilDate(time)%>&week/endWeekLength=<%=talent.core.TalentFunctions.formatUtilDate(time)%>','testframe',0)
	</qx:talentModule>
	<qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_UnitRank">
	tabbox1.add('3','����൥Ԫ����','teachWorkManage.prTeachEvaluate.prUnitReport.do?AssignMark/ClassID=0&AssignMark/CourseID=0','testframe',0)
	</qx:talentModule>
	<qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_FinalRank">
	tabbox1.add('4','�������ĩ����','teachWorkManage.prTeachEvaluate.prFinalReport.do?AssignMark/ClassID=0','testframe',0)
	</qx:talentModule>
	<qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_ShortRank">
	tabbox1.add('5','��ѵ����������','teachWorkManage.prTeachEvaluate.prShortReport.do?AssignMark/ClassID=0','testframe',0)
	</qx:talentModule>
	<qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_ExtraRank">
	tabbox1.add('6','�������������','teachWorkManage.prTeachEvaluate.prExtraReport.do?AssignMark/ClassID=0','testframe',0)
    </qx:talentModule>
    <qx:talentModule moduleID="DX_TEACH_MANAGE_TeachEvl_EvlCollect_DataAlys">
	tabbox1.add('7','�������ݷ���','teachWorkManage.prTeachEvaluate.prWDetailReport.do?AssignMark/ClassID=0','testframe',0)
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