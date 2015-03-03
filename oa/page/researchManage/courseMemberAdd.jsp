<%@include file="/internet/common.jsp"%>
<script type="text/javascript">
<!--
<logic:notEqual property="msg" value="0">
alert("<bean:write property='msg'/>");
</logic:notEqual>
//-->
</script>
<div align="center">
<TABLE cellPadding="0" align="center" style="BORDER-RIGHT: black 3px solid; BORDER-TOP: white 3px solid; BORDER-LEFT: white 3px solid; WIDTH: 100%; BORDER-BOTTOM: black 3px solid; HEIGHT: 191px; BACKGROUND-COLOR: #ff9999" border="0" cellSpacing="0">
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.courseMemberAddDo.do">
<html:hidden name="Group/ProjectID" property="fid"/>
<html:hidden name="Group/ProjectType" value="0"/>
<html:hidden name="Group/AuthorNo"/>
<html:hidden name="Group/WordNum"/>
<html:hidden property="isLocal"/>
<logic:equal property="isLocal" value="1">
<html:hidden name="Group/Sex"/>
<html:hidden name="Group/Unit"/>
</logic:equal>
	<TBODY>
		<TR>
			<TD align="middle">
			<logic:equal property="isLocal" value="1">
			<SPAN class="label" id="KeTi1_Label20" style="FONT-WEIGHT: bold; FONT-SIZE: small">请填写本单位成员信息</SPAN>&nbsp;
			</logic:equal>
			<logic:equal property="isLocal" value="0">
			<SPAN class="label" id="KeTi1_Label20" style="FONT-WEIGHT: bold; FONT-SIZE: small">请填写外单位成员信息</SPAN>&nbsp;
			</logic:equal>
			</TD>
		</TR>
		<TR>
			<TD height="7" align="middle"><FONT face="宋体"></FONT></TD>
		</TR>
		<TR>
			<TD vAlign="center">
				<TABLE width="98%" cellPadding="0" border="0" cellSpacing="0">
					<TBODY>
						<TR>
							<TD width="50%"><FONT color="blue">*</FONT>
							<SPAN class="label_smaller" id="KeTi1_Label21" style="FONT-WEIGHT: bold; WIDTH: 52px; HEIGHT: 14px">姓名：</SPAN> 
							<html:text property="Group/memberName" maxlength="100" attributesText='size="20" ValidateType="notempty" Msg="姓名不能为空"'/>
							<html:hidden property="Group/OperatorID"/>
							<logic:equal property="isLocal" value="1">
							<input name="Button" type="button" style="HEIGHT: 22px;font-weight: bold;font-size: 14px;cursor: hand;color: blue;font-family: 仿宋_GB2312;" value="选 择" elname="Group/OperatorID,Group/memberName" onClick="selectSysUser('yes')">
							</logic:equal>
							</TD>
							<TD width="50%" align="right" style="FONT-WEIGHT: bold;">
<TABLE class="small" style="FONT-SIZE: smaller; WIDTH: 250px; BORDER-TOP-STYLE: dotted; BORDER-RIGHT-STYLE: dotted; BORDER-LEFT-STYLE: dotted; HEIGHT: 30px; BORDER-BOTTOM-STYLE: dotted" border="0" id="KeTi1_Roles_Ben_Radiobuttonlist">
									<TBODY>
										<TR>
											<TD align="center"><html:radio property="Group/MemberType" value="0"/>主持人</TD>
											<TD align="center"><html:radio property="Group/MemberType" value="1" checked="true"/>成员</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</TD>
		</TR>
		<logic:equal property="isLocal" value="0">
		<TR>
			<TD style="FONT-WEIGHT: bold;"><FONT color="blue">*</FONT>
			性别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<html:radio property="Group/Sex" value="1" checked="true"/>男&nbsp;&nbsp;&nbsp;&nbsp;<html:radio property="Group/Sex" value="0"/>女
			</TD>
		</TR>
		<TR>
			<TD style="FONT-WEIGHT: bold;"><FONT color="blue">*</FONT> 
			工作单位：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:text style="WIDTH: 350px" property="Group/Unit" attributesText='ValidateType="notempty" Msg="工作单位不能为空"'/>(&lt;50字符)</TD>
		</TR>
		</logic:equal>
		<TR>
			<TD style="FONT-WEIGHT: bold;">&nbsp;
			承担哪部分工作：
			<html:text style="WIDTH: 350px" property="Group/WorkFor"/>(&lt;100字符)</TD>
		</TR>
		<TR>
			<TD align="middle">
			<INPUT value="成员确认" type="button" onclick="save();" style="HEIGHT: 22px;font-weight: bold;font-size: 14px;cursor: hand;color: blue;font-family: 仿宋_GB2312;" name="KeTi1:Input_Ben_Button" id="KeTi1_Input_Ben_Button">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<INPUT value="成员放弃" type="button" onclick="javascript:RenYuan_Show()" style="WIDTH: 66px; HEIGHT: 22px">&nbsp;</TD>
		</TR>
	</TBODY>
</form>
</TABLE>
</div>

<script language="javascript">
function selectSysUser(single){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	var name = btn.elname;
	var names = name.split(",");
	
	if(single == null) single = "no";
	url = "teachWorkManage.prMakeTeachPlan.selectHead.do?fccargs=" + fccargs + "&single=" + single;
	
	
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

function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
}

function RenYuan_Show()
{
	window.parent.document.all("Members_Tr").style.display="";
    window.parent.document.all("MemberList_Tr").style.display = "";
	window.parent.document.all("LocalMembers_Tr").style.display="none";
}
</script>