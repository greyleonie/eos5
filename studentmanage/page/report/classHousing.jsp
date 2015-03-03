<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
-->
</style>
<body>

<form method="post" action="studentmanage.prReport.classHousing.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
   
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prReport.classHousing.do">
		
		
		<html:hidden property="QueryStudentRoom/_order/col1/field"/>
		<html:hidden property="QueryStudentRoom/_order/col1/asc" />
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
            <td class="text">班 级： <html:select property="QueryStudentRoom/ClassID/criteria/value" onchange="talentquery()"> 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			  <input name="query" type="button" class="button_02" value="查 询" onClick="toquery()">
			  <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint3()">
              <input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">			 </td>
      </tr>
	 <logic:present property="QueryStudentRoom/ClassID/criteria/value">
        <logic:notEqual property="QueryStudentRoom/ClassID/criteria/value" value="-1"> 

      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td  class="text" align="center"><div id="printTable" style="display: none;"></div></td>
      </tr>
      
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="6%" align="center" nowrap id="QueryStudentRoom.StudentNO" onClick="talentsort()">序号</td>
            <td width="17%" align="center" nowrap id="QueryStudentRoom.operatorname" onClick="talentsort()">姓名</td>
            <td width="16%" align="center" nowrap id="QueryStudentRoom.TeamName" onClick="talentsort()">组别</td>
            <td width="11%" align="center" nowrap id="QueryStudentRoom.Sex" onClick="talentsort()">性别</td>
            <td width="12%" align="center" nowrap id="QueryStudentRoom.BuildingName" onClick="talentsort()">楼宇</td>
            <td width="11%" align="center" nowrap id="QueryStudentRoom.RoomName" onClick="talentsort()">房间</td>
            <td width="18%" align="center" nowrap id="QueryStudentRoom.RoomTel" onClick="talentsort()">电话</td>
            </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryStudentRoom']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
            <tr class="<%=trClass%>">
              <td nowrap align="center"><%=count %></td>
              <td nowrap align="center"><bean:write id="resultset" property="QueryStudentRoom/operatorname" /></td>
              <td nowrap align="center"><bean:write id="resultset" property="QueryStudentRoom/TeamName" /></td>
              <td nowrap align="center"><dict:write businTypeId="BNDICT_gender" property="QueryStudentRoom/Sex" id="resultset"/></td>
              <td nowrap align="center"><bean:write id="resultset" property="QueryStudentRoom/BuildingName" /></td>
              <td nowrap align="center"><bean:write id="resultset" property="QueryStudentRoom/RoomName"/>              </td>
              <td nowrap align="center"><bean:write id="resultset" property="QueryStudentRoom/RoomTel"/></td>
              </tr>
          </logic:iterate>
        </table></td>
      </tr>
      <script>
      	var sel=document.forms[0].elements["QueryStudentRoom/ClassID/criteria/value"];
 		printTable.innerHTML=sel.options[sel.options.selectedIndex].text+"住宿表";
 		
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
 	if(frm.elements["QueryStudentRoom/ClassID/criteria/value"].value==-1){
 		alert("请选择班级");
 		return;
 	}
 	
 	frm.action = frm.elements["queryaction"].value;
 	frm.submit();
 }
 
 
</script>