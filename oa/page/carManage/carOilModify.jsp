<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prCarManage.carOilModifyDO.do">
  <html:hidden property="CAR_OIL/OilID"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;�������ͼ�¼�޸�</td>
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
            <td width="16%" align="right" class="td2">���ƺţ�</td>
            <td width="34%" class="td1">&nbsp;<html:select  property="CAR_OIL/CARNO" attributesText='class="input"  ValidateType="notempty" Msg="���ƺŲ���Ϊ��"'>
             <html:options property="list[@type='CAR_CARINFO']/CAR_CARINFO/CARNO" labelProperty="list[@type='CAR_CARINFO']/CAR_CARINFO/CARNO"></html:options>
            </html:select>
            <span class="text_red">*</span>            </td>
            <td width="16%" align="right" class="td2">�� �ڣ�</td>
            <td class="td1">&nbsp;<html:text property="CAR_OIL/USEDATE[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAR_OIL/USEDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��������</td>
            <td class="td1">&nbsp;<html:text property="CAR_OIL/USEAMOUNT" attributesText='class="input" size="30"  ValidateType="numeric" Msg="����������Ϊ����"' onchange="sumPrice()"/> ��</td>
            <td align="right" class="td2">���ͺţ�</td>
            <td class="td1">&nbsp;<html:text property="CAR_OIL/OILTYPE" attributesText='class="input" size="30" '  maxlength="20"/> </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�� �ۣ�</td>
            <td class="td1">&nbsp;<html:text property="CAR_OIL/PRICE" attributesText='class="input" size="30"  ValidateType="numeric" Msg="���۱���Ϊ����"' onchange="sumPrice()"/> 
            ��/Ԫ </td>
            <td align="right" class="td2">�����ˣ�</td>
            <td class="td1">&nbsp;<input type="text" name="CAR_OIL/OPERATOR"  Class="input"  size="30"  maxlength="20" readonly="readonly" value='<bean:write  property="CAR_OIL/OPERATORID" formatClass="username" formatType="operatorID"/>'/>
              <html:hidden  property="CAR_OIL/OPERATORID"  />
              <input name="Submit2232" elname="CAR_OIL/OPERATORID,CAR_OIL/OPERATOR" type="button" class="button_02" value="ѡ��" onclick="selectSysUser('yes')">              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�� �</td>
            <td colspan="3" class="td1">&nbsp;<html:text property="CAR_OIL/SUMPRICE" attributesText='class="input" size="30"  ValidateType="numeric" Msg="������Ϊ����"' onclick="sumPrice()"/>
            Ԫ</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�� ע��</td>
            <td colspan="3" class="td1">&nbsp;<html:textarea property="CAR_OIL/Remark" cols="50" rows="8" styleClass="input" attributesText='maxlength="200"  ValidateType="maxlength" Msg="��ע����С��200��"' />
            </td>
          </tr>

        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <br>
              <input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
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
 