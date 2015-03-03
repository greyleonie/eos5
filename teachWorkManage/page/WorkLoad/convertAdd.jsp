<%@include file="/internet/common.jsp"%>
<title>增加工作项目</title>

<body>
<form name="convertForm" action="teachWorkManage.prWorkLoad.convertAddDo.do" target="_parent">
<html:hidden property="WorkLoadConvert/IsAdopted" value="1"/>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
      <tr class="td2">
        <td align="center">增加工作项目 </td>
      </tr>
    </table> 
       <table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
       <tr class="td1"><td align="right">工作类别：</td><td><html:select property="WorkLoadConvert/WorkType"  attributesText=' ValidateType="notempty"  Msg="工作类别不能为空" '> 
              <html:option value="">--请选择工作类别--</html:option> <html:options property="list[@type='WorkType']/WorkType/WorkType" labelProperty="list[@type='WorkType']/WorkType/WorkType"/> 
              </html:select>  &nbsp;<span class="text_red">*</span></td></tr>
       <tr class="td1"><td align="right">工作项目：</td><td><html:text property="WorkLoadConvert/WorkItem" attributesText='class="input" size="40" ValidateType="notempty" Msg="工作项目不能为空"'/> &nbsp;<span class="text_red">*</span></td></tr>
       <tr class="td1"><td align="right">折算课次：</td><td><html:text property="WorkLoadConvert/ClassNum" attributesText='class="input" size="10" ValidateType="notempty,numeric" Msg="折算课次不能为空;折算课次必须为数字" '/> &nbsp;<span class="text_red">*</span></td></tr>
       <tr class="td1"><td align="right">单&nbsp;&nbsp;&nbsp;&nbsp;位：</td><td><html:text property="WorkLoadConvert/Unit" attributesText='class="input" size="10" ValidateType="notempty" Msg="单位不能为空"'/> &nbsp;<span class="text_red">*</span></td></tr>
    
      </table>      
      <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center">
          <input name="Submit" type="button" class="button_02" onClick="save()" value="确 定">
          <input name="Submit" type="button" class="button_02" value="关 闭" onclick="window.close()">
          </td>
        </tr>
      </table></td>
  </tr>
</table>
</form>

</body>
<script language="javascript">
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) {
	  frm.submit();
	  window.opener.location.href="teachWorkManage.prWorkLoad.convertModify.do"; 
	  window.close();
	}
  
  }
</script>