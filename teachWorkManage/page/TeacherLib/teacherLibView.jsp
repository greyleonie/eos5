<%@include file="/internet/common.jsp"%>

<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ѧ����&gt;ʦ�ʿ����&gt;��У��ʦ��&gt;ʦ�ʿ���Ϣ</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
		<html:hidden property="Teacher/TeacherID" />
		
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
            <td width="35%" class="td1">&nbsp;<bean:write property="Teacher/operatorName" /></td>
            <td width="12%" align="right" nowrap class="td2">�ԡ����� </td>
            <td width="39%" class="td1">&nbsp;<logic:equal property="Teacher/Sex" value="0">Ů</logic:equal><logic:equal property="Teacher/Sex" value="1">��</logic:equal>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">���ڲ��ţ� </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/Department" /></td>
            <td align="right" nowrap class="td2">ְ���� ��</td>
            <td class="td1">&nbsp;<bean:write property="Teacher/DutyTechnicalPost" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�������£� </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/Birthdate" /></td>
            <td align="right" nowrap class="td2">ְ���� �ƣ�</td>
            <td class="td1">&nbsp;<bean:write property="Teacher/persition" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">ѧ    ���� </td>
            <td class="td1">&nbsp;<dict:write businTypeId="dx_education" property="TeacherLib/Education"/></td>
            <td align="right" nowrap class="td2">ר    ҵ�� </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/Specialty" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��λ�绰�� </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/OrganTel" /></td>
            <td align="right" nowrap class="td2">�ƶ��绰�� </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/MobileTel" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">סլ�绰�� </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/HomeTel" /></td>
            <td align="right" nowrap class="td2">סլ��ַ�� </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/ADDRESS" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�����ʼ��� </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/Email" /></td>
            <td align="right" nowrap class="td2">�Ƿ���ְ�� </td>
            <td class="td1">&nbsp;<logic:equal property="Teacher/IsRetire" value="0">��ְ</logic:equal><logic:equal property="Teacher/IsRetire" value="��">��ְ</logic:equal></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��ѧ���ң� </td>
            <td class="td1" colspan="3" >&nbsp;<bean:write property="Teacher/StudyContury" />
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�о����� </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="Teacher/ResearchWay" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">����������Ҫ��ѧ���� </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="Teacher/TeaTask" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��    ���� </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="Teacher/Resume" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��Ҫ�ɹ��� </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="Teacher/Achievement" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">���ķ�������� </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="Teacher/PublishPaper" /></td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>


