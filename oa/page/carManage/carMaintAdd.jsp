<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prCarManage.carMaintAddDO.do">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;����ά��(��)��¼����</td>
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
            <td width="34%" class="td1">&nbsp;<html:select  property="CarMaint/CarNO" attributesText='class="input"  ValidateType="notempty" Msg="���ƺŲ���Ϊ��"'>
             <html:options property="list[@type='CAR_CARINFO']/CAR_CARINFO/CARNO" labelProperty="list[@type='CAR_CARINFO']/CAR_CARINFO/CARNO"></html:options>
            </html:select>
            	<span class="text_red">*</span>
            </td>
            <td width="16%" align="right" class="td2">�����ˣ�</td>
            <td width="34%" class="td1">
			&nbsp;<html:text property="CarMaint/Charger"  styleClass="input"  size="30"  maxlength="20"/>
              <html:hidden  property="CarMaint/ChargerID"  />
              <input name="Submit2232" elname="CarMaint/ChargerID,CarMaint/Charger" type="button" class="button_02" value="ѡ��" onclick="selectDriver()">			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">ά��(��)����</td>
            <td class="td1">&nbsp;<html:select property="CarMaint/MaintLevel" >
	        		<html:option value="һ�����">һ�����</html:option>
					<html:option value="���ͼ���">���ͼ���</html:option>
					<html:option value="���ͼ���">���ͼ���</html:option>
					<html:option value="����">����</html:option>
	��������			<html:option value="ϴ��">ϴ��</html:option>
	        		<html:option value="����">����</html:option>
	        	</html:select>
        	<span class="text_red">*</span>
        	</td>
            <td align="right" class="td2">ά��(��)ʱ�䣺</td>
            <td class="td1">&nbsp;<html:text property="CarMaint/MaintTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CarMaint/MaintTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>			</td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">ά��(��)�̣�</td>
            <td class="td1">&nbsp;<html:text property="CarMaint/Mainter" attributesText='class="input" size="30" ' maxlength="20"/></td>
            <td align="right" class="td2">����(Ԫ)��</td>
            <td class="td1">&nbsp;<html:text property="CarMaint/MaintCost" attributesText='class="input" size="30"  ValidateType="numeric" Msg="���ñ���Ϊ����"' maxlength="20"/>
              </td>
          </tr>
          
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��ע��</td>
            <td colspan="3" class="td1">
			&nbsp;<html:textarea property="CarMaint/Remark" cols="50" rows="8" styleClass="input" attributesText='maxlength="200"  ValidateType="maxlength" Msg="��ע����С��200��"' />
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
  
  function singleselectUser(){
  	window.open("oa.prMeetingManage.singleSelectUser.do","","width=500,height=450,left=200,top=100");
  }
  </script>
 