<%@include file="/internet/common.jsp"%>
<style type="text/css">
.STYLE1 {
font-size: 18px;
font-weight: bold;
}

.STYLE2 {
	background-color: #FFFFFF;
	font-size: 14px;
	line-height: 22px;
	color: #000000;
}
</style>
<script type="text/javascript">
<!--
  function minAge(){
     var age=document.getElementById("age").value;
     var sel=document.forms[0].elements["StudentStat/ClassID"];
 	 var classValue=sel.options[sel.options.selectedIndex].text;
     if(age=="0")
     alert("年龄构成信息不完整，请检查学籍管理的"+classValue+"是否有学员出生日期为空！");
  }
//-->
</script>

<body onload="minAge()">

<form method="post" action="studentmanage.prReport.studentStat.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
   
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prReport.studentStat.do">
		
		
		<html:hidden property="StudentStat/_order/col1/field"/>
		<html:hidden property="StudentStat/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<INPUT type="hidden" id="age" value="<bean:write property="StudentStat/minAge" />">
		
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
            <td class="text">班 级： <html:select property="StudentStat/ClassID"  onchange="talentquery()"> 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			  <input name="query" type="button" class="button_02" value="查 询" onClick="toquery()">
			  <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint4()">
              <input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">			  </td>
      </tr>
	 <logic:present property="StudentStat/ClassID">
        <logic:notEqual property="StudentStat/ClassID" value="-1"> 

      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td  class="text" align="center">&nbsp;</td>
      </tr>
      <tr>
        <td  class="text" align="center"><div id="printTable" class="STYLE1"> 中共广州市委党校（广州行政学院）班级基本情况统计表</div></td>
      </tr>
      <tr>
        <td  class="text" align="center">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="STYLE2">
            <td width="24%" align="center"  >班 级</td>
            <td colspan="3" align="center" id="theclass">&nbsp;</td>
            </tr>
          <tr class="STYLE2">
            <td rowspan="3" align="center" >人数构成</td>
            <td width="30%" align="center" >总人数</td>
            <td width="10%" align="center" ><bean:write property="StudentStat/total"/>人</td>
            <td width="36%" align="center" >&nbsp;</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">男学员</td>
            <td align="center"><bean:write property="StudentStat/manCount"/>人</td>
            <td align="center">占本班学员<bean:write property="StudentStat/manScale"/>%</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">女学员</td>
            <td align="center"><bean:write property="StudentStat/womenCount"/>人</td>
            <td align="center">占本班学员<bean:write property="StudentStat/womenScale"/>%</td>
          </tr>
          <tr class="STYLE2">
            <td rowspan="7" align="center">年龄构成</td>
            <td align="center">平均年龄</td>
            <td align="center"><bean:write property="StudentStat/aveAge"/></td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">年龄最大</td>
            <td align="center"><bean:write property="StudentStat/maxAge"/></td>
            <td align="center">&nbsp;</td>
          </tr>
           <logic:equal property="StudentStat/minAge" value="0">
          <tr class="STYLE2" style="color:#FF0000 ">
          </logic:equal>
          <logic:notEqual property="StudentStat/minAge" value="0">
           <tr class="STYLE2">
          </logic:notEqual>
         
            <td align="center">年龄最小</td>
            <td align="center"><bean:write property="StudentStat/minAge" /></td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">20-29年龄段</td>
            <td align="center"><bean:write property="StudentStat/ageCount2"/>人</td>
            <td align="center">占本班学员<bean:write property="StudentStat/ageScale2"/>%</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">30-39年龄段</td>
            <td align="center"><bean:write property="StudentStat/ageCount3"/>人</td>
            <td align="center">占本班学员<bean:write property="StudentStat/ageScale3"/>%</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">40-49年龄段</td>
            <td align="center"><bean:write property="StudentStat/ageCount4"/>人</td>
            <td align="center">占本班学员<bean:write property="StudentStat/ageScale4"/>%</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">50-59年龄段</td>
            <td align="center"><bean:write property="StudentStat/ageCount5"/>人</td>
            <td align="center">占本班学员<bean:write property="StudentStat/ageScale5"/>%</td>
          </tr>
          <%
          int i=0;
           %>
           <logic:iterate id="resultset" property="StudentStat/list[@type='Student']">
          <%
          	if(i==0){
           %>
          <tr class="STYLE2" >
            <td rowspan="2" align="center" id="theDegree">学历构成</td>
            <td align="center"><dict:write id="resultset" businTypeId="dx_education" property="Student/DegreeID"  /></td>
            <td align="center"><bean:write id="resultset" property="Student/counts"/>人</td>
            <td align="center">占本班学员<bean:write id="resultset" property="Student/scale"/>%</td>
          </tr>
          <%}else{ %>
          <tr class="STYLE2">
             <td align="center"><dict:write id="resultset" businTypeId="dx_education" property="Student/DegreeID"  /></td>
            <td align="center"><bean:write id="resultset" property="Student/counts"/>人</td>
            <td align="center">占本班学员<bean:write id="resultset" property="Student/scale"/>%</td>
          </tr>
          <%}
          i++;
           %>
           </logic:iterate>
          <tr class="STYLE2">
            <td rowspan="3" align="center">专业构成</td>
            <td align="center">文科</td>
            <td align="center">&nbsp;
            人</td>
            <td align="center">占本班学员&nbsp;&nbsp;%</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">理科</td>
            <td align="center">&nbsp;
            人</td>
            <td align="center">占本班学员&nbsp;&nbsp;%</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">工科</td>
            <td align="center">&nbsp; 人</td>
            <td align="center">占本班学员&nbsp;&nbsp;%</td>
          </tr>
        </table></td>
      </tr>
      <script>
      	var sel=document.forms[0].elements["StudentStat/ClassID"];
 		theclass.innerHTML=sel.options[sel.options.selectedIndex].text;
 		document.getElementById("theDegree").setAttribute("rowSpan","<%=i%>");
		listdetail.outerHTML = listdetail.outerHTML;
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
 	if(frm.elements["StudentStat/ClassID"].value==-1){
 		alert("请选择班级");
 		return;
 	}
 	
 	frm.action = frm.elements["queryaction"].value;
 	frm.submit();
 }
 
 
</script>