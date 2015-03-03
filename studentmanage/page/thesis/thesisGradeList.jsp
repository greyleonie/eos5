<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prThesis.thesisGradeList.do" target="" >
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;学员文章管理—&gt;学员文章批改—&gt;待批改文章</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prThesis.thesisGradeList.do">
		<input type="hidden" name="viewaction" value="studentmanage.prThesis.thesisView.do">
		<input type="hidden" name="modifyaction" value="studentmanage.prThesis.thesisGrade.do">
		
		<html:hidden property="QueryThesis/_order/col1/field"/>
		<html:hidden property="QueryThesis/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		 </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
            <td class="text">班　　　级： 
            <html:select property="QueryThesis/ClassID/criteria/value" onchange="talentquery()" attributesText='id="printTable"'> 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			 
			  <input name="query" type="button" class="button_02" value="查 询" onclick="talentquery()">
			  服务端排序：
			  <input type="checkbox" name="checkbox" onclick="servertoorder()" marked="">			 </td>
      </tr>
	  
	  <tr>
	    <td height="30" class="text">
	   
	    <qx:talentButton property="view" type="button" styleClass="button_02" value="批 改" onclick="talentmodify()" operation="DX_STUDENT_MANAGE_ARTICLE_GRADE_DP.DX_STUDENT_MANAGE_ARTICLE_GRADE_DP_GRADE"/>
	    <input name="view" type="button" class="button_02" value="查 看" onclick="talentview()">
	    		<input name="ieprint" type="button" class="button_02" value="打 印" onclick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onclick="exporttoexcel()">		</td>
	    </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" marked="">                  </td>
                  <td width="9%" align="center" nowrap id="QueryThesis.StudentNO" onclick="talentsort()">学号</td>
                  <td width="9%" align="center" nowrap id="QueryThesis.operatorname" onclick="talentsort()">姓名</td>
                  <td width="36%" align="center" nowrap id="QueryThesis.ThesisTitle" onclick="talentsort()">文章标题</td>
                  <td width="15%" align="center" nowrap id="QueryThesis.TeachingGroupID" onclick="talentsort()">文章类型</td>
                  <td width="7%" align="center" nowrap id="QueryThesis.cooperatorsName" onclick="talentsort()">合写人</td>
                  <td width="10%" align="center" nowrap id="QueryThesis.commentTeacher" onclick="talentsort()">评改人</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='QueryThesis']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onclick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryThesis/ThesisID"/>','true')"> 
                 
                  <td align="center">
				  <logic:present  id="resultset" property="QueryThesis/ThesisID">
				  	<html:checkbox id="resultset" name="list[@name='update']/QueryThesis/ThesisID" property="QueryThesis/ThesisID" indexed="true"/>
				  </logic:present>				  </td>
                  <td align="center" nowrap>
                    <bean:write id="resultset" property="QueryThesis/StudentNO"/></td>
                  <td align="center" nowrap>
                    <bean:write id="resultset" property="QueryThesis/operatorname" /></td>
                  <td nowrap>&nbsp;
                  <a href='/common/page/viewimgdb/viewFromDB.jsp?table=Thesis&pkn=ThesisID&field=ThesisContent&pkv=<bean:write id="resultset" property="QueryThesis/ThesisID"/>&type=<bean:write id="resultset" property="QueryThesis/ContentType"/>&fileName=<bean:write id="resultset" property="QueryThesis/ThesisTitle" filter="true"/>'>
                  <bean:write id="resultset" property="QueryThesis/ThesisTitle"/>
                  </a>                  </td>
                  <td align="center" nowrap>
                    <bean:write id="resultset" property="QueryThesis/UnitTitle"/></td>
                  <td align="center" nowrap>
					<logic:equal value="1" id="resultset" property="QueryThesis/Iscooperate">
						<bean:write id="resultset" property="QueryThesis/cooperatorsName" />
					</logic:equal>					</td>
                  <td align="center" nowrap>
                  
                    <bean:write id="resultset" property="QueryThesis/commentTeacher" />
                    <logic:notPresent id="resultset" property="QueryThesis/TeacherID"><font color="red">未分配</font></logic:notPresent>
                    </td>
                  </tr>
				</logic:iterate>
          </table>
          <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>			  </td>
            </tr>
          </table>		  </td>
      </tr>
      <tr>
        <td class="text"></td>
      </tr>
    </table>

</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>

</script>