<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prPsLemma.psLemmaAddDo.do">	
<html:hidden property="PubLemma/CYYTYPE" value="1"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;���Ĺ���&gt;���˴�������</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="60%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="40%" align="right" class="td2">�����ˣ�</td>
            <td width="60%" class="td1">&nbsp;
            <bean:write property="SessionEntity/userName"/>
            <input type="hidden" name="PubLemma/CREATEOR" value="<bean:write property='SessionEntity/userName'/>">
            </td>
          </tr>
		  <!--<tr  onClick="changeTRBgColor(this)">
            <td width="40%" align="right" class="td2">�� �ͣ�</td>
            <td width="60%" class="td1">&nbsp;
            <html:radio property="PubLemma/CYYTYPE" value="0"/>����&nbsp;
            <html:radio property="PubLemma/CYYTYPE" value="1"/>˽��
            </td>
          </tr>-->
          <tr  onClick="changeTRBgColor(this)">
          <td width="40%" align="right" class="td2">�� �ݣ�</td>
            <td width="60%" class="td1">&nbsp;
            <html:textarea property="PubLemma/DESCRIPTION" cols="40" rows="10"/>
            </td>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
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
 