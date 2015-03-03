<%@include file="/internet/common.jsp"%>
<body onload="getCurDatetime()">
<form method="post"  action="teachWorkManage.prNetCenter.remoteTeachAddDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;网络中心教学管理—&gt;远程教学录制安排新增</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" />
		<input type="hidden" name="addaction" />
		<input type="hidden" name="modifyaction" />
		<input type="hidden" name="deleteaction" />
		<input type="hidden" name="viewaction"/>
		<html:hidden property="DistanceTeaching/_order/col1/field"/>
		<html:hidden property="DistanceTeaching/_order/col1/asc" />
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
      
      
	  <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">日&nbsp;&nbsp;&nbsp;&nbsp;期：</td>
            <td width="88%" class="td1"><html:text property="DistanceTeaching/RecordDate[@pattern='yyyy-MM-dd']" attributesText='class="input" size="20"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["DistanceTeaching/RecordDate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>              
              <input onblur="doCheckClock();getNoon()" size="10"  name="DistanceTeaching/RecordTime"  value="8:30:00">

<input onclick="document.opeForm['DistanceTeaching/RecordTime'].value='8:30:00'"  type="radio" name="DistanceTeaching/RecordNoon" value="0" checked="checked">
上午
<input onclick="document.opeForm['DistanceTeaching/RecordTime'].value='14:30:00'" type="radio" name="DistanceTeaching/RecordNoon" value="1">
下午
<input onclick="document.opeForm['DistanceTeaching/RecordTime'].value='19:00:00'" type="radio" name="DistanceTeaching/RecordNoon" value="2">
晚上
</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">频&nbsp;&nbsp;&nbsp;&nbsp;道：</td>
            <td class="td1">
              <dict:select businTypeId="dx_distanceType" property="DistanceTeaching/Channel" ></dict:select>          
                        
                        <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">课程标题：</td>
            <td class="td1"><html:text  property="DistanceTeaching/CourseTitle" maxlength="50"  attributesText='class="input" size="60"  ValidateType="notempty" Msg="课程标题不能为空"'/> <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">班&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
            <td class="td1"><input readOnly name="DistanceTeaching/Class"  class="input" size="60" >
              <img src="/internet/image/house.gif" width="18" height="15" onClick="javascript:selectClass()" align="absmiddle"></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">授课教师：</td>
            <td class="td1"><input class="input" size="60" maxlength="10" name="DistanceTeaching/Teacher"></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">授课教师单位：</td>
            <td class="td1"><input class="input" size="60" maxlength="20" name="DistanceTeaching/TeacherOrg"></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">授课教师职务：</td>
            <td class="td1"><input class="input" size="60" maxlength="10" name="DistanceTeaching/TeacherPost"></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">录&nbsp;&nbsp;&nbsp;&nbsp;制：</td>
            <td class="td1"><html:radio  value="0" property="DistanceTeaching/IsRecord"/>
              否
                <html:radio value="1" property="DistanceTeaching/IsRecord"/>
                是 &nbsp;地点 
                <input class="input" size="30" name="telenetedutitle2222"></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">直&nbsp;&nbsp;&nbsp;&nbsp;播：</td>
            <td class="td1"><html:radio value="0" property="DistanceTeaching/IsLive"/>
              否
                <html:radio value="1" property="DistanceTeaching/IsLive"/>
            是</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">放&nbsp;&nbsp;&nbsp;&nbsp;映：</td>
            <td class="td1"><html:radio value="0" property="DistanceTeaching/IsPlay"/>
              否
                <html:radio value="1" property="DistanceTeaching/IsPlay"/>
            是</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">课&nbsp;&nbsp;&nbsp;&nbsp;室：</td>
            <td class="td1"><html:text readonly="true" property="DistanceTeaching/ClassRooms"  attributesText='class="input" size="60" ValidateType="notempty" Msg="课室不能为空" '/> <span class="text_red">*</span>
              <img src="/internet/image/house.gif" width="18" height="15"  onClick="javascript:selectRoom()" align="absmiddle">&nbsp;&nbsp;
			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
            <td class="td1"><textarea class="finput" name="DistanceTeaching/Remarks"  cols="80" rows="4"></textarea></td>
          </tr>
        </table>
      
      
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                 <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>
    <div style="display:none">
  <Iframe name="verifyFrame"></Iframe>
  </div>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
  function getCurDatetime(){
  		var curTime = new Date();
		var curDateStr = "";
		var curTimeStr = "";

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
		curTimeStr = hours+":"+minutes+":"+second;
		document.opeForm["DistanceTeaching/RecordDate[@pattern='yyyy-MM-dd']"].value = curDateStr;
	//	document.opeForm['DistanceTeaching/RecordTime'].value = curTimeStr;
	}
						
function doCheckClock(){							
				var clock = document.opeForm['DistanceTeaching/RecordTime'].value;
				if (clock!=""){
					var array = clock.split(":");
					if (array.length==2||array.length==3){
						for(i=0;i<array.length;i++){
							if (isNaN(parseInt(array[i]))){
							alert("请输入正确的时间！");
							return false;
							}
					}
					if (parseInt(array[0])>24){
						alert("输入的小时不正确，请重新输入！");
						return false;
					}
					if (parseInt(array[1])>60){
						alert("输入的分钟不正确，请重新输入！");
						return false;
					}
					if (array.length==3){
						if (parseInt(array[2])>60){
						alert("输入的秒不正确，请重新输入！");
						return false;
					}
				}
					return true;
				}else{
			alert("请输入完整的上课时间！");
			return false;
			}
				}else{
					alert("请输入上课时间！");
					return false;
				}
				
				
			}


function doClearSelect(){
			document.opeForm["DistanceTeaching/ClassRooms"].value = "";
			document.opeForm.ClassRoomName.value = "";
			}
			
function selectClass(){
 	 var frm = document.opeForm;
     var loc="teachWorkManage.prNetCenter.selectClass.do";

     var acceptValue="";
     var ids="";
     var names="";
     try{
       acceptValue=window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=480px;status:no;scroll:yes");  
       ids=acceptValue[0];
       names=acceptValue[1];
     }catch(e){}

    document.opeForm["DistanceTeaching/Class"].value=names;

  }
  
  function selectRoom(){
 	 var frm = document.opeForm;
     var loc="teachWorkManage.prNetCenter.selectRoom.do";

     var acceptValue="";
     var ids="";
     var names="";
     try{
       acceptValue=window.showModalDialog(loc,"","dialogWidth:750px;DialogHeight=480px;status:no;scroll:yes");  
       ids=acceptValue[0];
       names=acceptValue[1];
     }catch(e){}

    document.opeForm["DistanceTeaching/ClassRooms"].value=names; 

  }
  
  function getNoon(){
	var clock = document.opeForm['DistanceTeaching/RecordTime'].value;
	if (clock!=""){
	var array = clock.split(":");
	if (parseInt(array[0])>12&&parseInt(array[0])<=19){
						document.opeForm['DistanceTeaching/RecordNoon'][1].checked=true;
					}else if(parseInt(array[0])>19&&parseInt(array[0])<=23){
						document.opeForm['DistanceTeaching/RecordNoon'][2].checked=true;
					}else{
						document.opeForm['DistanceTeaching/RecordNoon'][0].checked=true;
					}
	}
}
  </script>