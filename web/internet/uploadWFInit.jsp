<%@include file="/internet/hciHead.jsp"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body>
<form action="WorkFlow.pr_automata.uploadWFSchema.do" method="post" enctype="multipart/form-data" name="form1">
  <p>
     ������Schema����: <input type="text" size="32" name="WFSchemaName">
    </br>
  <p> 
  <p>
    ������Schema����·��: <input type="file" size="32" name="file">
    </br>
  <p> 
    <input name="absolute" type="checkbox" id="absolute" value="checkbox">
    ���������Ƿ����·��&nbsp;&nbsp;&nbsp;&nbsp;<input name="overwrite" type="checkbox" id="overwrite" value="checkbox" checked>
    ���������Ƿ񸲸�
  </p>
  <p>���������ļ����·��:
    <input name="filepath" type="text" value="/">
  </p>
  </p>
    <input type="submit" name="Submit" value="Submit">
  </p>
</form>
</body>
</html>
<%@include file="/internet/hciTail.jsp"%>
