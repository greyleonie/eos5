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
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
}

var g_AddListContainer = null;
var g_InputObject=null;
var textbookArray=new Array();
var count='<%=count%>';


if(count>0){
 <%
 for(int i=0;i<count;i++){
    talent.core.Course c=new talent.core.Course();
    c=(talent.core.Course)list.get(i);
    String title=c.getCourseTitle();
   int    orgId=c.getClassId();
   String  orgName=c.getRemarks();
   String  	operatorName=c.getOperatorname();
 %>
  textbookArray[textbookArray.length]=new Array('<%=orgId%>','<%=title%>','<%=orgName%>','<%=operatorName%>');
  <%}%>
}




  
</script>

<body>
<form name="courseForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt; 教学计划编制      
              -&gt; <logic:equal value="1" property="isAdd">新增课程</logic:equal><logic:equal value="2" property="isAdd">修改课程</logic:equal></td>     
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
      <html:hidden property="isNew" value="1"/>     
    
      <html:hidden property="courseInSubject"/>     
      <html:hidden property="loc"/><loc-4：在上报阶段 loc-1：在定框架阶段-->
      <html:hidden property="isAdd"/>     
      <html:hidden property="Course/IsAdopted"/>
      <html:hidden property="Course/ClassID"/>  
      <html:hidden property="Course/CourseID"/>   
      <html:hidden property="Course/UnitID"/>   
      <html:hidden property="Course/SpecialID"/>    
      <html:hidden property="TeachingPlanUnit/UnitID"/>  
      <html:hidden property="TeachingPlan/PlanID"/>
      <html:hidden property="TeachingPlanUnit/ClassID"/>
      <html:hidden property="TeachingPlanUnit/UnitName"/> 
      <html:hidden property="Course/ClassTime[@pattern='yyyy-MM-dd HH:mm']"/> 
      <html:hidden property="Course/finalClassTime[@pattern='yyyy-MM-dd HH:mm']"/> 
      <html:hidden property="dec"/><!--如果保存版本需要输入版本说明-->     
      <html:hidden property="saveVersion" value="0"/><!--是否保存版本-->     
      <input type="hidden" name="unitBegTime[@pattern='yyyy-MM-dd']" value="<bean:write property="TeachingPlanUnit/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>">      

      <html:hidden property="Class/ClassName"/>
      <input type="hidden" name="lastDate" value="<bean:write property="list[@type='Course']/Course[@rowNum='0']/lastDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>">      
      
      </td>
    </tr>
    <tr>
      <td class="text">&nbsp;       
       </td>
    </tr>    
    <tr >
      <td class="text" >
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" height="714">
          <tr  id="classTr">
            <td align="right" class="td2" width="117" colspan="2" height="27">班&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
            <td colspan="7" class="td1" width="781" height="27">
           <bean:write property="Class/ClassName"/>
            </td>
          </tr>
          <tr  id="unitTr">
            <td width="117" nowrap align="right" class="td2" colspan="2" height="27">教学单元：</td>
            <td colspan="7" class="td1" width="781" height="27">
            <bean:write property="TeachingPlanUnit/UnitName"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="27">日&nbsp;&nbsp;&nbsp;&nbsp;期：</td> 
            <td colspan="7" class="td1" width="781" height="27">
             <html:text property="Course/ClassDate[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
          <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Course/ClassDate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
             <span class="text_red">*</span></td>
          </tr>
           <td align="right" class="td2" width="117" colspan="2" height="27">上课时间：</td> 
            <td colspan="7" class="td1" width="781" height="27">
              <html:text property="ClassTime" value="" attributesText='class="input" size="20"' onchange="selectFClassTime()"/> <span class="text_red">*</span>
            <html:radio property="Course/ClassNoon" onclick="setClassTime('0')" value="0"/>   
            上午
             <html:radio property="Course/ClassNoon" onclick="setClassTime('1')" value="1"/>   
            下午
             <html:radio property="Course/ClassNoon" onclick="setClassTime('2')" value="2"/>   
            晚上
             <html:radio property="Course/ClassNoon" onclick="setClassTime('3')"value="3"/>   
            全天</td>
          </tr>
           <td align="right" class="td2" width="117" colspan="2" height="27">下课时间：</td> 
           <td colspan="7" class="td1" width="781" height="27">
              <html:text property="finalClassTime" value="" attributesText='class="input" size="20"'/> <span class="text_red">*</span>
            </td>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">课程标题：</td>
            <td colspan="7" class="td1" width="781" height="27">
             <html:text maxlength="50" property="Course/CourseTitle" onkeydown="javascript:actionKeyDown(this,event)" onkeyup="actionKeyUp(this,event)" attributesText='class="input" size="60" '/>
          
           教研部：<html:select property="Course/TeachingGroupID" > 
              <html:option value="-1">--选择教研部--</html:option>
               <html:options property="list[@type='EOSORG_T_Organization']/EOSORG_T_Organization/orgid" labelProperty="list[@type='EOSORG_T_Organization']/EOSORG_T_Organization/orgname"/> 
              </html:select>
           </td>
          </tr>
           <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">是否新课题：</td>
            <td colspan="7" class="td1" width="781" height="27">
               <html:radio property="Course/IsNew" value="1"/> 是
               <html:radio property="Course/IsNew" value="0"/>否               
           </td>
          </tr>          
          <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">记分方式：</td>
            <td colspan="2" class="td1" height="27">
          <dict:select businTypeId="BNDICT_unitScoreType" property="Course/ScoringMethod" />
              
              </td>  
            <td colspan="3" class="td2" nowrap height="27">
              <p align="right">是否合班上课：</td>  
            <td colspan="2" class="td1"  height="27">
            <html:radio property="Course/IsMeldClass" value="0"/>否 
             <html:radio property="Course/IsMeldClass" value="1"/>是</td>   
          </tr>
           <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">学&nbsp;&nbsp;&nbsp;&nbsp;时：</td>
            <td colspan="2" class="td1" height="27">
             <html:text maxlength="3" onblur="check(this,'学时')" property="Course/ClassHour" attributesText='class="input" size="12" '/>
              
              </td>  
            <td colspan="3" class="td2" nowrap height="27">
              <p align="right">学&nbsp;&nbsp;&nbsp;&nbsp;分：</td>  
            <td colspan="2" class="td1" width="297" height="27">
   <html:text maxlength="6" onblur="judgeValue(this)" property="Course/Credit" attributesText='class="input" size="12" '/>
          </td>   
          </tr>
          <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">授课教师：</td>
            <td colspan="7" class="td1" width="781" height="27">
             <html:hidden property="Course/Teachers"/>
            <input name="shouKe" readonly="true" type="text" value="<bean:write property="Course/shouKe"/>" class="input" size="48">
           <input name="Button" type="button" class="button_02" value="选 择" elname="Course/Teachers,shouKe" onClick="selectSysUser('yes')"> 
            <input name="Button" type="button" class="button_02" value="检查冲突"  onClick="checkDraft('1')"> 
           <input name="button" type="button" class="button_02" onclick="clearValue('1')" value="清空" style="width: 50; height: 18"></td>     
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">辅导教师：</td>
            <td colspan="7" class="td1" width="781" height="27">
            <html:hidden property="Course/Tutors"/>
            <input name="assitant" readonly="true"  value="<bean:write property="Course/fuDao"/>" type="text" class="input" size="48">
              <input name="Button" type="button" class="button_02" value="选 择" elname="Course/Tutors,assitant" onClick="selectSysUser()"> 
           <font color="#C0C0C0">（可多选）</font> 
              <input name="button" type="button" class="button_02" onclick="clearValue('2')" value="清空" style="width: 50; height: 18"></td>     
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">到课教师：</td>
            <td colspan="7" class="td1" width="781" height="27">
               <html:hidden property="Course/Attenders"/>
             <INPUT type="text" name="attenders" readonly="true"  class="input" value="<bean:write property="Course/daoKe"/>" size="48">
               <input name="Button" type="button" class="button_02" value="选 择" elname="Course/Attenders,attenders" onClick="selectSysUser()"> 
           <input name="button" type="button" class="button_02" onclick="clearValue('4')" value="清空" style="width: 50; height: 18">
          
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="27">外请教师：</td>
            <td width="80" class="td1" colspan="2" height="27">
            <html:text maxlength="25" property="Course/Outsider" attributesText='class="input" size="30" '/>
            </td>
           
            <td nowrap align="right" class="td2" height="27" colspan="4">外请教师职务：</td>
            <td width="354" class="td1" height="27">
            <html:text maxlength="25" property="Course/OutSidePost" attributesText='class="input" size="30" '/>
            </td>
          </tr>
		   <tr  id="classTr">
            <td align="right" class="td2" width="117" colspan="2" height="27">外请教师单位：</td>
            <td colspan="7" class="td1" width="781" height="27">
            <html:text maxlength="25" property="Course/OutSideOrg" attributesText='class="input" size="45" '/>
           
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">主&nbsp;持&nbsp;人：</td>
            <td class="td1" colspan="4" width="333" height="27">           
              <html:hidden property="Course/Compere"/>
             <input type="text" name="compere" readonly="true"  class="input" value="<bean:write property="Course/dj"/>" size="20">
               <input name="Button" type="button" class="button_02" value="选 择" elname="Course/Compere,compere" onClick="selectSysUser()"> 
           <input name="button" type="button" class="button_02" onclick="clearValue('5')" value="清空" style="width: 50; height: 18">
           
            </td>
            <td align="right" class="td2" width="86" height="27" colspan="2">到会教师：</td>
            <td class="td1" nowrap height="27">
              <html:hidden property="Course/Conventioneers"/>
             <input type="text" class="input" readonly="true"  name="conventioneers" value="<bean:write property="Course/daoHui"/>" size="20">
               <input name="Button" type="button" class="button_02" value="选 择" elname="Course/Conventioneers,conventioneers" onClick="selectSysUser()"> 
           <input name="button" type="button" class="button_02" onclick="clearValue('6')" value="清空" style="width: 50; height: 18">
           
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">教学模式：</td>
            <td class="td1" colspan="4" width="333" height="27"> 
                <html:select property="Course/TeahchingModelID"> 
             <html:options property="list[@type='EducatingMode']/EducatingMode/EducatingModeID" labelProperty="list[@type='EducatingMode']/EducatingMode/EducatingMode"/> 
              </html:select>
             
             
         </td>
            <td align="right" class="td2" width="86" height="27" colspan="2">课堂模式：</td>
            <td class="td1" width="354" height="27">
              <html:select property="Course/ClassModelID"  attributesText='id="printTable"'> 
             <html:options property="result[@type='RangeMode']/RangeMode/RangeModeID" labelProperty="result[@type='RangeMode']/RangeMode/RangeMode"/> 
              </html:select>
           </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2"nowrap colspan="2" height="27">课&nbsp;&nbsp;&nbsp;&nbsp;室：</td>
            <td colspan="7" class="td1" width="781" height="27">
          <html:hidden property="Course/ClassRoomID"/>
            <input name="classRoom" readOnly="true" value="<bean:write property="Course/classRoom"/>" type="text" class="input" size="30">
            <a href="javascript:selectRoom('1')" ><img src="image/house.gif" name="selRoomImg" width="18" border="0" height="15" align="absmiddle"></a>&nbsp;      
             <input name="clroom" type="button" class="button_02" onclick="clearValue('3')"  value="清空" style="width: 50; height: 18"></td>
          </tr>
          <tr>
            <td align="right" class="td2" width="23" rowspan="5" height="123">　教学辅助</td>
            <td align="right" class="td2" nowrap height="22">考&nbsp;勤&nbsp;机：</td>
            <td colspan="7" class="td1" width="781" height="22">
            <html:radio property="Course/IsUseKQJ" value="0" />   
              否  
               <html:radio property="Course/IsUseKQJ" value="1" />   
            是</td>  
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">课&nbsp;&nbsp;&nbsp;&nbsp;件：</td> 
            <td class="td1" colspan="4" width="333" height="22">
             <html:radio property="Course/IsUseCourseWare" value="0" />   
              否   
                 <html:radio property="Course/IsUseCourseWare" value="1"/>   
            是</td>   
            <td align="right" class="td2" width="86" height="22" colspan="2">手提电脑：</td>
            <td class="td1" width="354" height="22">
            <html:radio property="Course/IsUseNotebookPC" value="0" />   
  否
     <html:radio property="Course/IsUseNotebookPC" value="1"/>   
  是</td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">拍&nbsp;花&nbsp;絮：</td>
            <td class="td1" colspan="4" width="333" height="22">
              <html:radio property="Course/IsTakeFeature" value="0" />   
              否
                <html:radio property="Course/IsTakeFeature" value="1"/>   
            是</td>
            <td align="right" class="td2" width="86" height="22" colspan="2">数码照相：</td>
            <td class="td1" width="354" height="22">
               <html:radio property="Course/IsUseCamera" value="0" />   
             
  否
       <html:radio property="Course/IsUseCamera" value="1"/>   
             
  是</td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">全程摄像：</td>
            <td class="td1" colspan="4" width="333" height="22">
                <html:radio property="Course/IsUseVideo" value="0" />   
              否
                    <html:radio property="Course/IsUseVideo" value="1" />   
            是</td>
            <td align="right" class="td2" width="86" height="22" colspan="2">媒体播放：</td>
            <td class="td1" width="354" height="22">          
               <html:radio property="Course/IsUseMediaPlayer" value="0" />   
  否
   
       <html:radio property="Course/IsUseMediaPlayer" value="1"/>   
  是</td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="27">无线话筒：</td>
            <td class="td1" colspan="4" width="333" height="27">
            <html:text maxlength="4" onblur="check(this,'无线话筒')" property="Course/WiredPhones" attributesText='class="input" size="10" '/>          
            个</td>
            <td align="right" class="td2" width="86" height="27" colspan="2">有线话筒：</td>
            <td class="td1" width="354" height="27">
             <html:text maxlength="4" onblur="check(this,'有线话筒')" property="Course/RadioPhones" attributesText='class="input" size="10" '/>
          
