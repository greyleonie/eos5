<%--
	---------------------------------------------------------------------------------
	Revision           Revision Date    Revision Man         Reason/Statement
	1.0                2004/04/26       liuhang                 create
	
--%>
<%@include file="/internet/common.jsp" %>


<link rel="StyleSheet" href="/internet/theme/style0/tree.css" type="text/css">
<script>

// Arrays for nodes and icons
var nodes		= new Array();;
var openNodes	= new Array();
var icons		= new Array(6);

// Loads all icons that are used in the tree
function preloadIcons() {
	icons[0] = new Image();
	icons[0].src = "/internet/theme/style0/tree_plus.gif";
	icons[1] = new Image();
	icons[1].src = "/internet/theme/style0/tree_plusbottom.gif";
	icons[2] = new Image();
	icons[2].src = "/internet/theme/style0/tree_minus.gif";
	icons[3] = new Image();
	icons[3].src = "/internet/theme/style0/tree_minusbottom.gif";
	icons[4] = new Image();
	icons[4].src = "/internet/theme/style0/tree_folder.gif";
	icons[5] = new Image();
	icons[5].src = "/internet/theme/style0/tree_folderopen.gif";
}
// Create the tree
function createTree(arrName, startNode, openNode,strHead,strHeadUrl,strTarget) {
	nodes = arrName;
	if (nodes.length > 0) {
		preloadIcons();
		if (startNode == null) startNode = 0;
		if (openNode != 0 || openNode != null) setOpenNodes(openNode);
	
		if (startNode !=0) {
			var nodeValues = nodes[getArrayId(startNode)].split("|");
			document.write("<a href=\"" + nodeValues[3] + "\" target=\"" + nodeValues[4] + "\" onmouseover=\"window.status='" + nodeValues[2] + "';return true;\" onmouseout=\"window.status=' ';return true;\"><img src=\"/internet/theme/style0/tree_folderopen.gif\" align=\"absbottom\" alt=\"\" />" + nodeValues[2] + "</a><br />");
		} else document.write("<a href='"+ strHeadUrl + " ' target='"+ strTarget + "'> <img src=\"/internet/theme/style0/tree_base.gif\" align=\"absbottom\" alt=\"\" />" + strHead + "</a><br />");
	
		var recursedNodes = new Array();
		addNode(startNode, recursedNodes);
	}
}
// Returns the position of a node in the array
function getArrayId(node) {
	for (i=0; i<nodes.length; i++) {
		var nodeValues = nodes[i].split("|");
		if (nodeValues[0]==node) return i;
	}
}
// Puts in array nodes that will be open
function setOpenNodes(openNode) {
	for (i=0; i<nodes.length; i++) {
		var nodeValues = nodes[i].split("|");
		if (nodeValues[0]==openNode) {
			openNodes.push(nodeValues[0]);
			setOpenNodes(nodeValues[1]);
		}
	} 
}
// Checks if a node is open
function isNodeOpen(node) {
	for (i=0; i<openNodes.length; i++)
		if (openNodes[i]==node) return true;
	return false;
}
// Checks if a node has any children
function hasChildNode(parentNode) {
	for (i=0; i< nodes.length; i++) {
		var nodeValues = nodes[i].split("|");
		if (nodeValues[1] == parentNode) return true;
		//begin:  added by Zesheng Liu 2003/8/5
		//assumption:  node Id is unique 
		//if (nodeValues[0] == parentNode) return false;   //can't handle it so simple
		//end 
	}
	return false;
}
// Checks if a node is the last sibling
function lastSibling (node, parentNode) {
	var lastChild = 0;
	for (i=0; i< nodes.length; i++) {
		var nodeValues = nodes[i].split("|");
		if (nodeValues[1] == parentNode)
			lastChild = nodeValues[0];
	}
	if (lastChild==node) return true;
	return false;
}
// Adds a new node in the tree
function addNode(parentNode, recursedNodes) {
	for (var i = 0; i < nodes.length; i++) {

		var nodeValues = nodes[i].split("|");
		if (nodeValues[1] == parentNode) {
			
			var ls	= lastSibling(nodeValues[0], nodeValues[1]);
			var hcn	= hasChildNode(nodeValues[0]);
			var ino = isNodeOpen(nodeValues[0]);

			// Write out line & empty icons
			for (g=0; g<recursedNodes.length; g++) {
				if (recursedNodes[g] == 1) document.write("<img src=\"/internet/theme/style0/tree_line.gif\" align=\"absbottom\" alt=\"\" />");
				else  document.write("<img src=\"/internet/theme/style0/tree_empty.gif\" align=\"absbottom\" alt=\"\" />");
			}

			// put in array line & empty icons
			if (ls) recursedNodes.push(0);
			else recursedNodes.push(1);

			// Write out join icons
			if (hcn) {
				if (ls) {
					document.write("<a href=\"javascript: oc('" + nodeValues[0] + "', 1);\" ><img id=\"join" + nodeValues[0] + "\" src=\"/internet/theme/style0/");
					 	if (ino) document.write("tree_minus");
						else document.write("tree_plus");
					document.write("bottom.gif\" align=\"absbottom\" alt=\"Open/Close node\" /></a>");
				} else {
					document.write("<a href=\"javascript: oc('" + nodeValues[0] + "', 0);\" ><img id=\"join" + nodeValues[0] + "\" src=\"/internet/theme/style0/");
						if (ino) document.write("tree_minus");
						else document.write("tree_plus");
					document.write(".gif\" align=\"absbottom\" alt=\"Open/Close node\" /></a>");
				}
			} else {
				if (ls) document.write("<img src=\"/internet/theme/style0/tree_join.gif\" align=\"absbottom\" alt=\"\" />");
				else document.write("<img src=\"/internet/theme/style0/tree_joinbottom.gif\" align=\"absbottom\" alt=\"\" />");
			}

			// Start link
			if(nodeValues[4] != ""){
				document.write("<a href=\"" + nodeValues[3] + "\" target=\"" + nodeValues[4] + "\" onmouseover=\"window.status='" + nodeValues[2] + "';return true;\" onmouseout=\"window.status=' ';return true;\">");
			}
			else{
				document.write("<a href=\"" + nodeValues[3] + "\" onmouseover=\"window.status='" + nodeValues[2] + "';return true;\" onmouseout=\"window.status=' ';return true;\">");
			}
			

			// Write out folder & page icons
			if (hcn) {
				document.write("<img id=\"icon" + nodeValues[0] + "\" src=\"/internet/theme/style0/tree_folder")
					if (ino) document.write("open");
				document.write(".gif\" align=\"absbottom\" alt=\"Folder\" />");
			} else document.write("<img id=\"icon" + nodeValues[0] + "\" src=\"/internet/theme/style0/tree_package.gif\" align=\"absbottom\" alt=\"Page\" />");

			// Write out node name
			document.write(nodeValues[2]);

			// End link
			document.write("</a><br />");

			// If node has children write out divs and go deeper
			if (hcn) {
				document.write("<div id=\"div" + nodeValues[0] + "\"");
					if (!ino) document.write(" style=\"display: none;\"");
				document.write(">");
				addNode(nodeValues[0], recursedNodes);
				document.write("</div>");
			}
			
			// remove last line or empty icon 
			recursedNodes.pop();
		}
	}
}

