<%@include file="/internet/common.jsp"%>
<link rel="stylesheet" href="/pageComponent/resources/theme/style_custom.css" type="text/css">
<br><br><br>
<script>
  var msg='<bean:write property="msg"/>';
  if(msg!=""){
    alert(msg);
  }

javascript:history.go(-1);
</script>