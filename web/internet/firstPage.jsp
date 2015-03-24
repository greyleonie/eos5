<%@include file="/internet/hciHead.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>firstPage</title>
</head>

<body>
<p>更新表EOSRole的数据并显示表EOSRole的内容</p>
<p>请输入要更新的记录的roleID</p>
<form name="roleFrm" method="post" action="learn1.pr_automata.firstPrlogic.do" >
  <p>
    <input name="EOSRole/roleID" type="text">
  </p>
  <p>
  根据输入的roleID将该条记录的roleName改为
  </p>
  <p>
    <input name="EOSRole/roleName" type="text">
  </p>

 <input type="submit" name="Submit" value="提交">
  <input type="reset" name="Submit2" value="重置">
</form>
</body>

<%@include file="/internet/hciTail.jsp" %>
