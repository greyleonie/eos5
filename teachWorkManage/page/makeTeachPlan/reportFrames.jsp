<%@include file="/internet/common.jsp"%>

<script>
  var loc='<bean:write property="loc"/>';
  var path="teachWorkManage.prMakeTeachPlan.mainClassReport.do?TeachingPlan=";//�ϱ�
  var path2="teachWorkManage.prMakeTeachPlan.subjectReport.do?TeachingPlan/State=3&loc="+loc;
  if(loc=="5"){
    path="teachWorkManage.prMakeTeachPlan.filterMainClass.do?TeachingPlan=&isAdopted=";//ɸѡ
    path2="teachWorkManage.prMakeTeachPlan.filterSubject.do?TeachingPlan/State=3&isAdopted=&loc="+loc;
  }
	var tabbox1=new TabControl("tab1c")
	tabbox1.add('1','������ѧ�ƻ�',path,'testframe',0)
	tabbox1.add('2','��ѡ��ѵ���ѧ�ƻ�',path2,'testframe',0)
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
</html>