<html>
<head>
<title>�ޱ����ĵ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
</head>
<SCRIPT src="/internet/scripts/pageComponent/print.js" type="text/javascript"></SCRIPT>
<SCRIPT src="/internet/scripts/sortTable.js" type="text/javascript"></SCRIPT>
<body bgcolor="#CCFFCC" text="#000000">
<form name="myform" method="post">
<table border="0" cellspacing="1" cellpadding="1" class="result" id="printTable" align="center">
<tr>
<td class="result_title" align="left">��ѯ���</td>
</tr>
<tr>
<td>
<table id="sortTable1" width ="100%" border="1" bordercolordark="#ffffff" bordercolorlight="#eeeeee" cellpadding="3" cellspacing="0">
 <tr class="result_head">
  <td width="5%">ѡ��</td>
<td width="15%"   onClick="sort('sortTable1')"title="�������">Ԥ�ƿ�ʼ����</td>
<td width="15%"  onClick="sort('sortTable1')"title="�������">Ԥ�ƽ�������</td>
<td width="30%"  onClick="sort('sortTable1')"title="�������">�ƻ�����</td>
<td width="15%"  onClick="sort('sortTable1')"title="�������">�ƻ�״̬</td>
<td width="15%" onClick="sort('sortTable1')"title="�������">�����</td>
<td >&nbsp;</td>
</tr>
 <tr class="result_content">
<td align="center"><A HREF="">1></A></td>
<td align="center">22</td>
<td align="center">33</td>
<td align="center"> 44</td>
<td align="center">����</td>
<td align="center">����ʮ�� </td>
<td align="center">����</td>
</tr>
 <tr class="result_content">
<td align="center"> 2</td>
<td align="center">��</td>
<td align="center">�Ƶ�</td>
<td align="center">�ط� </td>
<td align="center">�Ƶ�</td>
<td align="center">�ط� </td>
<td align="center">��</td>
</tr>
 <tr class="result_content">
<td align="center"> 3</td>
<td align="center"><img src="/images/1.jpg"</td>
<td align="center">�Ƶ�</td>
<td align="center">�ط� </td>
<td align="center">�Ƶ�</td>
<td align="center">�ط� </td>
<td align="center">��</td>
</tr>
</table>
</td>
</tr>
<tr class="result_bottom">
<td>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr class="result_bottom">
<td>
  <a href="javascript:printTable('sortTable1','���Դ�ӡ')" >����ӡ��</a>  
</td>
</tr>
</table>
</td>
</tr>
<html:text value='<bean:write property=""/>'/>
</table>
</body>
</html>