个</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="23" rowspan="4" height="121">　后勤辅助</td>
            <td align="right" class="td2" nowrap height="20">主席台座位：</td>
            <td colspan="7" class="td1" width="781" height="20">
            <html:text maxlength="4" onblur="check(this,'主席台座位')" property="Course/PlatformSeats" attributesText='class="input" size="10" '/>
            张</td>  
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="22">学员座位：</td>
            <td class="td1" colspan="4" width="333" height="22">
           <html:text maxlength="4" onblur="check(this,'学员座位') "property="Course/StudentSeats" attributesText='class="input" size="10" '/>
             张</td>  
            <td align="right" class="td2" width="86" height="22" colspan="2">茶杯（茶叶）：</td>
            <td class="td1" width="354" height="22">
             <html:text maxlength="4" onblur="check(this,'茶杯（茶叶）')" property="Course/Cups" attributesText='class="input" size="10" '/>
           
              个</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="22">倒&nbsp;&nbsp;&nbsp;&nbsp;水：</td>
            <td class="td1" colspan="4" width="333" height="22">
            <html:radio property="Course/IsUseTea" value="0" />
              否 
                <html:radio property="Course/IsUseTea" value="1"/>
            是</td> 
            <td align="right" class="td2" width="86" height="22" colspan="2">摆&nbsp;&nbsp;&nbsp;&nbsp;花：</td>
            <td class="td1" width="354" height="22">
           <html:radio property="Course/IsUseFlower" value="0" />
  否 
    <html:radio property="Course/IsUseFlower" value="1"/>
              是</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="27">
              <p align="right">课桌布置形式：</p>
            </td>
            <td class="td1" colspan="7" width="773" height="27">
            <textarea name="Course/DeskArrange" cols="81" onblur="checkLen('课桌布置形式',this,'100')"  rows="3"><bean:write property="Course/DeskArrange"/></textarea></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="22">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td> 
            <td colspan="7" class="td1" width="781" height="22">
            <html:textarea property="Course/Remarks" onblur="checkLen('备注',this,'250')"rows="5" cols="81"/>
        </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="22">发送通知：</td>
            <td colspan="7" class="td1" width="781" height="22">
            <html:radio property="Course/IsSendNotice" value="0" tabindex="0"/>          
