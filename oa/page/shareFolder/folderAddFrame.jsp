<%@include file="/internet/common.jsp"%>
<%
String fid = request.getParameter("fid");
 %>
<script>

	var tabbox1=new TabControl("tab1c",0);
	tabbox1.add('1','新增文件','oa.prFolder.fileAdd.do?fid=<%=fid%>','testframe',0);
	tabbox1.add('2','新增文件夹','oa.prFolder.folderAdd.do?fid=<%=fid%>','testframe',0);

	
</script>
<body>
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
				<iframe src="" name="testframe" frameborder="0" width="100%"></iframe>
				
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