<%@include file="/internet/common.jsp"%>
<script>
	var tabbox1=new TabControl("tab1c")
	tabbox1.add('1','�����ѧ�ƻ�','teachWorkManage.prMakeTeachPlan.singleClassPlan.do?TeachingPlan=&isAdopted=1','testframe',0)
	tabbox1.add('2','��ѧ�ƻ����ܱ�','teachWorkManage.prMakeTeachPlan.allTeachPlan.do?sqlCondition&exp=0&sesson=1&beg=&end=&conditionSql=&classIds=&isFirst=0&path=1','testframe',0)
	tabbox1.add('3','��ѧ�ƻ�ִ�б�','teachWorkManage.prMakeTeachPlan.executedPlan.do?PageCond=&Course=&isFirst=1','testframe',0)
	tabbox1.add('4','��ѧ�ƻ�ִ���ܱ�','teachWorkManage.prMakeTeachPlan.allExecutedPlan.do?exp=0&sesson=1&beg=&end=&conditionSql=&classIds=&isFirst=0&path=2','testframe',0)
	tabbox1.add('5','���뼰�ϰ�','teachWorkManage.prMakeTeachPlan.monitorOutSideTeacherCourse.do?start=&end=&PageCond=&isFirst=1&Course=','testframe',0)
	tabbox1.add('6','��ѧ��������','teachWorkManage.prMakeTeachPlan.assintTeaching.do?input/degree=1','testframe',0)
	tabbox1.add('7','���ڷ������','teachWorkManage.prMakeTeachPlan.service4Teaching.do?path=1&isFirst=1&start=&end=&export=0&currentWeek=1','testframe',0)
</script>
</head>



<body>

<table width="100%" height="5" border="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>

<table border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" >
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