<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prScore.classSubjectList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;�༶ѧԱ�ɼ���&gt;�༶��Ŀ����</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prScore.classSubjectList.do">
		<input type="hidden" name="addaction" value="studentmanage.prScore.classSubjectAdd.do">
		<input type="hidden" name="modifyaction" value="studentmanage.prScore.classSubjectModify.do">
		<input type="hidden" name="deleteaction" value="studentmanage.prScore.classSubjectDelete.do">
		<input type="hidden" name="initScoreAction" value="studentmanage.prScore.initScore.do">
		<input type="hidden" name="initSubjectAction" value="studentmanage.prScore.initSubject.do">
		
		<html:hidden property="QueryClassSubject/_order/col1/field"/>
		<html:hidden property="QueryClassSubject/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<!--INPUT value="like" type="hidden" name="QueryStudent/operatorname/criteria/operator">
		<INPUT value="center" type="hidden" name="QueryStudent/operatorname/criteria/likeRule"-->
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
            <td class="text">�ࡡ�������� <html:select property="QueryClassSubject/ClassID" onchange="totalentquery()" attributesText='id="printTable"'> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
		     &nbsp;</td>
      </tr>
      <logic:present property="QueryClassSubject/ClassID">
	  <tr>
            <td height="30" class="text">
				<qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentaddNew()" operation="DX_STUDENT_MANAGE_SCORE_SUBJECT.DX_STUDENT_MANAGE_SCORE_SUBJECT_ADD"/>
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_STUDENT_MANAGE_SCORE_SUBJECT.DX_STUDENT_MANAGE_SCORE_SUBJECT_DEL"/>
                <qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_STUDENT_MANAGE_SCORE_SUBJECT.DX_STUDENT_MANAGE_SCORE_SUBJECT_MODIFY" />
                <qx:talentButton property="modify" type="button" styleClass="button_02" value="��ȡ��Ŀ" onclick="initSubject()"  operation="DX_STUDENT_MANAGE_SCORE_SUBJECT.DX_STUDENT_MANAGE_SCORE_SUBJECT_INIT"/>
                <qx:talentButton property="modify" type="button" styleClass="button_03" value="��ʼ���ɼ�" onclick="initScore()"  operation="DX_STUDENT_MANAGE_SCORE_SUBJECT.DX_STUDENT_MANAGE_SCORE_SUBJECT_SCORE"/>
                 <input name="ieprint" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()">			</td>
      </tr>
      </logic:present>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
        
		
		<logic:present property="QueryClassSubject/ClassID">
		
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="2%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" marked="">                  </td>
                  <td width="4%" align="center" nowrap >���</td>
                  <td width="30%" align="center" nowrap >��Ŀ����</td>
                  <td width="10%" align="center" nowrap >��Ŀ����</td>
                  <td width="10%" align="center" nowrap >�Ƿַ�ʽ</td>
                  <td width="10%" align="center" nowrap >ѧʱ</td>
                  <td width="10%" align="center" nowrap >Ĭ�ϳɼ�</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='QueryClassSubject']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
				<tr class="<%=trClass%>" onclick="changeTRBgColor(this)" > 
              		<td align="center">
				  <logic:present  id="resultset" property="QueryClassSubject/SubjectID">
				  	<html:checkbox id="resultset" name="list[@name='update']/ClassSubject/SubjectID" property="QueryClassSubject/SubjectID" indexed="true"/>
				  </logic:present>				  </td>
				  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryClassSubject/SubjectNO"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryClassSubject/Subject"/></td>
                  <td nowrap>&nbsp;<dict:write id="resultset" property="QueryClassSubject/SubjectType" businTypeId="dx_SubjectType"/></td>
                  <td nowrap>&nbsp;<dict:write id="resultset" property="QueryClassSubject/ScoreMethod" businTypeId="dx_ScoreMethod"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryClassSubject/ClassHours"/></td>
                  <td nowrap>&nbsp;
                  	<bean:write id="resultset" property="QueryClassSubject/DefaultScore"/>
                  </td>
                  </tr>
				</logic:iterate>
              </table>		  
			  </logic:present>
			  
			  
			  
			  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
<table width="96%"  align="center" >
  <tr>
    <td class="td1"><font color="#C0B0B0">
    ˵������ѡ��һ���༶��������ȡ��Ŀ����ȡ�ӿγ̱���ȡ�ð༶��Ŀ������������ɾ�����޸Ŀ�Ŀ����Ŀ��ʼ�����ɳ�ʼ��ѧԱ�ĳɼ�������ʼ���ɼ���������󷵻ء�ѧԱ�ɼ����ᡱ����ѧԱ�ɼ���
    </font></td>
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
	if(frm.elements["QueryClassSubject/ClassID"].value == "-1") {
		alert("��ѡ��༶");
		return
	}
	var sel = frm.elements["QueryClassSubject/ClassID"];
	var className = sel.options[sel.options.selectedIndex].text;
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}
function totalentquery() {
	var frm = document.forms[0];
	if(frm.elements["QueryClassSubject/ClassID"].value == "-1") {
		alert("��ѡ��༶");
		return
	}
	talentquery();
}

function initScore() {
	var frm = document.forms[0];
	if(frm.elements["QueryClassSubject/ClassID"].value == "-1") {
		alert("��ѡ��༶");
		return
	}
	if(confirm('��ð༶����Ŀ���гɼ�����ʼ����ѳɼ�����ΪĬ�ϣ����ĳ��⣩��ȷ�ϳ�ʼ����')){
		frm.action = frm.elements["initScoreAction"].value ;
	   	frm.submit();
   	}

}

function initSubject() {
	var frm = document.forms[0];
	if(frm.elements["QueryClassSubject/ClassID"].value == "-1") {
		alert("��ѡ��༶");
		return
	}
	if(confirm('ȷ����ȡ��')){
		frm.action = frm.elements["initSubjectAction"].value ;
	   	frm.submit();
   	}

}
</script>
<script>
	loadOrderImg(document.forms[0],'QueryStudent');
</script>