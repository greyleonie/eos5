<%@ include file="/internet/eosapp/hciHead.jsp" %>
<%@page import="java.net.URLEncoder"%>
<table border="0" width="100%">
<tr>
    <td height="450" width="18%">
    	<iframe src="ROLE.pr_automata.ROLE_P_ShowFunctionTree.do" name="tree" target="main" width="100%" height="450" align="left" frameBorder="0"></iframe>
    </td>
    <td height="450" width="82%">
    	<iframe src="ROLE.pr_automata.ROLE_P_FunctionEdit.do?command='add'" target="main" name="main" align="right"  width="100%" height="450" frameBorder="0"></iframe>
    </td>
</tr>
</table>
<%@include file="/internet/hciTail.jsp" %>