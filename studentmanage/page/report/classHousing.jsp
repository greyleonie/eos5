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
            <td class="text">�� ���� <html:select property="QueryStudentRoom/ClassID/criteria/value" onchange="talentquery()"> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			  <input name="query" type="button" class="button_02" value="�� ѯ" onClick="toquery()">
			  <input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint3()">
              <input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">			 </td>
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
            <td width="6%" align="center" nowrap id="QueryStudentRoom.StudentNO" onClick="talentsort()">���</td>
            <td width="17%" align="center" nowrap id="QueryStudentRoom.operatorname" onClick="talentsort()">����</td>
            <td width="16%" align="center" nowrap id="QueryStudentRoom.TeamName" onClick="talentsort()">���</td>
            <td width="11%" align="center" nowrap id="QueryStudentRoom.Sex" onClick="talentsort()">�Ա�</td>
            <td width="12%" align="center" nowrap id="QueryStudentRoom.BuildingName" onClick="talentsort()">¥��</td>
            <td width="11%" align="center" nowrap id="QueryStudentRoom.RoomName" onClick="talentsort()">����</td>
            <td width="18%" align="center" nowrap id="QueryStudentRoom.RoomTel" onClick="talentsort()">�绰</td>
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
 		printTable.innerHTML=sel.options[sel.options.selectedIndex].text+"ס�ޱ�";
 		
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
 		alert("��ѡ��༶");
 		return;
 	}
 	
 	frm.action = frm.elements["queryaction"].value;
 	frm.submit();
 }
 
 
</script>