否
 <html:radio property="Course/IsSendNotice" value="1"/>
是</td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="button" class="button_02" value="保 存" onclick="saveCourse()">
                <input name="Submit2" type="button" class="button_02" value="返 回" onclick="javascript:history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
<p><font color="#C0C0C0"><b>说明：</b></font></p>
<p><font color="#C0C0C0">1、日期选择时，如果是上午，则时间默认为8:45，下午默认为14:30，晚上默认为19:30，全天默认为8:45。</font></p>
</body>
<script>
 var isAdd='<bean:write property="isAdd"/>';
 var time='<bean:write property="Course/ClassTime"/>';
 var ftime='<bean:write property="Course/finalClassTime"/>';
 if(isAdd=="1"){
   document.courseForm.elements["ClassTime"].value="8:45";
   document.courseForm.elements["finalClassTime"].value="11:45";
 }else{
   document.courseForm.elements["ClassTime"].value=time;
   document.courseForm.elements["finalClassTime"].value=ftime;
 }
</script>
<script language="javascript">
var frm=document.courseForm;




function selectFClassTime(){
 var time=frm.elements["ClassTime"].value;
 var array=time.split(":");
 var hours=array[0].split(""); 
 var hour;
 if(hours[0]==0){ 
 hour=parseInt(hours[1]);
 }else{
 hour=parseInt(array[0]);
 }
 var nextHour=hour+3
 if(nextHour<10){
  nextHour="0"+nextHour;
 }
 if(nextHour>24){
 nextHour=nextHour-24;
  nextHour="0"+nextHour;
 }

nextTime=nextHour+":"+array[1];
frm.elements["finalClassTime"].value=nextTime;

}
function selectModel(object){
var model =object.options[object.selectedIndex].text ;
if(model=="社会调查"){
   frm.elements["Course/IsUseKQJ"][0].checked="true";
}
else{
 frm.elements["Course/IsUseKQJ"][1].checked="true";
}
}


