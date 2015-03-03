<%@include file="/internet/common.jsp"%>
<script type="text/javascript">
  var pageSelectedClassroom = new Array();
  //日期|午别|课室ID|课室名称
  function showSelectClassroom(){  
	var tblSelectClassroomPane = document.all.selectClassroomPane;
	if (pageSelectedClassroom.length>0){
		//清掉所有列表。
		var rows = tblSelectClassroomPane.rows.length;
		for(j=rows-1;j>0;j--){
			tblSelectClassroomPane.deleteRow(j);
		}
	}
	for(i=0;i<pageSelectedClassroom.length;i++){
		var row = tblSelectClassroomPane.insertRow();
		row.className = "td1";
		var rowData = pageSelectedClassroom[i].split("|");
		var cell = row.insertCell();
		cell.insertAdjacentText("AfterBegin",rowData[0]);

		cell = row.insertCell();
		noon = "";
		if (rowData[1]==0){
			noon = "上午";
		}
		if(rowData[1]==1){
			noon = "下午";
		}
		if(rowData[1]==2){
			noon = "晚上";
		}
		cell.insertAdjacentText("AfterBegin",noon);

		cell = row.insertCell();
		cell.insertAdjacentText("AfterBegin",rowData[3]);
		
	}
  }
  
  
  function autoReadBookInfo(){
		try{
			var opener = window.opener;
			var selectpage = opener.parent["bottomFrame"].document;
			var freeclassroom = selectpage.all.freeclassroom;
			var array = new Array();
			if(typeof(freeclassroom)!="undefined"){
				for(i=0;i<freeclassroom.length;i++){
					if(freeclassroom[i].checked){
						array[array.length] = freeclassroom[i].value;
						
					}
				}
			}

			if(array.length>0){
				var firstNoon = array[0];
				var firstDate = firstNoon.substring(0,firstNoon.indexOf("|"));
				document.all["ClassroomBusinessRec/UsingDate"].value = firstDate;
				for(i=0;i<array.length;i++){
					pageSelectedClassroom[pageSelectedClassroom.length] = array[i];
				}
				showSelectClassroom();
			}
		}catch(exception){}
	}


</script>



