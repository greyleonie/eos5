<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prThesis.thesisClassList.do">
  <html:hidden property="TeachingPlanUnit/UnitID" name="Thesis/TeachingGroupID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;ѧԱ���¹���&gt;ѧԱ�����ϴ�</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prThesis.thesisClassList.do">
	  	<input type="hidden" name="viewaction" value="studentmanage.prThesis.thesisView.do">
		<input type="hidden" name="uploadaction" value="studentmanage.prThesis.thesisUpload.do">
		<input type="hidden" name="deleteaction" value="studentmanage.prThesis.thesisClassDetele.do">
	  	<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="isUpdateClass" value="0"/>
		<html:hidden property="Class/ClassID"/>
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="1" cellspacing="1">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
            <td class="text">�ࡡ�������� <html:select property="QueryThesis/ClassID/criteria/value" onchange="talentquery()" attributesText='id="printTable"'> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
              <input name="query" type="button" class="button_02" value="�� ѯ" onclick="talentquery()">
            </td>
      </tr>
      <tr>
      <TD class="text">
           <qx:talentButton property="view" type="button" styleClass="button_02" value="�� ��" onclick="talentToUpload()" operation="DX_STUDENT_MANAGE_ARTICLE_UPLOAD.DX_STUDENT_MANAGE_ARTICLE_UPLOAD_UPLOAD"/>
           <qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_STUDENT_MANAGE_ARTICLE_UPLOAD.DX_STUDENT_MANAGE_ARTICLE_UPLOAD_DEL"/>
           <input name="ieprint" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">
           <input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()">
           <input name="SetDeadline" type="button" class="button_03" value="���ý�ֹʱ��" onclick="displayDeadline()">
           <html:text property="Class/ThesisDeadline[@pattern='yyyy-MM-dd']" attributesText='class="input" size="10" ValidateType="notempty" Msg="��ֹʱ�䲻��Ϊ��"' style="display:none"/>
		   <img name="ThesisDeadlineImg" src="/internet/image/date.gif" width="13" height="20" align="absmiddle" style="display:none" onClick=calendar(document.forms[0].elements["Class/ThesisDeadline[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
		   <input name="SaveThesisDeadline" type="button" class="button_02" value="�� ��" style="display:none" onclick="saveDeadline()">
		   <logic:notEqual property="Class/ThesisDeadline" value="">�ð༶�������ϴ���ֹʱ��Ϊ<bean:write property="Class/ThesisDeadline" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></logic:notEqual>
        </td>
      </tr>
      <tr>
        <td height="5"></td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
            <tr class="td_title">
              <td width="3%" align="center" nowrap><input type="checkbox" name="checkbox" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" marked="">              </td>
              <td width="9%" align="center" nowrap  onclick="talentsort()">ѧ��</td>
              <td width="9%" align="center" nowrap  onclick="talentsort()">����</td>
              <td width="36%" align="center" nowrap  onclick="talentsort()">���±���</td>
              <td width="11%" align="center" nowrap  onclick="talentsort()">�ϴ�ʱ��</td>
              <td width="7%" align="center" nowrap  onclick="talentsort()">�Ƿ��д</td>
              <td width="10%" align="center" nowrap  onclick="talentsort()">��д��</td>
            </tr>
            <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
            <logic:iterate id="resultset" property="list[@type='QueryStudent']">
              <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
             <tr class="<%=trClass%>" onclick="changeTRBgColor(this)" >
              <td align="center"><logic:present  id="resultset" property="QueryStudent/StudentID">
                <html:checkbox id="resultset" name="list[@name='update']/QueryStudent/StudentID" property="QueryStudent/StudentID" indexed="true"/>
              </logic:present>              </td>
            <td nowrap>&nbsp;
                <bean:write id="resultset" property="QueryStudent/StudentNO"/></td>
                <td nowrap>&nbsp;
                    <bean:write id="resultset" property="QueryStudent/operatorname" /></td>
                <td nowrap>&nbsp; 
                <logic:present id="resultset" property="QueryStudent/QueryThesis"> 
                <a href='/common/page/viewimgdb/viewFromDB.jsp?table=Thesis&pkn=ThesisID&field=ThesisContent&pkv=<bean:write id="resultset" property="QueryStudent/QueryThesis/ThesisID"/>&type=application/msword&fileName=<bean:write id="resultset" property="QueryStudent/QueryThesis/ThesisTitle" filter="true"/>'>
              		<bean:write id="resultset" property="QueryStudent/QueryThesis/ThesisTitle"/>
            	</a>
            	</logic:present>
            	<logic:notPresent id="resultset" property="QueryStudent/QueryThesis">
            	<font color="red">δ�ϴ�</font>
            	</logic:notPresent>
             </td>
                <td nowrap>&nbsp;
                    <bean:write id="resultset" property="QueryStudent/QueryThesis/CommitTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;
                	<logic:equal value="1" id="resultset" property="QueryStudent/QueryThesis/Iscooperate">��</logic:equal>
                </td>
                <td nowrap>&nbsp;
                    <bean:write id="resultset" property="QueryStudent/QueryThesis/cooperatorsName" />            </td>
              </tr>
            </logic:iterate>
          </table>
            <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="30" class="text">
                </td>
              </tr>
          </table></td>
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
function talentToUpload(){
    	var frm =document.forms[0];
		
   		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	} 
    
    	frm.action = frm.elements["uploadaction"].value;
    	frm.submit();
}

function displayDeadline() {
var frm =document.forms[0];
var timeInput = frm.elements["Class/ThesisDeadline[@pattern='yyyy-MM-dd']"];
var timeImg = frm.elements["ThesisDeadlineImg"];
var saveButton = frm.elements["SaveThesisDeadline"];

timeInput.style.display = "inline";
timeImg.style.display = "inline";
saveButton.style.display = "inline";
}

function saveDeadline() {
var frm =document.forms[0];
var classes = frm.elements["QueryThesis/ClassID/criteria/value"];

frm.elements["isUpdateClass"].value="1";
frm.elements["Class/ClassID"].value=classes.options[classes.selectedIndex].value;
frm.submit();
}
</script>