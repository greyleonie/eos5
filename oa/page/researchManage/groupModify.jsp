<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.groupModifyDo.do">		
		<html:hidden property="researchTeam/_order/col1/field"/>
		<html:hidden property="researchTeam//_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="researchTeam/groupID" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;科研管理—&gt;科研组管理</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="79%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="18%" align="right" class="td2">科研组名称：</td>
            <td width="82%" class="td1">&nbsp;
            <html:text property="researchTeam/groupName" maxlength="50" attributesText='class="input" size="60" ValidateType="notempty" Msg="科研组名称不能为空"'/>
            <span class="text_red">*</span></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="18%" align="right" class="td2">负责人：</td>
            <td width="82%" class="td1">&nbsp;
            <html:text property="researchTeam/managerName" maxlength="9" attributesText='class="input" size="60" readOnly="fcc"'/>
			<html:hidden property="researchTeam/manager"/><input name="Button" type="button" class="button_02" value="选 择" elname="researchTeam/manager,researchTeam/managerName" onClick="selectSysUser('yes')"> 
            <span class="text_red">*</span></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="18%" align="right" class="td2">科研组成员：</td>
            <td width="82%" class="td1">&nbsp;
            <html:textarea property="researchTeam/memberName" attributesText='class="input" cols="50" rows="4" readOnly="fcc"'/>
            <html:hidden property="researchTeam/member"/><input name="Button" type="button" class="button_02" value="选 择" elname="researchTeam/member,researchTeam/memberName" onClick="selectSysUser()"> 
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="18%" align="right" class="td2">科研组简介：</td>
            <td width="82%" class="td1">&nbsp;
            <html:textarea property="researchTeam/remark" attributesText='class="input" cols="50" rows="4"'/></td>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
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

  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
  function selectManagerFromUser(){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	url = "oa.prResearchManage.groupManagerSelect.do?fccargs=" + fccargs;
	
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
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
		}
	
	}

  }
  
  function selectMemberFromUser(){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	url = "oa.prResearchManage.groupMemberSelect.do?fccargs=" + fccargs;
	
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
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
		}
	
	}

  }
  </script>
 