<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prCarManage.breakRuleAddDO.do">
  <html:hidden property="queryaction"/> 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;����Υ�¼�¼����</td>
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
            <td align="right" class="td2">Υ��˾����</td>
            <td class="td1">&nbsp;<html:text property="BreakRule/DriverName"  styleClass="input"  size="30"  maxlength="20" readonly="true"/>
              <html:hidden  property="BreakRule/DriverID" attributesText='  ValidateType="notempty" Msg="Υ��˾������Ϊ��"'  />
              <input name="Submit2232" elname="BreakRule/DriverID,BreakRule/DriverName" type="button" class="button_02" value="ѡ��" onclick="selectDriver()">
			  <span class="text_red">*</span>			  </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="30%" align="right" class="td2">Υ��ʱ�䣺</td>
            <td width="70%" class="td1">&nbsp;<html:text property="BreakRule/BreakTime[@pattern='yyyy-MM-dd']"  readonly="true" attributesText='class="input" size="30"  ValidateType="notempty" Msg="Υ��ʱ�䲻��Ϊ��"' />
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["BreakRule/BreakTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>		
            	<span class="text_red">*</span>            </td>
          </tr>
          
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">Υ�µص㣺</td>
            <td class="td1">&nbsp;<html:text property="BreakRule/BreakPlace"  maxlength="50" attributesText='class="input" size="50"  ValidateType="notempty" Msg="Υ�µص㲻��Ϊ��"' />
			<span class="text_red">*</span>   
			</td>
          </tr>
          
          
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">Υ�����ݣ�</td>
            <td class="td1">&nbsp;<html:text property="BreakRule/Detail"  maxlength="50" attributesText='class="input" size="50"  ValidateType="notempty" Msg="Υ�����ݲ���Ϊ��"' />
			<span class="text_red">*</span>   
				</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">Υ�´�����</td>
            <td class="td1">&nbsp;<html:text property="BreakRule/Punishment" maxlength="50" attributesText='class="input" size="50"  ValidateType="notempty" Msg="Υ�´�������Ϊ��"' />
			<span class="text_red">*</span>   
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
 