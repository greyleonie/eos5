<%@include file="/internet/common.jsp"%>

<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">教学管理—&gt;师资库管理—&gt;本校教师—&gt;师资库信息</td>
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
            <td width="14%" align="right" nowrap class="td2">教师姓名： </td>
            <td width="35%" class="td1">&nbsp;<bean:write property="Teacher/operatorName" /></td>
            <td width="12%" align="right" nowrap class="td2">性　　别： </td>
            <td width="39%" class="td1">&nbsp;<logic:equal property="Teacher/Sex" value="0">女</logic:equal><logic:equal property="Teacher/Sex" value="1">男</logic:equal>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">所在部门： </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/Department" /></td>
            <td align="right" nowrap class="td2">职　　 务：</td>
            <td class="td1">&nbsp;<bean:write property="Teacher/DutyTechnicalPost" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">出生年月： </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/Birthdate" /></td>
            <td align="right" nowrap class="td2">职　　 称：</td>
            <td class="td1">&nbsp;<bean:write property="Teacher/persition" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">学    历： </td>
            <td class="td1">&nbsp;<dict:write businTypeId="dx_education" property="TeacherLib/Education"/></td>
            <td align="right" nowrap class="td2">专    业： </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/Specialty" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">单位电话： </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/OrganTel" /></td>
            <td align="right" nowrap class="td2">移动电话： </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/MobileTel" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">住宅电话： </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/HomeTel" /></td>
            <td align="right" nowrap class="td2">住宅地址： </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/ADDRESS" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">电子邮件： </td>
            <td class="td1">&nbsp;<bean:write property="Teacher/Email" /></td>
            <td align="right" nowrap class="td2">是否在职： </td>
            <td class="td1">&nbsp;<logic:equal property="Teacher/IsRetire" value="0">在职</logic:equal><logic:equal property="Teacher/IsRetire" value="１">离职</logic:equal></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">留学国家： </td>
            <td class="td1" colspan="3" >&nbsp;<bean:write property="Teacher/StudyContury" />
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">研究方向： </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="Teacher/ResearchWay" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">近三年来主要教学任务： </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="Teacher/TeaTask" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">简    历： </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="Teacher/Resume" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">主要成果： </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="Teacher/Achievement" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">论文发表情况： </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="Teacher/PublishPaper" /></td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>


