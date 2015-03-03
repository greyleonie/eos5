<%@include file="/internet/common.jsp"%>
 
                  
<body>
<form method="post" action="studentmanage.prReport.classScore.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prReport.classScore.do">
		
		<html:hidden property="QueryStudent/_order/col1/field"/>
		<html:hidden property="QueryStudent/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
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
            <td class="text">班　　　级： <html:select property="Class/ClassID"   onchange="talentquery()"> 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			  
	          <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
            <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
            <input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()"></td>
      </tr>
      <logic:present property="Class/ClassID">
      <tr>
        <td height="8"> 
        <div id="printTable" style="display: none;"></div>
        </td>
      </tr>
      <tr>
        <td valign="top" class="text">
        
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="6%" align="center" nowrap id="QueryStudent.StudentNO" onClick="talentsort()">序号</td>
                  <td width="10%" align="center" nowrap id="QueryStudent.operatorname" onClick="talentsort()">姓名</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.WorkingOrgan" onClick="talentsort()">工作单位</td>
                 
                  
                  <logic:iterate id="subjects" property="list[@type='QueryClassSubject']">
                  <td width="10%" align="center"  >
                  <bean:write id="subjects" property="QueryClassSubject/Subject" />                  </td>
                  </logic:iterate>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="students" property="list[@type='QueryStudent']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
					<tr class="<%=trClass%>" onClick="changeTRBgColor(this)" > 
                  <td nowrap align="center"><%=count %></td>
                  <td nowrap  align="center"><bean:write id="students" property="QueryStudent/operatorname"/></td>
                  <td nowrap >&nbsp;<bean:write id="students" property="QueryStudent/WorkingOrgan" /></td>
                  <logic:iterate id="sorces" property="QueryStudent/studentScore" propertyId="students">
                  <td nowrap  align="center" >
                 	<bean:write id="sorces" property="QueryScore/Score" />                  	</td>
                  </logic:iterate>
                </tr>
				</logic:iterate>
      </table>		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;
        
                </td>
      </tr>
    </table>    </td>
  </tr>
   <script>
      	var sel=document.forms[0].elements["Class/ClassID"];
 		printTable.innerHTML=sel.options[sel.options.selectedIndex].text+"学员成绩表";
 		
      </script>
  </logic:present>
  <tr>
        <td >&nbsp;</td>
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