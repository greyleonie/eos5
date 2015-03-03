<%@include file="/internet/common.jsp"%>
<script>
function initFcc(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("部门名已存在，请重新输入！");
		</logic:greaterThan>
	</logic:present>
	document.forms[0].elements["EOSORG_T_OrganizationTEMP/managerName"].value = '<bean:write property="EOSORG_T_OrganizationTEMP/managerID" formatClass="username" formatType="operatorID"/>';
	document.forms[0].elements["EOSORG_T_OrganizationTEMP/auxiliaryManagerName"].value = '<bean:write property="EOSORG_T_OrganizationTEMP/auxiliaryManagerID" formatClass="username" formatType="operatorID"/>'
}
</script>
<body>
<form method="post" action="talent.pr.deptModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;部门管理—&gt;部门查看</td>
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
		
		<html:hidden property="isModify" />
		<html:hidden name="EOSORG_T_OrganizationTEMPOLD/orgName" property="EOSORG_T_OrganizationTEMP/orgName" />
		
		<html:hidden property="EOSORG_T_Organization/_order/col1/field"/>
		<html:hidden property="EOSORG_T_Organization/_order/col1/asc" />
		<html:hidden property="EOSORG_T_Organization/parentOrgID/criteria/value" />
		
		<html:hidden property="EOSORG_T_Organization/parentName" />
		<html:hidden property="EOSORG_T_Organization/orgLevel"/>
		<html:hidden property="EOSORG_T_OrganizationTEMP/orgID"/>
		
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
		
		
		
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
            <td width="16%" align="right" nowrap class="td2">部门名称： </td>
            <td width="35%" class="td1"><bean:write property="EOSORG_T_OrganizationTEMP/orgName" /> 
            </td>
            <td width="12%" align="right" nowrap class="td2">上级部门： </td>
            <td width="37%" class="td1"><bean:write property="EOSORG_T_Organization/parentName"/> 
              </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">负 责 人： </td>
            <td class="td1"><bean:write property="EOSORG_T_OrganizationTEMP/managerID" formatClass="username" formatType="operatorID"/>
            </td>
            <td align="right" nowrap class="td2">副负责人：</td>
            <td class="td1"><bean:write property="EOSORG_T_OrganizationTEMP/auxiliaryManagerID" formatClass="username" formatType="operatorID"/>
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">部门类别： </td>
            <td class="td1"> 
			  <logic:equal property="EOSORG_T_OrganizationTEMP/orgTypeID" value="1">
				教研部门
			  </logic:equal>
			  <logic:equal property="EOSORG_T_OrganizationTEMP/orgTypeID" value="2">
				行政部门
			  </logic:equal>
			  <logic:equal property="EOSORG_T_OrganizationTEMP/orgTypeID" value="3">
				其他
			  </logic:equal>
			  </td>
            <td align="right" nowrap class="td2">部门代码： </td>
            <td class="td1"> <bean:write property="EOSORG_T_OrganizationTEMP/orgCode" /> 
            </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">是否教学情况统计： </td>
            <td colspan="3" class="td1">
			<logic:equal property="EOSORG_T_OrganizationTEMP/Teaching" value="1">
				是
			</logic:equal>
			<logic:equal property="EOSORG_T_OrganizationTEMP/Teaching" value="0">
				否
			</logic:equal>
              </td>
          </tr>
          <tr> 
            <td align="right" nowrap class="td2">是否工作量统计： </td>
            <td colspan="3" class="td1">
			<logic:equal property="EOSORG_T_OrganizationTEMP/IsWork" value="1">
				是
			</logic:equal>
			<logic:equal property="EOSORG_T_OrganizationTEMP/IsWork" value="0">
				否
			</logic:equal>
              </td>
          </tr>
          <tr> 
            <td height="22" align="right" nowrap class="td2">部门简介： </td>
            <td colspan="3" class="td1"> <bean:write property="EOSORG_T_OrganizationTEMP/memo"/> 
            </td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              
            <td align="center"> 
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) {
		if(frm.elements["EOSORG_T_OrganizationTEMPOLD/orgName"].value!=frm.elements["EOSORG_T_OrganizationTEMP/orgName"].value) {
			frm.elements["isModify"].value = "1";
		}
	  
	  frm.submit();	
	} 
  
}
  
function selectManagerFromUser(){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	url = "talent.pr.deptToSelectManager.do?fccargs=" + fccargs;
	
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