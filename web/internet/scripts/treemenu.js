
var icon_default_path = "/internet/images/";

var icon_line = new Image();
var icon_join = new Image();
var icon_joinbottom = new Image();
var icon_plus = new Image();
var icon_plusbottom = new Image();
var icon_minus = new Image();
var icon_minusbottom = new Image();
var node_default_icon = new Image();
var node_default_open_icon = new Image();

// 初始化缺省图标，包括缺省的节点图标
var icon_line_file = icon_default_path + "line.gif";
var icon_join_file = icon_default_path + "join.gif";
var icon_joinbottom_file = icon_default_path + "joinbottom.gif";
var icon_plus_file = icon_default_path + "plus.gif";
var icon_plusbottom_file = icon_default_path + "plusbottom.gif";
var icon_minus_file = icon_default_path + "minus.gif";
var icon_minusbottom_file = icon_default_path + "minusbottom.gif";
var node_default_icon_file = icon_default_path + "folder.gif";
var node_default_open_icon_file = icon_default_path + "folderopen.gif";
var empty_icon_file = icon_default_path + "empty.gif";
var root_icon_file = icon_default_path + "root.gif";

icon_line.src = icon_line_file;
icon_join.src = icon_join_file;
icon_joinbottom.src = icon_joinbottom_file;
icon_plus.src = icon_plus_file;
icon_plusbottom.src = icon_plusbottom_file;
icon_minus.src = icon_minus_file;
icon_minusbottom.src = icon_minusbottom_file;
node_default_icon.src = node_default_icon_file;
node_default_open_icon.src = node_default_open_icon_file;

var imgWidth = 19;
var imgHeight = 16;
var font_size = 12;

var treeNodes = new Array();
var nodeTypes = new Array();
var typeUrls = new Array();
var typeIcons = new Array();
var typeIconFiles = new Array();
var openNodes	= new Array();

/**
 * 初始化数的节点类型，图标以及缺省链接
 */
function initTree(typeList, urlList, iconList, imgW, imgH, fSize)
{
    initNodeTypes(typeList);
    if (urlList != null) {
        initNodeUrl(urlList);
    }
    var myIcon = new Array();
    if (iconList != null) {
        myIcon = iconList;
    }

    if (imgW != null && imgW != '') {
        imgWidth = imgW;
    }

    if (imgH != null && imgH != '') {
        imgHeight = imgH;
    }

    if (fSize != null && fSize != '') {
        font_size = fSize;
    }

    initNodeIcon(myIcon);
}

/**
 * 初始化节点类型 节点类型采用数组方式初始化
 *
 */
function initNodeTypes(typeList)
{
    var i;
    nodeTypes = typeList;
    for (i=0; i<nodeTypes.length; i++) {
        typeUrls[i] = "";
    }
}

/**
 * 根据节点类型获得类型编号
 */
function getTypeId(nodeType)
{
    var typeId = -1;
    var i;
    for (i=0; i<nodeTypes.length; i++) {
        if (nodeTypes[i] == nodeType) {
            typeId = i;
            break;
        }
    }
    return typeId;
}

/**
 * 初始化节点类型的缺省链接
 * 链接字符串的格式： nodeType|URL
 */
function initNodeUrl(urlList)
{
    var i, j;
    for (i=0; i<nodeTypes.length; i++) {
        typeUrls[i] = "";
        for (j=0; j<urlList.length; j++) {
            var urlValues = urlList[j].split('|');
            if (urlValues[0] == nodeTypes[i]) {
                if (urlValues.length > 1) {
                    typeUrls[i] = urlValues[1];
                }
                break;
            }
        }
    }
}


/**
 * 初始化不同类型节点的图标，图标列表数组的元素为字符串类型格式： nodeType|nodeIconFilePath|nodeOpenIconFilePath
 * 如果节点类型没有图标将使用缺省图标，如果没有 open 类型的图标，那么open 类图标和节点图标一样
 *
 */
