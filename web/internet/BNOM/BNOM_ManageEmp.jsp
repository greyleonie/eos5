<%@ include file="/internet/hciHead.jsp" %> 
<%@page import="java.net.URLEncoder"%>
<table border="0" width="100%">
<tr>
    <td height="450" width="27%"> <iframe src="BNOM.pr_automata.BNOM_P_ShowOrgTree.do?URLonClick=<%=URLEncoder.encode("BNOM.pr_automata.BNOM_P_QueryEmpsByOrg.do?QueryCondition=&")%>" name="tree" target="main" width="100%" height="520" align="left" frameBorder="0"></iframe></td>
    <td height="450" width="73%"> <iframe src="about:blank" target="main" name="main" align="right"  width="100%" height="520" frameBorder="0"></iframe></td>
</tr>
</table>
			
		</td>
	</tr>
</table>
</body>
</html>


