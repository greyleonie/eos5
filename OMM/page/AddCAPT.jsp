<%@include file="/internet/common.jsp"%>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree" %>
<script language="jscript" src="/pageComponent/resources/scripts/rtree.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/string.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/eventManager.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></script>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">

<body>
<form method="post" action="oa.prAssetsManage.infoList.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;资产管理—&gt;<span id="printTable">资产信息管理</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
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
			<TD height="380" width="180" align="left" style="padding-top:3px" valign="top">
				 <tree:tree id="tree1" width="180" height="100%">
        <tree:root name="资产管理" icon="/internet/image/type1.gif" expandAction="oa.bizAssetsManage.typeList" firstLevelEntities="list[@type='CAPT_TYPE']" expand="true"  onclick="queryRoot" ondblclick="reloadNodeChild"/>
        <tree:display entity="CAPT_TYPE" expression="$[NAMECODE] " icon= "/internet/image/type2.gif" onclick="queryGood" ondblclick="reloadNodeChild"  />
        <tree:display entity="CAPT_CAPITALINFO" expression="$[CAPTNAME]" icon="/internet/image/type3.gif" onclick="viewGood" ondblclick="reloadNodeChild" />
		<tree:expand entity="CAPT_TYPE" action="oa.bizAssetsManage.infoList"  childEntities="list[@type='CAPT_CAPITALINFO']"/>
       

        <tree:move entity="CAPT_CAPITALINFO" toEntity="CAPT_TYPE" action="oa.bizAssetsManage.infoMove"/>

        <tree:menu entity="root">
			<tree:menuitem name="增加类别" onclick="addGoodType" />
		</tree:menu>
        <tree:menu entity="CAPT_TYPE">
            <tree:menuitem name="修改类别" onclick="updateGoodType"/>
            <tree:menuitem name="删除类别" onclick="deleteGoodType"/>
        </tree:menu>
        <tree:menu entity="CAPT_CAPITALINFO">
            <tree:menuitem name="修改资产" onclick="updateGood"/>
            <tree:menuitem name="删除资产" onclick="deleteGood"/>
        </tree:menu>
        </tree:tree>

        
        </TD>

             
			<TD width="85%" align="left"  valign="top"><IFRAME name="goodInfo" style="WIDTH: 100%; HEIGHT: 100%" frameBorder="0"
					scrolling="auto" src="oa.prAssetsManage.infoList.do"></IFRAME></TD>
		</TR>
		<tr><td colspan="2">
		 <p><font color="#C0C0C0" style="font-size: 14"><b>说明：</b></font></p>
<p><font color="#C0C0C0" style="font-size: 14">在“资产管理”上点右键可以增加类别,</font>
<font color="#C0C0C0" style="font-size: 14">在资产类别上点右键可以修改、删除类别</font></p>
</td></tr>
	</TBODY>
</TABLE>
		  
		  </td>
      </tr>
      <tr>
        <td class="text">   </td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
</body>
<script>
	var currentNode;

	function queryRoot( treeNode ){
		currentNode = treeNode;
		currentNode.expandNode();
		window.frames["goodInfo"].location.href="oa.prAssetsManage.infoList.do";
	}


	function queryGood( treeNode ){
		currentNode = treeNode;
		currentNode.expandNode();
		window.frames["goodInfo"].location.href="oa.prAssetsManage.infoList.do?CAPT_CAPITALINFO/TYPECODE/criteria/value="+treeNode.entity.getProperty("TYPECODE")+"&CAPT_CAPITALINFO/TYPECODE/criteria/operator==";
	}


	function addGood( treeNode ){
		currentNode = treeNode;
		window.frames["goodInfo"].location.href="oa.prAssetsManage.infoAdd.do?CAPT_CAPITALINFO/TYPECODE="+treeNode.entity.getProperty("TYPECODE");
		refreshNode();
	}
	
	function updateGood( treeNode ){
		currentNode = treeNode;
		window.frames["goodInfo"].location.href="oa.prAssetsManage.infoModify.do?fid="+treeNode.entity.getProperty("CAPTID");
	}
	function viewGood( treeNode ){
		currentNode = treeNode;
		window.frames["goodInfo"].location.href="oa.prAssetsManage.infoView.do?fid="+treeNode.entity.getProperty("CAPTID");
	}
	
	function deleteGood( treeNode ){
		currentNode = treeNode;
		if(confirm("确定要删除此资产吗？"))
		{
			var sub1 = new HiddenSubmit("oa.bizAssetsManage.infoDeleteByID");
			sub1.add("fid", treeNode.entity.getProperty("CAPTID"));
			if (sub1.submit()) {
				var ret = sub1.getValue("root/return/code");
				if (ret == null || ret == "0") {
					alert("删除菜单失败！请联系管理员");
				} else {
					alert("删除菜单成功！");
					refreshNodeParent();
					window.frames["goodInfo"].location.href="oa.prAssetsManage.infoList.do";
				}
			}
		}
		
	}

	
	
	function addGoodType( treeNode ){
		currentNode = treeNode;
		window.frames["goodInfo"].location.href="oa.prAssetsManage.typeAdd.do";
	}
	function updateGoodType(treeNode ){
		currentNode = treeNode;
		window.frames["goodInfo"].location.href="oa.prAssetsManage.typeModify.do?CAPT_TYPE/TYPECODE="+treeNode.entity.getProperty("TYPECODE");
	}
	function deleteGoodType( treeNode ){
		currentNode = treeNode;
		if(confirm("确定要删除此类别吗？"))
		{
			var sub1 = new HiddenSubmit("oa.bizAssetsManage.typeDelete");
			sub1.add("CAPT_TYPE/TYPECODE", treeNode.entity.getProperty("TYPECODE"));
			if (sub1.submit()) {
				var ret = sub1.getValue("root/return/code");
				if (ret == null || ret == "0") {
					alert("删除类别失败！请联系管理员");
				} else {
					alert("删除类别成功！");
					refreshNodeParent();
					window.frames["goodInfo"].location.href="oa.prAssetsManage.infoList.do";
				}
			}
		}
		
	}
	
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
			goodTree.rootNode.reloadChild();
			goodTree.rootNode.expandNode();
			currentNode = goodTree.rootNode;
		}
	}
</script>