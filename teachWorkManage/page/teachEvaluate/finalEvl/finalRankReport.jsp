<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>
<%@ taglib uri="/WEB-INF/hci-dict.tld" prefix="dict" %>
<%@ taglib uri="/WEB-INF/hci-info.tld" prefix="info" %>
<%@ taglib uri="/WEB-INF/hci-pagecom.tld" prefix="pagecom" %>
<%@ taglib uri="/WEB-INF/workflow.tld" prefix="workflow" %>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree" %>
<%@ taglib uri="/WEB-INF/hci-richclient.tld" prefix="richclient" %>
<%@ taglib uri="/WEB-INF/hci-datacell.tld" prefix="datacell" %>
<%
response.setContentType("application/msword;charset=gb2312");
%>
<head>
<title>�������������</title>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "��������";
	font-size: 24px;
	font-weight: bold;
}
.STYLE2 {
	font-family: "�����п�";
	font-size: 24px;
	font-weight: bold;
}
.STYLE3 {
	font-size: 14px;
	font-weight: bold;
}
.STYLE5 {
	font-size: 18px;
	font-weight: bold;
}
.STYLE6 {
font-size: 16px;
font-weight: bold;
}
-->
</style>
</head>

<body>
<table width="90%" border="0" align="center" cellpadding="1" cellspacing="1"  id="listdetail">
<tr><td>
<table width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td height="50" align="center" class="STYLE1" id="printTable">
      <bean:write property="QueryClassEvl/year"/>��<bean:write property="QueryClassEvl/season"/>���������ý�ѧ��������
    </td>
  </tr>
  <tr><td height="30" align="center" class="STYLE2">�� �� һ ��</td></tr>
  <tr><td height="30" align="center" class="STYLE3">��<bean:write property="begin"/>��<bean:write property="end"/>��
  </td></tr>
  <tr><td height="30" align="center" class="STYLE5">�� �� ��</td></tr>
</table>
<table width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td width="15%" align="left" class="STYLE6" valign="top">ѧԱ������</td>
    <td width="90%" class="STYLE6" align="left" valign="top">
    <logic:iterate id="countList" property="list[@type='ClassCountList']">
	<bean:write id="countList" property="ClassCountList/ClassName"/>&nbsp;<bean:write id="countList" property="ClassCountList/amount"/>&nbsp;�ˡ�<br>
	</logic:iterate>
	</td>
  </tr>
  <tr><td colspan="2" height="20"></td></tr>
  <tr>
    <td width="20%" align="left" class="STYLE6" valign="top">�������չʾ��</td>
    <td width="90%" class="STYLE6" align="left" valign="top">
    <logic:iterate id="satRankList" property="list[@type='EvlSatList']">
	<bean:write id="satRankList" property="EvlSatList/ClassShortName"/>ѧԱ����������Ϊ&nbsp;<bean:write id="satRankList" property="EvlSatList/rank"/>&nbsp;%��<br>
	</logic:iterate>
	</td>
  </tr>
  <tr><td colspan="2" height="20"></td></tr>
  <tr align="center"><td align="left" colspan="2" class="STYLE6">��ע��ÿ��������ƽ������<bean:write property="QueryClassEvl/satisfyScore"/>�ϵģ����������ʡ���</td></tr>
</table>
</td></tr></table>
</body>