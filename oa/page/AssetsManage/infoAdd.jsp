<%@include file="/internet/common.jsp"%>
<logic:greaterThan property="count" value="0">
<script>
alert("�Ѿ����ڴ��ʲ�");
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
                  <td align="right" nowrap="nowrap"  class="td2" >�ʲ����룺</td>
                  <td colspan="3" nowrap="nowrap"  class="td1" >
                       <html:text property="CAPT_CAPITALINFO/CAPTCODE" maxlength="20" attributesText='class="input" size="30"' readonly="true"/> 
                    </td>
                </tr>
                <tr> 
                  <td align="right" nowrap="nowrap"  class="td2" >�ʲ����룺</td>
                  <td colspan="3" nowrap="nowrap"  class="td1" >
                  <html:text property="CAPT_CAPITALINFO/BARCODE" maxlength="50" attributesText='class="input" size="30"'/>
                  </td>
                </tr>
               <tr>
                  <td align="right" nowrap="nowrap"  class="td2" >�ʲ����ͣ�</td>
                  <td  nowrap="nowrap"  class="td1" ><html:select property="CAPT_CAPITALINFO/TYPECODE"  attributesText='ValidateType="notempty" Msg="�ʲ����Ͳ���Ϊ��" '> 
              <html:option value="">-��ѡ��-</html:option> <html:options property="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPECODE" labelProperty="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPENAME"/> 
              </html:select>&nbsp;<span class="text_red">*</span></td>
                  <td  nowrap="nowrap" align="right"  class="td2" >������λ��</td>
                  <td  nowrap="nowrap"  class="td1" ><dict:select  businTypeId="dx_unit" property="CAPT_CAPITALINFO/UNITCODE"  nullOption="false" nullLabel="-��ѡ��-"  />&nbsp;<span class="text_red">*</span></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap"  align="right"  class="td2" >�ʲ����ƣ�</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" ><html:text property="CAPT_CAPITALINFO/CAPTNAME"  maxlength="50" attributesText='class="input" size="50" ValidateType="notempty" Msg="�ʲ����Ʋ���Ϊ��"' /> 
                    <span class="text_red">*</span></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >�������̣�</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" ><html:text property="CAPT_CAPITALINFO/MANUFACTURE" maxlength="100" attributesText='class="input" size="50" ValidateType="notempty" Msg="�������̲���Ϊ��"' /> 
                    <span class="text_red">*</span></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >Ʒ&nbsp;&nbsp;&nbsp;&nbsp;�ƣ�</td>
                  <td  nowrap="nowrap"  class="td1" ><html:text property="CAPT_CAPITALINFO/BRANDNAME" maxlength="30" attributesText='class="input" size="20" ' /></td>
                  <td  nowrap="nowrap"  align="right"  class="td2" >����ͺţ�</td>
                  <td  nowrap="nowrap"  class="td1" ><html:text property="CAPT_CAPITALINFO/SEPCIFICATION"  maxlength="100" attributesText='class="input" size="20" '/></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >�� Ӧ �̣�</td>
                  <td  nowrap="nowrap"  class="td1" colspan="3" >
                 <html:select property="CAPT_CAPITALINFO/PROVCODE"  attributesText='ValidateType="notempty" Msg="�ʲ����Ͳ���Ϊ��" '> 
              <html:option value="">-��ѡ��-</html:option> <html:options property="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPECODE" labelProperty="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPENAME"/> 
              </html:select>
                   </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >�ۺ�����̣�</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" >
                  <html:select property="CAPT_CAPITALINFO/VINDCODE"  > 
              <html:option value="">-��ѡ��-</html:option> <html:options property="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPECODE" labelProperty="list[@type='CAPT_TYPE']/CAPT_TYPE/TYPENAME"/> 
              </html:select>
                  </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >������ڣ�</td>
                  <td  nowrap="nowrap"  class="td1" >
              <html:text property="CAPT_CAPITALINFO/HQDATE[@pattern='yyyy-MM-dd']" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_CAPITALINFO/HQDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
               </td>
                  <td  nowrap="nowrap" align="right"  class="td2" >�������ڣ�</td>
                  <td  nowrap="nowrap"   class="td1" >
            <html:text property="CAPT_CAPITALINFO/QLDATE[@pattern='yyyy-MM-dd']" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_CAPITALINFO/QLDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
                 </td></tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >����۸�</td>
                  <td  nowrap="nowrap"  class="td1" ><html:text property="CAPT_CAPITALINFO/PURCHPRICE"  attributesText='class="input" size="10" ValidateType="money" Msg="����۸����Ϊ����"'/>Ԫ</td>
                  <td  nowrap="nowrap" align="right"  class="td2" >�ɹ��ʽ���Դ��</td>
                  <td  nowrap="nowrap"  class="td1" ><html:text property="CAPT_CAPITALINFO/FUNDORIGIN"   maxlength="50" attributesText='class="input" size="20"'/></td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >�ʲ��������ţ�</td>
                  <td  nowrap="nowrap"  class="td1" >
                      <html:select property="CAPT_CAPITALINFO/OWNER" > 
              <html:option value="">-��ѡ��-</html:option> <html:options property="list[@type='TeachGroup']/TeachGroup/TeachGroupID" labelProperty="list[@type='TeachGroup']/TeachGroup/TeachGroupName"/> 
              </html:select>
                  </td>
                  <td  nowrap="nowrap" align="right"  class="td2" >�������ޣ�</td>
                  <td  nowrap="nowrap"  class="td1" >
        <html:text property="CAPT_CAPITALINFO/BXDATE[@pattern='yyyy-MM-dd']" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_CAPITALINFO/BXDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
           </td>
                </tr>
                <tr> 
                  <td  nowrap="nowrap" align="right"  class="td2" >��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
                  <td  nowrap="nowrap" colspan="3"  class="td1" ><html:textarea name="CAPT_CAPITALINFO/REMARK" cols="50" rows="4"/></td>
                </tr>
              </table> 
            <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="javascript:save()">
            </tr>
          </table>
    	  </td>
      </tr>
    </table>
    </form>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
 </script>
