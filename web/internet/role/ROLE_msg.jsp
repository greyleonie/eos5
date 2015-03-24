<%@ include file="/internet/common.jsp" %> 
<link rel="stylesheet" href="/internet/css/HCIStyle.css" type="text/css">
<bean:write property="msg"/>
<script language="javascript">
<!--
  var ref="<bean:write property="refresh"/>";
  if(ref=="tree"){
	window.parent.frames("tree").navigate("/internet/ROLE.pr_automata.ROLE_P_QueryAllMenu.do?");
  }
//-->
</script>