<form method="post"  action="ICCard.prField.classRoomBookAddDo.do">
<div style="display:none" id="usingClassLogsPane"></div>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 场地管理 -&gt; 客户管理 -&gt; 客户出租 -&gt; 课室预订</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
	  </td>
    </tr>
  </table>
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="10%" align="center" bgcolor="#4A82D1" class="textb_wirte">课室预订</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="80%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
      
      
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
		<html:hidden property="ClassroomBusinessRec/Status" value="3"/>
        <tr> 
          <td align="right" class="td2">使用单位： </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/UsingOrgan"   maxlength="100" attributesText='class="input" size="50"'/> </td> 
           </tr>
        <tr> 
          <td align="right" class="td2">使用日期： </td> 
          <td class="td1" ><html:text property="ClassroomBusinessRec/UsingDate" attributesText='class="input" size="12"  ValidateType="notempty" Msg="使用日期不能为空"' readonly="true"/> <span class="text_red">*</span>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ClassroomBusinessRec/UsingDate"],"yyyy-MM-dd")></td>
        </tr>
        <tr> 
          <td align="right" class="td2">联 系 人： </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/LinkMan"  maxlength="100" attributesText='class="input" size="25"  ValidateType="notempty" Msg="联系人不能为空"'/><span class="text_red">*</span></td>
        </tr>
          <tr> 
          <td align="right" class="td2">联系电话： </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/LinkTel"  maxlength="50" attributesText='class="input" size="25" '/></td>
        </tr>
          <tr> 
          <td align="right" class="td2">有效证件名称： </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/PassPortName"  maxlength="50" attributesText='class="input" size="25" '/></td>
        </tr>
        <tr> 
          <td align="right" class="td2">证件号码： </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/PassPortNumber"  maxlength="50" attributesText='class="input" size="25" '/></td>
        </tr>
          <tr> 
          <td align="right" class="td2">预存金额： </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/PreWorth"   attributesText='class="input" size="10" ValidateType="money" Msg="预存金额必须为数字"'/></td>
        </tr>
          <tr> 
          <td align="right" class="td2">是否使用空调：</td>
          <td class="td1" ><html:radio property="ClassroomBusinessRec/IsUseAirConditioning" value="1" />是
							<html:radio property="ClassroomBusinessRec/IsUseAirConditioning" value="0"  />否</td>
        </tr>
          <tr> 
          <td align="right" class="td2">用&nbsp;&nbsp;&nbsp; 途： </td>
          <td class="td1" ><html:textarea property="ClassroomBusinessRec/Purpose" rows="5" cols="40"  /></td>
        </tr>
          <tr> 
          <td align="right" class="td2">受 理 人： </td>
          <td class="td1" ><input type="text"  name="ClassroomBusinessRec/BookActionMan" value='<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>' maxlength="50"   class="input" size="10"  ValidateType="notempty" Msg="受理人不能为空"/> <span class="text_red">*</span></td>
        </tr>
                  <tr> 
          <td align="right" class="td2">受理时间： </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/SysBookTime"   attributesText='class="input" size="25" ValidateType="notempty" Msg="受理时间不能为空"'/> <span class="text_red">*</span></td>
        </tr>
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="关 闭" onClick="window.close()"></td>
            </tr>
          </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="selectClassroomPane">
                <tr class="td_title"> 
                  <td width="20%" align="center" nowrap id="ClassroomBusinessRec.ClassroomBusinessRecName" onClick="talentsort()">时间</td>
                  <td width="20%" align="center" nowrap id="ClassroomBusinessRec.LayerNum" onClick="talentsort()">出租时段</td>
                  <td width="60%" align="center" nowrap id="ClassroomBusinessRec.RoomNum" onClick="talentsort()">课室名称</td>
                
                </tr>

				
              </table>  
          
          
          
          </td>
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
 function save(){
	var pane = document.all.usingClassLogsPane;
	var frm = document.forms[0];
	if (validater(frm)){
		if (pageSelectedClassroom.length>0){
			for(i=0;i<pageSelectedClassroom.length;i++){
				var temparray = pageSelectedClassroom[i].split("|");
				innerHTML = "<input type=\"hidden\" name=\"list[@type='UsingClassroomLogs']/UsingClassroomLogs[@hciTagIndex='"+i+"']/UsingDate[@pattern='yyyy-MM-dd']\" value=\""+temparray[0]+ "\"/>";
				innerHTML +="<input type=\"hidden\" name=\"list[@type='UsingClassroomLogs']/UsingClassroomLogs[@hciTagIndex='"+i+"']/UsingNoon\" value=\""+temparray[1]+ "\"/>";
				innerHTML +="<input type=\"hidden\" name=\"list[@type='UsingClassroomLogs']/UsingClassroomLogs[@hciTagIndex='"+i+"']/RoomID\" value=\""+temparray[2]+ "\"/>";
				pane.innerHTML += innerHTML;
			}
			frm .submit();
		}else{
			alert("请选择出租课室！");
		}
	}
 }
  
  
	// 返回到查询页面
	function goBack() {
		window.location.href = "ICCard.prField.buildingList.do";
	}
	
	
	function  fillCurrentTime(){
		var curTime = new Date();
		var curDateStr = "";
		var curTimeStr = "";
		var form = document.forms[0];
		var datetime = form["ClassroomBusinessRec/SysBookTime"].value;
		if(datetime==""){
			//设置为当前时间
             var month = curTime.getMonth()+1;
			if (month<10){
					month = "0"+month;
			}
			var curDateOfMonth = curTime.getDate();
			if (curDateOfMonth<10){
				curDateOfMonth = "0"+curDateOfMonth;
			}
			curDateStr = curTime.getFullYear()+"-"+month+"-"+curDateOfMonth;

			var hours = curTime.getHours();
            if (hours<10){
				hours = "0"+hours;
			}
			var minutes = curTime.getMinutes();
			if(minutes<10){
				minutes = "0"+minutes;
			}
			var second = curTime.getSeconds();
			if(second<10){
				second ="0"+second;
			}
			curTimeStr =curDateStr+" "+ hours+":"+minutes+":"+second;
			form["ClassroomBusinessRec/SysBookTime"].value = curTimeStr;
			}
		}
	autoReadBookInfo();
	fillCurrentTime();
  </script>
  