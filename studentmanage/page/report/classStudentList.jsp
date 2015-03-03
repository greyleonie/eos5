<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
-->
</style>
<body>

<form method="post" action="studentmanage.prReport.classStudentList.do" target="">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
   
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prReport.classStudentList.do">
		<input type="hidden" name="selaction" value="studentmanage.prReport.classStudentList.do">
		<input type="hidden" name="viewaction" value="studentmanage.student_xj.xjview.do">
		<input type="hidden" name="exportaction" value="studentmanage.prReport.exportClassStudent.do">
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
            <td class="text">班 级： <html:select property="QueryStudent/ClassID/criteria/value"  onchange="selTeam()"> 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			  分 组：
			  <html:select property="QueryStudent/TeamID/criteria/value"   onchange="talentquery()"> 
              <html:option value="-1">请选择</html:option> <html:options property="list[@type='Team']/Team/TeamID" labelProperty="list[@type='Team']/Team/TeamName"/> 
              </html:select> 
              &nbsp;
			  <input name="query" type="button" class="button_02" value="查 询" onClick="toquery()">
			  <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint4()">
              <input name="export1" type="button" class="button_02" value="导 出" onClick="toexport()">			 </td>
      </tr>
	 <logic:present property="QueryStudent/ClassID/criteria/value">
        <logic:notEqual property="QueryStudent/ClassID/criteria/value" value="-1"> 

      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td  class="text" align="center"><div id="printTable" style="display: none;"></div></td>
      </tr>
      
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center"  id="QueryStudent.StudentNO" onClick="talentsort()">学号</td>
            <td width="8%" align="center"  id="QueryStudent.operatorname" onClick="talentsort()">姓名</td>
            <td width="4%" align="center"  id="QueryStudent.Sex" onClick="talentsort()">性别</td>
            <td width="8%" align="center"  id="QueryStudent.Birthdate" onClick="talentsort()">出生年月</td>
            <td width="10%" align="center"  id="QueryStudent.DegreeID" onClick="talentsort()">学历</td>
            <td width="8%" align="center"  id="QueryStudent.JoinPartyTime" onClick="talentsort()">所学专业</td>
            <td width="22%" align="center"  id="QueryStudent.WorkingOrgan" onClick="talentsort()">工作单位</td>
            <td width="14%" align="center"  id="QueryStudent.Duty" onClick="talentsort()">职务</td>
            <td width="5%" align="center"  id="QueryStudent.RoomName" onClick="talentsort()">房号</td>
            <td width="7%" align="center"  id="QueryStudent.RoomTel" onClick="talentsort()">电话</td>
            <td width="10%" align="center"  id="QueryStudent.Remark" onClick="talentsort()">备注</td>
          </tr>
          <%
		            int count=0;
			         String trClass = "result_content"; 
			         int num = 0;
			         String numberStr = base.util.TalentContext.getValue(pageContext,null,"QueryStudent/TeamStuNumber/entity/TeamStuNumber");
			         if(numberStr!=null&&!numberStr.equals(""))
			              num = Integer.parseInt(numberStr);

		  		%>
		
          <logic:iterate id="resultset" property="list[@type='QueryStudent']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
             <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"  onDblClick="talentviewf('<bean:write id="resultset" property="QueryStudent/StudentID"/>','true')"> 
            <td align="center" nowrap><%= (count + num) %></td>
              <td align="center" nowrap>
                  <bean:write id="resultset" property="QueryStudent/operatorname"/></td>
              <td align="center" nowrap>
                  <dict:write businTypeId="BNDICT_gender" property="QueryStudent/Sex" id="resultset"/></td>
              <td align="center" nowrap>
                  <bean:write id="resultset" property="QueryStudent/Birthdate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy.MM"/></td>
              <td align="center">
                  <dict:write businTypeId="dx_education" property="QueryStudent/DegreeID" id="resultset"/></td>
               <td >&nbsp;<bean:write id="resultset" property=" QueryStudent/Major" /></td>
             
              <td >&nbsp;<bean:write id="resultset" property="QueryStudent/WorkingOrgan" /></td>
              <td align="center">
                  <bean:write id="resultset" property="QueryStudent/Duty" maxLength="16"/></td>
              <td align="center" nowrap><bean:write id="resultset" property="QueryStudent/RoomName" /></td>
              <td align="center" ><bean:write id="resultset" property="QueryStudent/RoomTel" /></td>
              <td >&nbsp;<bean:write id="resultset" property="QueryStudent/Remark" /></td>
            </tr>
          </logic:iterate>
        </table></td>
      </tr>
      
      <script>
      	var sel=document.forms[0].elements["QueryStudent/ClassID/criteria/value"];
      	var sel2=document.forms[0].elements["QueryStudent/TeamID/criteria/value"];
 		printTable.innerHTML=sel2.options[sel2.options.selectedIndex].text + "：<%=count%>人　　　　　　　讨论室：<bean:write property="QueryTeam/RoomName"/>" ;
 		
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
 	if(frm.elements["QueryStudent/ClassID/criteria/value"].value==-1){
 		alert("请选择班级");
 		return;
 	}
 	if(frm.elements["QueryStudent/TeamID/criteria/value"].value==-1){
 		alert("请选择班组");
 		return;
 	}
 	frm.action = frm.elements["queryaction"].value;
 	frm.submit();
 }
 
 function toexport(){
 	var frm =document.forms[0];
 	if(frm.elements["QueryStudent/ClassID/criteria/value"].value==-1){
 		alert("请选择班级");
 		return;
 	}
 	var sel = frm.elements["QueryStudent/ClassID/criteria/value"];
 	var className = sel.options[sel.options.selectedIndex].text;
 	frm.action = frm.elements["exportaction"].value+ "?ClassName=" + className;
 	frm.target = "_blank";
 	frm.submit();
 	frm.target = "";
 }
 
 function selTeam(){
 	var frm =document.forms[0];
 	var teams = frm.elements["QueryStudent/TeamID/criteria/value"];
 	if(frm.elements["QueryStudent/ClassID/criteria/value"].value==-1){
 		alert("请选择班级");
 		return;
 	} else {
 	   teams.options[0].selected = true;
 	}
 	
 	frm.action = frm.elements["selaction"].value;
 	frm.submit();
 }
 
</script>