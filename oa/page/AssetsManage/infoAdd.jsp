<%@include file="/internet/common.jsp"%>
<logic:greaterThan property="count" value="0">
<script>
alert("已经存在此资产");
</script>
</logic:greaterThan>
<form method="post" action="oa.prAssetsManage.infoAddDo.do">
<html:hidden property="CAPT_TYPE/ENABLE" value="1"/>
<html:hidden property="CAPT_TYPE/PARENTID" value="0"/>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="15"> </td>
      </tr>
  <tr><td>
	<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" class="text" >
		     <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                <tr>
                  <td align="right" nowrap="nowrap"  class="td2" >资产编码：</td>
                  <td colspan="3" nowrap="nowrap"  class="td1" >
                       <html:text property="CAPT_CAPITALINFO/CAPTCODE" maxlength="20" attributesText='class="input" size="30"' readonly="true"/> 
                    </td>
                </tr>
                <tr> 
                  <td align="right" nowrap="nowrap"  class="td2" >资产条码：</td>
                  <td colspan="3" nowrap="nowrap"  class="td1" >
                  <html:text property="CAPT_CAPITALINFO/BARCODE" maxlength="50" attributesText='class="input" size="30"'/>
                  </td>
                </tr>
               <tr>
                  <td align="right" nowrap="nowrap"  class="td2" >资产类型：</td>
                  <td  nowrap="nowrap"  class="td1" ><html:select property="CAPT_CAPITALINFO/TYPECODE"  attributesText='ValidateType="notempty" Msg="资产类型不能为空" '> 
              <html:option value="">-请选择-</html:option> <html:options property="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPECODE" labelProperty="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPENAME"/> 
              </html:select>&nbsp;<span class="text_red">*</span></td>
                  <td  nowrap="nowrap" align="right"  class="td2" >计量单位：</td>
                  <td  nowrap="nowrap"  class="td1" ><dict:select  businTypeId="dx_unit" property="CAPT_CAPITALINFO/UNITCODE"  nullOption="false" nullLabel="-请选择-"  />&nbsp;<span class="text_red">*</span></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap"  align="right"  class="td2" >资产名称：</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" ><html:text property="CAPT_CAPITALINFO/CAPTNAME"  maxlength="50" attributesText='class="input" size="50" ValidateType="notempty" Msg="资产名称不能为空"' /> 
                    <span class="text_red">*</span></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >生产厂商：</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" ><html:text property="CAPT_CAPITALINFO/MANUFACTURE" maxlength="100" attributesText='class="input" size="50" ValidateType="notempty" Msg="生产厂商不能为空"' /> 
                    <span class="text_red">*</span></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >品&nbsp;&nbsp;&nbsp;&nbsp;牌：</td>
                  <td  nowrap="nowrap"  class="td1" ><html:text property="CAPT_CAPITALINFO/BRANDNAME" maxlength="30" attributesText='class="input" size="20" ' /></td>
                  <td  nowrap="nowrap"  align="right"  class="td2" >规格型号：</td>
                  <td  nowrap="nowrap"  class="td1" ><html:text property="CAPT_CAPITALINFO/SEPCIFICATION"  maxlength="100" attributesText='class="input" size="20" '/></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >供 应 商：</td>
                  <td  nowrap="nowrap"  class="td1" colspan="3" >
                 <html:select property="CAPT_CAPITALINFO/PROVCODE"  attributesText='ValidateType="notempty" Msg="资产类型不能为空" '> 
              <html:option value="">-请选择-</html:option> <html:options property="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPECODE" labelProperty="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPENAME"/> 
              </html:select>
                   </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >售后服务商：</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" >
                  <html:select property="CAPT_CAPITALINFO/VINDCODE"  > 
              <html:option value="">-请选择-</html:option> <html:options property="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPECODE" labelProperty="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPENAME"/> 
              </html:select>
                  </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >获得日期：</td>
                  <td  nowrap="nowrap"  class="td1" >
              <html:text property="CAPT_CAPITALINFO/HQDATE[@pattern='yyyy-MM-dd']" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_CAPITALINFO/HQDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
               </td>
                  <td  nowrap="nowrap" align="right"  class="td2" >清理日期：</td>
                  <td  nowrap="nowrap"   class="td1" >
            <html:text property="CAPT_CAPITALINFO/QLDATE[@pattern='yyyy-MM-dd']" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_CAPITALINFO/QLDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
                 </td></tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >购买价格：</td>
                  <td  nowrap="nowrap"  class="td1" ><html:text property="CAPT_CAPITALINFO/PURCHPRICE"  attributesText='class="input" size="10" ValidateType="money" Msg="购买价格必须为数字"'/>元</td>
                  <td  nowrap="nowrap" align="right"  class="td2" >采购资金来源：</td>
                  <td  nowrap="nowrap"  class="td1" ><html:text property="CAPT_CAPITALINFO/FUNDORIGIN"   maxlength="50" attributesText='class="input" size="20"'/></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >资产所属部门：</td>
                  <td  nowrap="nowrap"  class="td1" >
                      <html:select property="CAPT_CAPITALINFO/OWNER" > 
              <html:option value="">-请选择-</html:option> <html:options property="list[@type='TeachGroup']/TeachGroup/TeachGroupID" labelProperty="list[@type='TeachGroup']/TeachGroup/TeachGroupName"/> 
              </html:select>
                  </td>
                  <td  nowrap="nowrap" align="right"  class="td2" >保修期限：</td>
                  <td  nowrap="nowrap"  class="td1" >
        <html:text property="CAPT_CAPITALINFO/BXDATE[@pattern='yyyy-MM-dd']" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_CAPITALINFO/BXDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
           </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" ><html:textarea name="CAPT_CAPITALINFO/REMARK" cols="50" rows="4"/></td>
                </tr>
              </table> 
            <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="javascript:save()">
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
