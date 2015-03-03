<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
-->
</style>
<body>

<form method="post" action="studentmanage.prReport.studentSummary.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
   
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prReport.studentSummary.do">
		
		
		<html:hidden property="QueryStudentSummary/_order/col1/field"/>
		<html:hidden property="QueryStudentSummary/_order/col1/asc" />
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
            <td class="text">班 级： <html:select property="QueryStudentSummary/ClassID/criteria/value"   onchange="talentquery()"> 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			  <input name="query" type="button" class="button_02" value="查 询" onClick="toquery()">
			  <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
              <input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">			 </td>
      </tr>
	 <logic:present property="QueryStudentSummary/ClassID/criteria/value">
        <logic:notEqual property="QueryStudentSummary/ClassID/criteria/value" value="-1"> 

      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td  class="text" align="center"><div id="printTable" style="display: none;">通讯录</div></td>
      </tr>
      
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="5%" align="center" nowrap id="QueryStudentSummary.StudentNO" onClick="talentsort()">序号</td>
            <td width="10%" align="center" nowrap id="QueryStudentSummary.StudentName" onClick="talentsort()">学员名</td>
            <td width="30%" align="center" nowrap id="QueryStudentSummary.ThesisTitle" onClick="talentsort()">论文题</td>
            <td width="10%" align="center" nowrap id="QueryStudentSummary.TeacherName" onClick="talentsort()">评语老师</td>
            <td width="45%" align="center" nowrap id="QueryStudentSummary.Summary" onClick="talentsort()">评语</td>
            </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryStudentSummary']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
            <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" > 
	            <td align="center" nowrap><%=count %></td>
	            <td align="center" nowrap><bean:write id="resultset" property="QueryStudentSummary/StudentName"/></td>
	            <td nowrap>&nbsp; <bean:write id="resultset" property="QueryStudentSummary/ThesisTitle" /></td>
	            <td nowrap align="center"><bean:write id="resultset" property="QueryStudentSummary/TeacherName" /></td>
	            <td>&nbsp;<bean:write id="resultset" property="QueryStudentSummary/Summary" /></td>
            </tr>
          </logic:iterate>
        </table></td>
      </tr>
      <script>
      	var sel=document.forms[0].elements["QueryStudentSummary/ClassID/criteria/value"];
 		printTable.innerHTML=sel.options[sel.options.selectedIndex].text+"班级学员评语";
 		
      </script>
      </logic:notEqual>
        </logic:present>
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
 function toquery(){
 	var frm =document.forms[0];
 	if(frm.elements["QueryStudentSummary/ClassID/criteria/value"].value==-1){
 		alert("请选择班级");
 		return;
 	}
 	
 	frm.action = frm.elements["queryaction"].value;
 	frm.submit();
 }
 
 
</script>