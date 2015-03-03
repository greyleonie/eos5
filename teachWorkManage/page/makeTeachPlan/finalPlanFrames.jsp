<%@include file="/internet/common.jsp"%>
<script>
	var tabbox1=new TabControl("tab1c")
	tabbox1.add('1','单班教学计划','teachWorkManage.prMakeTeachPlan.singleClassPlan.do?TeachingPlan=&isAdopted=1','testframe',0)
	tabbox1.add('2','教学计划汇总表','teachWorkManage.prMakeTeachPlan.allTeachPlan.do?sqlCondition&exp=0&sesson=1&beg=&end=&conditionSql=&classIds=&isFirst=0&path=1','testframe',0)
	tabbox1.add('3','教学计划执行表','teachWorkManage.prMakeTeachPlan.executedPlan.do?PageCond=&Course=&isFirst=1','testframe',0)
	tabbox1.add('4','教学计划执行总表','teachWorkManage.prMakeTeachPlan.allExecutedPlan.do?exp=0&sesson=1&beg=&end=&conditionSql=&classIds=&isFirst=0&path=2','testframe',0)
	tabbox1.add('5','外请及合班','teachWorkManage.prMakeTeachPlan.monitorOutSideTeacherCourse.do?start=&end=&PageCond=&isFirst=1&Course=','testframe',0)
	tabbox1.add('6','教学辅助汇总','teachWorkManage.prMakeTeachPlan.assintTeaching.do?input/degree=1','testframe',0)
	tabbox1.add('7','后勤服务汇总','teachWorkManage.prMakeTeachPlan.service4Teaching.do?path=1&isFirst=1&start=&end=&export=0&currentWeek=1','testframe',0)
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