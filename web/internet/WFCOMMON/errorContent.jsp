<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %> 
<%
	String errTitle=request.getParameter("errTitle");
	String errMsg = request.getParameter("errMsg");
%>
<html>
<head>
<title><%=errTitle%></title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body  text="#000000" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<table width="100%" border="0" bgcolor="#cccccc" height="100%" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<font size="2" ><%=errMsg%></font></td>
  </tr><tr>
    <td align="center"><input type="button" value="确定" onClick="javascript:window.close();"></td>
  </tr>
</table>
</body>
</html>
