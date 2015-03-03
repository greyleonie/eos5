<%@include file="/internet/common.jsp"%>
<script>
	var tabbox1=new TabControl("tab1c")
	tabbox1.add('1','专题班报名情况','teachWorkManage.prMakeTeachPlan.signUp2Subject.do?PageCond=&TeachingPlan=','testframe',0)
	tabbox1.add('2','专题班报名详细','teachWorkManage.prMakeTeachPlan.signDetail.do?PageCond=&SpecialSubject=','testframe',0)
	tabbox1.add('3','专题班课程表','teachWorkManage.prMakeTeachPlan.courseOfSpecialSubject.do?PageCond=','testframe',0)

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