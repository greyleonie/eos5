<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>广州市委党校信息一体化平台</title>
</head>
<%
String op = (String)request.getParameter("op");
 %>


<frameset rows="*,6,240"   frameborder="0" border="0" framespacing="0" name="contentFrameSet" >
  <frame src='ICCard.prField.classRoom4Day.do?op=<%=op %>' name="topFrame" scrolling="auto" noresize  >
    <frame src="ICCard.prField.frameSpace2.do" name="spaceFrame" scrolling="NO" noresize>
  <frame src="ICCard.prField.classRoom4Month.do?input/RoomID=152&op=<%=op %>" name="bottomFrame" scrolling="auto"  noresize>
  <noframes>
  <body> 
</body>
  </noframes>
  </frameset>

<frameset>

</frameset>
</html>