function checkDraft(checkType){
  var teacherId=frm.elements["Course/Teachers"].value; 
  var currentDate=frm.elements["Course/ClassDate[@pattern='yyyy-MM-dd']"].value;
  var classNoon="";
  var courseId=frm.elements["Course/CourseID"].value;
  
  var array=frm.elements["Course/ClassNoon"];
  
  for(var i=0;i<4;i++){
     var obj=array[i];
     if(obj.checked){
        classNoon=i;
        break;
     }
  }
  
  if(teacherId==""){
       alert("请先选择授课教师！");
       return;
  }
  var remark=new Date().getTime();
  var loc="teachWorkManage.prMakeTeachPlan.checTeacherDraft.do?Course/CourseID="+courseId+"&Course/ClassDate="+currentDate+"&Course/ClassNoon="+classNoon+"&Course/Teachers="+teacherId+"&remark="+remark;
  window.showModalDialog(loc,"","top:150px;left:150px;dialogWidth:600px;dialogHeight:400px");
}

function checkLen(theName,obj,limit){
   if(obj.value.length>250){
      alert(theName+"字数不能超过"+limit+"个！");
   }
}

function judgeValue(obj){
  if(obj.value!=""){
   isUnsignedNumeric(obj);
   }
}

function isUnsignedNumeric(obj)
{
 var newPar=/^\d+(\.\d+)?$/
 var flag=newPar.test(obj.value);
 if(!flag){
   alert("学分输入错误！");
   obj.focus();
   
 }
}


