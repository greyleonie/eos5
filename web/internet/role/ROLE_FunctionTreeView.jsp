<%@ include file="/internet/common.jsp" %>
<link rel="stylesheet" href="/internet/theme/style0/tree.css" type="text/css" >
<%
	//get request parameter URLonClick;
	String URLonClick = request.getParameter("URLonClick");
	if(URLonClick==null){
		URLonClick="ROLE.pr_automata.ROLE_P_ShowFunction.do?";
	}
	//get request parameter target;
	String target = request.getParameter("target");
	if(target==null){
		target="main";
	}
%>
<script type="text/javascript" src="/internet/scripts/tree.js"></script>
<div id="tree" align="left" STYLE="padding-top: 8px;" nowrap>
<script type="text/javascript">

// nodeId | parentNodeId | nodeName | nodeUrl | target
var Tree =  new Array (<logic:iterate id="vop" property="list[@type='EOSBizCatalog']">"<bean:write id="vop"  property="EOSBizCatalog/catalogID"/>|0|<bean:write id="vop"  property="EOSBizCatalog/catalogName"/>|<%=URLonClick%>EOSBizCatalog/catalogID=<bean:write id="vop"  property="EOSBizCatalog/catalogID"/>|<%=target%>",</logic:iterate>"end");
createTree(Tree, 0, 0, "所有功能列表", "ROLE.pr_automata.ROLE_P_ShowAllFunction.do", "main");
</script>
</div>