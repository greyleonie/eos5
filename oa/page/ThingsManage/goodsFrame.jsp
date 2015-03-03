<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>选择用品</title>
</head>
<%
  String goodIDs =  request.getParameter("goodIDs");
  String type =  request.getParameter("type");
%>
<frameset  id="main" name="main" cols="260,*">
<frame  name="tree" src="oa.prThingsManage.goodsTree.do?goodIDs=<%=goodIDs %>"  scrolling="no"></frame>
<frame name="manipulate" src='oa.prThingsManage.goodsSelected.do?type=<%=type %>'></frame>
</frameset><noframes></noframes>
<body>
</body>
</html>