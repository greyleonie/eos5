<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prCarManage.driverModifyDO.do">
  <html:hidden property="DriverInfo/DriverID"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;˾���޸�</td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="18"> </td>
    </tr>
    <tr>
      <td class="text"><table width="80%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">˾��������</td>
            <td width="70%" class="td1">&nbsp;<html:text property="DriverInfo/DriverName" attributesText='class="input" size="30" ValidateType="notempty" Msg="��������Ϊ��"'/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">׼�ݳ��ͣ�</td>
            <td class="td1">&nbsp;<html:text property="DriverInfo/VehType" attributesText='class="input" size="30" '/></td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��ʻ֤�ţ�</td>
            <td class="td1">&nbsp;<html:text property="DriverInfo/DrivCardNO" attributesText='class="input" size="30" ValidateType="numeric" Msg="��ʻ֤�Ų���ȷ"'/>			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�������ڣ�</td>
            <td class="td1">&nbsp;<html:text property="DriverInfo/BirthDay[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["DriverInfo/BirthDay[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>            </td>
          </tr>
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
            <td class="td1">&nbsp;<dict:radio businTypeId="BNDICT_gender" property="DriverInfo/Sex" modifiable="true" value="1"/>         </td>
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
 