function initNodeIcon(iconList)
{
    var hasIcon = false;
    var i, j;
    for (i=0; i<nodeTypes.length; i++) {
        hasIcon = false;
        for (j=0; j<iconList.length; j++) {
            var iconValues = iconList[j].split('|');
            if (iconValues[0] == nodeTypes[i]) {
                hasIcon = true;
                if (iconValues.length > 1) {
                    typeIcons[i] = new Array();
                    typeIcons[i][0] = new Image();
                    typeIcons[i][0].src = iconValues[1];
                    typeIconFiles[i] = new Array();
                    typeIconFiles[i][0] = iconValues[1];

                    typeIcons[i][1] = new Image();
                    if (iconValues.length > 2) {
                        typeIcons[i][1].src = iconValues[2];
                        typeIconFiles[i][1] = iconValues[2];
                    } else {
                        typeIcons[i][1].src = iconValues[1];
                        typeIconFiles[i][1] = iconValues[1];
                    }
                } else {
                    hasIcon = false;
                }
                break;
            }
        }
        if (!hasIcon) {
            typeIcons[i] = new Array();
            typeIcons[i][0] = new Image();
            typeIcons[i][0].src = node_default_icon_file;
            typeIcons[i][1] = new Image();
            typeIcons[i][1].src = node_default_open_icon_file;

            typeIconFiles[i] = new Array();
            typeIconFiles[i][0] = node_default_icon_file;
            typeIconFiles[i][1] = node_default_open_icon_file;
        }
    }
}

function getNodeTypeIcon(typeId)
{
    return typeIcons[typeId][0];
}

function getNodeTypeOpenIcon(typeId)
{
    return typeIcons[typeId][1];
}

function getNodeTypeIconFile(typeId)
{
    return typeIconFiles[typeId][0];
}

function getNodeTypeOpenIconFile(typeId)
{
    return typeIconFiles[typeId][1];
}


/**
 *  根据节点编号获得节点在数组中的编号
 */
function getTreeNodeArrayId(typeId, nodeId)
{
    var i, arrayId = -1;
    for (i=0; i<treeNodes.length; i++) {
        if ((typeId == treeNodes[i][1]) && (nodeId == treeNodes[i][0])) {
            arrayId = i;
            break;
        }
    }
    return arrayId;
}

/**
 * 创建树
 * 初始化树的节点，节点值的格式： nodeType|nodeId|parentNodeType|parentNodeId|nodeName|nodeUrl|target
 * openNodeId ： 需要打开的节点编号 （可以为空）
 * openNodeType ： 需要打开的节点的类型 （如果有openNodeId ，这个参数也需要）
 * strHead ：根节点名 （如果有此参数，后面的参数才有效都需要有）
 * strHeadUrl ： 根节点链接
 * strHeadTarget ： 根节点链接目标
 * iconHeadFile ： 根据节点的图标文件名 （如果没有使用缺省图标）
 *
 */
