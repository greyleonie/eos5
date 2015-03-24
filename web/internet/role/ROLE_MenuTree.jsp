<%@ include file="/internet/common.jsp" %> 
<eos:css/>
<link rel="stylesheet" href="/internet/theme/style0/tree.css" type="text/css" >
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
<%
	//get request parameter URLonClick;
	String URLonClick = request.getParameter("url");
	if(URLonClick==null){
		URLonClick="ROLE.pr_automata.ROLE_P_ExpandMenu.do?";
	}
	//get request parameter target;
	String target = request.getParameter("target");
	if(target==null){
		target="main";
	}
%>
<script type="text/javascript" src="/internet/scripts/tree.js"></script>
 <table height="100%" width="100%">
   <tr>
     <td valign="top">
<div id="tree" align="left" STYLE="padding-top: 8px;" nowrap>

<script type="text/javascript">
	// nodeId | parentNodeId | nodeName | target
 var Tree =  new Array (<logic:iterate id="ms" property="list[@type='EOSMenu']">"<bean:write id="ms"  property="EOSMenu/menuID"/>|<bean:write id="ms"  property="EOSMenu/parentsID"/>|<bean:write id="ms"  property="EOSMenu/menuLabel"/>|<%=URLonClick%>menuID=<bean:write id="ms"  property="EOSMenu/menuID"/>|<%=target%>",</logic:iterate>"end");		
	createTree(Tree, 0, 0,"²Ëµ¥Ê÷","ROLE.pr_automata.ROLE_P_QueryMenusPage.do?EOSMenu/parentsID=0&list/orderby/col1=menuLevel&list/orderby/col2=displayOrder&PageCond/begin=0&PageCond/isFirst=true&PageCond/isEnd=false&PageCond/curPage=1&PageCond/length=10","main");
</script>

</div>
    </td>
    </tr>
    </table>