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
     alert("���乹����Ϣ������������ѧ�������"+classValue+"�Ƿ���ѧԱ��������Ϊ�գ�");
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
            <td class="text">�� ���� <html:select property="StudentStat/ClassID"  onchange="talentquery()"> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			  <input name="query" type="button" class="button_02" value="�� ѯ" onClick="toquery()">
			  <input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint4()">
              <input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">			  </td>
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
        <td  class="text" align="center"><div id="printTable" class="STYLE1"> �й�������ί��У����������ѧԺ���༶�������ͳ�Ʊ�</div></td>
      </tr>
      <tr>
        <td  class="text" align="center">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="STYLE2">
            <td width="24%" align="center"  >�� ��</td>
            <td colspan="3" align="center" id="theclass">&nbsp;</td>
            </tr>
          <tr class="STYLE2">
            <td rowspan="3" align="center" >��������</td>
            <td width="30%" align="center" >������</td>
            <td width="10%" align="center" ><bean:write property="StudentStat/total"/>��</td>
            <td width="36%" align="center" >&nbsp;</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">��ѧԱ</td>
            <td align="center"><bean:write property="StudentStat/manCount"/>��</td>
            <td align="center">ռ����ѧԱ<bean:write property="StudentStat/manScale"/>%</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">ŮѧԱ</td>
            <td align="center"><bean:write property="StudentStat/womenCount"/>��</td>
            <td align="center">ռ����ѧԱ<bean:write property="StudentStat/womenScale"/>%</td>
          </tr>
          <tr class="STYLE2">
            <td rowspan="7" align="center">���乹��</td>
            <td align="center">ƽ������</td>
            <td align="center"><bean:write property="StudentStat/aveAge"/></td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">�������</td>
            <td align="center"><bean:write property="StudentStat/maxAge"/></td>
            <td align="center">&nbsp;</td>
          </tr>
           <logic:equal property="StudentStat/minAge" value="0">
          <tr class="STYLE2" style="color:#FF0000 ">
          </logic:equal>
          <logic:notEqual property="StudentStat/minAge" value="0">
           <tr class="STYLE2">
          </logic:notEqual>
         
            <td align="center">������С</td>
            <td align="center"><bean:write property="StudentStat/minAge" /></td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">20-29�����</td>
            <td align="center"><bean:write property="StudentStat/ageCount2"/>��</td>
            <td align="center">ռ����ѧԱ<bean:write property="StudentStat/ageScale2"/>%</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">30-39�����</td>
            <td align="center"><bean:write property="StudentStat/ageCount3"/>��</td>
            <td align="center">ռ����ѧԱ<bean:write property="StudentStat/ageScale3"/>%</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">40-49�����</td>
            <td align="center"><bean:write property="StudentStat/ageCount4"/>��</td>
            <td align="center">ռ����ѧԱ<bean:write property="StudentStat/ageScale4"/>%</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">50-59�����</td>
            <td align="center"><bean:write property="StudentStat/ageCount5"/>��</td>
            <td align="center">ռ����ѧԱ<bean:write property="StudentStat/ageScale5"/>%</td>
          </tr>
          <%
          int i=0;
           %>
           <logic:iterate id="resultset" property="StudentStat/list[@type='Student']">
          <%
          	if(i==0){
           %>
          <tr class="STYLE2" >
            <td rowspan="2" align="center" id="theDegree">ѧ������</td>
            <td align="center"><dict:write id="resultset" businTypeId="dx_education" property="Student/DegreeID"  /></td>
            <td align="center"><bean:write id="resultset" property="Student/counts"/>��</td>
            <td align="center">ռ����ѧԱ<bean:write id="resultset" property="Student/scale"/>%</td>
          </tr>
          <%}else{ %>
          <tr class="STYLE2">
             <td align="center"><dict:write id="resultset" businTypeId="dx_education" property="Student/DegreeID"  /></td>
            <td align="center"><bean:write id="resultset" property="Student/counts"/>��</td>
            <td align="center">ռ����ѧԱ<bean:write id="resultset" property="Student/scale"/>%</td>
          </tr>
          <%}
          i++;
           %>
           </logic:iterate>
          <tr class="STYLE2">
            <td rowspan="3" align="center">רҵ����</td>
            <td align="center">�Ŀ�</td>
            <td align="center">&nbsp;
            ��</td>
            <td align="center">ռ����ѧԱ&nbsp;&nbsp;%</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">���</td>
            <td align="center">&nbsp;
            ��</td>
            <td align="center">ռ����ѧԱ&nbsp;&nbsp;%</td>
          </tr>
          <tr class="STYLE2">
            <td align="center">����</td>
            <td align="center">&nbsp; ��</td>
            <td align="center">ռ����ѧԱ&nbsp;&nbsp;%</td>
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
 		alert("��ѡ��༶");
 		return;
 	}
 	
 	frm.action = frm.elements["queryaction"].value;
 	frm.submit();
 }
 
 
</script>