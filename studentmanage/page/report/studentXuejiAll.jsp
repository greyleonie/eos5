<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prReport.studentXueji.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prReport.studentXueji.do">
		<input type="hidden" name="viewaction" value="studentmanage.student_xj.xjXueji.do">
		
		<html:hidden property="QueryStudent/_order/col1/field"/>
		<html:hidden property="QueryStudent/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="type" value="all"/>
		
		  </td>
    </tr>
  </table>


<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
            <td class="text">�ࡡ�������� <html:select property="QueryStudent/ClassID/criteria/value" onchange="talentquery()" attributesText='id="printTable"'> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			  </td>
      </tr>
	  <tr>
            <td height="30" class="text">
				<a title='�ؼ��ֿ�����"ѧԱ������ѧ�š�������λ"' id="keytitle">�ؼ��ֲ�ѯ</a>�� 
			    <html:text property="QueryStudent/fccsearch" attributesText='class="input"'/>
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
			    <input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
			    <input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="2%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="6%" align="center" nowrap id="QueryStudent.StudentNO" onClick="talentsort()">ѧ��</td>
                  <td width="10%" align="center" nowrap id="QueryStudent.operatorname" onClick="talentsort()">����</td>
                  <td width="5%" align="center" nowrap id="QueryStudent.Sex" onClick="talentsort()">�Ա�</td>
                  <td width="9%" align="center" nowrap id="QueryStudent.Birthdate" onClick="talentsort()">��������</td>
                  <td width="5%" align="center" nowrap id="QueryStudent.FolkID" onClick="talentsort()">����</td>
                  <td width="5%" align="center" nowrap id="QueryStudent.NativePlace" onClick="talentsort()">����</td>
                  <td width="13%" align="center" nowrap id="QueryStudent.DegreeID" onClick="talentsort()">ѧ��</td>
                  <td width="8%" align="center" nowrap id="QueryStudent.EduLevel" onClick="talentsort()">ѧλ</td>
                  <td width="8%" align="center" nowrap id="QueryStudent.zhuanye" onClick="talentsort()">רҵ</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.WorkingOrgan" onClick="talentsort()">������λ</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.JobTitle" onClick="talentsort()">ְ��</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.StartWorkingTime" onClick="talentsort()">�μӹ���ʱ��</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.Duty" onClick="talentsort()">ְ��</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.dutylevel" onClick="talentsort()">ְ��</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.JoinPartyTime" onClick="talentsort()">�뵳ʱ��</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.PartyPost" onClick="talentsort()">����ְ��</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.SocietyPost" onClick="talentsort()">���ְ��</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.OrgAddr" onClick="talentsort()">��λ��ַ</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.OrgPostcode" onClick="talentsort()">��λ�ʱ�</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.OrganTel" onClick="talentsort()">��λ�绰</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.Email" onClick="talentsort()">EMAIL</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.MobileTel" onClick="talentsort()">�ֻ�</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.HomeTel" onClick="talentsort()">סլ�绰</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.DiplomaNO" onClick="talentsort()">��(��)ҵ֤����</td>
                  <td width="10%" align="center" nowrap id="QueryStudent.TeamID" onClick="talentsort()">����</td>
                  <td width="10%" align="center" nowrap id="QueryStudent.TeamID" onClick="talentsort()">��ע</td>
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
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryStudent/StudentID"/>','true')"> 
                  <td align="center">
				  <logic:present  id="resultset" property="QueryStudent/StudentID">
				  	<html:checkbox id="resultset" name="list[@name='update']/QueryStudent/StudentID" property="QueryStudent/StudentID" indexed="true"/>
				  </logic:present>
				  </td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/StudentNO"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/operatorname"/></td>
                  <td nowrap>&nbsp;<dict:write businTypeId="BNDICT_gender" property="QueryStudent/Sex" id="resultset"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Birthdate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM"/></td>
                  <td nowrap>&nbsp;<dict:write businTypeId="dx_folk" property="QueryStudent/FolkID" id="resultset"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/NativePlace"/></td>
                  <td nowrap>&nbsp;<dict:write businTypeId="dx_education" property="QueryStudent/DegreeID" id="resultset"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/EduLevel"/></td>
                  <td nowrap>&nbsp;
				  <logic:notEqual id="resultset" property="QueryStudent/zhuanye" value="null">
				  	<bean:write id="resultset" property="QueryStudent/zhuanye" maxLength="16" filter="true"/>
				  </logic:notEqual>
				  </td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/WorkingOrgan"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/JobTitle"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/StartWorkingTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Duty"/></td>
                  <td nowrap>&nbsp;<dict:write businTypeId="dx_dutylevel" property="QueryStudent/dutylevel" id="resultset"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/JoinPartyTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/PartyPost"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/SocietyPost"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/OrgAddr"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/OrgPostcode"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/OrganTel"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Email"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/MobileTel"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/HomeTel"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/DiplomaNO"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/TeamName" /></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Remark" /></td>
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
<script>
//exporttoexcel()
</script>