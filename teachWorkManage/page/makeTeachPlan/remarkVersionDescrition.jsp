
<%@include file="/internet/common.jsp"%>
<title>填写版本说明</title>
<form>
<table width="60%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="80%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC" >
          <tr > 
            <td align="center" class="td2" nowrap>版本说明</td>
            <td align="center" class="td1">  <html:textarea property="dec" rows="6" cols="40"/></td>
          </tr>
        </table>
          <table width="90%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center" nowrap>
                <input name="d" type="button" class="button_02" value=保存 onclick="save()">
                <input name="g" type="button" class="button_02" value="取 消" onclick="window.close()"></td>
            </tr>
        </table></td>
    </tr>
   
  </table>
</form>
<script>
 function save(){
   window.returnValue=document.forms[0].elements["dec"].value;
   //alert(dialogArguments.window.forms[0].name);
  
   window.close();
 }
</script>