<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.groupAddDo.do">		
		<html:hidden property="researchTeam/_order/col1/field"/>
		<html:hidden property="researchTeam//_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;科研管理—&gt;科研组管理</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="79%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="18%" align="right" class="td2">科研组名称：</td>
            <td width="82%" class="td1">&nbsp;
            <bean:write property="researchTeam/groupName"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="18%" align="right" class="td2">负责人：</td>
            <td width="82%" class="td1">&nbsp;
            <bean:write property="researchTeam/managerName"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="18%" align="right" class="td2">科研组成员：</td>
            <td width="82%" class="td1">&nbsp;
            <bean:write property="researchTeam/memberName"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="18%" align="right" class="td2">科研组简介：</td>
            <td width="82%" class="td1">&nbsp;
            <bean:write property="researchTeam/remark"/>
            </td>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
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
 

 