<%@include file="/internet/common.jsp"%>


<form method="post" action="teachWorkManage.prTeacherLib.outTeacherLibAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ѧ����&gt;ʦ�ʿ����&gt;�����ʦ��&gt;¼�������ʦ��Ϣ</td>
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
            <td width="35%" class="td1">&nbsp;<html:text property="OutTeacher/Name" maxlength="28" attributesText='class="input" size="28"  ValidateType="notempty" Msg="��ʦ��������Ϊ��"'/><span class="text_red">*</span></td>
            <td width="12%" align="right" nowrap class="td2">�ԡ����� </td>
            <td width="39%" class="td1">&nbsp;<dict:radio businTypeId="BNDICT_gender" property="OutTeacher/Sex" modifiable="true" value="1"/>
            </td>
          </tr>
          <tr> 
            <td width="14%" align="right" nowrap class="td2">�������£� </td>
            <td width="35%" class="td1">&nbsp;<html:text property="OutTeacher/Birthday" maxlength="50" attributesText='class="input" size="13"'/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["OutTeacher/Birthday"],"yyyy-MM-dd")></td>
            <td width="12%" align="right" nowrap class="td2">ְ    �ƣ�</td>
            <td width="39%" class="td1">&nbsp;<dict:select businTypeId="dx_positionlevel" property="OutTeacher/DutyTechnicalPost" nullOption="true" nullLabel="---��ѡ��---" />
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">���ڵ�λ�� </td>
            <td class="td1">&nbsp;<html:text property="OutTeacher/WorkUnit" maxlength="50" attributesText='class="input" size="30" '/></td>
            <td align="right" nowrap class="td2">ְ������</td>
            <td class="td1">&nbsp;<dict:select businTypeId="BNORG_position" property="OutTeacher/Persition" nullOption="true" nullLabel="---��ѡ��---" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">ѧ    ����</td>
            <td class="td1">&nbsp;<dict:select businTypeId="dx_education" property="OutTeacher/Education" nullOption="true" nullLabel="---��ѡ��---" /></td>
            <td align="right" nowrap class="td2">ר    ҵ��</td>
            <td class="td1">&nbsp;<html:text property="OutTeacher/Specialty" maxlength="50" attributesText='class="input" size="30" '/>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��ϵ�绰�� </td>
            <td class="td1">&nbsp;<html:text property="OutTeacher/LinkTel" maxlength="50" attributesText='class="input" size="30" '/></td>
            <td align="right" nowrap class="td2">�������䣺 </td>
            <td class="td1">&nbsp;<html:text property="OutTeacher/Email" maxlength="50" attributesText='class="input" size="30" '/>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��ϵ��ַ�� </td>
            <td class="td1">&nbsp;<html:text property="OutTeacher/ADDRESS" maxlength="50" attributesText='class="input" size="30" '/></td>
            <td align="right" nowrap class="td2">��ѧ���ң� </td>
            <td class="td1">&nbsp;<html:text property="OutTeacher/StudyContury" maxlength="50" attributesText='class="input" size="30" '/>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">�о����� </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="OutTeacher/ResearchWay" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">����������Ҫ��ѧ���� </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="OutTeacher/TeaTask" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��    ���� </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="OutTeacher/Resume" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">��Ҫ�ɹ��� </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="OutTeacher/Achievement" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">���ķ�������� </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="OutTeacher/PublishPaper" attributesText='class="input" cols="100" rows="4"'/></td>
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
function check(tel)   //�жϵ绰����
{
	var thi=tel.value;
  var Letters = "0123456789()+-";
  for (i=0; i< thi.length; i++){
     var CheckChar = thi.charAt(i);
     if (Letters.indexOf(CheckChar) == -1){
       return true;
      }
    }
    return false;
}
  function   checkMail(str)   //�ж�����
  {   
  	if(str=="") return false;
    var   strReg="";                   
    var   r;   
    strReg=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/i;                                   
    
                
    r=str.search(strReg);   
    if(r==-1)   
    return true; 
    
    else  return false;   
  }
  
  
  function save() {
  	var frm = document.forms[0];
	var meg="";
	var tel1=frm.elements["OutTeacher/LinkTel"];
	var mail1=frm.elements["OutTeacher/Email"];
	if(check(tel1))
	{
	
		meg="�绰�����ʽ����ȷ��";
  	}
  	if(checkMail(mail1.value))
  	{
  		if(meg=="") meg="�������";
  		else meg=meg+"\n�������"
  	}
  	if(meg!="")
  	{
  		alert(meg);
  		return ;
  	}
	if(validater(frm)) frm.submit();
  
  }
  
  </script>