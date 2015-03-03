<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="teachWorkManage.prSocialSurvey.ssAddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;社会调查资料管理—&gt;社会调查资料新增</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		<html:hidden property="QuerySocialSurvey/_order/col1/field"/>
		<html:hidden property="QuerySocialSurvey/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="QuerySocialSurvey/classname/criteria/value"/>
		
		<input type="hidden" name="filepath" value="SocialSurvey"/>
		<input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="SocialSurvey">
		<input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F"> 
		
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
      <tr> 
            <td  align="right" class="td2">班级名称：</td>
            <td class="td1" colspan="3"> <html:select property="SocialSurvey/ClassID"  attributesText='ValidateType="notempty" Msg="班级名称不能为空" '> 
              <html:option value="">--请选择班级--</html:option> <html:options property="list[@type='Class']/Class/ClassID" labelProperty="list[@type='Class']/Class/ClassName"/> 
              </html:select>  &nbsp;<span class="text_red">*</span>
			 </td>
        </tr>
        <tr> 
          <td align="right" class="td2">调查主题： </td>
          <td  class="td1" colspan="3"><html:text property="SocialSurvey/Theme" maxlength="50" attributesText='class="input" size="80"  ValidateType="notempty" Msg="调查主题不能为空" '/>  &nbsp;<span class="text_red">*</span>
            </td>
        </tr>
        <tr> 
          <td align="right" class="td2">调查内容： </td>
          <td class="td1" colspan="3"><html:textarea property="SocialSurvey/Detail"  attributesText='cols="80" rows="5"'/> 
           </td>

        </tr>
        <tr> 
          <td align="right" class="td2">负责教研部：</td>
          <td class="td1"><html:select  property="SocialSurvey/TeachingGroup">
          			<html:option  value="">--请选择--</html:option>
                   <html:options property="list[@type='TeachGroup']/TeachGroup/orgID" labelProperty="list[@type='TeachGroup']/TeachGroup/orgName"/>
             </html:select></td>
          <td align="right" class="td2">调查时间： </td>
          <td class="td1"><html:text property="SocialSurvey/SurveyTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["SocialSurvey/SurveyTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")></td>
        </tr>
        <tr> 
          <td align="right" class="td2">带队领导： </td>
          <td class="td1">
             <html:hidden property="SocialSurvey/LeadTeacher"/>
            <input name="LeadTeacher" readonly="true" type="text"  class="input" size="15">
           <input name="Button" type="button" class="button_02" value="选 择" elname="SocialSurvey/LeadTeacher,LeadTeacher" onClick="selectSysUser('yes')"> 
           <input name="button" type="button" class="button_02" onclick="clearValue('1')" value="清空" style="width: 50; height: 18">
            </td>
          <td align="right" class="td2">跟班老师及班主任： </td>
           <td class="td1">
           <html:hidden property="SocialSurvey/Attendants" />
            <input name="Attendants" readonly="true"  maxlength="50"  type="text" class="input" size="30">
              <input name="Button" type="button" class="button_02" value="选 择" elname="SocialSurvey/Attendants,Attendants" onClick="selectSysUser()"> 
           <font color="#C0C0C0">（可多选）</font> 
              <input name="button" type="button" class="button_02" onclick="clearValue('2')" value="清空" style="width: 50; height: 18"></td>     
        </tr>
        <tr> 
          
          <td align="right" class="td2">调查地点： </td>
          <td class="td1" colspan="3"><html:text property="SocialSurvey/SurveySpot" maxlength="100" attributesText='class="input" size="80"'/>
          </td>
        </tr>
        <tr> 
          <td align="right" class="td2">调查方案：</td>
          <td class="td1"><input type="file" disabled="disabled" name="Scheme" class="input"> </td>
          <td align="right" class="td2">审批领导： </td>
          <td class="td1">
            <html:hidden property="SocialSurvey/ExamLeader"/>
            <input name="ExamLeader" readonly="true" type="text"  class="input" size="30">
           <input name="Button" type="button" class="button_02" value="选 择" elname="SocialSurvey/ExamLeader,ExamLeader" onClick="selectSysUser('yes')"> 
           <input name="button" type="button" class="button_02" onclick="clearValue('3')" value="清空" style="width: 50; height: 18">
          </td>
        </tr>
        <tr> 
          <td align="right" class="td2">行程路线：</td>
          <td class="td1"><input type="file" disabled="disabled" name="Route" class="input"></td>
          <td align="right" class="td2">调查报告：</td>
          <td class="td1"><input type="file" disabled="disabled" name="Report" class="input"> </td>
        </tr>
        <tr> 
          <td align="right" class="td2">调查报告发表情况：</td>
          <td class="td1" colspan="3"><html:text property="SocialSurvey/Publish" maxlength="100" attributesText='class="input" size="80" '/></td>
         
        </tr>
        <tr> 
          <td align="right" class="td2">备注：</td>
          <td class="td1" colspan="3"><html:textarea property="SocialSurvey/Remarks" rows="5" cols="80"/></td>
         
        </tr>
        
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
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
	if(validater(frm)) frm.submit();
  
  }
  
   function selectLeadTeacher(flag){ //选择教师
   	var frm =document.forms[0];
     var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prSocialSurvey.selectTeacher.do?flag="+flag+"&refreshMark="+refreshMark;
     var acceptValue="";
     var ids="";
     var names="";
     try{
    acceptValue= window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=550px;status:no;scroll:yes");      
      ids=acceptValue[0];
      names=acceptValue[1];
        }catch(e){}
        frm["SocialSurvey/LeadTeacher"].value=names;
 
 }
 
    function selectAttendants(flag){ //选择教师
   	var frm =document.forms[0];
     var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prSocialSurvey.selectTeacher.do?flag="+flag+"&refreshMark="+refreshMark;
     var acceptValue="";
     var ids="";
     var names="";
     try{
    acceptValue= window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=550px;status:no;scroll:yes");      
      ids=acceptValue[0];
      names=acceptValue[1];
        }catch(e){}
        frm["SocialSurvey/Attendants"].value=names;

 
 }
 
  function selectExamLeader(flag){ //选择教师
   	var frm =document.forms[0];
     var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prSocialSurvey.selectTeacher.do?flag="+flag+"&refreshMark="+refreshMark;
     var acceptValue="";
     var ids="";
     var names="";
     try{
    acceptValue= window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=550px;status:no;scroll:yes");      
      ids=acceptValue[0];
      names=acceptValue[1];
        }catch(e){}
        frm["SocialSurvey/ExamLeader"].value=names;

 
 }
 
 function clearValue(flag){
   var frm = document.forms[0];
   if(flag=="1"){  
      frm.elements["SocialSurvey/LeadTeacher"].value="";
      frm.elements["LeadTeacher"].value="";
    
   }else if(flag=="2"){
      frm.elements["SocialSurvey/Attendants"].value="";
      frm.elements["Attendants"].value="";
   }else  if(flag=="3"){
      frm.elements["SocialSurvey/ExamLeader"].value="";
      frm.elements["ExamLeader"].value="";
   }
  
}
  </script>