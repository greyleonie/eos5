<%@include file="/internet/hciHead.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>firstPage</title>
</head>

<body>
<p>���±�EOSRole�����ݲ���ʾ��EOSRole������</p>
<p>������Ҫ���µļ�¼��roleID</p>
<form name="roleFrm" method="post" action="learn1.pr_automata.firstPrlogic.do" >
  <p>
    <input name="EOSRole/roleID" type="text">
  </p>
  <p>
  ���������roleID��������¼��roleName��Ϊ
  </p>
  <p>
    <input name="EOSRole/roleName" type="text">
  </p>

 <input type="submit" name="Submit" value="�ύ">
  <input type="reset" name="Submit2" value="����">
</form>
</body>

<%@include file="/internet/hciTail.jsp" %>
