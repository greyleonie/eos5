<%@include file="/internet/common.jsp"%>
<title>ѡ��༶</title>
<body>
<form method="post" name="frm" action="teachWorkManage.prNetCenter.SetPeopleModifyDo.do">
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
      <tr class="td2">
        <td align="center" class="td_title">���ù�������Ĭ�ϸ�����</td>
      </tr>
    </table> 
       <table  width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
		 <tr align="center" class="td_title" >
		 <td width="50%" align="center">��������</td>
		 <td width="50%" align="center">Ĭ�ϸ�����</td>
		 </tr>
		 <logic:iterate id="taskresult" property="list[@type='Task']">
		 		 <tr align="center" class="td1">
		 		 
		 <html:hidden indexed="true" name="list/TaskType/TaskID" property="Task/TaskID" id="taskresult" />
		 <td align="center"><bean:write id="taskresult" property="Task/TaskName" /></td>
		   <td  align="center" class="td1"><html:select indexed="true"  name="list/TaskType/Director"  property="Task/Director" id="taskresult" >
          	<html:option  value="">--��ѡ��--</html:option>
              <html:options property="list[@type='Teacher']/Teacher/TeacherName" labelProperty="list[@type='Teacher']/Teacher/TeacherName"/>
             </html:select></td>
		 
		 </tr>
		</logic:iterate>	

      </table>      
      <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center">
          <input name="Submit" type="button" class="button_02" value="�� ��" onclick="save()">
          <input name="Submit" type="button" class="button_02" value="�� ��" onclick="window.close()">
          </td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>

<script>
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
    window.close()
  }


</script>