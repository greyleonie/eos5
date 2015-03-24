<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %>
<%@ page import="com.primeton.tp.core.config.ConfigCacher"%>
<body  background="/internet/WFCOMMON/images/instancemgr.jpg">
<form action="" name="form1">
<table width="100%" border="0">
  <tr>
    <td width="10%">&nbsp;</td>
    <td width="26%" align="right"></td>
    <td width="31%">&nbsp;</td>
    <td width="33%">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%">&nbsp;</td>
    <td width="26%" align="right"></td>
    <td width="31%">&nbsp;</td>
    <td width="33%">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%">&nbsp;</td>
    <td width="26%" align="right">配置信息</td>
    <td width="31%">&nbsp;</td>
    <td width="33%">&nbsp;</td>
  </tr>
  <tr>
    <td height="25">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" class="queryLabelTD">Driver Class名称</td>
    <td><html:text property="connection/jdbcdriver"  size="50"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" class="queryLabelTD">连接地址</td>
    <td><html:text property="connection/jdbcurl"  size="50"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" class="queryLabelTD">用户名</td>
    <td><html:text property="connection/username"  size="50"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" class="queryLabelTD">密码</td>
    <td><html:text property="connection/password" size="50"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right"></td>
    <td><input type="button" value="测试数据库连接" size="10" onClick="javascript:testConn();">&nbsp;&nbsp;&nbsp;<input type="button" value="开始升级" onClick="javascript:startUpgrade();"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <td></td>
    <td colspan="3">
    <logic:present property="connected">
    <br><p></p>
	    <logic:equal property="connected" value="true">
	    	<font color="green">连接成功</font>
	    </logic:equal><logic:equal property="connected" value="false">
	    	<font color="red">
	    	<br><b>
连接失败！</b>可能原因：<p>
&nbsp;&nbsp;1.通过以上配置无法成功建立数据库连接<p>
&nbsp;&nbsp;2.该用户无法操作当前使用的工作流数据库</font>
	    </logic:equal>
    </logic:present>
    </td>    
  </tr>
</table>
</form>
<script language="javascript">
function testConn(){
	document.form1.action="WFCOMMON.pr_upgrade.isValidConnection.do";
	document.form1.submit();
}
function startUpgrade(){
	document.form1.action="WFCOMMON.pr_upgrade.executeUpgrade.do";
	document.form1.submit();
}
</script>
</body>