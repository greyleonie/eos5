<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<html>
    <head><title>ErrorPage</title>
    </head>
    <body bgcolor="#EEEEEE" text="#000000">
<div align="left">
  <p>&nbsp;</p>
  <p><b><font size="2">保存过程中有错误发生</font></b></p>  
<script  language="JavaScript">
document.write("<table  border=\"0\" width=\"100%\" >");
document.write("<logic:iterate id="rs" property="SaveResult">");
document.write("<tr>");
document.write("<td align=\"\">");

document.write("<font size=\"2\">");
document.write("<bean:write id="rs" property="error/errorDesc"/>");
document.write("</font>");

document.write("</td>");
document.write("</tr>");
document.write("</logic:iterate>");
document.write("</table>");
</script>
<input type="button" onclick="JavaScript:history.go(-1);" value="确定">
<!--
  <form action="WFDEFMGR.pr_automata.WFDEFMGR_P_ShowActyDef.do" >
  <html:hidden property="processDefID"/>
  <html:hidden property="activityDefID"/>
  <html:hidden property="tab"/>
  <html:hidden property="activityType"/>
  
  <input type="submit" value="确定">
  </form>
  -->
</div>

</body>
</html>