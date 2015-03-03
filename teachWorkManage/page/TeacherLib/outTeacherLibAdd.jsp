<%@include file="/internet/common.jsp"%>


<form method="post" action="teachWorkManage.prTeacherLib.outTeacherLibAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">教学管理—&gt;师资库管理—&gt;外请教师—&gt;录入外请教师信息</td>
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
            <td width="14%" align="right" nowrap class="td2">教师姓名： </td>
            <td width="35%" class="td1">&nbsp;<html:text property="OutTeacher/Name" maxlength="28" attributesText='class="input" size="28"  ValidateType="notempty" Msg="教师姓名不能为空"'/><span class="text_red">*</span></td>
            <td width="12%" align="right" nowrap class="td2">性　　别： </td>
            <td width="39%" class="td1">&nbsp;<dict:radio businTypeId="BNDICT_gender" property="OutTeacher/Sex" modifiable="true" value="1"/>
            </td>
          </tr>
          <tr> 
            <td width="14%" align="right" nowrap class="td2">出生年月： </td>
            <td width="35%" class="td1">&nbsp;<html:text property="OutTeacher/Birthday" maxlength="50" attributesText='class="input" size="13"'/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["OutTeacher/Birthday"],"yyyy-MM-dd")></td>
            <td width="12%" align="right" nowrap class="td2">职    称：</td>
            <td width="39%" class="td1">&nbsp;<dict:select businTypeId="dx_positionlevel" property="OutTeacher/DutyTechnicalPost" nullOption="true" nullLabel="---请选择---" />
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">所在单位： </td>
            <td class="td1">&nbsp;<html:text property="OutTeacher/WorkUnit" maxlength="50" attributesText='class="input" size="30" '/></td>
            <td align="right" nowrap class="td2">职　　务：</td>
            <td class="td1">&nbsp;<dict:select businTypeId="BNORG_position" property="OutTeacher/Persition" nullOption="true" nullLabel="---请选择---" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">学    历：</td>
            <td class="td1">&nbsp;<dict:select businTypeId="dx_education" property="OutTeacher/Education" nullOption="true" nullLabel="---请选择---" /></td>
            <td align="right" nowrap class="td2">专    业：</td>
            <td class="td1">&nbsp;<html:text property="OutTeacher/Specialty" maxlength="50" attributesText='class="input" size="30" '/>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">联系电话： </td>
            <td class="td1">&nbsp;<html:text property="OutTeacher/LinkTel" maxlength="50" attributesText='class="input" size="30" '/></td>
            <td align="right" nowrap class="td2">电子邮箱： </td>
            <td class="td1">&nbsp;<html:text property="OutTeacher/Email" maxlength="50" attributesText='class="input" size="30" '/>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">联系地址： </td>
            <td class="td1">&nbsp;<html:text property="OutTeacher/ADDRESS" maxlength="50" attributesText='class="input" size="30" '/></td>
            <td align="right" nowrap class="td2">留学国家： </td>
            <td class="td1">&nbsp;<html:text property="OutTeacher/StudyContury" maxlength="50" attributesText='class="input" size="30" '/>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">研究方向： </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="OutTeacher/ResearchWay" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">近三年来主要教学任务： </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="OutTeacher/TeaTask" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">简    历： </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="OutTeacher/Resume" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">主要成果： </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="OutTeacher/Achievement" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">论文发表情况： </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="OutTeacher/PublishPaper" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <script>
function check(tel)   //判断电话号码
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
  function   checkMail(str)   //判断邮箱
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
	
		meg="电话号码格式不正确！";
  	}
  	if(checkMail(mail1.value))
  	{
  		if(meg=="") meg="邮箱错误！";
  		else meg=meg+"\n邮箱错误！"
  	}
  	if(meg!="")
  	{
  		alert(meg);
  		return ;
  	}
	if(validater(frm)) frm.submit();
  
  }
  
  </script>