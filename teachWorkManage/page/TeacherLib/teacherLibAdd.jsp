<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/internet/scripts/common.js" ></SCRIPT>
<SCRIPT language="JavaScript" src="/internet/scripts/autoSearch.js" ></SCRIPT>
<link href="/internet/css/autoFinish.css" rel="stylesheet" type="text/css">
<%@ page import="java.util.*;"%>
<%int count=0;
  ArrayList list=new ArrayList();
  list=talent.core.CourseLib.queryCourse();
  if(list!=null)count=list.size();
 %>

<form method="post" action="teachWorkManage.prTeacherLib.teacherLibModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">教学管理—&gt;师资库管理—&gt;本校教师—&gt;录入师资库信息</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
	
		
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
	      <td width="14%" align="right" nowrap class="td2">教师姓名： </td>
            <td  class="td1" colspan="3">&nbsp;<html:text property="Teacher/operatorName" attributesText='class="input" size="30" readOnly="fcc"'/>
            <html:hidden property="Teacher/TeacherID"/><input name="Button" type="button" class="button_02" value="选 择" elname="Teacher/TeacherID,Teacher/operatorName" onClick="selectSysUser('yes')">
            </td>
          </tr>
        </table>
       </td>
    </tr>
    <tr>
      <td height="8"> </td>
    </tr>
    <tr id="show" style="display:block">
      <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
	     
          <tr> 
            <td width="14%" align="right" nowrap class="td2">性　　别： </td>
            <td width="35%" class="td1">&nbsp;<span id="sex"></span></td>
            <td width="12%" align="right" nowrap class="td2">所在部门： </td>
            <td width="39%" class="td1">&nbsp;<span id="Department"></span></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">职　　 务：</td>
            <td class="td1">&nbsp;<span id="DutyTechnicalPost"></span></td>
            <td align="right" nowrap class="td2">学    历： </td>
            <td class="td1">&nbsp;<dict:select businTypeId="dx_education" property="Teacher/Education" nullOption="true" nullLabel="---请选择---" /></td>
          </tr>
          <tr> 
            
            <td align="right" nowrap class="td2">专    业： </td>
            <td class="td1">&nbsp;<html:text property="Teacher/Specialty" maxlength="50" attributesText='class="input" size="30" '/></td>
            <td align="right" nowrap class="td2">留学国家： </td>
            <td class="td1" >&nbsp;<html:text property="Teacher/StudyContury" maxlength="50" attributesText='class="input" size="30" '/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">研究方向： </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="Teacher/ResearchWay" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">近三年来主要教学任务： </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="Teacher/TeaTask" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">简    历： </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="Teacher/Resume" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">主要成果： </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="Teacher/Achievement" attributesText='class="input" cols="100" rows="4"'/></td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">论文发表情况： </td>
            <td class="td1" colspan="3" height="70">&nbsp;<html:textarea property="Teacher/PublishPaper" attributesText='class="input" cols="100" rows="4"'/></td>
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

  function save() {
  	var frm = document.forms[0];

	if(validater(frm)) frm.submit();
  
  }
  
  

  function selectTeacher(){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	url = "teachWorkManage.prTeacherLib.selectTeacher.do?fccargs=" + fccargs ;
	
	var name = btn.elname;
	var names = name.split(",");
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id的值
	}
	values[values.length] = btn.name;
	
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	
	if(retArr!=null){
		document.getElementById("show").style.display = '';
		
		var fid = retArr[0];
		var name = retArr[1];
		var sex = retArr[2];
		var department = retArr[3];
		var post = retArr[4];
		//alert(fid);
		frm.elements["Teacher/TeacherID"].value=fid;
		frm.elements["Teacher/operatorName"].value=name;
		//alert(department);alert(post);
		document.getElementById("Department").innerHTML = department;
		document.getElementById("DutyTechnicalPost").innerHTML = post;
		if(sex=='0') document.getElementById("sex").innerHTML = "女";
		else if(sex=='1') document.getElementById("sex").innerHTML = "男";
	}
	//if(retArr!=null){
	//	var obj = null;
	//	var j = 0;
	//	for(var i=0;i<retArr.length;i++){
	//		obj = retArr[i];
	//		frm.elements[names[j++]].value=retArr[i].value;
	//		frm.elements[names[j++]].value=retArr[i].text;
	//	}
	
	//}
	


}
  </script>
  
  