<%@include file="/internet/common.jsp"%>

<form method="post" action="teachWorkManage.prSubjectDeclare.subjectPlate.do">
<input type="hidden" name="queryaction" value="teachWorkManage.prSubjectDeclare.subjectPlate.do">
<input type="hidden" name="addaction" value="teachWorkManage.prSubjectDeclare.subjectPlateAdd.do">
<input type="hidden" name="modifyaction" value="teachWorkManage.prSubjectDeclare.subjectPlateModify.do">
<input type="hidden" name="deleteaction" value="teachWorkManage.prSubjectDeclare.subjectPlateDelete.do">
<input type="hidden" name="viewaction" value="teachWorkManage.prSubjectDeclare.subjectPlateView.do">
		
<html:hidden property="SubjectDeclare/_order/col1/field"/>
<html:hidden property="SubjectDeclare/_order/col1/desc" />
		
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length" />

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�����걨��&gt;�����</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">&nbsp;ѡ���걨�����飺
          <html:select property="SubjectDeclare/DeclareID" onchange="talentquery()" attributesText='id="printTable"'> 
              <logic:present property="list[@type='SubjectDeclare/SubjectDeclare/DeclareID']">
              <html:options property="list[@type='SubjectDeclare']/SubjectDeclare/DeclareID" labelProperty="list[@type='SubjectDeclare']/SubjectDeclare/DeclareName"/>
              </logic:present>
              <logic:notPresent property="list[@type='SubjectDeclare/SubjectDeclare/DeclareID']">
              <option>�������걨���</option>
              </logic:notPresent> 
          </html:select></td>  
        </tr>
      </table>   
      </td>
     </tr>
     <tr>
        <td height="8"> </td>
      </tr>
     <tr >
       <td class="text">      
         <table width="96%" height="6"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td>&nbsp;&nbsp;  
                <qx:talentButton property="add" type="button" styleClass="button_02" value="�������" onclick="talentadd()" operation="DX_TEACH_MANAGE_SUBJECTDECLARE_PLATE.DX_TEACH_MANAGE_SUBJECTDECLARE_PLATE_ADD"/>
				<logic:present property="list[@type='SubjectDeclare']/SubjectDeclare/DeclareID">
				<qx:talentButton property="modify" type="button" styleClass="button_02" value="�޸İ��" onclick="platemodify()" operation="DX_TEACH_MANAGE_SUBJECTDECLARE_PLATE.DX_TEACH_MANAGE_SUBJECTDECLARE_PLATE_MODIFY"/>
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ�����" onclick="platedelete()" operation="DX_TEACH_MANAGE_SUBJECTDECLARE_PLATE.DX_TEACH_MANAGE_SUBJECTDECLARE_PLATE_DELETE"/>
              	</logic:present>
            </td>
           </tr>
         </table>
       </td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <%int count=0;%>
      <logic:present property="list[@type='SubjectDeclare/SubjectDeclare/DeclareID']">
      <tr>
       <td class="text">
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
            <tr>
              <td width="18%" height="9" class="td1" >&nbsp;�걨���ƣ�</td>
              <td width="82%" height="9" class="td1" >&nbsp;<bean:write property="SubjectDeclare/DeclareName"/>
              </td>
            </tr>
            <tr>
              <td height="9" class="td1" >&nbsp;�걨��ֹʱ�䣺</td>
              <td height="9" class="td1">&nbsp;<bean:write property="SubjectDeclare/DateLine" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
              </td>
            </tr>
            <tr>
              <td height="15" class="td1">&nbsp;������飺
              </td>
              <td height="15" class="td1">&nbsp;<bean:write property="SubjectDeclare/PlateNum"/>��
              </td>
            </tr>
            <logic:iterate id="resultset" property="list[@type='SubjectPlate']">
            <%count++; %>
            <tr>
              <td height="23" class="td1" colspan="2">
                <b> &nbsp;<font color="#008080">���<%=count %>��<bean:write id="resultset" property="SubjectPlate/PlateName"/></font></b>
              </td>
            </tr>
            <tr>
              <td height="23" class="td1" colspan="2">
                 &nbsp;���˵����<bean:write id="resultset" property="SubjectPlate/content"/>
              </td>
            </tr>
            </logic:iterate>
            
            <tr>
              <td height="23" class="td1" colspan="2">
              </td>
            </tr>

          </table></td>
    </tr>
    </logic:present>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
<script>
  
  function platemodify(){
  	var frm =document.forms[0];
  	var id = '<bean:write property="SubjectDeclare/DeclareID"/>';

  	frm.action = frm.elements["modifyaction"].value;
    frm.action += "?fid=" + id;
	frm.submit();
  }
  
  function platedelete(){
  	var frm =document.forms[0];
  	
  	if(confirm("�Ƿ�ȷ��ɾ����ǰ�����걨��")==false){
		return ;
	} 
  	var id = '<bean:write property="SubjectDeclare/DeclareID"/>';

  	frm.action = frm.elements["deleteaction"].value;
    frm.action += "?fid=" + id;
	frm.submit();
  }
</script>