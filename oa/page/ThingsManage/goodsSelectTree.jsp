<%@include file="/internet/common.jsp"%>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree" %>
<script language="jscript" src="/pageComponent/resources/scripts/rtree.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/string.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/eventManager.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></script>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">
<body>
<form method="post" action="oa.prThingsManage.infoList.do" name="opeForm">
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" class="text" >
		<TABLE border="0" width="98%" align="center">
	<TBODY>
		<TR>
		<TD  align="left" style="padding-top:3px" valign="top">
		<tree:tree id="tree1" width="100%" height="100%">
        <tree:root name="选择用品" icon="/internet/image/type1.gif" expandAction="oa.bizThingsManage.typeList"  firstLevelEntities="list[@type='COMM_TYPE']" expand="true"  onclick="reloadNodeChild"/>
        <tree:display entity="COMM_TYPE" expression="$[TYPENAME] " icon= "/internet/image/type2.gif" onclick="reloadNodeChild"  />
        <tree:display entity="COMM_INFO" expression="$[GOODNAME]" icon="/internet/image/type3.gif" onclick="add" />
		<tree:expand entity="COMM_TYPE" action="oa.bizThingsManage.infoQuery"  childEntities="list[@type='COMM_INFO']"/>
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
	
	
	   var nameArray = new Array();  //要填充的字段名称
		var i = 0;
		nameArray[i++] = "COMMNAME"; 
		nameArray[i++] = "COMMID"; 
		nameArray[i++] = "SPECIA";
		nameArray[i++] = "PRICE";
		nameArray[i++] = "STORAGE";
	function add(treeNode){
		var frm = parent.document.forms[0];
		var detailName = frm["detailName"].value;
		var index = frm["index"].value;
		var goodIDs = frm["goodIDs"].value;
		var goodIDArray = new Array();
		if(goodIDs != ""){
		  goodIDArray = goodIDs.split(",");
		}
		var id = treeNode.entity.getProperty("COMMID");
		if(check(id,goodIDArray)==0){
			for(var i = 0;i<nameArray.length; i++){
				var fieldName = "listInsert/"+detailName+"[@hciTagIndex='"+index+"']/"+nameArray[i];
				frm[fieldName].value=treeNode.entity.getProperty(nameArray[i]);
				if(i==0||i==2){
				frm[fieldName].readOnly = true;
				}
			}
			var unitID = treeNode.entity.getProperty("UNITID");
			var unitField = "listInsert/"+detailName+"[@hciTagIndex='"+index+"']/UNITID";
			var selObj = frm[unitField];
			checkSelectByValue(selObj,unitID,true);
			selObj.disabled = true;
			
		}
	 parent.g_AddListContainer.style.display="none";
	}
	
	//防止选中已选的
	function check(value,goodIDArray){
		var flag=0;
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