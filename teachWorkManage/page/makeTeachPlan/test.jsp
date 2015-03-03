<%@include file="/internet/common.jsp"%>

<title>发送页面到外网</title>
<body>

<form name="frm" method="post">

  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">       
     
      
      </td>
    </tr>
    <tr>
      <td class="text">    
   
      <table width="100%" id="listdetail"><tr><td>
	    <table width="98%"  border="0" cellpadding="0" cellspacing="0">
       <tr>
      <td height="8"><bean:write property="msg"/></td></tr></table>
        </td>
    </tr>
   
       <tr>
      <td class="text"><table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
             
              <input name="btnSave" type="button" border="0" value="关 闭" onclick='window.close()'>
              </td>
            </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
