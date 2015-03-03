<%@include file="/internet/common.jsp"%>
<%
String userName = base.util.TalentContext.getValue(pageContext,null,"SessionEntity/userName");
%>
<form method="post" enctype="multipart/form-data" action="teachWorkManage.prTeachingCase.teachingCaseCheckDo.do">
  
 <html:hidden property="TeachingCase/caseID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学案例库—&gt;教学案例审核</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
        <html:hidden property="SendArchive/RecordID"/>
        <html:hidden property="TeachingCase/RecordID"/>        
        <input type="hidden" name="TeachingCase/CaseTypeID" value='<bean:write property="TeachingCase/CaseTypeID"/>'>
        <html:hidden property="hasSave" value="0"/>
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr  onclick="changeTRBgColor(this)">
          <td width="12%" align="right" class="td2">主题：</td>
          <td colspan="3" class="td1">&nbsp;
              <bean:write property="QueryTeachingCase/Theme"/>   
              <input type="hidden" name="QueryTeachingCase/Theme" value='<bean:write property="QueryTeachingCase/Theme"/>'>   
                     </td>
        </tr>
        <tr  onclick="changeTRBgColor(this)">
          <td align="right" class="td2">题目：</td>
          <td colspan="3" class="td1">&nbsp;
              <bean:write property="QueryTeachingCase/Title"/> 
              <input type="hidden" name="TeachingCase/Title" value='<bean:write property="QueryTeachingCase/Title"/>'>    
               </td>
        </tr>
        <tr  onclick="changeTRBgColor(this)">
          <td align="right" class="td2">作者：</td>
          <td width="32%" class="td1">&nbsp;
              <bean:write property="QueryTeachingCase/Editor"/></td>
          <td width="15%" align="right" class="td2">单位：</td>
          <td width="41%" class="td1">&nbsp;
              <bean:write property="QueryTeachingCase/Org"/>          </td>
        </tr>
        <tr  onclick="changeTRBgColor(this)">
          <td align="right" class="td2">职务：</td>
          <td class="td1">&nbsp;
              <bean:write property="QueryTeachingCase/Post"/>          </td>
          <td align="right" class="td2">班级：</td>
          <td class="td1">&nbsp;
              <bean:write property="Class/ClassName"/>          </td>
        </tr>
        <tr  onclick="changeTRBgColor(this)">
          <td align="right" class="td2">案例类别：</td>
          <td class="td1">&nbsp;
              <bean:write property="QueryTeachingCase/CaseTypeName"/>          </td>
          <td align="right" class="td2">保密程度：</td>
          <td class="td1">&nbsp;
              <dict:write businTypeId="dx_secretLevel"  property="QueryTeachingCase/SecretLevel"/>          </td>
        </tr>
        <tr  onclick="changeTRBgColor(this)">
          <td align="right" class="td2">来源：</td>
          <td class="td1">&nbsp;
              <bean:write property="QueryTeachingCase/CaseFrom"/></td>
          <td align="right" class="td2">教研部：</td>
          <td class="td1">&nbsp;
              <bean:write property="QueryTeachingCase/orgName"/></td>
        </tr>
      
        <tr  onclick="changeTRBgColor(this)">
          <td align="right" class="td2">审核：</td>
          <td colspan="3" class="td1">&nbsp;
          <html:radio property="TeachingCase/State" value="2" checked="true"></html:radio>通过 
          <html:radio property="TeachingCase/State" value="3"></html:radio>不通过 
          
          </td>
        </tr>
        <tr  onclick="changeTRBgColor(this)">
          <td align="right" class="td2">审核意见：</td>
          <td colspan="3" class="td1">&nbsp;
          <html:textarea property="TeachingCase/ExamOpinion" cols="68" rows="8"></html:textarea>
          </td>
        </tr>
               <tr>
            <td class="td1" colspan="4">  <table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="attachment">
				<tr> 
				  <td width="100%" height="30px" align="left" valign="middle" class="td1">&nbsp;
				  <INPUT type="button" class="button_02" value="提 交" onClick="saveFile();">&nbsp;
				  <input name="Submit2" type="button" class="button_02" value="返 回" onclick="javascript:history.go(-1)" />
				  </td>
				</tr>
				<tr><td width="100%" height="600px" align="center" class="td2">
				<iframe src='/iWebOffice/teachCase/DocumentEdit.jsp?UserName=<%=userName%>&EditType=2,1&RecordID=<bean:write property="TeachingCase/RecordID"/>&SendArchive/archiveTitle=&Purview=edit&FileType=.doc&Template=' frameborder="0" width="100%" name="sendText" style=" height: 100%" scrolling="no"></iframe>
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
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
  
	if(document.forms[0].elements["hasSave"].value=="0"){
	  if(confirm("正文没保存，是否要保存？")==true){
	   return false;
	  }else{	
	     frm.submit();
	  }
	}else{ 
	  frm.submit();
	}
	   
	   
	
  
  }





function saveFile() {
  
   var webOffice = document.getElementById("sendText").contentWindow.document.getElementById("WebOffice");
   if (!webOffice.WebSave()){
     alert(webOffice.Status);
     return false;
   }
   var webform = document.getElementById("sendText").contentWindow.document.webform;
   webform.submit();
}
  </script>