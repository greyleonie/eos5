<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="teachWorkManage.prTeachingCase.teachingCaseAddDo.do">
  <html:hidden property="TeachingCase/State"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�����⡪&gt;��ѧ������¼��</td>
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
			<html:text property="TeachingCase/Title" maxlength="100" attributesText='class="input" size="80" ValidateType="notempty" Msg="��Ŀ����Ϊ��"'/> 
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
              </html:select>           
			<span class="text_red">*</span>
			</td>
            <td align="right" class="td2">���̶ܳȣ�</td>
            <td class="td1">
			<dict:select businTypeId="dx_secretLevel" property="TeachingCase/SecretLevel" nullOption="true" nullLabel="��ѡ��" />			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��Դ��</td>
            <td class="td1" colspan="3"><html:text property="TeachingCase/CaseFrom" maxlength="50" attributesText='class="input" size="30" '/></td>
         </tr>
           
          <tr>
            <td class="td1" colspan="4">  <table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="attachment">
				<tr> 
				  <td width="100%" height="30px" align="left" valign="middle" class="td1">&nbsp;
				  <INPUT type="button" class="button_02" value="����" onClick="saveFile(0);">&nbsp;
				
               <input name="Submit" type="button" class="button_02" value="�� ��" onclick="javascript:saveFile(1)">
			    <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
				  </td>
				</tr>
				<tr><td width="100%" height="600px" align="center" class="td2">
				<iframe src='/iWebOffice/teachCase/DocumentEdit.jsp?RecordID=<bean:write property="TeachingCase/RecordID"/>&SendArchive/archiveTitle=&Purview=edit&FileType=.doc&Template=' frameborder="0" width="100%" name="sendText" style=" height: 100%" scrolling="no"></iframe>
				</td></tr>
        	  </table></td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              
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
  
  saveFile();
  var recordId=document.forms[0].elements["TeachingCase/RecordID"].value;
  //alert("recordId:"+recordId);
  	var frm = document.forms[0];
  	if(frm.elements["TeachingCase/CaseTypeID"].value == "-1") {
		alert("��ѡ�������");
		return
	}
	if(validater(frm)){	
	
	 if(recordId!=""){
	   frm.submit();
	 }
	
	 }
  
  }
  function selectState(val){
	var frm = document.forms[0];
	frm.elements["TeachingCase/State"].value=val;
	//save();
}

function saveFile(val) {
    var frm = document.forms[0];
	frm.elements["TeachingCase/State"].value=val;


   var webOffice = document.getElementById("sendText").contentWindow.document.getElementById("WebOffice");
   if (!webOffice.WebSave()){
   
   }
   var webform = document.getElementById("sendText").contentWindow.document.webform;
   webform.submit();
}
  </script>
  <%
 
  %>