<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prAssetsManage.vindicatorAddDo.do">
<html:hidden property="CAPT_VINDICATOR/ENABLE" value="1"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;资产管理—&gt;<span id="printTable">售后服务商信息新增</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="CAPT_VINDICATOR/_order/col1/field"/>
		<html:hidden property="CAPT_VINDICATOR/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
      <tr>
        <td height="15"> </td>
      </tr>
  <tr>
     <td>
	<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td valign="top" class="text" >
		   <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
            <tr>
             <td nowrap="nowrap"   class="td2" width="13%" align="right">售后服务商名称：</td>
             <td nowrap="nowrap"   class="td1" colspan="3"><html:text property="CAPT_VINDICATOR/VINDNAME" maxlength="25"  attributesText='class="input" size="80" ValidateType="notempty" Msg="售后服务商名称不能为空"'/>
                <span class="text_red">*</span></td>
              </tr>
            <tr>
             <td nowrap="nowrap"   class="td2" align="right">联&nbsp;&nbsp;系&nbsp;&nbsp;人：</td>
             <td nowrap="nowrap"   class="td1"><html:text property="CAPT_VINDICATOR/LINKMAN" maxlength="10"  attributesText='class="input" size="36" ValidateType="notempty" Msg="联系人不能为空"'/>
                <span class="text_red">*</span></td>
             <td nowrap="nowrap"   class="td2" align="right">联系电话：</td>
             <td nowrap="nowrap"   class="td1">
              <html:text property="CAPT_VINDICATOR/TEL" maxlength="25"  attributesText='class="input" size="20" ValidateType="notempty,phone" Msg="联系电话不能为空;联系电话必须为电话格式,如020-81741033"'/>
              <span class="text_red">*</span></td>
            </tr>
           <tr>
             <td nowrap="nowrap"   class="td2" align="right">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
             <td nowrap="nowrap"   class="td1" width="45%"><html:text property="CAPT_VINDICATOR/ADDRESS" maxlength="25"  attributesText='class="input" size="36" '/></td>
             <td nowrap="nowrap"   class="td2" width="14%" align="right">邮&nbsp;&nbsp;&nbsp;&nbsp;编：</td>
             <td nowrap="nowrap"   class="td1" width="28%">
             <html:text maxlength="9" property="CAPT_VINDICATOR/ZIPCODE"  attributesText='class="input" size="20" ValidateType="postalcode" Msg="邮编不正确"' />
              </td>
            </tr>
            <tr>
             <td nowrap="nowrap"   class="td2" align="right">E-mail：</td>
             <td nowrap="nowrap"   class="td1"><html:text property="CAPT_VINDICATOR/E_MAIL" maxlength="25"  attributesText='class="input" size="36" ValidateType="email" Msg="E-mail不正确"'/></td>
             <td nowrap="nowrap"   class="td2" align="right">传真号码：</td>
             <td nowrap="nowrap"   class="td1"><html:text property="CAPT_VINDICATOR/FAX" maxlength="20"  attributesText='class="input" size="20" ValidateType="phone" Msg="传真号码不正确,如020-81741033"'/></td>
            </tr>
           <tr>
             <td nowrap="nowrap"   class="td2" align="right">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
                 <td nowrap="nowrap"   class="td1" colspan="3"><html:textarea property="CAPT_VINDICATOR/REMARK"  cols="80" rows="5"/>
                  </td>
            </tr>
          </table> 
            <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="javascript:save()">
               <input name="Button" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
               </td>
            </tr>
          </table>
         </td>
      </tr>
</table>
         </td>
      </tr>
</table>
    </form>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
 </script>