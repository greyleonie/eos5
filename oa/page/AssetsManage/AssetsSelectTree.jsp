<%@include file="/internet/common.jsp"%>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree" %>
<script language="jscript" src="/pageComponent/resources/scripts/rtree.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/string.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/eventManager.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></script>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">
<body>
<form method="post" action="oa.bizAssetsManage.infoList.do" name="opeForm">
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" class="text" >
		<TABLE border="0" width="98%" align="center">
	<TBODY>
		<TR>
		<TD  align="left" style="padding-top:3px" valign="top">
        <tree:tree id="tree1" width="100%" height="100%">
        <tree:root name="资产管理" icon="/internet/image/type1.gif" expandAction="oa.bizAssetsManage.typeList" firstLevelEntities="list[@type='CAPT_TYPE']" expand="true"  onclick="reloadNodeChild"/>
        <tree:display entity="CAPT_TYPE" expression="$[NAMECODE] " icon= "/internet/image/type2.gif" onclick="reloadNodeChild"  />
        <tree:display entity="entity" expression="$[CAPTNAME]" icon="/internet/image/type3.gif" onclick="add" />
		<tree:expand entity="CAPT_TYPE" action="oa.bizAssetsManage.infoListForKeyWork"  childEntities="list"/>
        </tree:tree></TD>
		
		</TR>
	</TBODY>
	</TABLE>
	</td>
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
	
	function checkSelectByValue(selObj,value,bSelected){
	 if (bSelected == undefined || bSelected ==""){
	 	 bSelected = true;
	 }
	 for (var i =0; i< selObj.options.length ; i++){
		  if (selObj.options[i].value==value){
		   selObj.options[i].selected = bSelected;
		   break;
		  }
	 }

	}
	
	function add(treeNode){
		var frm = parent.document.forms[0];
		frm["CAPT_CAPITALINFO/searchText"].value=treeNode.entity.getProperty("CAPTNAME");
	 parent.g_AddListContainer.style.display="none";
	}

</script>