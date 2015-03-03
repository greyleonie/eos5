<%@include file="/internet/common.jsp"%>

<body>
<form name="frm" method="post">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;新增教学模式</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
      <html:hidden property="isAdd"/>    
      <html:hidden property="EducatingMode/IsExecute" value="0"/>      
      <html:hidden property="listfcc"/>        
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">教学模式名称：</td>
            <td class="td1">
            <html:text property="EducatingMode/EducatingMode" attributesText='class="input" size="32" ValidateType="notempty" Msg="教学模式名称不能为空"'/>
             <span class="text_red">*</span></td>
          </tr>
          
          
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="button" class="button_02" value="保 存" onclick="save()">
                
                <input name="Submit2" type="submit" class="button_02" value="返 回" onclick="window.close()"></td>
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
 function save(){
    if(validater(document.forms[0])){
      document.forms[0].action="teachWorkManage.prMakeTeachPlan.saveEducationModel.do";
      document.forms[0].submit();
    }
 }
</script>