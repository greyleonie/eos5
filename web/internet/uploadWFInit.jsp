<%@include file="/internet/hciHead.jsp"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body>
<form action="WorkFlow.pr_automata.uploadWFSchema.do" method="post" enctype="multipart/form-data" name="form1">
  <p>
     工作流Schema名称: <input type="text" size="32" name="WFSchemaName">
    </br>
  <p> 
  <p>
    工作流Schema本地路经: <input type="file" size="32" name="file">
    </br>
  <p> 
    <input name="absolute" type="checkbox" id="absolute" value="checkbox">
    服务器上是否绝对路径&nbsp;&nbsp;&nbsp;&nbsp;<input name="overwrite" type="checkbox" id="overwrite" value="checkbox" checked>
    服务器上是否覆盖
  </p>
  <p>服务器上文件相对路经:
    <input name="filepath" type="text" value="/">
  </p>
  </p>
    <input type="submit" name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
<%@include file="/internet/hciTail.jsp"%>