function createTree(nodeList, openNodeId, openNodeType, strHead, strHeadUrl, strHeadTarget, iconHeadFile)
{
    var i, n = 0;
    for (i=0; i<nodeList.length; i++) {
        if (nodeList[i] == "end") continue;

        var nodeValues = nodeList[i].split('|');
        var typeId = getTypeId(nodeValues[0]);
        if (typeId > -1) {
            treeNodes[n] = new Array();
            treeNodes[n][0] = nodeValues[1];            //节点编号
            treeNodes[n][1] = typeId;                   //节点类型
            treeNodes[n][2] = nodeValues[4];            //节点名称
            treeNodes[n][3] = getTypeId(nodeValues[2]);  //父节点类型
            if (treeNodes[n][3] == -1) {
                treeNodes[n][4] = "tree_node_parent_not_exist";   //父节点类型不存在
            } else {
                treeNodes[n][4] = nodeValues[3];        //父节点编号
            }
            if (nodeValues[5] != "") {
                treeNodes[n][5] = nodeValues[5];        //节点链接
            } else {
                if (typeUrls[typeId] == "") {
                    treeNodes[n][5] = "";               //没有链接
                } else {
                    treeNodes[n][5] = typeUrls[typeId] + nodeValues[1];
                }
            }
            treeNodes[n][6] = nodeValues[6];            //链接目标位置
            n++;
        }
    }

    for (i=0; i<treeNodes.length; i++) {
        if (treeNodes[i][4] != "tree_node_parent_not_exist") {
            var arrayId = getTreeNodeArrayId(treeNodes[i][3], treeNodes[i][4]);
            if ((arrayId != -1) && (arrayId != i)) {
                treeNodes[i][4] = arrayId;
            } else {
                treeNodes[i][4] = "tree_node_parent_not_exist";
            }
        }
    }

    if (openNodeId != null && openNodeType != null) {
        var openId = getTreeNodeArrayId(getTypeId(openNodeType), openNodeId);
        if (openId != -1) setOpenNodes(openId);
    }
    if (strHead != null && strHead != "") {
        if (strHeadTarget == null) strHeadTarget = "";
        if (strHeadUrl != null && strHeadUrl != "") {
            document.write("<a style=\"color:#000; text-decoration:none; font-size:"+font_size+"px;\" href=\"" + strHeadUrl + "\" target=\"" + strHeadTarget + "\" >");
        }
        if (iconHeadFile != null && iconHeadFile != "") {
            document.write("<img style=\"border:0px; width:"+imgWidth+"px; height:"+imgHeight+"px;\" src=\"" + iconHeadFile + "\" align=\"absbottom\" />");
        } else {
            document.write("<img style=\"border:0px; width:"+imgWidth+"px; height:"+imgHeight+"px;\" src=\"" + root_icon_file + "\" align=\"absbottom\" />");
        }
        document.write("<font style=\"font-size:"+font_size+"px;\" >&nbsp;" + strHead + "</font>");
        if (strHeadUrl != null && strHeadUrl != "") {
            document.write("</a>");
        }
        document.write("<br />");
        var recursedNodes = new Array();
        addNode("tree_node_parent_not_exist", recursedNodes);
    } else {
        for (i=0; i<treeNodes.length; i++) {
            if (treeNodes[i][4] == "tree_node_parent_not_exist") {
                var recursedNodes = new Array();
    
                if (treeNodes[i][5] != "") {
                    document.write("<a style=\"color:#000; text-decoration:none; font-size:"+font_size+"px;\" href=\"" + treeNodes[i][5] + "\" target=\"" + treeNodes[i][6] +"\" >");
                }
                document.write("<img style=\"border:0px; width:"+imgWidth+"px; height:"+imgHeight+"px;\" id=\"tree_icon_" + i + "\" src=\"" + getNodeTypeOpenIconFile(treeNodes[i][1]) +"\" align=\"absbottom\" />");
    			// Write out node name
                document.write("<font style=\"font-size:"+font_size+"px;\" >&nbsp;" + treeNodes[i][2] + "</font>");
    
                if (treeNodes[i][5] != "") {
                    document.write("</a>");
                }
                document.write("<br />");
                addNode(i, recursedNodes);
            }
        }
    }
}

