<html>
<head>
<title>无标题文档</title>
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
<td class="result_title" align="left">查询结果</td>
</tr>
<tr>
<td>
<table id="sortTable1" width ="100%" border="1" bordercolordark="#ffffff" bordercolorlight="#eeeeee" cellpadding="3" cellspacing="0">
 <tr class="result_head">
  <td width="5%">选择</td>
<td width="15%"   onClick="sort('sortTable1')"title="点击排序">预计开始日期</td>
<td width="15%"  onClick="sort('sortTable1')"title="点击排序">预计结束日期</td>
<td width="30%"  onClick="sort('sortTable1')"title="点击排序">计划内容</td>
<td width="15%"  onClick="sort('sortTable1')"title="点击排序">计划状态</td>
<td width="15%" onClick="sort('sortTable1')"title="点击排序">完成率</td>
<td >&nbsp;</td>
</tr>
 <tr class="result_content">
<td align="center"><A HREF="">1></A></td>
<td align="center">22</td>
<td align="center">33</td>
<td align="center"> 44</td>
<td align="center">往往</td>
<td align="center">第三十三 </td>
<td align="center">往往</td>
</tr>
 <tr class="result_content">
<td align="center"> 2</td>
<td align="center">的</td>
<td align="center">似的</td>
<td align="center">地方 </td>
<td align="center">似的</td>
<td align="center">地方 </td>
<td align="center">发</td>
</tr>
 <tr class="result_content">
<td align="center"> 3</td>
<td align="center"><img src="/images/1.jpg"</td>
<td align="center">似的</td>
<td align="center">地方 </td>
<td align="center">似的</td>
<td align="center">地方 </td>
<td align="center">发</td>
</tr>
</table>
</td>
</tr>
<tr class="result_bottom">
<td>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr class="result_bottom">
<td>
  <a href="javascript:printTable('sortTable1','测试打印')" >【打印】</a>  
</td>
</tr>
</table>
</td>
</tr>
<html:text value='<bean:write property=""/>'/>
</table>
</body>
</html>