function setClassTime(classNoon){
   if(classNoon=="0"||classNoon=="3"){
     frm.elements["ClassTime"].value="08:45";
     frm.elements["finalClassTime"].value="11:45";
   }
   if(classNoon=="1"){
     frm.elements["ClassTime"].value="14:30";
     frm.elements["finalClassTime"].value="17:30";
   }
  if(classNoon=="2"){
     frm.elements["ClassTime"].value="19:30";
     frm.elements["finalClassTime"].value="22:30";
   }
}

function clearValue(flag){

   if(flag=="1"){  
      frm.elements["Course/Teachers"].value="";
      frm.elements["shouKe"].value="";
    
   }else if(flag=="2"){
      frm.elements["Course/Tutors"].value="";
      frm.elements["assitant"].value="";
   }else  if(flag=="3"){
      frm.elements["Course/ClassRoomID"].value="";
      frm.elements["classRoom"].value="";
   }else  if(flag=="4"){
      frm.elements["Course/Attenders"].value="";
      frm.elements["attenders"].value="";
   }else  if(flag=="5"){
      frm.elements["Course/Compere"].value="";
      frm.elements["compere"].value="";
   }else  if(flag=="6"){
      frm.elements["Course/Conventioneers"].value="";
      frm.elements["conventioneers"].value="";
   }
  
}

  function selectRoom(roomTypeID){
     var courseId=frm.elements["Course/CourseID"].value;
     var array=frm.elements["Course/ClassNoon"].value;
     var date=frm.elements["Course/ClassDate[@pattern='yyyy-MM-dd']"].value;
     var refresMark=new Date().getTime();
     var loc="teachWorkManage.prMakeTeachPlan.selectRoom.do?";
     var array=frm.elements["Course/ClassNoon"];
     var classNoon="";
     
  for(var i=0;i<4;i++){
     var obj=array[i];
     if(obj.checked){
        classNoon=i;
        break;
     }
  }
   
        loc+="roomType=1&flag=0"+"&roomTypeID="+roomTypeID+"&refreshMark="+refresMark+"&Course/CourseID="+courseId+"&Course/ClassNoon="+classNoon+"&Course/ClassDate="+date;
     var acceptValue="";
     var ids="";
     var names="";
     var onlyOne="y";
     try{
      acceptValue=window.showModalDialog(loc,onlyOne,"dialogWidth:700px;DialogHeight=480px;status:no;scroll:yes");  
      //  acceptValue=window.open(loc,onlyOne,"dialogWidth:660px;DialogHeight=480px;status:no;scroll:yes"); 
       ids=acceptValue[0];
       names=acceptValue[1];
     }catch(e){}
     
     if(roomTypeID=="1"){//教室   
        var temp=ids.substring(1,ids.length-1);       
        frm.elements["Course/ClassRoomID"].value=temp;       
        frm.elements["classRoom"].value=names;
     }
  }
  
  function save(){
    var flag=checkTime();
    frm.elements["Course/ClassTime[@pattern='yyyy-MM-dd HH:mm']"].value="1900-01-01 "+frm.elements["ClassTime"].value
    frm.elements["Course/finalClassTime[@pattern='yyyy-MM-dd HH:mm']"].value="1900-01-01 "+frm.elements["finalClassTime"].value    
    var classRoom=document.getElementById('classRoom').value;
    if(classRoom==''){
    	alert('请输入课室选项!');
    	return false;
    }
    if(flag){    
      frm.action="teachWorkManage.prMakeTeachPlan.saveCourse.do";   
    if(frm.elements["loc"].value=="6"){
       if(confirm("是否保存版本?")){
          var re=(new Date()).getTime();
          var loc="teachWorkManage.prMakeTeachPlan.noticeSaveVersion.do?re="+re;
          var dec=window.showModalDialog(loc,window,'top=200px;left=200px;dialogWidth=380px;dialogHeight=280px;status=no');    
        if(dec=="undefined")dec="";
           frm.elements["dec"].value=dec;           
           frm.elements["saveVersion"].value="1";       
             frm.submit();   
       }else{
          frm.elements["dec"].value="";      
          frm.submit();
         }//end confirm
      }//end loc==6
    }else{
       frm.submit();
    }//end flag
     if(frm.elements["loc"].value!="6"){
	    frm.submit();
	}
  }
  
 function saveCourse(){
    if(frm.elements["Course/SpecialID"].value>0){
         var flag=checkTime();
         frm.elements["Course/ClassTime[@pattern='yyyy-MM-dd HH:mm']"].value="1900-01-01 "+frm.elements["ClassTime"].value
         frm.elements["Course/finalClassTime[@pattern='yyyy-MM-dd HH:mm']"].value="1900-01-01 "+frm.elements["finalClassTime"].value 
         frm.action="teachWorkManage.prMakeTeachPlan.saveSubjectCourse.do";
        if(frm.elements["Course/ClassDate[@pattern='yyyy-MM-dd']"].value==""){  
           alert("日期不能为空！");
           return;
          }else if(frm.elements["finalClassTime"].value==""){
            alert("下课时间不能为空！");
          }else if(frm.elements["ClassTime"].value==""){
            alert("上课时间不能为空！");
          }else{
           frm.submit();   
          }
    }else{
   
     if(frm.elements["Course/ClassDate[@pattern='yyyy-MM-dd']"].value==""){  
         alert("日期不能为空！");
           return;
     }else if(frm.elements["finalClassTime"].value==""){
            alert("下课时间不能为空！");
     }else if(frm.elements["ClassTime"].value==""){
            alert("上课时间不能为空！");
     }else{
     	
      	save();
      }
    }
 }  
   
    function check(obj,theName){ 
     if(obj.value!=""&&!isInteger(obj.value)){
        alert(theName+"必须是整数！");
        return;
     }
  }
  
    function isInteger( str ){  
	var regu = /^[-]{0,1}[0-9]{1,}$/;
        return regu.test(str);
}
  
    function selectTitle(){
       var refresMark=new Date().getTime();
       var loc="teachWorkManage.prMakeTeachPlan.selectTitle.do?PageCond=&isHistory=0&keyWord=&group=-1&remark="+refresMark;
       window.open(loc,"","width=680,height=600,top=80,left=80,status=1,scrollbars=1");
     frm.elements["isNew"].value=0;
  }
  
  function selectTeacher(flag){//选择教师
      var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prClassInfoManage.selectTeacher.do?flag=1&refreshMark="+refreshMark;
     var acceptValue="";
     var ids="";
     var names="";
     try{
      acceptValue= window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=550px;status:no;scroll:yes");      
      ids=acceptValue[0];
      names=acceptValue[1];
        }catch(e){}
   
   if(flag=="0"){//如果是授课教师
        frm.elements["Course/Teachers"].value=ids;      
        frm.elements["shouKe"].value=names;
   }else{//辅导教师
        frm.elements["Course/Tutors"].value=ids;
        frm.elements["assitant"].value=names;
 }
  }
  
  function checkTime(){
    var today=date2str(new Date());    
    var courseTime=frm.elements["Course/ClassDate[@pattern='yyyy-MM-dd']"].value;
    var unitBegTime=frm.elements["unitBegTime[@pattern='yyyy-MM-dd']"].value;
    var lastDate=frm.elements["lastDate"].value;
    if(courseTime==""){
    //  alert("课程开始日期不能为空！");
      return false;
    }
    return true; 
  }
  
  function goBack(){
   if(frm.elements["loc"].value=="6"){//筛选阶段
    frm.action="teachWorkManage.prMakeTeachPlan.singleClassPlan.do?isAdopted=&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
  }else  if(frm.elements["loc"].value=="5"){//筛选阶段
    frm.action="teachWorkManage.prMakeTeachPlan.filterMainClass.do?isAdopted=&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
  }else if(frm.elements["loc"].value=="4"){//上报阶段
    frm.action="teachWorkManage.prMakeTeachPlan.mainClassReport.do?TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
  }else{
    frm.action="teachWorkManage.prMakeTeachPlan.editUnit_new.do?TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
 }
   frm.submit();
 }
 
 function   date2str(d){   
  var   ret=d.getFullYear()+"-"   
  ret+=("00"+(d.getMonth()+1)).slice(-2)+"-"   
  ret+=("00"+d.getDate()).slice(-2)+"   "   
  ret+=("00"+d.getHours()).slice(-2)+":"   
  ret+=("00"+d.getMinutes()).slice(-2)+":"   
  ret+=("00"+d.getSeconds()).slice(-2)+"."   
  return   ret+d.getMilliseconds()   
  }
  
 function   str2date(str){   
  var   d=null;   
  var   reg=/^(\d{4})-(\d{2})-(\d{2})   (\d{2}):(\d{2}):(\d{2})\.(\d+)$/   
  if(arr=str.match(reg))d=new   Date(Number(arr[1]),Number(arr[2])-1,Number(arr[3]),Number(arr[4]),Number(arr[5]),Number(arr[6]),Number(arr[7]))   
  return   d;   
  }
  
  function initPage(){//为专题新增课程不显示班级和单元2行
    if(frm.elements["courseInSubject"].value=="1"){
       classTr.style.display="none";
       unitTr.style.display="none";
    }
  }
  
   function setSelectedIndex(){
    var isAdd='<bean:write property="isAdd"/>';
    var teachModel=frm.elements["Course/TeahchingModelID"];
    var classModel=frm.elements["Course/ClassModelID"];
   
   if(isAdd==1){
      //teachModel.selectedIndex=12;
      classModel.selectedIndex=1;    
    }
  }
  
