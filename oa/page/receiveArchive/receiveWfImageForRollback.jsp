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
<form method="post" action="oa.prReceiveArchive.receiveRollback.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="display:none">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;<bean:write property="title"/>—&gt;流程图</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="WFWorkItem/processInstID"/>
		<html:hidden property="title"/>
		<html:hidden property="tableName"/>
	  </td>
    </tr>
  </table>


<table height="100%" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table height="100%" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="90%">
		<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" id="graphID" height="100%" width="100%"></iframe>
		 </td>
      </tr>
      
      <tr>
          <td height="10%" align="center" valign="middle" class="text">
		  <input name="wfrollback" type="button" class="button_02" value="回 退" onClick="rollback()">
		  <!--<input name="wfclose" type="button" class="button_02" value="关 闭" onClick="window.close()">-->
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
<script>
	//document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	//document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .60;
</script>
</body>
</html>