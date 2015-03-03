<%@include file="/internet/common.jsp"%>


<form method="post" action="teachWorkManage.prSubjectDeclare.subjectDeclareAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;课题申报—&gt;查看课题申报</td>
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
	  <table width="94%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="21%" align="right" nowrap class="td2">课题名称： </td>
            <td width="79%" class="td1" height="30">&nbsp;
            <bean:write property="SubjectOfDeclared/SubjectName"/></td>
          </tr>
		  <tr> 
            <td width="21%" align="right" nowrap class="td2">教研部： </td>
            <td width="79%" class="td1" height="30">&nbsp;
            <bean:write property="SubjectOfDeclared/DeptName"/></td>
          </tr>
          <tr> 
            <td width="21%" align="right" nowrap class="td2">申报教员： </td>
            <td width="79%" class="td1" height="30">&nbsp;
            <bean:write property="SubjectOfDeclared/Teacher"/></td>
          </tr>
		  <tr> 
            <td width="21%" align="right" nowrap class="td2">对应板块： </td>
            <td width="79%" class="td1">&nbsp; 
             <bean:write property="SubjectOfDeclared/PlateNames"/>
            </td>
          </tr>
		  <tr> 
            <td width="21%" align="right" nowrap class="td2">适用班次： </td>
            <td width="79%" class="td1" height="30">&nbsp;  
            <bean:write property="SubjectOfDeclared/Classes"/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">设计意图： </td>
            <td class="td1">&nbsp;
            <bean:write property="SubjectOfDeclared/Purpose"/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">主任意见： </td>
            <td class="td1">&nbsp;
            <bean:write property="SubjectOfDeclared/Advice"/></td>
          </tr>
          <logic:equal property="SubjectOfDeclared/IsAdpoted" value="1">
          <tr> 
            <td align="right" nowrap class="td2">内容提要： </td>
            <td class="td1">&nbsp;
            <bean:write property="SubjectOfDeclared/Content"/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">教学思路： </td>
            <td class="td1">&nbsp;
            <bean:write property="SubjectOfDeclared/Thought"/></td>
          </tr>
		  <tr> 
            <td align="right" nowrap class="td2">方式方法： </td>
            <td class="td1">&nbsp;
            <bean:write property="SubjectOfDeclared/Method"/></td>
          </tr>
          </logic:equal>
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
  </form>