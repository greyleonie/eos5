<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prCarManage.carInfoAddDO.do">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;��������</td>
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
            <td width="34%" class="td1">&nbsp;<html:text property="CAR_CARINFO/CARNO" attributesText='class="input" size="30" ValidateType="notempty" Msg="���ƺŲ���Ϊ��"' maxlength="20"/>
            	<span class="text_red">*</span>
            </td>
            <td width="16%" align="right" class="td2">�����ͺţ�</td>
            <td width="34%" class="td1">&nbsp;<html:text property="CAR_CARINFO/MANUNO" attributesText='class="input" size="30" ValidateType="notempty" Msg="�����ͺŲ���Ϊ��"' maxlength="20"/>
            	<span class="text_red">*</span>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">���ܺţ�</td>
            <td class="td1">&nbsp;<html:text property="CAR_CARINFO/FRAMENO" attributesText='class="input" size="30" ' maxlength="30"/></td>
            <td align="right" class="td2">�������ͣ�</td>
            <td class="td1">&nbsp;<html:text property="CAR_CARINFO/CARTYPE" attributesText='class="input" size="30" '  maxlength="20"/> </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">����۸�</td>
            <td class="td1">&nbsp;<html:text property="CAR_CARINFO/PRICE" attributesText='class="input" size="30"  ValidateType="numeric" Msg="�۸����Ϊ����"'/> Ԫ(�����)</td>
            <td align="right" class="td2">��ʻԱ��</td>
            <td class="td1">&nbsp;<html:text property="CAR_CARINFO/DRIVER"  styleClass="input"  size="30"  maxlength="20"/>
              <html:hidden  property="CAR_CARINFO/DRIVERID"  />
              <input name="Submit2232" elname="CAR_CARINFO/DRIVERID,CAR_CARINFO/DRIVER" type="button" class="button_02" value="ѡ��" onclick="selectDriver()">
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">���������룺</td>
            <td class="td1">&nbsp;<html:text property="CAR_CARINFO/ENGINENO" attributesText='class="input" size="30" '/></td>
            <td align="right" class="td2">�������ڣ�</td>
            <td class="td1">&nbsp;<html:text property="CAR_CARINFO/BUYDATE[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAR_CARINFO/BUYDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>			</td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��ǰ״̬��</td>
            <td colspan="3" class="td1">&nbsp;<dict:select businTypeId="dx_CARSTATE" property="CAR_CARINFO/STATE" />         </td>
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
 