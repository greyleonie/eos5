<!-- saved from url=(0022)http://internet.e-mail -->
<%@ include file="/internet/eosapp/hciHead.jsp" %> 
<html>

<head>
<title>��������</title>
</head>
<div align="left" class="margindiv">               
<body>
<p align="left"><font size="4" color="#0000FF"><b>���Ĳ���Ա����</b></font></p>
<html:form name="clearpassword" action="ROLE.pr_automata.ROLESaveClearedPassword.do" method="post">
<table>
  <tr>
    <td><p class="blue_text">����Ա��¼����</p></td>
    <td><html:text property="EOSOperator/userID" maxlength="20" size="20"/></td>
  </tr>
  <tr>
    <td><p class="blue_text">�����룺</p></td>
    <td><html:password property="newpassword" size="20" maxlength="20" /></td>
  </tr>
  <tr>
    <td><p class="blue_text">�������������룺</p></td>
    <td><html:password property="confirm" size="20" maxlength="20" /></td>
  </tr>
  <tr>
    <td colspan="1"><p><input type="button" onClick="javascripts:save()" value="ȷ��" name="B1"></p></td>
  </tr>
</html:form>


<script language="javaScript">
  function save()
  {
    var frm = document.clearpassword;
    if ( frm.elements["EOSOperator/userID"].value=="")
    {
         alert("�����������Ա��¼����");
    } 
    else if (frm.elements["hciPasswordTypenewpassword"].value!=frm.elements["hciPasswordTypeconfirm"].value)
    {
        alert("������������벻ͬ��");
    }
    else
    {
      frm.submit();
    }

  }
</script>

</body>
</div>
</html>
<%@ include file="/internet/hciTail.jsp" %> 