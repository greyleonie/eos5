<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prTeacherLib.teacherLibList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">教务管理—&gt;师资库管理—&gt;本校教师</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prTeacherLib.teacherLibList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prTeacherLib.teacherLibAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prTeacherLib.teacherLibModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prTeacherLib.teacherLibDelete.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prTeacherLib.teacherLibView.do">
		
		<html:hidden property="TeacherLib/_order/col1/field"/>
		<html:hidden property="TeacherLib/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />

	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
                <a title='姓名"' id="keytitle">姓名</a>： 
			    <html:text property="TeacherLib/SearchName" attributesText='class="input" size="15"'/>
			    &nbsp;
			    <html:hidden property="Teacher/TeacherID"/><input name="Button" type="button" class="button_02" value="选 择" elname="Teacher/TeacherID,TeacherLib/SearchName" onClick="selectSysUser('yes')">
			    &nbsp;
				<a title='专业"' id="keytitle">专业</a>： 
			    <html:text property="TeacherLib/SearchSpecialty" attributesText='class="input" size="15"'/>
				&nbsp;
			    <a title='学历"' id="keytitle">学历</a>： 
			    <dict:select businTypeId="dx_education" property="TeacherLib/SearchEducation" nullOption="true" nullLabel="---请选择---" />
				&nbsp;
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">

			</td>
      </tr>
	  <tr>
	  	<td class="text">
				<qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_TEACH_MANAGE_TEACHERLIB_LOCAL.DX_TEACH_MANAGE_TEACHERLIB_LOCAL_ADD"/>
				<qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_TEACH_MANAGE_TEACHERLIB_LOCAL.DX_TEACH_MANAGE_TEACHERLIB_LOCAL_MODIFY"/>
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_TEACH_MANAGE_TEACHERLIB_LOCAL.DX_TEACH_MANAGE_TEACHERLIB_LOCAL_DELETE"/>
              	<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
              	<qx:talentButton property="ieprint" type="button" styleClass="button_02" value="打 印" onclick="iePrint()" operation="DX_TEACH_MANAGE_TEACHERLIB_LOCAL.DX_TEACH_MANAGE_TEACHERLIB_LOCAL_PRINT"/>
				<qx:talentButton property="export" type="button" styleClass="button_02" value="导 出" onclick="exporttoexcel()" operation="DX_TEACH_MANAGE_TEACHERLIB_LOCAL.DX_TEACH_MANAGE_TEACHERLIB_LOCAL_EXPORT"/>

		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="6%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="14%" align="center" nowrap id="TeacherLib.operatorname" onClick="talentsort()">姓名</td>
                  <td width="12%" align="center" nowrap id="TeacherLib.Sex" onClick="talentsort()">性别</td>
                  <td width="16%" align="center" nowrap id="TeacherLib.Education" onClick="talentsort()">学历</td>
                  <td width="16%" align="center" nowrap id="TeacherLib.Specialty" onClick="talentsort()">专业</td>
                  <td width="21%" align="center" nowrap id="TeacherLib.DepartmentID" onClick="talentsort()">所在部门</td>
                  <td width="15%" align="center" nowrap id=TeacherLib.DutyTechnicalPost" onClick="talentsort()">职务</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='TeacherLib']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="TeacherLib/TeacherID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="TeacherLib/TeacherID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/TeacherLib/TeacherID" property="TeacherLib/TeacherID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="TeacherLib/operatorName"/></td>
                <td nowrap align="center">
                <logic:equal id="resultset" property="TeacherLib/Sex" value="0">女</logic:equal>
                <logic:equal id="resultset" property="TeacherLib/Sex" value="1">男</logic:equal>
                </td>
                <td nowrap >&nbsp;<dict:write businTypeId="dx_education" property="TeacherLib/Education" id="resultset"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="TeacherLib/Specialty"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="TeacherLib/Department"/></td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="TeacherLib/DutyTechnicalPost"/></td>
              </tr>
                </logic:iterate> 
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>
			  </td>
            </tr>
			 
          </table>
		  
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>