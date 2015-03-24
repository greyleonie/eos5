<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<script language="JavaScript">
function startActInst(){
	if(confirm("该操作将会启动一个新的活动实例，确定吗？")){
		document.form1.submit();
	}
}
</script>
<html>
    <head><title>ErrorPage</title>
    </head>
    <body bgcolor="#EEEEEE" text="#000000">
<div align="left">
  <p>&nbsp;</p>
  <p><b>提示信息：</b></p>
  <p><font size="4"> 流程没有运行到该活动，</font></p>
  <p><font size="4"> 所以未发现该活动的实例...<input type="button" value="启动" onClick="javascript:startActInst();"></font></p>
</div>
<form name="form1" target ="moonpiazza" action="WFINSTMGR.pr_automata.prStartActInst.do">
<html:hidden name="procInstID" property="WFActivityInstView/processInstID"/>
<html:hidden name="processInstID" property="WFActivityInstView/processInstID"/>
<html:hidden name="actDefID" property="WFActivityInstView/activityDefID"/>
</form>
</body>
</html>