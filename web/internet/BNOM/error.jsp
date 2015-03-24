<%@ include file="/internet/BNOM/omappbase.jsp" %> 
<script>
alert("不能增加这个用户，因为您所指定的用户登录名已存在！");
//history.go(-1);
//window.top.frames("addNewEmp").navigate("/internet/BNOM/BNOM_CloseModalDialog.jsp");
window.top.frames("addNewEmp").navigate("BNOM.pr_automata.BNOM_P_ShowNewEmp.do?mode=N&from=orgMgr");
</script>
