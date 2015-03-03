<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="studentmanage.prScore.classSubjectAddDo.do">
  <html:hidden property="QueryClassSubject/ClassID" name="ClassSubject/ClassID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;班级学员成绩—&gt;班级科目新增</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="15%" align="right" class="td2">科目名称：</td>
            <td width="85%" class="td1">
			<html:text property="ClassSubject/Subject" maxlength="50" attributesText='class="input" size="50" ValidateType="notempty" Msg="科目名称不能为空"'/> 
              <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">科目顺序号：</td>
            <td class="td1"><html:text property="ClassSubject/SubjectNO" maxlength="4"  attributesText='class="input" size="4" ValidateType="notempty" Msg="序号不能为空" onfocus="textValidate()" onlytype="int"'/> 
              <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">科目类型：</td>
            <td class="td1"><dict:select property="ClassSubject/SubjectType"  businTypeId="dx_SubjectType" />
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">记分方式：</td>
            <td class="td1"><dict:radio property="ClassSubject/ScoreMethod" value="1" businTypeId="dx_ScoreMethod" modifiable="true" onclick="javascript:selectMethod(this.value)" /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">学时：</td>
            <td class="td1"><html:text property="ClassSubject/ClassHours" maxlength="6" attributesText='class="input" size="6" ValidateType="int" Msg="学时需为整数"'/> </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">默认成绩：</td>
            <td class="td1" id="DefaultScore">&nbsp;</td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit1" type="button" class="button_02" value="保 存" onclick="save()">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>
 
  <script>
  selectMethod(1);
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }   
  function check(obj,theName){ 
     if(obj.value!=""&&!isInteger(obj.value)){
        alert(theName+"必须是整数！");
        return;
     }
  }
  function selectMethod(n) {
  	
  	var str="<select name='ClassSubject/DefaultScore' class='input' ValidateType='notempty' Msg='默认成绩不能为空'>";
  	<logic:iterate id="scoreType" property="list[@type='ScoreType']">
    	str=str+"<option value='"+'<bean:write id="scoreType" property="ScoreType/scoretypename"/>'+"'>"+'<bean:write id="scoreType" property="ScoreType/scoretypename"/>'+"</option>";
    </logic:iterate>
    str=str+"</select> <span class='text_red'>*</span>";
  	var text="<input type='text' onfocus='textValidate()' onlytype='int' name='ClassSubject/DefaultScore' maxlength='6' value='' class='input' size='6'  ValidateType='notempty' Msg='默认成绩不能为空''/><span class='text_red'>*</span>" ;
  	if(n==1){
  		DefaultScore.innerHTML=str;
  	}
  	else{
  		DefaultScore.innerHTML=text;
  	}
  }
  </script>
  <%
 
  %>