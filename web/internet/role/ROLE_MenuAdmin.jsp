<%@include file="/internet/BNOM/hciHead.jsp" %>
<table  width="100%" height="600">
	<tr>
		<div>
			<td width=20%>
			     <iframe frameborder="0" src="ROLE.pr_automata.ROLE_P_QueryAllMenu.do" name="tree" align="left" width="100%"  height="85%" scrolling="auto"></iframe>
			</td>
			<td width=80%>
			     <iframe src="ROLE.pr_automata.ROLE_P_QueryMenusPage.do?EOSMenu/parentsID=0&list/orderby/col1=menuLevel&list/orderby/col2=displayOrder&PageCond/begin=0&PageCond/isFirst=true&PageCond/isEnd=false&PageCond/curPage=1&PageCond/length=10" name="main" align="left" width="100%" frameborder="0"  height="90%" scrolling="no"></iframe>
			</td>
		</div>
	</tr>
</table>
<%@ include file="/internet/hciTail.jsp" %> 