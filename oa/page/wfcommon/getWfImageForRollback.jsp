<%@include file="/internet/common.jsp"%>
<html>
<head>
<title><bean:write property="title"/>—&gt;流程图</title>
<script>
function rollback() {
	var frm = document.forms[0];
	frm.submit();
}
</script>
</head>
<body>
<form method="post" action="oa.pr.wfrollback.do">
		<html:hidden property="WFWorkItem/processInstID"/>
		<html:hidden property="title"/>
		<html:hidden property="tableName"/>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="100%" align="center">
		<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' height="235px" width="100%" frameborder="0" id="graphID"></iframe>
		 </td>
      </tr>      
      <tr>
          <td align="center" valign="top" class="text">
          <%
          try{
          String userID=base.util.TalentContext.getValue(pageContext,null,"SessionEntity/userID");
          String part=base.util.TalentContext.getValue(pageContext,null,"list2/entity/participant");
          //out.print(userID+"/"+part);
          if(userID.equals(part)){
           %>
		  <input name="wfrollback" type="button" class="button_02" value="抽 回" onClick="rollback()">
		  <!--<input name="wfclose" type="button" class="button_02" value="关 闭" onClick="window.close()">-->
		  <%} }catch(Exception e){}%>
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
</body>
</html>