function setOpenNodes(node) 
{
    openNodes.push(node);
    if (treeNodes[node][4] != "tree_node_parent_not_exist") {
        setOpenNodes(treeNodes[node][4]);
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
    for (var i=0; i< treeNodes.length; i++) {
        if (treeNodes[i][4] == parentNode) return true;
    }
    return false;
}

// Checks if a node is the last sibling
function lastSibling (node, parentNode) {
    var lastChild = 0;
    for (var i=0; i< treeNodes.length; i++) {
        if (treeNodes[i][4] == parentNode)
            lastChild = i;
    }
    if (lastChild==node) return true;
    return false;
}


function addNode(parentNode,  recursedNodes)
{
    var i;
    for (i=0; i<treeNodes.length; i++) {
        if ((parentNode != i) && (treeNodes[i][4] == parentNode)) {

            var ls  = lastSibling(i, parentNode);
            var hcn = hasChildNode(i);
            var ino = isNodeOpen(i);

            // Write out line & empty icons
            for (var g=0; g<recursedNodes.length; g++) {
                if (recursedNodes[g] == 1) document.write("<img style=\"border:0px; width:19px; height:19px;\" src=\"" + icon_line_file + "\" align=\"absbottom\" />");
                else  document.write("<img style=\"border:0px; width:19px; height:19px;\" src=\"" + empty_icon_file + "\" align=\"absbottom\" />");
            }

            // put in array line & empty icons
            if (ls) recursedNodes.push(0);
            else recursedNodes.push(1);

			// Write out join icons
			if (hcn) {
				if (ls) {
					document.write("<a style=\"color:#000; text-decoration:none; font-size:"+font_size+"px;\" href=\"javascript: oc(" + i + ", 1);\" ><img style=\"border:0px; width:19px; height:19px;\" id=\"tree_join_" + i + "\" src=\"");
					if (ino) document.write(icon_minusbottom_file);
					else document.write(icon_plusbottom_file);
					document.write("\" align=\"absbottom\" /></a>");
				} else {
					document.write("<a style=\"color:#000; text-decoration:none; font-size:"+font_size+"px;\" href=\"javascript: oc(" + i + ", 0);\" ><img style=\"border:0px; width:19px; height:19px;\" id=\"tree_join_" + i + "\" src=\"");
					if (ino) document.write(icon_minus_file);
					else document.write(icon_plus_file);
					document.write("\" align=\"absbottom\" /></a>");
				}
			} else {
				if (ls) document.write("<img style=\"border:0px; width:19px; height:19px;\" src=\"" + icon_join_file + "\" align=\"absbottom\" />");
				else document.write("<img style=\"border:0px; width:19px; height:19px;\" src=\"" + icon_joinbottom_file + "\" align=\"absbottom\" />");
			}

            if (treeNodes[i][5] != "") {
                document.write("<a style=\"color:#000; text-decoration:none; font-size:"+font_size+"px;\" href=\"" + treeNodes[i][5] + "\" target=\"" + treeNodes[i][6] +"\" >");
            } else {
                if (hcn) {
                    document.write("<a style=\"color:#000; text-decoration:none; font-size:"+font_size+"px;\" href=\"javascript: oc(" + i+ ", 1);\" >");
                }
            }
            if (ino) {
                document.write("<img style=\"border:0px; width:"+imgWidth+"px; height:"+imgHeight+"px;\" id=\"tree_icon_" + i + "\" src=\"" + getNodeTypeOpenIconFile(treeNodes[i][1]) +"\" align=\"absbottom\" />");
            } else {
                document.write("<img style=\"border:0px; width:"+imgWidth+"px; height:"+imgHeight+"px;\" id=\"tree_icon_" + i + "\" src=\"" + getNodeTypeIconFile(treeNodes[i][1]) +"\" align=\"absbottom\" />");
            }
			// Write out node name
            document.write("<font style=\"font-size:"+font_size+"px;\" >&nbsp;" + treeNodes[i][2] + "</font>");

            if (treeNodes[i][5] != "") {
                document.write("</a>");
            } else {
                if (hcn) document.write("</a>");
            }
            document.write("<br />");

			// If node has children write out divs and go deeper
			if (hcn) {
				document.write("<div nowrap id=\"tree_div_" + i + "\"");
					if (!ino) document.write(" style=\"display: none;\"");
				document.write(">");
				addNode(i, recursedNodes);
				document.write("</div>");
			}
			
			// remove last line or empty icon 
			recursedNodes.pop();
        }
    }
}


// Opens or closes a node
function oc(node, bottom) {
	var theDiv = document.getElementById("tree_div_" + node);
	var theJoin	= document.getElementById("tree_join_" + node);
	var theIcon = document.getElementById("tree_icon_" + node);
	
	if (theDiv.style.display == 'none') {
		if (bottom==1) theJoin.src = icon_minusbottom.src;
		else theJoin.src = icon_minus.src;
		var openIcon = getNodeTypeOpenIcon(treeNodes[node][1]);
		theIcon.src = openIcon.src;
		theDiv.style.display = '';
	} else {
		if (bottom==1) theJoin.src = icon_plusbottom.src;
		else theJoin.src = icon_plus.src;
		var closeIcon = getNodeTypeIcon(treeNodes[node][1]);
		theIcon.src = closeIcon.src;
		theDiv.style.display = 'none';
	}
}


// Push and pop not implemented in IE(crap!    don磘 know about NS though)
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
