<%@include file="/internet/common.jsp"%>

<form method="post" action="teachWorkManage.prSubjectDeclare.subjectVie.do">
<input type="hidden" name="queryaction" value="teachWorkManage.prSubjectDeclare.subjectVie.do">
<input type="hidden" name="modifyaction" value="teachWorkManage.prSubjectDeclare.subjectVieModify.do">
<input type="hidden" name="viewaction" value="teachWorkManage.prSubjectDeclare.subjectDeclareView.do">
		
<html:hidden property="SubjectDeclare/_order/col1/field"/>
<html:hidden property="SubjectDeclare/_order/col1/desc" />
		
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length" />

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;课题申报—&gt;竞课课题</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    
      <tr>
       <td class="text">
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
            <tr>
              <td width="18%" height="9" class="td1" >&nbsp;申报名称：</td>
              <td width="82%" height="9" class="td1" >&nbsp;<bean:write property="SubjectDeclare/DeclareName"/>
              </td>
            </tr>
            <tr>
              <td height="9" class="td1" >&nbsp;申报截止时间：</td>
              <td height="9" class="td1">&nbsp;<bean:write property="SubjectDeclare/DateLine" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
              </td>
            </tr>
            <tr>
              <td height="15" class="td1">&nbsp;包含板块：
              </td>
              <td height="15" class="td1">&nbsp;<bean:write property="SubjectDeclare/PlateNum"/>个
              </td>
            </tr>
            <tr>
              <td height="23" class="td1" colspan="2">
                <b> &nbsp;<font color="#FF0000"><bean:write property="SubjectDeclare/DeptName"/></font></b>
              </td>
            </tr>
            <tr>
              <td height="23" class="td1" colspan="2">
                 &nbsp;已通过筛选的课题
              </td>
            </tr>
            <tr>
              <td height="23" class="td1" colspan="2">&nbsp;
                <qx:talentButton property="modify" type="button" styleClass="button_02" value="编 辑" onclick="talentmodify()" operation="DX_TEACH_MANAGE_SUBJECTDECLARE_VIES.DX_TEACH_MANAGE_SUBJECTDECLARE_VIES_MODIFY"/>
              </td>
            </tr>
            <tr>
              <td height="23" class="td1" colspan="2">
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr align="center" class="td_title">
                    <td width="2%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> </td>
                    <td width="11%" align="center" nowrap id="SubjectOfDeclared.DeptID" onClick="talentsort()">教研部</td>
                    <td width="9%" align="center" nowrap id="SubjectOfDeclared.TeacherID" onClick="talentsort()">申报教员</td>
                    <td width="9%" align="center" nowrap id="SubjectOfDeclared.SubjectName" onClick="talentsort()">课题名称</td>
                    <td width="8%" align="center" nowrap id="SubjectOfDeclared.DeclareTime" onClick="talentsort()">对应板块</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.SubjectName" onClick="talentsort()">适用班级</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.PlateIDs" onClick="talentsort()">内容提要</td>
                    <td width="19%" align="center" nowrap id="SubjectOfDeclared.Purpose" onClick="talentsort()">教学思路</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.Advice" onClick="talentsort()">方式方法</td>
                  </tr>
                  <%
		           int counts=0;
			         String trClass = "result_content"; 
		  
		  		  %>
                  <logic:iterate id="resultset2" property="list[@type='SubjectOfDeclared']">
                  <%
				     
						if(counts%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						counts++;
			       %>
                  <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset2" property="SubjectOfDeclared/SubjectID"/>','true')"> 
                    <td align="center">
					<logic:present  id="resultset2" property="SubjectOfDeclared/SubjectID"> 
                  		<html:checkbox id="resultset2" name="list[@name='update']/SubjectOfDeclared/SubjectID" property="SubjectOfDeclared/SubjectID" indexed="true"/> 
                  	</logic:present> 
				    </td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/DeptName"/></td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/Teacher"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/SubjectName"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subSubjectName"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/PlateNames"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subPlateNames" /></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/Classes"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subClasses"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/Content"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subContent"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/Thought"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subThought"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/Method"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subMethod"/></td>
                  </tr>
                  </logic:iterate>
                </table>
              </td>
            </tr>
           
            
            <tr>
              <td height="8" class="td1" colspan="2">
              </td>
            </tr>

          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
<script>


</script>