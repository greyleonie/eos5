<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="teachWorkManage.prTeachingCase.teachingCaseModifyDo.do">
  <html:hidden property="TeachingCase/State"/>
 <html:hidden property="TeachingCase/caseID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�����⡪&gt;��ѧ�������޸�</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> 
      <html:hidden property="SendArchive/RecordID"/>
      <html:hidden property="TeachingCase/RecordID"/>
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">���⣺</td>
            <td colspan="3" class="td1">
			<html:text property="TeachingCase/Theme" maxlength="100" attributesText='class="input" size="80" ValidateType="notempty" Msg="���ⲻ��Ϊ��"'/> 
              <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��Ŀ��</td>
            <td colspan="3" class="td1">
			<html:text property="TeachingCase/Title" maxlength="100" attributesText='class="input" size="80" ValidateType="notempty" Msg="���ⲻ��Ϊ��"'/> 
            <span class="text_red">*</span> </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">���ߣ�</td>
            <td width="32%" class="td1">
<html:text property="TeachingCase/Editor" maxlength="32" attributesText='class="input" size="30" '/></td>
            <td width="15%" align="right" class="td2">��λ��</td>
            <td width="41%" class="td1">
          <html:text property="TeachingCase/Org" maxlength="32" attributesText='class="input" size="30" '/>		</tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">ְ��</td>
            <td class="td1">
            <html:text property="TeachingCase/Post" maxlength="32" attributesText='class="input" size="30" '/>			</td>
            <td align="right" class="td2">�༶��</td>
            <td class="td1">
            <html:select property="TeachingCase/ClassID"  attributesText='id="printTable"'> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select>            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�������</td>
            <td class="td1">
            <html:select property="TeachingCase/CaseTypeID"  attributesText='id="printTable"'> 
              <html:option value="-1">��ѡ��</html:option> 
              <html:options property="list[@type='CaseType']/CaseType/CaseTypeID" labelProperty="list[@type='CaseType']/CaseType/CaseTypeName"/> 
              </html:select>                      </td>
            <td align="right" class="td2">���̶ܳȣ�</td>
            <td class="td1">
			<dict:select businTypeId="dx_secretLevel" property="TeachingCase/SecretLevel" nullOption="true" nullLabel="��ѡ��" />			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��Դ��</td>
            <td class="td1" colspan="3">
				<html:text property="TeachingCase/CaseFrom" maxlength="32" attributesText='class="input" size="30" '/>		
			</td>
           
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">&nbsp;</td>
            <td colspan="3" class="td1">&nbsp;&nbsp;
            <logic:present property="TeachingCase/FileType">
            <a href='/common/page/viewimgdb/viewFromDB.jsp?table=TeachingCase&pkn=caseID&field=Detail&pkv=<bean:write property="TeachingCase/caseID"/>&type=<bean:write property="TeachingCase/FileType"/>' target="_blank">����:<bean:write property="TeachingCase/Title"/></a> 
             </logic:present>           
              </td>
          </tr>
              <tr>
            <td class="td1" colspan="4">  <table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="attachment">
				<tr> 
				  <td width="100%" height="30px" align="left" valign="middle" class="td1">&nbsp;
				  <INPUT type="button" class="button_02" value="����" onClick="saveFile(0);">&nbsp;
				   <logic:notPresent property="isSearch">
               <input name="Submit" type="button" class="button_02" value="�� ��" onclick="javascript:saveFile(1)">
                  
               </logic:notPresent>				
                 <%String editType=""; %>
               <logic:present property="isSearch">
              	<%editType="EditType=2,1&"; %>
               </logic:present>
			      <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
				  </td>
				</tr>
				<tr><td width="100%" height="600px" align="center" class="td2">
				<iframe src='/iWebOffice/teachCase/DocumentEdit.jsp?UserName=<bean:write property="SessionEntity/userName"/>&<%=editType %>RecordID=<bean:write property="TeachingCase/RecordID"/>&SendArchive/archiveTitle=&Purview=edit&FileType=.doc&Template=' frameborder="0" width="100%" name="sendText" style=" height: 100%" scrolling="no"></iframe>
				</td></tr>
        	  </table></td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <logic:present property="isSearch">
              	
              </logic:present>
              <logic:notPresent property="isSearch">
              
               </logic:notPresent>
               
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
  	if(frm.elements["TeachingCase/CaseType"].value == "-1") {
		alert("��ѡ�������");
		return
	}
	if(validater(frm)) frm.submit();
  
  }
   function selectState(val){
	var frm = document.forms[0];
	frm.elements["TeachingCase/State"].value=val;
}


function saveFile(val) {
    var frm = document.forms[0];
  <logic:notPresent property="isSearch">//û�ύ֮ǰ��Ҫ����״̬
	frm.elements["TeachingCase/State"].value=val;
  </logic:notPresent>
   <logic:present property="isSearch">
    frm.action="teachWorkManage.prTeachingCase.saveTeachingCase.do";
   </logic:present>
   var webOffice = document.getElementById("sendText").contentWindow.document.getElementById("WebOffice");
   if (!webOffice.WebSave()){
     alert(webOffice.Status);
     return false;
   }
   var webform = document.getElementById("sendText").contentWindow.document.webform;
   webform.submit();
}
  </script>