<%@include file="/internet/common.jsp"%>

<form method="post" action="teachWorkManage.prSubjectDeclare.subjectDeclare.do">
<input type="hidden" name="queryaction" value="teachWorkManage.prSubjectDeclare.subjectDeclare.do">
<input type="hidden" name="addaction" value="teachWorkManage.prSubjectDeclare.subjectDeclareAdd.do">
<input type="hidden" name="modifyaction" value="teachWorkManage.prSubjectDeclare.subjectDeclareModify.do">
<input type="hidden" name="deleteaction" value="teachWorkManage.prSubjectDeclare.subjectDeclareDelete.do">
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
            <td class="text_wirte">首页—&gt;教务管理—&gt;课题申报—&gt;课题申报</td>
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
              <td height="15" class="td1">&nbsp;<span id="plateNum"></span>个
              </td>
            </tr>
            <%int count=0;%>
            <logic:iterate id="resultset" property="list[@type='SubjectPlate']">
            <%count++; %>
            <tr>
              <td height="23" class="td1" colspan="2">
                <b> &nbsp;<font color="#FF9900">板块<%=count %>：<bean:write id="resultset" property="SubjectPlate/PlateName"/></font></b>
              </td>
            </tr>
            <tr>
              <td height="23" class="td1" colspan="2">
                 &nbsp;板块说明：<bean:write id="resultset" property="SubjectPlate/content"/>
              </td>
            </tr>
            <tr>
              <td height="23" class="td1" colspan="2">&nbsp;已申报课题：
                <qx:talentButton property="add" type="button" styleClass="button_02" value="新增申报" onclick="declareadd()" operation="DX_TEACH_MANAGE_SUBJECTDECLARE_DECLARE.DX_TEACH_MANAGE_SUBJECTDECLARE_DECLARE_ADD"/>

                <input name="add" type="button" class="button_02" value="查看申报" onClick="talentview()">
                <!--input name="modify" type="button" class="button_02" value="修改申报" onClick="talentmodify()">
              	<input name="delete" type="button" class="button_02" value="删除申报" onClick="talentdelete()"-->
              </td>
            </tr>
            <tr>
              <td height="23" class="td1" colspan="2">
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr align="center" class="td_title">
                    <td width="2%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> </td>
                    <td width="11%" align="center" nowrap id="SubjectOfDeclared.DeptID" onClick="talentsort()">教研部</td>
                    <td width="9%" align="center" nowrap id="SubjectOfDeclared.TeacherID" onClick="talentsort()">申报教员</td>
                    <td width="8%" align="center" nowrap id="SubjectOfDeclared.DeclareTime" onClick="talentsort()">申报时间</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.SubjectName" onClick="talentsort()">课题名称</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.PlateIDs" onClick="talentsort()">对应板块</td>
                    <td width="19%" align="center" nowrap id="SubjectOfDeclared.Purpose" onClick="talentsort()">意图说明</td>
                    <td width="17%" align="center" nowrap id="SubjectOfDeclared.Advice" onClick="talentsort()">主任意见</td>
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
                  <logic:equal property="SubjectOfDeclared/PlateID" propertyId="resultset2" value="SubjectPlate/PlateID" valueType="variable" valueId="resultset">
                  <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset2" property="SubjectOfDeclared/SubjectID"/>','true')"> 
                    <td align="center">
					<logic:present  id="resultset2" property="SubjectOfDeclared/SubjectID"> 
                  		<html:checkbox id="resultset2" name="list[@name='update']/SubjectOfDeclared/SubjectID" property="SubjectOfDeclared/SubjectID" indexed="true"/> 
                  	</logic:present> 
				    </td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/DeptName"/></td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/Teacher"/></td>
                    <td nowrap align="center"><bean:write id="resultset2" property="SubjectOfDeclared/DeclareTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/SubjectName"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subSubjectName"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/PlateNames"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subPlateNames"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/Purpose"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subPurpose"/></td>
                    <td nowrap title='<bean:write id="resultset2" property="SubjectOfDeclared/Advice"/>'>&nbsp;<bean:write id="resultset2" property="SubjectOfDeclared/subAdvice"/></td>
                  </tr>
                  </logic:equal>
                  </logic:iterate>
                </table>
              </td>
            </tr>
            </logic:iterate>
            
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
  document.getElementById("plateNum").innerHTML='<%=count%>';
  
  function declareadd(){
  	var frm =document.forms[0];
  	var id = '<bean:write property="SubjectDeclare/DeclareID"/>';

  	frm.action = frm.elements["addaction"].value;
    frm.action += "?fid=" + id;
	frm.submit();
  }
</script>