<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>选择资产</title>
</head>
<%
  String goodIDs =  request.getParameter("goodIDs");
%>
<frameset  id="main" name="main" cols="250,*">
<frame  name="tree" src="oa.prAssetsManage.goodsTree.do?goodIDs=<%=goodIDs %>" ></frame>
<frame name="manipulate" src='oa.prAssetsManage.goodsSelected.do'></frame>
</frameset><noframes></noframes>
<body>
</body>
</html>