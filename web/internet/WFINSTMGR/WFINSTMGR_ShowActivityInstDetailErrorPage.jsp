<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<script language="JavaScript">
function startActInst(){
	if(confirm("�ò�����������һ���µĻʵ����ȷ����")){
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
  <p><b>��ʾ��Ϣ��</b></p>
  <p><font size="4"> ����û�����е��û��</font></p>
  <p><font size="4"> ����δ���ָû��ʵ��...<input type="button" value="����" onClick="javascript:startActInst();"></font></p>
</div>
<form name="form1" target ="moonpiazza" action="WFINSTMGR.pr_automata.prStartActInst.do">
<html:hidden name="procInstID" property="WFActivityInstView/processInstID"/>
<html:hidden name="processInstID" property="WFActivityInstView/processInstID"/>
<html:hidden name="actDefID" property="WFActivityInstView/activityDefID"/>
</form>
</body>
</html>