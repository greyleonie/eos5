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
        <tree:root name="�ʲ�����" icon="/internet/image/XiuGai.gif" expandAction="oa.bizAssetsManage.typeList" firstLevelEntities="list" expand="true"  onclick="test"/>

        <tree:display entity="COMM_TYPE" expression="$[TYPENAME] " icon= "/internet/image/XiuGai.gif" onclick="test"/>

        <tree:display entity="COMM_COMMODITYINFO" expression="$[COMMNAME]" icon="/internet/image/XiuGai.gif" onclick="test"/>

        <tree:expand entity="COMM_TYPE" action="oa.bizAssetsManage.infoList" childEntities="list"/>

        <tree:move entity="COMM_COMMODITYINFO" toEntity="COMM_TYPE" action="TES T.biz.TEST_B_ChangeOperatorRole"/>

        <tree:menu entity="root">
			<tree:menuitem name="�������" onclick="queryEmp" />
		</tree:menu>
        <tree:menu entity="COMM_TYPE">
            <tree:menuitem name="�����ʲ�" onclick="listOperator"/>
            <tree:menuitem name="�޸����" onclick="deleteRole"/>
            <tree:menuitem name="ɾ�����" onclick="deleteRole"/>
        </tree:menu>
        <tree:menu entity="COMM_COMMODITYINFO">
            <tree:menuitem name="�޸��ʲ�" onclick="deleteRole"/>
            <tree:menuitem name="ɾ���ʲ�" onclick="deleteRole"/>
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