<%@include file="/internet/common.jsp"%>


<title>教学计划编制-&gt;提交领导审核</title>
<body>
<form name="postForm" method="post">

 
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> 
      </td>
    </tr>
    <tr>
      <td class="text">
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              
            <td align="center"> &nbsp; </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
<script>
var msg='<bean:write property="msg"/>';
if(msg!="")
alert(msg);
window.close();
</script>