// Opens or closes a node
function oc(node, bottom) {
	var theDiv = document.getElementById("div" + node);
	var theJoin	= document.getElementById("join" + node);
	var theIcon = document.getElementById("icon" + node);
	//added by chugh 2003-9-9;
	if(theDiv==null){
		return;
	}//end  2003-9-9

	
	if (theDiv.style.display == 'none') {
		if (bottom==1) theJoin.src = icons[3].src;
		else theJoin.src = icons[2].src;
		theIcon.src = icons[5].src;
		theDiv.style.display = '';
	} else {
		if (bottom==1) theJoin.src = icons[1].src;
		else theJoin.src = icons[0].src;
		theIcon.src = icons[4].src;
		theDiv.style.display = 'none';
	}
}
// Push and pop not implemented in IE(crap!    don´t know about NS though)
if(!Array.prototype.push) {
	function array_push() {
		for(var i=0;i<arguments.length;i++)
			this[this.length]=arguments[i];
		return this.length;
	}
	Array.prototype.push = array_push;
}
if(!Array.prototype.pop) {
	function array_pop(){
		lastElement = this[this.length-1];
		this.length = Math.max(this.length-1,0);
		return lastElement;
	}
	Array.prototype.pop = array_pop;
}

</script>
<eos:css/>
 <table  height="100%" width="100%">
   <tr>
     <td valign="top">

<div id="tree" align="left" STYLE="padding-top: 8px;" nowrap>
<script type="text/javascript">
	//parent.hideWaiting();

	// nodeId | parentNodeId | nodeName | nodeUrl| target
	var Tree =  new Array (
	<logic:iterate id="items" property="list[@type='EOSFunctionUnit']">
		"<bean:write id="items" property="EOSFunctinUnit/unitID"/>|0|<bean:write id="items" property="EOSFunctionUnit/unitName"/>|ROLE.pr_automata.ROLE_P_QueryFunction.do?EOSFunction/unitID=<bean:write id="items" property="EOSFunctionUnit/unitID"/>|treeMain",
	</logic:iterate>

	"end");
 	createTree(Tree,0,"0","°üÁÐ±í","ROLE.pr_automata.ROLE_P_QueryFunction.do","treeMain");	
</script>
</div>
    </td>
    </tr>
    </table>
<%@include file="/internet/commonTail.jsp" %>