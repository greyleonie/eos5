<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prTeacherLib.teacherLibList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�������&gt;ʦ�ʿ����&gt;�����ʦ</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prTeacherLib.outTeacherLibList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prTeacherLib.outTeacherLibAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prTeacherLib.outTeacherLibModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prTeacherLib.outTeacherLibDelete.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prTeacherLib.outTeacherLibView.do">
		
		<html:hidden property="OutTeacher/_order/col1/field"/>
		<html:hidden property="OutTeacher/_order/col1/desc" />
		
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
                <a title='����"' id="keytitle">����</a>�� 
			    <html:text property="OutTeacher/SearchName" attributesText='class="input" size="15"'/>
			    &nbsp;
				<a title='רҵ"' id="keytitle">רҵ</a>�� 
			    <html:text property="OutTeacher/SearchSpecialty" attributesText='class="input" size="15"'/>
				&nbsp;
			    <a title='ѧ��"' id="keytitle">ѧ��</a>�� 
			    <dict:select businTypeId="dx_education" property="OutTeacher/SearchEducation" nullOption="true" nullLabel="---��ѡ��---" />
				&nbsp;
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">

			</td>
      </tr>
	  <tr>
	  	<td class="text">
				<qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentadd()" operation="DX_TEACH_MANAGE_TEACHERLIB_OUT.DX_TEACH_MANAGE_TEACHERLIB_OUT_ADD"/>
				<qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_TEACH_MANAGE_TEACHERLIB_OUT.DX_TEACH_MANAGE_TEACHERLIB_OUT_MODIFY"/>
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_TEACH_MANAGE_TEACHERLIB_OUT.DX_TEACH_MANAGE_TEACHERLIB_OUT_DELETE"/>
              	<input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
              	<qx:talentButton property="ieprint" type="button" styleClass="button_02" value="�� ӡ" onclick="iePrint()" operation="DX_TEACH_MANAGE_TEACHERLIB_OUT.DX_TEACH_MANAGE_TEACHERLIB_OUT_PRINT"/>
				<qx:talentButton property="export" type="button" styleClass="button_02" value="�� ��" onclick="exporttoexcel()" operation="DX_TEACH_MANAGE_TEACHERLIB_OUT.DX_TEACH_MANAGE_TEACHERLIB_OUT_EXPORT"/>
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
                  <td width="13%" align="center" nowrap id="OutTeacher.Name" onClick="talentsort()">����</td>
                  <td width="8%" align="center" nowrap id="OutTeacher.Sex" onClick="talentsort()">�Ա�</td>
                  <td width="18%" align="center" nowrap id="OutTeacher.Education" onClick="talentsort()">ѧ��</td>
                  <td width="17%" align="center" nowrap id="OutTeacher.Specialty" onClick="talentsort()">רҵ</td>
                  <td width="23%" align="center" nowrap id="OutTeacher.WorkUnit" onClick="talentsort()">������λ</td>
                  <td width="15%" align="center" nowrap id="OutTeacher.DutyTechnicalPost" onClick="talentsort()">ְ��</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='OutTeacher']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="OutTeacher/OutTeacherID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="OutTeacher/OutTeacherID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/OutTeacher/OutTeacherID" property="OutTeacher/OutTeacherID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="OutTeacher/Name"/></td>
                <td nowrap align="center">
                <logic:equal id="resultset" property="OutTeacher/Sex" value="0">Ů</logic:equal>
                <logic:equal id="resultset" property="OutTeacher/Sex" value="1">��</logic:equal>
                </td>
                <td nowrap >&nbsp;<dict:write businTypeId="dx_education" property="OutTeacher/Education" id="resultset"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="OutTeacher/Specialty"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="OutTeacher/WorkUnit"/></td>
				<td nowrap >&nbsp;<dict:write id="resultset" businTypeId="BNORG_position" property="OutTeacher/DutyTechnicalPost"/></td>
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