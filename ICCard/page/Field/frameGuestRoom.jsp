<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>广州市委党校信息一体化平台</title>
</head>
<%
String op = (String)request.getParameter("op");
 %>
<frameset rows="*,6,150"   frameborder="0" border="0" framespacing="0" name="contentFrameSet">
  <frame src="ICCard.prField.guestRoom4Day.do?op=<%=op %>&input/BuildingID=1&input/LayerNO=6" name="topFrame" scrolling="auto"  >
   <frame src="ICCard.prField.frameSpace2.do" name="spaceFrame" scrolling="NO" noresize>
  <frame src="ICCard.prField.guestRoom4Month.do?input/RoomID=1&op=<%=op%>" name="bottomFrame" scrolling="auto">
  <noframes>
  <body> 
</body>
  </noframes>
  </frameset>

<frameset>

</frameset>
</html>