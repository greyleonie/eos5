<%@include file="/internet/common.jsp"%>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree" %>
<script language="jscript" src="/pageComponent/resources/scripts/rtree.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/string.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/eventManager.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></script>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">
<%
  String goodIDs =  (String)request.getAttribute("goodIDs");
  goodIDs = request.getParameter("goodIDs");
  String[] goodIDArray = null;
  if(goodIDs != null) {
	
	goodIDArray = goodIDs.split(",");

  }
%>
<script language="JavaScript">
var goodIDArray = new Array();
<%
if(goodIDArray!=null&&goodIDArray.length>0){
	for(int m=0;m<goodIDArray.length;m++){
		if(goodIDArray[m]!=null&&!("".equals(goodIDArray[m]))){
%>
			goodIDArray[goodIDArray.length]='<%=goodIDArray[m]%>';  //在页面已经选择的用品
<%
		}
	}
}
%>
</script>


<body>
<form>

<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<TABLE border="0" width="98%" align="center">
	<TBODY>
		<TR>
		<TD  align="left" style="padding-top:3px" valign="top">
		<tree:tree id="tree1" width="100%" height="100%">
        <tree:root name="资产管理" icon="/internet/image/type1.gif" expandAction="oa.bizAssetsManage.typeList"  firstLevelEntities="list[@type='CAPT_TYPE']" expand="true"  onclick="reloadNodeChild"/>
        <tree:display entity="CAPT_TYPE" expression="$[NAMECODE] " icon= "/internet/image/type2.gif" onclick="reloadNodeChild"  />
        <tree:display entity="CAPT_CAPITALINFO" expression="$[GOODNAME]" icon="/internet/image/type3.gif" ondblclick="add" />
		<tree:expand entity="CAPT_TYPE" action="oa.bizAssetsManage.infoList"  childEntities="list[@type='CAPT_CAPITALINFO']"/>
        </tree:tree></TD>
		
		</TR>
	</TBODY>
</TABLE>
		  
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
</body>
<script>
	var currentNode;
	function reloadNodeChild(treeNode) {
		currentNode = treeNode;
		currentNode.reloadChild();
		currentNode.expandNode();
	}
	function refreshNode(){
		currentNode.reloadChild();
		currentNode.expandNode();
	}

	function refreshNodeParent(){
		var parentN = currentNode.getParent();
		if (parentN != null) {
			parentN.reloadChild();
			parentN.expandNode();
			currentNode = parentN;
		} else {
			menuTree.rootNode.reloadChild();
			menuTree.rootNode.expandNode();
			currentNode = menuTree.rootNode;
		}
	}

function add(treeNode){
	if(parent.manipulate.form2 != null){
		var name = treeNode.entity.getProperty("GOODNAME");
		var id = treeNode.entity.getProperty("CAPTID");
		
		var ops = parent.manipulate.document.form2.selectedGood.options;
		var	length = ops.length;
		

		if(check(id)==0){
				ops[length]=new Option(name,id);		
//				parent.manipulate.document.form2.selectedGood.options.length++;
			}
		}else return;
	}
	
	//防止选中已选的
	function check(value){
		var slt    = parent.manipulate.document.form2.selectedGood;
		var flag=0;
		for(var i=0;i<parent.manipulate.document.form2.selectedGood.length;i++){
			if(value==slt.options[i].value)	{
					alert("该选项已经选中");
					flag=1;
					return flag;
					
			}
		}
		for(var i=0;i<goodIDArray.length;i++){
			if(value==goodIDArray[i])	{
					alert("该用品已经选中");
					flag=1;
					return flag;
			}
		}
		return flag;
	}

</script>