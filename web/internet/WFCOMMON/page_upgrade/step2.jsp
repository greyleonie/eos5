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
    <td width="26%" align="right">������Ϣ</td>
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
    <td align="right" class="queryLabelTD">Driver Class����</td>
    <td><html:text property="connection/jdbcdriver"  size="50"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" class="queryLabelTD">���ӵ�ַ</td>
    <td><html:text property="connection/jdbcurl"  size="50"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" class="queryLabelTD">�û���</td>
    <td><html:text property="connection/username"  size="50"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" class="queryLabelTD">����</td>
    <td><html:text property="connection/password" size="50"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right"></td>
    <td><input type="button" value="�������ݿ�����" size="10" onClick="javascript:testConn();">&nbsp;&nbsp;&nbsp;<input type="button" value="��ʼ����" onClick="javascript:startUpgrade();"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <td></td>
    <td colspan="3">
    <logic:present property="connected">
    <br><p></p>
	    <logic:equal property="connected" value="true">
	    	<font color="green">���ӳɹ�</font>
	    </logic:equal><logic:equal property="connected" value="false">
	    	<font color="red">
	    	<br><b>
����ʧ�ܣ�</b>����ԭ��<p>
&nbsp;&nbsp;1.ͨ�����������޷��ɹ��������ݿ�����<p>
&nbsp;&nbsp;2.���û��޷�������ǰʹ�õĹ��������ݿ�</font>
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