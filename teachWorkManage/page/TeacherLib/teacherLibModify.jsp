<%@include file="/internet/common.jsp"%>


<form method="post" action="teachWorkManage.prTeacherLib.teacherLibModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ѧ����&gt;ʦ�ʿ����&gt;��У��ʦ��&gt;�޸�ʦ�ʿ���Ϣ</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
        <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
	      <tr> 
	      <td width="14%" align="right" nowrap class="td2">��ʦ������ </td>
            <td  class="td1" colspan="3">&nbsp;<bean:write property="Teacher/operatorName" /><html:hidden property="Teacher/TeacherID" /></td>
          </tr>
        </table>
       </td>
    </tr>
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="14%" align="right" nowrap class="td2">�ԡ����� </td>
            <td width="35%" class="td1">&nbsp;<logic:equal property="Teacher/Sex" value="0">Ů</logic:equal><logic:equal property="Teacher/Sex" value="1">��</logic:equal></td>
            <td width="12%" align="right" nowrap class="td2">���ڲ��ţ� </td>
            <td width="39%" class="td1">&nbsp;<bean:write property="Teacher/Department" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">ְ���� ��</td>
            <td class="td1">&nbsp;<bean:write property="Teacher/DutyTechnicalPost" /></td>
            <td align="right" nowrap class="td2">ѧ    ���� </td>
            <td class="td1">&nbsp;<dict:select businTypeId="dx_education" property="Teacher/Education" nullOption="true" nullLabel="---��ѡ��---" /></td>
          </tr>
          <tr> 
            
            <td align="right" nowrap class="td2">ר    ҵ�� </td>
            <td class="td1">&nbsp;<html:text property="Teacher/Specialty" maxlength="50" attributesText='class="input" size="30" '/></td>
            <td align="right" nowrap class="td2">��ѧ���ң� </td>
            <td class="td1" >&nbsp;<html:text property="Teacher/StudyContury" maxlength="50" attributesText='class="input" size="30" '/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�о����� </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="Teacher/ResearchWay" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">����������Ҫ��ѧ���� </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="Teacher/TeaTask" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��    ���� </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="Teacher/Resume" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��Ҫ�ɹ��� </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="Teacher/Achievement" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">���ķ�������� </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="Teacher/PublishPaper" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <script>

  function save() {
  	var frm = document.forms[0];

	if(validater(frm)) frm.submit();
  
  }
  
  </script>