function setControlJurisdiction(){
   var currentUserOrg='<bean:write property="SessionEntity/orgID"/>';
   var delegateOrg='<bean:write property="TeachingPlanUnit/org"/>';
   var planStatus='<bean:write property="TeachingPlan/State"/>';
   
   if(planStatus=="3"&&delegateOrg==currentUserOrg){
       frm.elements["Course/IsNew"][0].disabled="true";
       frm.elements["Course/IsNew"][1].disabled="true";
       frm.elements["Course/ScoringMethod"].disabled="true";
       frm.elements["Course/IsMeldClass"][0].disabled="true";
       frm.elements["Course/IsMeldClass"][1].disabled="true";
       frm.elements["Course/ClassHour"].disabled="true";
       frm.elements["Course/Credit"].disabled="true";
       frm.elements["clroom"].style.display="none";
       frm.elements["selRoomImg"].style.display="none";
       frm.elements["Course/IsUseKQJ"][0].disabled="true";
       frm.elements["Course/IsUseKQJ"][1].disabled="true";
      
       frm.elements["Course/IsUseNotebookPC"][0].disabled="true";
       frm.elements["Course/IsUseNotebookPC"][1].disabled="true";
       frm.elements["Course/IsTakeFeature"][0].disabled="true";
       frm.elements["Course/IsTakeFeature"][1].disabled="true";
       frm.elements["Course/IsUseCamera"][0].disabled="true";
       frm.elements["Course/IsUseCamera"][1].disabled="true";
       frm.elements["Course/IsUseVideo"][0].disabled="true";
       frm.elements["Course/IsUseVideo"][1].disabled="true";
       frm.elements["Course/IsUseMediaPlayer"][0].disabled="true";
       frm.elements["Course/IsUseMediaPlayer"][1].disabled="true";
       frm.elements["Course/RadioPhones"].disabled="true";
       
       frm.elements["Course/WiredPhones"].disabled="true";
     
       frm.elements["Course/PlatformSeats"].disabled="true";  
     
       frm.elements["Course/StudentSeats"].disabled="true";
       frm.elements["Course/Cups"].disabled="true";
      
       frm.elements["Course/IsUseTea"][0].disabled="true";
       frm.elements["Course/IsUseTea"][1].disabled="true";
       frm.elements["Course/IsUseFlower"][0].disabled="true";
       frm.elements["Course/IsUseFlower"][1].disabled="true";
       frm.elements["Course/IsSendNotice"][0].disabled="true";
       frm.elements["Course/IsSendNotice"][1].disabled="true";
       
        frm.elements["Course/Remarks"].disabled="true";
   }
   
}

//授课老师为空外请老师不为空,设置显示外请老师为授课老师,清空外请老师显示
function changeTeacher(){
	if(frm.elements["shouKe"].value=="" && frm.elements["Course/Outsider"].value != ""){
	 	frm.elements["shouKe"].value = frm.elements["Course/Outsider"].value;
	 	frm.elements["Course/Outsider"].value = "";
	 }
}

  
 setSelectedIndex();  
 initPage();
 setControlJurisdiction();
 //changeTeacher();
 
 
     		
</script>