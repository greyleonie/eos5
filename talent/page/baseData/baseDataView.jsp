<%@include file="/internet/common.jsp"%>

<body >
<form method="post" action="talent.prBaseData.baseDataAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;基础数据管理—&gt;<bean:write property="BNDICT_T_Dictionary/baseName"/>查看</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		
		<html:hidden property="BNDICT_T_Dictionary/_order/col1/field"/>
		<html:hidden property="BNDICT_T_Dictionary/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
		<html:hidden property="BNDICT_T_Dictionary/businTypeID/criteria/value" />
		<html:hidden property="BNDICT_T_Dictionary/baseName" />
		
		<html:hidden property="BNDICT_T_DictionaryTEMP/businTypeID"/>
		<input type="hidden" name="BNDICT_T_DictionaryTEMP/status" value="0">
		 
		
		
		
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="23%" align="right" nowrap class="td2"><bean:write property="BNDICT_T_Dictionary/baseName"/>名称： </td>
            <td width="77%" class="td1"><bean:write property="BNDICT_T_DictionaryTEMP/businName" /> 
              
            </td>
          </tr>
          <tr> 
            <td width="23%" align="right" nowrap class="td2"><bean:write property="BNDICT_T_Dictionary/baseName"/>代码： </td>
            <td class="td1"><bean:write property="BNDICT_T_DictionaryTEMP/businID" />
			
            </td>
          </tr>
		  <tr> 
            <td width="23%" align="right" nowrap class="td2"><bean:write property="BNDICT_T_Dictionary/baseName"/>备注： </td>
            <td class="td1"><bean:write property="BNDICT_T_DictionaryTEMP/remark" />
			
            </td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              
            <td align="center"> 
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) {
		frm.elements["BNDICT_T_DictionaryTEMP/businTypeID"].value = frm.elements["BNDICT_T_Dictionary/businTypeID/criteria/value"].value
		  
		frm.submit();	
	} 
  
}
  




</script>