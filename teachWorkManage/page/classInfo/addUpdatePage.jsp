<%@include file="/internet/common.jsp"%>
<SCRIPT LANGUAGE="JavaScript" type="text/javascript">

	function dayPopUpCalendarDlg(objId) {
		var obj=document.getElementById(objId);
		showx = event.screenX - event.offsetX+10;
		// + deltaX;
		showy = event.screenY - event.offsetY+10;
		// + deltaY;
		newWINwidth = 220 + 4 + 18;
		retval = window.showModalDialog("teachWorkManage.prClassInfoManage.showCalendarPage.do", "setTime", "dialogWidth:197px; dialogHeight:260px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
		if ( retval!= null ) {
			obj.value = retval;
		}
	}
</SCRIPT>
<form name="addUpdateForm" method="post"><input type="hidden" name="dataEntity/_order/col1/field" value="me"> <input
		type="hidden" name="dataEntity/_order/col1/asc" value="ASC"> <input type="hidden" name="PageCond/begin" value="0"> <input
		type="hidden" name="PageCond/count"> <input type="hidden" name="PageCond/length" value="10">
	<html:hidden property="isAdd" />
	<html:hidden property="Class/ClassID" />
	<html:hidden property="Class/isHistoryClass" />
	
	<input type="hidden" name="targetValue" value="18">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="24" background="/internet/image/lz_bg.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="15"></td>
						<td class="text_wirte">首页 -&gt; 教务管理 -&gt; 班级管理 -&gt; 班级新增</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table width="82%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="8"></td>
		</tr>
		<tr>
			<td class="text">
				<table width="82%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
					<tr onClick="changeTRBgColor(this)">
						<td width="103" align="right" class="td2">班级名称：</td>
						<td colspan="7" class="td1" width="">
							<html:text maxlength="50" property="Class/ClassName"
								attributesText='class="input" size="50" ValidateType="notempty" Msg="班级名称不能为空"' />
							<span class="text_red">*</span></td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103">班级简称：</td>
						<td nowrap class="td1" colspan="3">
							<html:text property="Class/ClassShortName" maxlength="25"
								attributesText='class="input" size="35" ValidateType="notempty" Msg="班级简称不能为空"' />
							<span class="text_red">*</span></td>
						<td align="right" class="td2">班级类型：</td>
						<td width="337" class="td1" colspan="3">
							<html:select property="Class/ClassTypeID" onkeydown="catch_keydown(this);" onkeypress="catch_press(this);">
								<html:option value="-1">--选择班级类型--</html:option>
								<html:options property="list[@type='ClassType']/ClassType/ClassTypeID"
									labelProperty="list[@type='ClassType']/ClassType/ClassType" />
							</html:select>
							<span class="text_red">*</span></td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td nowrap align="right" class="td2">培训班编号：</td>
						<td nowrap colspan="3" class="td1" >
							<html:text maxlength="20" property="Class/ClassCode" attributesText='class="input" size="30" ' /> <div class="text_red">*<input type="checkbox" name="main" onclick="setClassCode(this)" />是否自动编号</div>
							</td>
						<td nowrap align="right" class="td2">人事局系统编号：</td>
						<td width="337" class="td1" colspan="3">
							<html:text maxlength="20" property="Class/renShiNo" attributesText='class="input" size="30" ' />
						</td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td nowrap align="right" class="td2">项目名称：</td>
						<td colspan="3" class="td1" width="60">
							<html:text maxlength="20" property="Class/proName" attributesText='class="input" size="30" ' />
						</td>
						<td nowrap align="right" class="td2">教学质量评估：</td>
						<td width="100" class="td1">
							<html:radio property="Class/IsUnitEva" value="1" checked="true" />
							是
							<html:radio property="Class/IsUnitEva" value="0" />
							否</td>
						<td class="td2" width="100" align="right">外网评估：</td>
						<td class="td1" width="100">
							<html:radio property="Class/IsWebEva" value="1" checked="true" />
							是
							<html:radio property="Class/IsWebEva" value="0" />
							否</td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103">调训单位：</td>
						<td class="td1" nowrap colspan="7">
							<html:select property="Class/Commission" onkeydown="catch_keydown(this);" onkeypress="catch_press(this);">
								<html:option value="-1">--选择调训单位--</html:option>
								<html:options property="list[@type='entity']/entity/commission"
									labelProperty="list[@type='entity']/entity/commission" />
							</html:select>
							<span class="text_red">*</span> 提示：选中内容时可以直接编辑；按回车键添加新的调训单位</td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103">计划招生人数：</td>
						<td class="td1" width="100" colspan="4">
							<html:text property="Class/RecruitNum" maxlength="4"
								attributesText='class="input" size="8" ValidateType="notempty" Msg="计划招生人数不能为空" onfocus="textValidate()" onlytype="int"' />
							<span class="text_red">*</span></td>
						<td align="right" colspan="2" class="td2" nowrap>实际招生人数：</td>
						<td class="td1" width="105">
							<html:text property="Class/factNum" maxlength="4"
								attributesText='class="input" size="8" onfocus="textValidate()" onlytype="int"' />
						</td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103">学&nbsp;&nbsp;&nbsp;&nbsp;制：</td>
						<td class="td1" colspan="3">
							<html:select property="Class/XueZhi" onkeydown="catch_keydown(this);" onkeypress="catch_press(this);">
								<html:option value="-1">--选择学制--</html:option>
								<html:options property="list[@type='xueZhi']/xueZhi/xuezhi" labelProperty="list[@type='entity']/xueZhi/xuezhi" />
							</html:select>
							<span class="text_red">*</span></td>
						<td align="right" class="td2">学&nbsp;习&nbsp;日：</td>
						<td class="td1" nowrap>
							<html:text property="Class/XueRi"
								attributesText='class="input" size="4" ValidateType="notempty" Msg="学习日不能为空" onfocus="textValidate()" onlytype="int"' />
							天 <span class="text_red">*</span></td>
						<td class="td2" width="100" align="right">班级级别：</td>
						<td class="td1" width="100"><select name="Class/levelId">
								<OPTION value="-1">请选择</OPTION>
								<logic:equal property="isAdd" value="1">
									<logic:iterate id="classLevlList1" property="list[@type='ClassLevl']">
										<option value="<bean:write id="classLevlList1" property="ClassLevl/levelId"/>">
											<bean:write id="classLevlList1" property="ClassLevl/levelName" />
										</option>
									</logic:iterate>
								</logic:equal>
								<logic:notEqual property="isAdd" value="1">
									<logic:iterate id="classLevlList" property="list[@type='ClassLevl']">
										<logic:equal value="ClassLevl/levelId" valueType="variable" valueId="classLevlList" property="Class/levelId">
											<option value="<bean:write id="classLevlList" property="ClassLevl/levelId"/>" selected>
												<bean:write id="classLevlList" property="ClassLevl/levelName" />
											</option>
										</logic:equal>
										<logic:notEqual value="ClassLevl/levelId" valueType="variable" valueId="classLevlList"
											property="Class/levelId">
											<option value="<bean:write id="classLevlList" property="ClassLevl/levelId"/>">
												<bean:write id="classLevlList" property="ClassLevl/levelName" />
											</option>
										</logic:notEqual>
									</logic:iterate>
								</logic:notEqual>
							</select></td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103">培&nbsp;训&nbsp;费：</td>
						<td class="td1" width="326" colspan="3">
							<html:text property="Class/EducatStand" maxlength="25"
								attributesText='class="input" size="8" onfocus="textValidate()" onlytype="int"' />
							元</td>
						<td align="right" class="td2">考&nbsp;察&nbsp;费：</td>
						<td class="td1" width="87">
							<html:text property="Class/KaoChaStand" maxlength="25"
								attributesText='class="input" size="8" onfocus="textValidate()" onlytype="int"' />
							元</td>
						<td align="right" class="td2" width="98">其&nbsp;他&nbsp;费：</td>
						<td class="td1" width="105" nowrap>
							<html:text property="Class/otherMoney" maxlength="10"
								attributesText='class="input" size="10" onfocus="textValidate()" onlytype="int"' />
							元</td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103">注册时间：</td>
						<td class="td1" width="326" colspan="3">
							<html:text property="Class/regTime[@pattern='yyyy-MM-dd  HH:mm:ss']"
								attributesText='class="input" id="reg" size="30" ValidateType="notempty" Msg="注册时间不能为空"' />
							<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick='dayPopUpCalendarDlg("reg")'>
							<span class="text_red">*</span></td>
						<td align="right" class="td2">报到时间：</td>
						<td class="td1" colspan="3" width="337">
							<html:text property="Class/reachTime[@pattern='yyyy-MM-dd HH:mm:ss']"
								attributesText='class="input" id="reachDate" size="30" ValidateType="notempty" Msg="报到时间不能为空"' />
							<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle"
								onClick='dayPopUpCalendarDlg("reachDate")'> <span class="text_red">*</span></td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103">开班时间：</td>
						<td class="td1" width="326" colspan="3">
							<html:text property="Class/BeginTime[@pattern='yyyy-MM-dd']"
								attributesText='class="input" id="beginTime" size="30" ValidateType="notempty" Msg="开班时间不能为空"' readonly="true" />
							<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle"
								onClick='dayPopUpCalendarDlg("beginTime")'> <span
								class="text_red">*</span></td>
						<td align="right" class="td2">毕(结)业时间：</td>
						<td class="td1" colspan="3" width="337">
							<html:text property="Class/EndTime[@pattern='yyyy-MM-dd']"
								attributesText='class="input" id="endTime" size="30" ValidateType="notempty" Msg="毕(结)业时间不能为空"' readonly="true" />
							<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle"
								onClick='dayPopUpCalendarDlg("endTime")'> <span
								class="text_red">*</span></td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103">上课地点：</td>
						<td class="td1" width="326" colspan="3">
							<html:hidden property="Class/ClassroomID" />
							<input name="classRoom" type="text" value='<bean:write property="Class/classRoomName"/>' class="input"
								readonly="true" size="30"> <a href="javascript:selectRoom('1','0')"> <img src="/internet/image/house.gif"
									width="18" border="0" height="15" align="absmiddle"></a><span class="text_2"></span></td>
						<td align="right" class="td2">住宿地点：</td>
						<td class="td1" colspan="3" width="337">
							<html:hidden property="Class/BuildingID" />
							<input name="liveBuilding" value="<bean:write property="Class/buildingName"/>" type="text" class="input"
								size="30"> <a href="javascript:selectRoom('2','1')"> <img src="/internet/image/house.gif" width="18" height="15"
									border="0" align="absmiddle"></a><span class="text_2">（可多选）</span></td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103">就餐标准：</td>
						<td colspan="3" class="td1" width="780">
							<html:text property="Class/RepastStand" maxlength="25" attributesText='class="input" size="30"' />
						</td>
						<td align="right" class="td2">学号前缀：</td>
						<td colspan="3" class="td1" width="780">
							<html:text property="Class/Prefix" maxlength="25" attributesText='class="input" size="25"' />
						</td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103">就&nbsp;餐&nbsp;卡：</td>
						<td class="td1" width="109"><select name="Class/RepastCard" style="width: 71; height: 23" size="1">
								<option value="0" selected>请选择</option>
								<option value="1">IC卡</option>
								<option value="2">纸卡</option>
								<option value="3">餐票</option>
							</select></td>
						<script>

							var cardType='<bean:write property="Class/RepastCard"/>';
							if (cardType!="") {
								document.addUpdateForm.elements["Class/RepastCard"][cardType].selected=true;
							}
						</script>
						<td align="right" class="td2" nowrap>就餐类型：</td>
						<td class="td1" width="109"><select name="Class/RepastTypeID" style="width: 71; height: 23" size="1">
								<option value="-1" selected>请选择</option>
								<logic:equal property="isAdd" value="1">
									<logic:iterate id="rePastTypeList" property="list[@type='RepastType']">
										<option value="<bean:write id="rePastTypeList" property="RepastType/RepastTypeID"/>">
											<bean:write id="rePastTypeList" property="RepastType/RepastType" />
										</option>
									</logic:iterate>
								</logic:equal>
								<logic:notEqual property="isAdd" value="1">
									<logic:iterate id="rePastTypeList" property="list[@type='RepastType']">
										<logic:equal value="RepastType/RepastTypeID" valueType="variable" valueId="rePastTypeList"
											property="Class/RepastTypeID">
											<option value="<bean:write id="rePastTypeList" property="RepastType/RepastTypeID"/>" selected>
												<bean:write id="rePastTypeList" property="RepastType/RepastType" />
											</option>
										</logic:equal>
										<logic:notEqual value="RepastType/RepastTypeID" valueType="variable" valueId="rePastTypeList"
											property="Class/RepastTypeID">
											<option value="<bean:write id="rePastTypeList" property="RepastType/RepastTypeID"/>">
												<bean:write id="rePastTypeList" property="RepastType/RepastType" />
											</option>
										</logic:notEqual>
									</logic:iterate>
								</logic:notEqual>
							</select></td>
						<td align="right" class="td2">预存金额：</td>
						<td class="td1" colspan="3" width="337">
							<html:text property="Class/Deposit" onblur="checkMoney(this)" maxlength="4"
								attributesText='class="input" size="8" onfocus="textValidate()" onlytype="int"' />
							元</td>
					</tr>
					<tr>
						<td align="right" class="td2" width="103">班&nbsp;主&nbsp;任：</td>
						<td class="td1" width="326" colspan="3"><input name="HeadTeacher" readonly="true"
								value="<bean:write property="Class/headTeacher"/>" type="text" class="input" size="15">
							<html:hidden property="Class/HeadTeacherID" />
							<input name="Button" type="button" class="button_02" value="选 择" elname="Class/HeadTeacherID,HeadTeacher"
								onClick="selectHead('yes')"> <span class="text_2">（单选）</span></td>
						<td align="right" class="td2">副班主任：</td>
						<td class="td1" colspan="3" width="337" nowrap><input name="TeacherString" readonly="true"
								value="<bean:write property="Class/teacherAssistant"/>" type="text" class="input" size="25">
							<html:hidden property="Class/TeacherString" />
							<input name="Button" type="button" class="button_02" value="选 择" elname="Class/TeacherString,TeacherString"
								onClick="selectHead()"> <span class="text_2">（可多选）</span></td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103" nowrap>制作通讯录：</td>
						<td class="td1" width="326" colspan="3">
							<html:radio property="Class/makeLinkBook" value="1" />
							是
							<html:radio property="Class/makeLinkBook" value="0" />
							否</td>
						<td align="right" class="td2">制作学员名册：</td>
						<td class="td1" width="320" colspan="3">
							<html:radio property="Class/makeStuBook" value="1" />
							是
							<html:radio property="Class/makeStuBook" value="0" />
							否</td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103" nowrap>订报纸：</td>
						<td class="td1" width="326" colspan="3">
							<html:radio property="Class/buyNewspaper" value="1" />
							是
							<html:radio property="Class/buyNewspaper" value="0" />
							否</td>
						<td align="right" class="td2">拍集体照：</td>
						<td class="td1" width="320" colspan="3">
							<html:radio property="Class/takePhoto" value="1" />
							是
							<html:radio property="Class/takePhoto" value="0" />
							否</td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td width="103" align="right" class="td2">报到地点：</td>
						<td colspan="7" class="td1">
							<html:hidden property="Class/regRoom" />
							<input name="regRoom" readonly="true" value="<bean:write property="regRoom"/>" type="text" class="input"
								size="25"> <a href="javascript:selectRoom('1','1')"> <img src="/internet/image/house.gif" width="18" border="0"
									height="15" align="absmiddle"></a></td>
					</tr>
					<tr onClick="changeTRBgColor(this)">
						<td align="right" class="td2" width="103">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
						<td colspan="7" class="td1" width="780"><TEXTAREA maxlength="100" name="Class/Remark" cols="86" rows="6">
								<bean:write property="Class/Remark" /></TEXTAREA></td>
					</tr>
				</table>
				<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td align="center"><input  name="Submit" type=button class="button_02" onclick="save()" value="保 存"> <input
								name="Submit2" onClick="history.go(-1)" type="button" class="button_02" value="返 回"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="text">&nbsp;</td>
		</tr>
	</table>
</form>
<p><font color="#C0C0C0"><b>说明：</b></font></p>
<p><font color="#C0C0C0">班主任通过弹出窗口选择，一般是学员处人员，也可以是其他部门人员或者校外人员，</font></p>
<p><font color="#C0C0C0">在选择时，应将学员处排在前面。教务处排在其次。如果是外单位人员，通过手工录入。</font></p>
<script language="javascript">

	function setClassCode(obj){
		if(obj.checked){
		document.getElementById('Class/ClassCode').value='<bean:write property="classCode"/>';
			document.getElementById('Class/ClassCode').readOnly = true;  
			
		}else{
			document.getElementById('Class/ClassCode').value='';
			document.getElementById('Class/ClassCode').readOnly = false;
		}
	}

  function save(){
  var frm=document.addUpdateForm;
    frm.action="teachWorkManage.prClassInfoManage.saveClassInfo.do";
    if(validater(document.addUpdateForm)){
    if(frm.elements["Class/Deposit"].value==""){
      frm.elements["Class/Deposit"].value=0;
    }
    
    if(frm.elements["Class/Commission"].value=="-1"){
      alert("请选择调训单位！");
      return;
    }
    
    if(frm.elements["Class/ClassCode"].value==""){
      alert("请输入培训班编号！");
      return;
    }
    
    if(frm.elements["Class/XueZhi"].value=="-1"){
      alert("请选择或者输入学制！");
      return;
    }
    
     if(frm.elements["Class/ClassTypeID"].value=="-1"){
      alert("请选择班级类型！");
      return;
    }
    
    if(isNaN(frm.elements["Class/XueRi"].value)){
       alert("学习日必须是数字！");
       return;
    }
          document.addUpdateForm.submit();
    }
  }
  
  function check(obj,theName){ 
     if(obj.value!=""&&!isInteger(obj.value)){
        alert(theName+"必须是整数！");
        return;
     }
  }
  
function isUnsignedInteger(strInteger)
{
var newPar=/^\d+$/
alert(newPar.test(strInteger));
}
  
  
  function isInteger( str ){  
	var regu = /^[-]{0,1}[0-9]{1,}$/;
        return regu.test(str);
}
  
  function selectTeacher(flag){ //选择教师
     var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prClassInfoManage.selectTeacher.do?flag="+flag+"&refreshMark="+refreshMark;
     var acceptValue="";
     var ids="";
     var names="";
     try{
    acceptValue= window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=550px;status:no;scroll:yes");      
      ids=acceptValue[0];
      names=acceptValue[1];
        }catch(e){}
   
   if(flag=="0"){//如果是班主任
        document.addUpdateForm.elements["Class/HeadTeacherID"].value=ids;
        document.addUpdateForm.elements["HeadTeacher"].value=names;
   }else{//副的
        document.addUpdateForm.elements["Class/TeacherString"].value=ids;
        document.addUpdateForm.elements["TeacherString"].value=names;
 }
    
  }
  
  function selectRoom(roomTypeID,flag){
     var refresMark=new Date().getTime();
     var loc="teachWorkManage.prClassInfoManage.selectRoom.do?";
     if(roomTypeID=="2"){
       loc="teachWorkManage.prClassInfoManage.selectBuilding.do?";
     }
        loc+="flag=1"+"&roomTypeID="+roomTypeID+"&refreshMark="+refresMark;
     var acceptValue="";
     var ids="";
     var names="";
     try{
    
       acceptValue=window.showModalDialog(loc,"","dialogWidth:730px;DialogHeight=540px;status:yes;scroll:yes");  
       ids=acceptValue[0];
       names=acceptValue[1];
     }catch(e){}
     
     if(roomTypeID=="1"){//教室
        var target=",";
        if(ids!=""){
          ids=ids.replace(new RegExp(target,"g"),"");
          ids=ids.trim();
        }
        if(flag=='0'){
        document.addUpdateForm.elements["Class/ClassroomID"].value=ids;
        document.addUpdateForm.elements["classRoom"].value=names;
        }else{
            document.addUpdateForm.elements["Class/regRoom"].value=ids;
            document.addUpdateForm.elements["regRoom"].value=names;
        }
     }else{//住宿
        document.addUpdateForm.elements["Class/BuildingID"].value=ids;
        document.addUpdateForm.elements["liveBuilding"].value=names;
     }
  }
  
  
  
  
  function checkForm(){
      var frm=document.addUpdateForm;
      if(frm.elements[""].value=="-1"){
          alert("请选择班级类型！");
          return;
      }
  }
  
  function checkMoney(obj){
    var result= isMoney(obj.value);
    if(!result){
      alert("预存金额错误，只能是正整数！");
      obj.focus();
    }
  
    if(obj.value!=""&&obj.value.charAt(0)=="-"){
        alert("预存金额错误，只能是正整数！");
      obj.focus();
    }
  }
  
function setCommission(){
 var frm=document.addUpdateForm;
 var obj=frm.elements["selCommission"];
  if(frm.elements["selCommission"].value!="-1")
   frm.elements["Class/Commission"].value=obj.options[obj.selectedIndex].text;
}
  
  function goBack(){
      var isHistoryClass=frm.elements["Class/isHistoryClass"].value;
      var frm=document.addUpdateForm;
      frm.action="teachWorkManage.prClassInfoManage.classInfoList.do?PageCond/begin=0&Class/isHistoryClass/criteria/value="+isHistoryClass;
      frm.target="_self";
      frm.submit();
  }
  
  //-------------------------------------------------------------------------------------------------------------------
   function catch_keydown(sel){
	switch(event.keyCode)
	{
		case 13:
			//Enter;
			sel.options[sel.length] = new Option("","",false,true);
			event.returnValue = false;
			break;
		case 27:
			//Esc;
			alert("text:" + sel.options[sel.selectedIndex].text + ", value:" + sel.options[sel.selectedIndex].value + ";");
			event.returnValue = false;
			break;
		case 46:
			//Delete;
			if(confirm("确定删除当前选项吗?"))
			{
				sel.options[sel.selectedIndex] = null;
				if(sel.length>0)
				{
					sel.options[0].selected = true;
				}
			}
			event.returnValue = false;
			break;
		case 8:
			//Back Space;
			var s = sel.options[sel.selectedIndex].text;
			sel.options[sel.selectedIndex].text = s.substr(0,s.length-1);
			event.returnValue = false;
			break;
	}	
}
//----------------------------------------------------------------------------------------------------------  
function catch_press(sel){
try{
	sel.options[sel.selectedIndex].text = sel.options[sel.selectedIndex].text + String.fromCharCode(event.keyCode);
	sel.options[sel.selectedIndex].value=sel.options[sel.selectedIndex].text;
	event.returnValue = false;
	}catch(e){}
}



function selectHead(single){
  selectSysUser(single);
}

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
	url = "teachWorkManage.prMakeTeachPlan.selectHead.do?fccargs=" + fccargs + "&single=" + single+"&orgId="+document.forms[0].elements["targetValue"].value;
	
	
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
	//var retArr = window.open(url);
	
	
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