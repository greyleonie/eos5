<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prAffair.noticeModifyDo.do">
		<html:hidden property="Notice/_order/col1/field"/>
		<html:hidden property="Notice/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="Notice/NoticeID" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;����֪ͨ��&gt;֪ͨ�޸�</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">֪ͨ���⣺</td>
            <td width="87%" class="td1">&nbsp;
            <html:text property="Notice/Title" maxlength="50" attributesText='class="input" size="80" ValidateType="notempty" Msg="֪ͨ���ⲻ��Ϊ��"'/>
            <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" align="right" height="30" class="td2">��Чʱ�䣺</td>
            <td width="87%" class="td1">&nbsp;
			<html:text name="Notice/ValidTime[@pattern='yyyy-MM-dd']" property="Notice/ValidTime" attributesText='class="input" size="30" ValidateType="notempty" Msg="��Чʱ�䲻��Ϊ��"'/>
			<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Notice/ValidTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")> 	
            <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" align="right" height="30" class="td2">��ֹʱ�䣺</td>
            <td width="87%" class="td1">&nbsp;
            <html:text name="Notice/InValidTime[@pattern='yyyy-MM-dd']" property="Notice/InValidTime" attributesText='class="input" size="30" ValidateType="notempty" Msg="��ֹʱ�䲻��Ϊ��"'/>
			<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Notice/InValidTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")> 	
            <span class="text_red">*</span></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">֪ͨ���ݣ�</td>
            <td width="87%" class="td1">&nbsp;
            <html:textarea property="Notice/Content" attributesText='class="input" cols="70" rows="6"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="58" align="right" class="td2">֪ͨ��Ա��</td>
            <td width="87%" class="td1">&nbsp;
            <html:textarea property="Notice/ReceiveIDsName" attributesText='class="input" cols="70" rows=3" readOnly="fcc" ValidateType="notempty" Msg="֪ͨ��Ա����Ϊ��"'/>
            <html:hidden property="Notice/ReceiveIDs"/><input name="Button" type="button" class="button_02" value="ѡ ��" elname="Notice/ReceiveIDs,Notice/ReceiveIDsName" onClick="selectSysUser()"> 
		    <span class="text_red">*</span></td>
          </tr>

          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="49" align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
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
  
  </script>
 