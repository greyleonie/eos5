<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
-->
</style>
<body>

<form method="post" action="studentmanage.prReport.classStudentList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
   
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prReport.classStudentList.do">
		<input type="hidden" name="selaction" value="studentmanage.prReport.classStudentTeam.do">
		<input type="hidden" name="viewaction" value="studentmanage.student_xj.xjview.do">
		
		<html:hidden property="QueryStudent/_order/col1/field"/>
		<html:hidden property="QueryStudent/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		 </td>
    </tr>
  </table>


<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table" style="display: none;">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
     

      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td  class="text" align="center"><div id="printTable" style="display: none;"><bean:write property="ClassName"/>班级名册</div></td>
      </tr>
      
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <%
          int count = 0;
           %>
          <logic:iterate id="teamList" property="list[@type='QueryTeam']">
		  
		  <tr >
            <td colspan="13" align="left" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<bean:write id="teamList" property="QueryTeam/TeamName"/>: <bean:write id="teamList" property="QueryTeam/count"/>人&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			讨论室：<bean:write id="teamList" property="QueryTeam/RoomName"/>
			</td>
            </tr>
          <tr>
            <td width="4%" align="center" >序号</td>
            <td width="9%" align="center" >学号</td>
            <td width="10%" align="center" >姓名</td>
            <td width="4%" align="center"  >性别</td>
            <td width="8%" align="center"  >出生年月</td>
            <td width="10%" align="center" >学历</td>
            <td width="8%" align="center"  >所学专业</td>
            <td width="15%" align="center" >工作单位</td>
            <td width="10%" align="center" >职务</td>
            <td width="5%" align="center"  >房号</td>
            <td width="7%" align="center"  >电话</td>
            <td width="9%" align="center" >手机号吗</td>
            <td width="10%" align="center"  >备注</td>
          </tr>

          <logic:iterate id="resultset" propertyId="teamList" property="QueryTeam/QueryStudentList">
            <%
		  count++;
		   %>
            <tr >
            <td align="center" nowrap> <%=count %></td>
              <td align="center" nowrap>
                  <bean:write id="resultset" property="QueryStudent/userID"/></td>
              <td align="center" nowrap>
                  <bean:write id="resultset" property="QueryStudent/operatorname"/></td>
              <td align="center" nowrap>
                  <dict:write businTypeId="BNDICT_gender" property="QueryStudent/Sex" id="resultset"/></td>
              <td align="center" nowrap>
                  <bean:write id="resultset" property="QueryStudent/Birthdate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM"/></td>
              <td align="center">
                  <dict:write businTypeId="dx_education" property="QueryStudent/DegreeID" id="resultset"/></td>
              
               <td >&nbsp;<bean:write id="resultset" property=" QueryStudent/Major" /></td>
            
              <td >&nbsp;<bean:write id="resultset" property="QueryStudent/WorkingOrgan" /></td>
              <td >
                  &nbsp;<bean:write id="resultset" property="QueryStudent/Duty" maxLength="16"/></td>
              <td align="center" nowrap><bean:write id="resultset" property="QueryStudent/RoomName" /></td>
              <td align="center" ><bean:write id="resultset" property="QueryStudent/RoomTel" /></td>
            
              <td >&nbsp;<bean:write id="resultset" property="QueryStudent/MobileTel" /></td>
              <td >&nbsp;<bean:write id="resultset" property="QueryStudent/Remark" /></td>
            </tr>
          </logic:iterate>
          <tr>
              <td colspan="13" align="center" nowrap>&nbsp;</td>
              </tr>
          
		</logic:iterate>  
        </table></td>
      </tr>
      
      <script>
      	//var sel=document.forms[0].elements["QueryStudent/ClassID/criteria/value"];
      	//var sel2=document.forms[0].elements["QueryStudent/TeamID/criteria/value"];
 		//printTable.innerHTML=sel2.options[sel2.options.selectedIndex].text + "：人　　　　　　　讨论室：<bean:write property="QueryTeam/RoomName"/>" ;
 		
      </script>
     
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
exporttoexcel();
</script>