<%@include file="/internet/common.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ѧ����&gt;ʦ�ʿ����&gt;�����ʦ��&gt;�鿴�����ʦ��Ϣ</td>
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
            <td width="35%" class="td1">&nbsp;<bean:write property="OutTeacher/Name" /></td>
            <td width="12%" align="right" nowrap class="td2">�ԡ����� </td>
            <td width="39%" class="td1">&nbsp;<logic:equal property="OutTeacher/Sex" value="0">Ů</logic:equal><logic:equal property="OutTeacher/Sex" value="1">��</logic:equal>
            </td>
          </tr>
          <tr> 
            <td width="14%" align="right" nowrap class="td2">�������£� </td>
            <td width="35%" class="td1">&nbsp;<bean:write property="OutTeacher/Birthday" /></td>
            <td width="12%" align="right" nowrap class="td2">ְ    �ƣ� </td>
            <td width="39%" class="td1">&nbsp;<dict:write businTypeId="dx_positionlevel" property="OutTeacher/DutyTechnicalPost"/>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">���ڵ�λ�� </td>
            <td class="td1">&nbsp;<bean:write property="OutTeacher/WorkUnit" /></td>
            <td align="right" nowrap class="td2">ְ���� ��</td>
            <td class="td1">&nbsp;<dict:write businTypeId="BNORG_position" property="OutTeacher/Persition"/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">ѧ    ���� </td>
            <td class="td1">&nbsp;<dict:write businTypeId="dx_education" property="OutTeacher/Education"/></td>
            <td align="right" nowrap class="td2">ר    ҵ�� </td>
            <td class="td1">&nbsp;<bean:write property="OutTeacher/Specialty" />
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��ϵ�绰�� </td>
            <td class="td1">&nbsp;<bean:write property="OutTeacher/LinkTel" /></td>
            <td align="right" nowrap class="td2">�������䣺 </td>
            <td class="td1">&nbsp;<bean:write property="OutTeacher/Email" />
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��ϵ��ַ�� </td>
            <td class="td1">&nbsp;<bean:write property="OutTeacher/ADDRESS" /></td>
            <td align="right" nowrap class="td2">��ѧ���ң� </td>
            <td class="td1">&nbsp;<bean:write property="OutTeacher/StudyContury" />
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�о����� </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="OutTeacher/ResearchWay" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">����������Ҫ��ѧ���� </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="OutTeacher/TeaTask" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��    ���� </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="OutTeacher/Resume" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��Ҫ�ɹ��� </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="OutTeacher/Achievement" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">���ķ�������� </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="OutTeacher/PublishPaper" /></td>
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