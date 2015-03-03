<%@include file="/internet/common.jsp"%>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree" %>
<script language="jscript" src="/pageComponent/resources/scripts/rtree.js"></script>

<script language="jscript" src="/pageComponent/resources/scripts/string.js"></script>

<script language="jscript" src="/pageComponent/resources/scripts/eventManager.js"></script>

<script language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></script>

<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">

<body>
<form method="post" action="oa.prThingsManage.infoList.do" name="opeForm">
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td  class="text">
        <tree:tree id="tree1" width="300" height="600">
        <tree:root name="资产管理" icon="/internet/image/XiuGai.gif" expandAction="oa.bizAssetsManage.typeList" firstLevelEntities="list" expand="true"  onclick="test"/>

        <tree:display entity="COMM_TYPE" expression="$[TYPENAME] " icon= "/internet/image/XiuGai.gif" onclick="test"/>

        <tree:display entity="COMM_COMMODITYINFO" expression="$[COMMNAME]" icon="/internet/image/XiuGai.gif" onclick="test"/>

        <tree:expand entity="COMM_TYPE" action="oa.bizAssetsManage.infoList" childEntities="list"/>

        <tree:move entity="COMM_COMMODITYINFO" toEntity="COMM_TYPE" action="TES T.biz.TEST_B_ChangeOperatorRole"/>

        <tree:menu entity="root">
			<tree:menuitem name="增加类别" onclick="queryEmp" />
		</tree:menu>
        <tree:menu entity="COMM_TYPE">
            <tree:menuitem name="增加资产" onclick="listOperator"/>
            <tree:menuitem name="修改类别" onclick="deleteRole"/>
            <tree:menuitem name="删除类别" onclick="deleteRole"/>
        </tree:menu>
        <tree:menu entity="COMM_COMMODITYINFO">
            <tree:menuitem name="修改资产" onclick="deleteRole"/>
            <tree:menuitem name="删除资产" onclick="deleteRole"/>
        </tree:menu>
        </tree:tree>
        
        
        
        
        
        

			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
</body>