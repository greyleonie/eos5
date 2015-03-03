<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prCarManage.carOilModifyDO.do">
  <html:hidden property="CAR_OIL/OilID"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;车辆管理—&gt;车辆用油记录修改</td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="18"> </td>
    </tr>
    <tr>
      <td class="text"><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="16%" align="right" class="td2">车牌号：</td>
            <td width="34%" class="td1">&nbsp;<html:select  property="CAR_OIL/CARNO" attributesText='class="input"  ValidateType="notempty" Msg="车牌号不能为空"'>
             <html:options property="list[@type='CAR_CARINFO']/CAR_CARINFO/CARNO" labelProperty="list[@type='CAR_CARINFO']/CAR_CARINFO/CARNO"></html:options>
            </html:select>
            <span class="text_red">*</span>            </td>
            <td width="16%" align="right" class="td2">日 期：</td>
            <td class="td1">&nbsp;<html:text property="CAR_OIL/USEDATE[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAR_OIL/USEDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">加油量：</td>
            <td class="td1">&nbsp;<html:text property="CAR_OIL/USEAMOUNT" attributesText='class="input" size="30"  ValidateType="numeric" Msg="加油量必须为数字"' onchange="sumPrice()"/> 升</td>
            <td align="right" class="td2">油型号：</td>
            <td class="td1">&nbsp;<html:text property="CAR_OIL/OILTYPE" attributesText='class="input" size="30" '  maxlength="20"/> </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">单 价：</td>
            <td class="td1">&nbsp;<html:text property="CAR_OIL/PRICE" attributesText='class="input" size="30"  ValidateType="numeric" Msg="单价必须为数字"' onchange="sumPrice()"/> 
            升/元 </td>
            <td align="right" class="td2">经办人：</td>
            <td class="td1">&nbsp;<input type="text" name="CAR_OIL/OPERATOR"  Class="input"  size="30"  maxlength="20" readonly="readonly" value='<bean:write  property="CAR_OIL/OPERATORID" formatClass="username" formatType="operatorID"/>'/>
              <html:hidden  property="CAR_OIL/OPERATORID"  />
              <input name="Submit2232" elname="CAR_OIL/OPERATORID,CAR_OIL/OPERATOR" type="button" class="button_02" value="选择" onclick="selectSysUser('yes')">              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">金 额：</td>
            <td colspan="3" class="td1">&nbsp;<html:text property="CAR_OIL/SUMPRICE" attributesText='class="input" size="30"  ValidateType="numeric" Msg="金额必须为数字"' onclick="sumPrice()"/>
            元</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">备 注：</td>
            <td colspan="3" class="td1">&nbsp;<html:textarea property="CAR_OIL/Remark" cols="50" rows="8" styleClass="input" attributesText='maxlength="200"  ValidateType="maxlength" Msg="备注必须小于200字"' />
            </td>
          </tr>

        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <br>
              <input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>
 
  <script>

  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
  function sumPrice(){		
  		
		var frm = document.forms[0];
		var mount = frm['CAR_OIL/USEAMOUNT'].value;
		var price = frm['CAR_OIL/PRICE'].value;
		if((!isNaN(mount))&&(!isNaN(price))){
			var sum = mount * price;
			var test = "";
			if(sum!=0){
				test = String(sum);
				var k = test.indexOf(".");
				if (k!=-1)
					test = test.substring(0,k+3);
				}
			frm['CAR_OIL/SUMPRICE'].value = test;
		}
		
		
	}
  </script>
 