<%@include file="/internet/common.jsp"%>
 <%
	int startRow=5; //��Ŀ��ʼ�У�������м�����У�Ҫ�޸ĸ�ֵ��
%>

<script>
var options=new Array();
i=0;
<logic:iterate id="ScoreType" property="list[@type='ScoreType']">
	options[i]='<bean:write id="ScoreType" property="ScoreType/scoretypename" />';
	i=i+1;
</logic:iterate>

</script>

                  
<body>
<form method="post" action="studentmanage.prScore.scoreManage.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;�༶ѧԱ�ɼ���&gt;ѧԱ�ɼ�����</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prScore.scoreManage.do">
		<input type="hidden" name="addaction" value="studentmanage.prScore.scoreManage.do">
		<input type="hidden" name="viewaction" value="studentmanage.prScore.scoreView.do">
		<input type="hidden" name="modifytoSave" value="studentmanage.prScore.scoreSaveModify.do">
		<input type="hidden" name="initLwScoreAction" value="studentmanage.prScore.initLwScore.do">
		<input type="hidden" name="QueryClassSubject/startRow" value="<%=startRow %>">
		<html:hidden property="QueryStudent/_order/col1/field"/>
		<html:hidden property="QueryStudent/_order/col1/asc" />
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
            <td class="text">�ࡡ�������� <html:select property="Class/ClassID" onchange="talentquery()" attributesText='id="printTable"'> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			  
	    </td>
      </tr>
      <logic:present property="Class/ClassID">
	  <tr>
            <td height="30" class="text">
				
			    <input name="query" type="button" class="button_02" value="�� ѯ" onclick="talentquery()">
			    <input name="view" type="button" class="button_02" value="�� ��" onclick="talentview()">
			    <qx:talentButton property="modifyandsave" type="button" styleClass="button_02" value="�޸ı���" onclick="modifySave('listdetail')" operation="DX_STUDENT_MANAGE_SCORE_LIST.DX_STUDENT_MANAGE_SCORE_LIST_SAVE"/>
				<qx:talentButton property="modify" type="button" styleClass="button_03" value="��ȡ���ĳɼ�" onclick="initLwScore()" operation="DX_STUDENT_MANAGE_SCORE_LIST.DX_STUDENT_MANAGE_SCORE_LIST_LW"/>
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()">
			</td>
      </tr>
      
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
        
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="2%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" marked="">                  </td>
                  <td width="4%" align="center" nowrap >���</td>
                  <td width="6%" align="center" nowrap id="QueryStudent.StudentNO" onclick="talentsort()">ѧ��</td>
                  <td width="10%" align="center" nowrap id="QueryStudent.operatorname" onclick="talentsort()">����</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.WorkingOrgan" onclick="talentsort()">������λ</td>
                 
                  
                  <logic:iterate id="subjects" property="list[@type='QueryClassSubject']">
                  <td width="10%" align="center"  >
                  <bean:write id="subjects" property="QueryClassSubject/Subject" />
                  <input type="hidden" name="QueryClassSubject/SubjectID<%=startRow%>" value='<bean:write id="subjects" property="QueryClassSubject/SubjectID" />'>
                  
                  </td>
                  
                  <%startRow=startRow+1; %>
                  </logic:iterate>
                  
                  
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="students" property="list[@type='QueryStudent']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
					<tr class="<%=trClass%>" onclick="changeTRBgColor(this)" > 
                  <td align="center">
				  <logic:present  id="students" property="QueryStudent/StudentID">
				  	<html:checkbox id="students" name="list[@name='update']/Student/StudentID" property="QueryStudent/StudentID" indexed="true"/>
				  </logic:present>				  </td>
				  <td nowrap>&nbsp;<%=count %></td>
                  <td nowrap>&nbsp;<bean:write id="students" property="QueryStudent/StudentNO"/></td>
                  <td nowrap>&nbsp;<bean:write id="students" property="QueryStudent/operatorname"/></td>
                  <td nowrap >&nbsp;<bean:write id="students" property="QueryStudent/WorkingOrgan" /></td>
                  <logic:iterate id="sorces" property="QueryStudent/studentScore" propertyId="students">
                  <td nowrap  align="center" <logic:equal id="sorces" property="QueryScore/ScoreMethod" value="1">onClick="toEditSelect(options)"</logic:equal><logic:notEqual id="sorces" property="QueryScore/ScoreMethod" value="1">onClick="toEditable()"</logic:notEqual> >
                 	<bean:write id="sorces" property="QueryScore/Score" />
                  	</td>
                  </logic:iterate>
                </tr>
				</logic:iterate>
      </table>
          
		  
		  </td>
      </tr>
      <tr>
        <td class="text">
        &nbsp;
        <input type="hidden" name="QueryClassSubject/endRow" value="<%=startRow %>">
		
        </td>
      </tr>
    </table>    </td>
  </tr>
  </logic:present>
  <tr>
        <td >&nbsp;</td>
      </tr>
</table>
<table width="96%"  align="center" >
  <tr>
    <td class="td1"><font color="#C0B0B0">
    ˵�����ɼ�����ǰ�����ڡ��ɼ���Ŀ���á������úÿ�Ŀ�ͳ�ʼ���ɼ���������ȡ���ĳɼ����ɴ����ı�����ȡ���ѧԱ���ĳɼ���
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
	if(frm.elements["QueryStudent/ClassID/criteria/value"].value == "-1") {
		alert("��ѡ��༶");
		return
	}
	var sel = frm.elements["QueryStudent/ClassID/criteria/value"];
	var className = sel.options[sel.options.selectedIndex].text;
	frm.action = frm.elements["addaction"].value + "?QueryStudent/ClassName=" + className;
   	frm.submit();

}
function initLwScore() {
	var frm = document.forms[0];
	if(frm.elements["Class/ClassID"].value == "-1") {
		alert("��ѡ��༶");
		return
	}
	if(confirm('�ò���������ı���������ȡ���ĳɼ������������ĳɼ���ȷ�ϲ�����')){
		frm.action = frm.elements["initLwScoreAction"].value ;
	   	frm.submit();
   	}

}
</script>
<script>
	loadOrderImg(document.forms[0],'QueryScore');
	ops=["1","2","3"];
</script>