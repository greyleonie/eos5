<!-- saved from url=(0022)http://internet.e-mail -->
<%@ include file="/internet/eosapp/hciHead.jsp" %> 
<html>

<head>
<title>更改密码</title>
</head>
<div align="left" class="margindiv">               
<body>
<p align="left"><font size="4" color="#0000FF"><b>更改操作员密码</b></font></p>
<html:form name="clearpassword" action="ROLE.pr_automata.ROLESaveClearedPassword.do" method="post">
<table>
  <tr>
    <td><p class="blue_text">操作员登录名：</p></td>
    <td><html:text property="EOSOperator/userID" maxlength="20" size="20"/></td>
  </tr>
  <tr>
    <td><p class="blue_text">新密码：</p></td>
    <td><html:password property="newpassword" size="20" maxlength="20" /></td>
  </tr>
  <tr>
    <td><p class="blue_text">重新输入新密码：</p></td>
    <td><html:password property="confirm" size="20" maxlength="20" /></td>
  </tr>
  <tr>
    <td colspan="1"><p><input type="button" onClick="javascripts:save()" value="确定" name="B1"></p></td>
  </tr>
</html:form>


<script language="javaScript">
  function save()
  {
    var frm = document.clearpassword;
    if ( frm.elements["EOSOperator/userID"].value=="")
    {
         alert("必须输入操作员登录名！");
    } 
    else if (frm.elements["hciPasswordTypenewpassword"].value!=frm.elements["hciPasswordTypeconfirm"].value)
    {
        alert("两次输入的密码不同！");
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