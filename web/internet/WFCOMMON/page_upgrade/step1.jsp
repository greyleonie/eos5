<%@include file="/internet/WFCOMMON/wfappbase.jsp" %>
<html>
<body  background="/internet/WFCOMMON/images/instancemgr.jpg">
<table width="100%" border="0">
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
  <tr>
    <td width="90%"><font color="red">&nbsp;&nbsp;&nbsp;&nbsp;工作流引擎的版本和工作流存储库的版本不一致,系统将会进行数据库升级.<BR>
		        
		        &nbsp;&nbsp;&nbsp;&nbsp;请您 <b>确保数据库已经得到备份</b>，然后点击下面的按钮开始进行升级操作。</font></td>
    <td></td>
  </tr>
  <tr>
    <td><input type="button" value="升级" onClick="javascript:location.href='WFCOMMON.pr_upgrade.getConnectInfo.do';">&nbsp;&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
