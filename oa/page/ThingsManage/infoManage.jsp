<%@include file="/internet/common.jsp"%>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree" %>
<script language="jscript" src="/pageComponent/resources/scripts/rtree.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/string.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/eventManager.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></script>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">

<body>
<form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��Ʒ����&gt;<span id="printTable">��Ʒ��Ϣ����</span></td>
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
        <tree:root name="��Ʒ����" icon="/internet/image/type1.gif" expandAction="oa.bizThingsManage.typeList"  firstLevelEntities="list[@type='COMM_TYPE']"  expand="true"  onclick="queryRoot" ondblclick="reloadNodeChild"  />
        <tree:display entity="COMM_TYPE" expression="$[TYPENAME] " icon= "/internet/image/type2.gif" onclick="queryGood" ondblclick="reloadNodeChild"  />
        <tree:display entity="COMM_INFO" expression="$[COMMNAME]" icon="/internet/image/type3.gif"/>
		<tree:expand entity="COMM_TYPE" action="oa.bizThingsManage.infoQuery"   childEntities="list[@type='COMM_INFO']"/>
        <tree:move entity="COMM_INFO" toEntity="COMM_TYPE" action="oa.bizThingsManage.infoMove"/>

        <tree:menu entity="root">
			<tree:menuitem name="�������" onclick="addGoodType" />
		</tree:menu>
        <tree:menu entity="COMM_TYPE">
            <tree:menuitem name="������Ʒ" onclick="addGood"/>
            <tree:menuitem name="�޸����" onclick="updateGoodType"/>
            <tree:menuitem name="ɾ�����" onclick="deleteGoodType"/>
        </tree:menu>
        <tree:menu entity="COMM_COMMODITYINFO">
            <tree:menuitem name="�޸���Ʒ" onclick="updateGood"/>
            <tree:menuitem name="ɾ����Ʒ" onclick="deleteRole"/>
        </tree:menu>
        </tree:tree></TD>
			<TD width="85%" align="left"  valign="top"><IFRAME name="goodInfo" style="WIDTH: 100%; HEIGHT: 100%" frameBorder="0"
					scrolling="auto" src="oa.prThingsManage.infoList.do"></IFRAME></TD>
		</TR>
	</TBODY>
			<tr><td colspan="2">
		 <p><font color="#C0C0C0" style="font-size: 14"><b>˵����</b></font></p>
<p><font color="#C0C0C0" style="font-size: 14">�ڡ���Ʒ�����ϵ��Ҽ������������,</font>
<font color="#C0C0C0" style="font-size: 14">����Ʒ����ϵ��Ҽ������޸ġ�ɾ�����</font></p>
</td></tr>
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

	function queryRoot( treeNode ){
		currentNode = treeNode;
		currentNode.expandNode();
		window.frames["goodInfo"].location.href="oa.prThingsManage.infoList.do";
	}


	function queryGood( treeNode ){
		currentNode = treeNode;
		currentNode.expandNode();
		window.frames["goodInfo"].location.href="oa.prThingsManage.infoList.do?COMM_COMMODITYINFO/TYPEID/criteria/value="+treeNode.entity.getProperty("TYPEID")+"&COMM_COMMODITYINFO/TYPEID/criteria/operator==";
	}


	function addGood( treeNode ){
		currentNode = treeNode;
		window.frames["goodInfo"].location.href="oa.prThingsManage.infoAdd.do?COMM_COMMODITYINFO/TYPEID="+treeNode.entity.getProperty("TYPEID");
		refreshNode();
	}
	
	function updateGood( treeNode ){
		currentNode = treeNode;
		window.frames["goodInfo"].location.href="oa.prThingsManage.infoModify.do?fid="+treeNode.entity.getProperty("COMMID");
	}
	
	function deleteGood( treeNode ){
		currentNode = treeNode;
		if(confirm("ȷ��Ҫɾ������Ʒ��"))
		{
			var sub1 = new HiddenSubmit("oa.bizThingsManage.infoDeleteByID");
			sub1.add("fid", treeNode.entity.getProperty("COMMID"));
			if (sub1.submit()) {
				var ret = sub1.getValue("root/return/code");
				if (ret == null || ret == "0") {
					alert("ɾ���˵�ʧ�ܣ�����ϵ����Ա");
				} else {
					alert("ɾ���˵��ɹ���");
					refreshNodeParent();
					window.frames["goodInfo"].location.href="oa.prThingsManage.infoList.do";
				}
			}
		}
		
	}

	
	
	function addGoodType( treeNode ){
		currentNode = treeNode;
		window.frames["goodInfo"].location.href="oa.prThingsManage.typeAdd.do";
	}
	function updateGoodType(treeNode ){
		currentNode = treeNode;
		window.frames["goodInfo"].location.href="oa.prThingsManage.typeModify.do?COMM_TYPE/TYPEID="+treeNode.entity.getProperty("TYPEID");
	}
	function deleteGoodType( treeNode ){
		currentNode = treeNode;
		if(confirm("ȷ��Ҫɾ���������"))
		{
			var sub1 = new HiddenSubmit("oa.bizThingsManage.typeDelete");
			sub1.add("COMM_TYPE/TYPEID", treeNode.entity.getProperty("TYPEID"));
			if (sub1.submit()) {
				var ret = sub1.getValue("root/return/code");
				if (ret == null || ret == "0") {
					alert("ɾ�����ʧ�ܣ�����ϵ����Ա");
				} else {
					alert("ɾ�����ɹ���");
					refreshNodeParent();
					window.frames["goodInfo"].location.href="oa.prThingsManage.infoList.do";
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
			menuTree.rootNode.reloadChild();
			menuTree.rootNode.expandNode();
			currentNode = menuTree.rootNode;
		}
	}
</script>