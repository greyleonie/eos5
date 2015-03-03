<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.student_xj.xjlist.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;学籍管理—&gt;班级学员信息</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		<html:hidden property="QueryStudent/_order/col1/field"/>
		<html:hidden property="QueryStudent/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<INPUT value="like" type="hidden" name="QueryStudent/operatorname/criteria/operator">
		<INPUT value="center" type="hidden" name="QueryStudent/operatorname/criteria/likeRule">
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
            <td class="text">班级： 
              <html:select property="QueryStudent/ClassID/criteria/value">
			  	<html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/>
			  </html:select>
              姓名： 
			  <html:text property="QueryStudent/operatorname/criteria/value" attributesText='class="input"'/>
			  
              
				<input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
				<input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
				<input name="modify" type="button" class="button_02" value="修 改" onClick="talentmodify()">
				<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">

			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr align="center" class="td_title"> 
                  <td width="2%"> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="6%" nowrap id="QueryStudent.StudentNO" onClick="talentsort()">学号</td>
                  <td width="10%" nowrap id="QueryStudent.operatorname" onClick="talentsort()">姓名</td>
                  <td width="5%" nowrap id="QueryStudent.Sex" onClick="talentsort()">性别</td>
                  <td width="9%" nowrap id="QueryStudent.Birthdate" onClick="talentsort()">出生年月</td>
                  <td width="5%" nowrap id="QueryStudent.FolkID" onClick="talentsort()">民族</td>
                  <td width="13%" nowrap id="QueryStudent.DegreeID" onClick="talentsort()">文化程度</td>
                  <td width="8%" nowrap id="QueryStudent.zhuanye" onClick="talentsort()">学位</td>
                  <td width="15%" nowrap id="QueryStudent.WorkingOrgan" onClick="talentsort()">工作单位</td>
                  <td width="17%" nowrap id="QueryStudent.Duty" onClick="talentsort()">职务</td>
                  <td width="10%" nowrap id="QueryStudent.TeamID" onClick="talentsort()">分组</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='student']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  <td align="center">
				  <logic:present  id="resultset" property="QueryStudent/StudentID">
				  	<html:checkbox id="resultset" name="list[@name='update']/QueryStudent/StudentID" property="QueryStudent/StudentID" indexed="true"/>
				  </logic:present>
				  </td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/StudentNO"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/operatorname"/></td>
                  <td nowrap>&nbsp;<dict:write businTypeId="BNDICT_gender" property="QueryStudent/Sex" id="resultset"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Birthdate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td nowrap>&nbsp;<dict:write businTypeId="dx_folk" property="QueryStudent/FolkID" id="resultset"/></td>
                  <td nowrap>&nbsp;<dict:write businTypeId="dx_education" property="QueryStudent/DegreeID" id="resultset"/></td>
                  <td nowrap>&nbsp;
				  <logic:notEqual id="resultset" property="QueryStudent/zhuanye" value="null">
				  	<bean:write id="resultset" property="QueryStudent/zhuanye" maxLength="16" filter="true"/>
				  </logic:notEqual>
				  </td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/WorkingOrgan" maxLength="16"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Duty" maxLength="16"/></td>
                  <td nowrap>&nbsp;</td>
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
</body>
<script>
	loadOrderImg(document.forms[0],'QueryStudent');
</script>