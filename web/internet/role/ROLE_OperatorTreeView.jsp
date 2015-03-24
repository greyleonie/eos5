<%@ include file="/internet/common.jsp" %>
<link rel="stylesheet" href="/internet/theme/style0/tree.css" type="text/css" >
<%
	//get request parameter URLonClick;
	String URLonClick = request.getParameter("URLonClick");
	if(URLonClick==null){
		URLonClick="ROLE.pr_automata.ROLE_P_ShowOperator.do?";
	}
	//get request parameter target;
	String target = request.getParameter("target");
	if(target==null){
		target="main";
	}
%>
<script type="text/javascript" src="/internet/scripts/tree.js"></script>
<div id="tree" align="left">
<script type="text/javascript">

// nodeId | parentNodeId | nodeName | nodeUrl | target
var Tree =  new Array (<logic:iterate id="vop" property="list[@type='EOSOperator']">"<bean:write id="vop"  property="EOSOperator/operatorID"/>|0|<bean:write id="vop"  property="EOSOperator/operatorName"/>|<%=URLonClick%>EOSOperator/operatorID=<bean:write id="vop"  property="EOSOperator/operatorID"/>|<%=target%>",</logic:iterate>"end");
createTree(Tree, 0, 0, "所有用户", "ROLE.pr_automata.ROLE_P_ShowAllOperator.do", "main");
</script>
</div>