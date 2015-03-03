<%@include file="/internet/common.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">教学管理—&gt;师资库管理—&gt;外请教师—&gt;查看外请教师信息</td>
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
            <td width="35%" class="td1">&nbsp;<bean:write property="OutTeacher/Name" /></td>
            <td width="12%" align="right" nowrap class="td2">性　　别： </td>
            <td width="39%" class="td1">&nbsp;<logic:equal property="OutTeacher/Sex" value="0">女</logic:equal><logic:equal property="OutTeacher/Sex" value="1">男</logic:equal>
            </td>
          </tr>
          <tr> 
            <td width="14%" align="right" nowrap class="td2">出生年月： </td>
            <td width="35%" class="td1">&nbsp;<bean:write property="OutTeacher/Birthday" /></td>
            <td width="12%" align="right" nowrap class="td2">职    称： </td>
            <td width="39%" class="td1">&nbsp;<dict:write businTypeId="dx_positionlevel" property="OutTeacher/DutyTechnicalPost"/>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">所在单位： </td>
            <td class="td1">&nbsp;<bean:write property="OutTeacher/WorkUnit" /></td>
            <td align="right" nowrap class="td2">职　　 务：</td>
            <td class="td1">&nbsp;<dict:write businTypeId="BNORG_position" property="OutTeacher/Persition"/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">学    历： </td>
            <td class="td1">&nbsp;<dict:write businTypeId="dx_education" property="OutTeacher/Education"/></td>
            <td align="right" nowrap class="td2">专    业： </td>
            <td class="td1">&nbsp;<bean:write property="OutTeacher/Specialty" />
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">联系电话： </td>
            <td class="td1">&nbsp;<bean:write property="OutTeacher/LinkTel" /></td>
            <td align="right" nowrap class="td2">电子邮箱： </td>
            <td class="td1">&nbsp;<bean:write property="OutTeacher/Email" />
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">联系地址： </td>
            <td class="td1">&nbsp;<bean:write property="OutTeacher/ADDRESS" /></td>
            <td align="right" nowrap class="td2">留学国家： </td>
            <td class="td1">&nbsp;<bean:write property="OutTeacher/StudyContury" />
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">研究方向： </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="OutTeacher/ResearchWay" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">近三年来主要教学任务： </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="OutTeacher/TeaTask" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">简    历： </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="OutTeacher/Resume" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">主要成果： </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="OutTeacher/Achievement" /></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">论文发表情况： </td>
            <td class="td1" colspan="3">&nbsp;<bean:write property="OutTeacher/PublishPaper" /></td>
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