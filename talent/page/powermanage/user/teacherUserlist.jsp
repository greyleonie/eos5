<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="talent.pr.teacherUserlist.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ϵͳ����&gt;�û�����&gt;��ʦ�û�</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="talent.pr.teacherUserlist.do">
		<input type="hidden" name="addaction" value="talent.pr.teacherUserAdd.do">
		<input type="hidden" name="modifyaction" value="talent.pr.teacherUserModify.do">
		<input type="hidden" name="deleteaction" value="talent.pr.teacherUserDelete.do">
		<input type="hidden" name="viewaction" value="talent.pr.teacherUserView.do">
		<html:hidden property="QueryTeacher/_order/col1/field"/>
		<html:hidden property="QueryTeacher/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<!--INPUT value="like" type="hidden" name="QueryTeacher/operatorname/criteria/operator">
		<INPUT value="center" type="hidden" name="QueryTeacher/operatorname/criteria/likeRule"-->
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
            <td class="text">���������ţ� <html:select property="QueryTeacher/DepartmentID/criteria/value" onchange="talentquery()" attributesText='id="printTable"'> 
              <html:option value="-1">--��ѡ����--</html:option> <html:options property="list[@type='teacherorg']/EOSORG_T_Organization/orgID" labelProperty="list[@type='teacherorg']/EOSORG_T_Organization/orgName"/> 
              </html:select> 
			  &nbsp;
			  �ѵ��룺<input type="checkbox" name="isLeave" onclick="getState(this)" <logic:equal property="QueryTeacher/isLeave/criteria/value" value="1">checked="checked"</logic:equal>/> <INPUT type="hidden" name="QueryTeacher/isLeave/criteria/value" value="<bean:write property="QueryTeacher/isLeave/criteria/value"/>"/> &nbsp;
			  �����ݣ�<input type="checkbox" name="IsRetire" onclick="getState(this)" <logic:equal property="QueryTeacher/IsRetire/criteria/value" value="1">checked="checked"</logic:equal>/> <INPUT type="hidden" name="QueryTeacher/IsRetire/criteria/value" value="<bean:write property="QueryTeacher/IsRetire/criteria/value"/>"/> &nbsp;
			  �ѹʣ�<input type="checkbox" name="isDead" onclick="getState(this)" <logic:equal property="QueryTeacher/isDead/criteria/value" value="1">checked="checked"</logic:equal>/> <INPUT type="hidden" name="QueryTeacher/isDead/criteria/value" value="<bean:write property="QueryTeacher/isDead/criteria/value"/>"/> &nbsp;
			  ���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			 </td>
      </tr>
	  <tr>
            <td height="30" class="text">
				<a title='�ؼ��ֿ�����"�ʺš���ʦ������ְ��"' id="keytitle">�ؼ��ֲ�ѯ</a>�� 
			    <html:text property="QueryTeacher/fccsearch" attributesText='class="input"'/>
			    <input name="add" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
				<input name="view" type="button" class="button_02" value="�� ��" onClick="talentadd()">
				<input name="delete" type="button" class="button_02" value="ɾ ��" onClick="talentdelete()">
              <input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="14%" align="center" nowrap id="QueryTeacher.userID" onClick="talentsort()">�ʺ�</td>
                  <td width="14%" align="center" nowrap id="QueryTeacher.operatorname" onClick="talentsort()">����</td>
				  <td width="22%" align="center" nowrap id="QueryTeacher.DutyTechnicalPost" onClick="talentsort()">ְ��</td>
                  <td width="10%" align="center" nowrap id="QueryTeacher.status" onClick="talentsort()">�û�״̬</td>
                  <td width="14%" align="center" nowrap id="QueryTeacher.cardID" onClick="talentsort()">�û�CARD</td>
                  <td width="11%" align="center" nowrap >�û�Ȩ��</td>
                  <td width="10%" align="center" nowrap >�޸�</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='teacher']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
               <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryTeacher/TeacherID"/>','true')"> 
                <td align="center"> <logic:present  id="resultset" property="QueryTeacher/TeacherID"> 
                  <html:checkbox id="resultset" name="list[@name='update']/QueryTeacher/TeacherID" property="QueryTeacher/TeacherID" indexed="true"/> 
                  </logic:present> </td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTeacher/userID"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTeacher/operatorname"/></td>
				<td nowrap>&nbsp;<dict:write id="resultset" businTypeId="BNORG_position" property="QueryTeacher/persition"/></td>
                <td nowrap>&nbsp;
					<logic:equal id="resultset" property="QueryTeacher/status" value="0">
					  ������
					</logic:equal>
					<logic:equal id="resultset" property="QueryTeacher/status" value="1">
					  ����
					</logic:equal>
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTeacher/cardID" /></td>
                <td align="center" nowrap><a href='talent.pr.userRightNew.do?usermark=<bean:write id="resultset" property="QueryTeacher/TeacherID"/>&tempuserid=<bean:write id="resultset" property="QueryTeacher/userID"/>&mode=1'><img src="/internet/image/QuanXian.gif" width="16" height="16" border="0" align="absmiddle"></a></td>
                <td align="center" nowrap><a href="javascript:talentModifyNew('<bean:write id="resultset" property="QueryTeacher/TeacherID"/>','true')"><img src="/internet/image/XiuGai.gif" width="16" height="16" border="0" align="absmiddle" style="corsor:hand" ></a></td>
                </tr>
                </logic:iterate> 
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>
			  </td>
            </tr>
			 
          </table>
		  
		  </td>
      </tr>
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
function talentaddNew() {
	var frm = document.forms[0];
	if(frm.elements["QueryStudent/ClassID/criteria/value"].value == "-1") {
		alert("��ѡ��༶");
		return
	}
	var sel = frm.elements["QueryStudent/ClassID/criteria/value"];
	var className = sel.options[sel.options.selectedIndex].text;
	frm.action = frm.elements["addaction"].value + "?Student/ClassName=" + className;
   	frm.submit();

}

function talentModifyNew(id,right) {
	if(right != "true") return;
	var frm = document.forms[0];
	frm.action = frm.elements["modifyaction"].value + "?fid=" + id;
	
	frm.submit();
	
	
}

function getState(obj){
	var flag=obj.checked;
	var name=obj.name;
//	alert("flag:"+flag+";name:"+name);
	if(flag){
		document.getElementById('QueryTeacher/'+name+'/criteria/value').value=1;
		//alert(document.getElementById('QueryTeacher/'+name+'/criteria/value').value);
	}else{
		document.getElementById('QueryTeacher/'+name+'/criteria/value').value=0;
		//alert(document.getElementById('QueryTeacher/'+name+'/criteria/value').value);
	}
}
</script>
<script>
	loadOrderImg(document.forms[0],'QueryStudent');
</script>