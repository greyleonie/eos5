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
 %>
  textbookArray[textbookArray.length]=new Array('<%=orgId%>','<%=title%>','<%=orgName%>');
  <%}%>
}
</script>
<body>
<form name="courseForm" method="post">

  <table width="98%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="98%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ -&gt; ������� -&gt; ��ѧ�ƻ�����      
              -&gt; <logic:equal value="1" property="isAdd">�����γ�</logic:equal><logic:equal value="2" property="isAdd">�޸Ŀγ�</logic:equal></td>     
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
       <html:hidden property="isNew" value="1"/>     
      <html:hidden property="courseInSubject"/>     
      <html:hidden property="loc"/><loc-4�����ϱ��׶� loc-1���ڶ���ܽ׶�-->
      <html:hidden property="isAdd"/>     
      <html:hidden property="Course/IsAdopted"/>
      <html:hidden property="Course/ClassID"/>  
      <html:hidden property="Course/CourseID"/>   
      <html:hidden property="Course/UnitID"/>   
      <html:hidden property="Course/SpecialID"/>    
      <html:hidden property="TeachingPlanUnit/UnitID"/>  
      <html:hidden property="TeachingPlan/PlanID"/>
      <html:hidden property="TeachingPlan/State"/>
      <html:hidden property="TeachingPlanUnit/ClassID"/>
      <html:hidden property="TeachingPlanUnit/UnitName"/>    
      <html:hidden property="Course/ClassTime[@pattern='yyyy-MM-dd HH:mm']"/>   
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
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" height="714">
          <tr  id="classTr">
            <td align="right" class="td2" width="" colspan="2" height="27">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td colspan="7" class="td1" width="" height="27">
           <bean:write property="Class/ClassName"/>
            </td>
          </tr>
          <tr  id="unitTr">
            <td width="" nowrap align="right" class="td2" colspan="2" height="27">��ѧ��Ԫ��</td>
            <td colspan="7" class="td1" width="" height="27">
            <bean:write property="TeachingPlanUnit/UnitName"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="" colspan="2" height="27">��&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�</td> 
            <td colspan="7" class="td1" width="" height="27">
             <html:text property="Course/ClassDate[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
          <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Course/ClassDate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
             <span class="text_red">*</span>
              <html:text property="ClassTime" value="" attributesText='class="input" size="20"' readonly=""/>
            <html:radio property="Course/ClassNoon" onclick="setClassTime('0')" value="0"/>   
            ����
             <html:radio property="Course/ClassNoon" onclick="setClassTime('1')" value="1"/>   
            ����
             <html:radio property="Course/ClassNoon" onclick="setClassTime('2')" value="2"/>   
            ����
             <html:radio property="Course/ClassNoon" onclick="setClassTime('3')"value="3"/>   
            ȫ��</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">�γ̱��⣺</td>
            <td colspan="7" class="td1" width="" height="27">
            <html:text maxlength="50" property="Course/CourseTitle" onkeydown="javascript:actionKeyDown(this,event)" onkeyup="actionKeyUp(this,event)" attributesText='class="input" size="60" '/>
            ���в���<html:select property="Course/TeachingGroupID" > 
              <html:option value="-1">--ѡ����в�--</html:option>
               <html:options property="list[@type='EOSORG_T_Organization']/EOSORG_T_Organization/orgid" labelProperty="list[@type='EOSORG_T_Organization']/EOSORG_T_Organization/orgname"/> 
              </html:select>
 </td>
          </tr>
             <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">�Ƿ��¿��⣺</td>
            <td colspan="7" class="td1" width="" height="27">
               <html:radio property="Course/IsNew" value="1"/> ��
               <html:radio property="Course/IsNew" value="0"/>��               
           </td>
          </tr> 
          <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">�Ƿַ�ʽ��</td>
            <td colspan="2" class="td1" height="27">
          <dict:select businTypeId="BNDICT_unitScoreType" property="Course/ScoringMethod" />
              
              </td>  
            <td colspan="3" class="td2" nowrap height="27">
              <p align="right">�Ƿ�ϰ��ϿΣ�</td>  
            <td colspan="2" class="td1"  height="27">
            <html:radio property="Course/IsMeldClass" value="0"/>�� 
             <html:radio property="Course/IsMeldClass" value="1"/>��</td>   
          </tr>
           <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">ѧ&nbsp;&nbsp;&nbsp;&nbsp;ʱ��</td>
            <td colspan="2" class="td1" height="27">
             <html:text maxlength="3" onblur="check(this,'ѧʱ')" property="Course/ClassHour" attributesText='class="input" size="12" '/>
              
              </td>  
            <td colspan="3" class="td2" nowrap height="27">
              <p align="right">ѧ&nbsp;&nbsp;&nbsp;&nbsp;�֣�</td>  
            <td colspan="2" class="td1" width="297" height="27">
   <html:text maxlength="6" onblur="judgeValue(this)" property="Course/Credit" attributesText='class="input" size="12" '/>
          </td>   
          </tr>
          <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">�ڿν�ʦ��</td>
            <td colspan="7" class="td1" width="" height="27">
             <html:hidden property="Course/Teachers"/>
            <input name="shouKe" readonly="true" type="text" value="<bean:write property="Course/shouKe"/>" class="input" size="48">
           <input name="Button" type="button" class="button_02" value="ѡ ��" elname="Course/Teachers,shouKe" onClick="selectSysUser('yes')"> 
            <input name="Button" type="button" class="button_02" value="����ͻ"  onClick="checkDraft('1')"> 
           <input name="button" type="button" class="button_02" onclick="clearValue('1')" value="���" style="width: 50; height: 18"></td>     
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">������ʦ��</td>
            <td colspan="7" class="td1" width="" height="27">
            <html:hidden property="Course/Tutors"/>
            <input name="assitant" readonly="true"  value="<bean:write property="Course/fuDao"/>" type="text" class="input" size="48">
              <input name="Button" type="button" class="button_02" value="ѡ ��" elname="Course/Tutors,assitant" onClick="selectSysUser()"> 
           <font color="#C0C0C0">���ɶ�ѡ��</font> 
              <input name="button" type="button" class="button_02" onclick="clearValue('2')" value="���" style="width: 50; height: 18"></td>     
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">���ν�ʦ��</td>
            <td colspan="7" class="td1" width="" height="27">
               <html:hidden property="Course/Attenders"/>
             <INPUT type="text" name="attenders" readonly="true"  class="input" value="<bean:write property="Course/daoKe"/>" size="48">
               <input name="Button" type="button" class="button_02" value="ѡ ��" elname="Course/Attenders,attenders" onClick="selectSysUser()"> 
          <input name="button" type="button" class="button_02" onclick="clearValue('4')" value="���" style="width: 50; height: 18">
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="" colspan="2" height="27">�����ʦ��</td>
            <td  class="td1" height="27">
            <html:text maxlength="25" property="Course/Outsider" attributesText='class="input" size="30" '/>
            </td>
           
            <td nowrap align="right" class="td2" height="27" colspan="2">�����ʦְ��</td>
            <td  class="td1" colspan="4" height="27">
            <html:text maxlength="25" property="Course/OutSidePost" attributesText='class="input" size="30" '/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="" colspan="2" height="27">�����ʦ��λ��</td>
            <td width="" class="td1" colspan="7" height="27"> <html:text maxlength="25" property="Course/OutSideOrg" attributesText='class="input" size="35" '/>
            </td>
          
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">��&nbsp;��&nbsp;�ˣ�</td>
            <td class="td1" colspan="4" width="" height="27">           
              <html:hidden property="Course/Compere"/>
             <input type="text" name="compere" readonly="true"  class="input" value="<bean:write property="Course/dj"/>" size="20">
               <input name="Button" type="button" class="button_02" value="ѡ ��" elname="Course/Compere,compere" onClick="selectSysUser()"> 
          <input name="button" type="button" class="button_02" onclick="clearValue('5')" value="���" style="width: 50; height: 18">
            </td>
            <td align="right" class="td2" width="" height="27" colspan="2">�����ʦ��</td>
            <td class="td1" nowrap height="27">
              <html:hidden property="Course/Conventioneers"/>
             <input type="text" class="input" readonly="true"  name="conventioneers" value="<bean:write property="Course/daoHui"/>" size="20">
               <input name="Button" type="button" class="button_02" value="ѡ ��" elname="Course/Conventioneers,conventioneers" onClick="selectSysUser()"> 
          <input name="button" type="button" class="button_02" onclick="clearValue('6')" value="���" style="width: 50; height: 18">
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">��ѧģʽ��</td>
            <td class="td1" colspan="4" width="" height="27"> 
             <html:select property="Course/TeahchingModelID"> 
             <html:options property="list[@type='EducatingMode']/EducatingMode/EducatingModeID" labelProperty="list[@type='EducatingMode']/EducatingMode/EducatingMode"/> 
              </html:select>
             
         </td>
            <td align="right" class="td2" width="" height="27" colspan="2">����ģʽ��</td>
            <td class="td1" width="" height="27">
              <html:select property="Course/ClassModelID"  attributesText='id="printTable"'> 
             <html:options property="result[@type='RangeMode']/RangeMode/RangeModeID" labelProperty="result[@type='RangeMode']/RangeMode/RangeMode"/> 
              </html:select>
           </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2"nowrap colspan="2" height="27">��&nbsp;&nbsp;&nbsp;&nbsp;�ң�</td>
            <td colspan="7" class="td1" width="" height="27">
          <html:hidden property="Course/ClassRoomID"/>
            <input name="classRoom" value="<bean:write property="Course/classRoom"/>" type="text" class="input" size="30">
            <a href="javascript:selectRoom('1')" ><img src="image/house.gif" width="18" border="0" height="15" align="absmiddle"></a>&nbsp;      
             <input name="button2" type="button" class="button_02" onclick="clearValue('3')"  value="���" style="width: 50; height: 18"></td>
          </tr>
          <tr>
            <td align="right" class="td2"  rowspan="5" height="123">����ѧ����</td>
            <td align="right" class="td2" nowrap height="22">��&nbsp;��&nbsp;����</td>
            <td colspan="7" class="td1" width="" height="22">
            <html:radio property="Course/IsUseKQJ" value="0"/>   
              ��  
               <html:radio property="Course/IsUseKQJ" value="1" />   
            ��</td>  
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">��&nbsp;&nbsp;&nbsp;&nbsp;����</td> 
            <td class="td1" colspan="4" width="" height="22">
             <html:radio property="Course/IsUseCourseWare" value="0" />   
              ��   
                 <html:radio property="Course/IsUseCourseWare" value="1"/>   
            ��</td>   
            <td align="right" class="td2"  height="22" colspan="2">������ԣ�</td>
            <td class="td1" width="" height="22">
            <html:radio property="Course/IsUseNotebookPC" value="0" />   
  ��
     <html:radio property="Course/IsUseNotebookPC" value="1"/>   
  ��</td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">��&nbsp;��&nbsp;����</td>
            <td class="td1" colspan="4" height="22">
              <html:radio property="Course/IsTakeFeature" value="0" />   
              ��
                <html:radio property="Course/IsTakeFeature" value="1"/>   
            ��</td>
            <td align="right" class="td2"  height="22" colspan="2">�������ࣺ</td>
            <td class="td1" width="" height="22">
               <html:radio property="Course/IsUseCamera" value="0" />   
             
  ��
       <html:radio property="Course/IsUseCamera" value="1"/>   
             
  ��</td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">ȫ������</td>
            <td class="td1" colspan="4" width="" height="22">
                <html:radio property="Course/IsUseVideo" value="0" />   
              ��
                    <html:radio property="Course/IsUseVideo" value="1" />   
            ��</td>
            <td align="right" class="td2" width="" height="22" colspan="2">ý�岥�ţ�</td>
            <td class="td1" width="" height="22">          
               <html:radio property="Course/IsUseMediaPlayer" value="0" />   
  ��
   
       <html:radio property="Course/IsUseMediaPlayer" value="1"/>   
  ��</td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="27">���߻�Ͳ��</td>
            <td class="td1" colspan="4" width="" height="27">
            <html:text maxlength="4" onblur="check(this,'���߻�Ͳ')" property="Course/RadioPhones" attributesText='class="input" size="10" '/>          
            ��</td>
            <td align="right" class="td2" height="27" colspan="2">���߻�Ͳ��</td>
            <td class="td1" width="" height="27">
             <html:text maxlength="4" onblur="check(this,'���߻�Ͳ')" property="Course/WiredPhones" attributesText='class="input" size="10" '/>
          
��</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2"  rowspan="4" height="121">�����ڸ���</td>
            <td align="right" class="td2" nowrap height="20">��ϯ̨��λ��</td>
            <td colspan="7" class="td1" width="" height="20">
            <html:text maxlength="4" onblur="check(this,'��ϯ̨��λ')" property="Course/PlatformSeats" attributesText='class="input" size="10" '/>
            ��</td>  
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="22">ѧԱ��λ��</td>
            <td class="td1" colspan="4" width="" height="22">
           <html:text maxlength="4" onblur="check(this,'ѧԱ��λ') "property="Course/StudentSeats" attributesText='class="input" size="10" '/>
             ��</td>  
            <td align="right" class="td2" height="22" nowrap colspan="2">�豭����Ҷ����</td>
            <td class="td1" width="" height="22">
             <html:text maxlength="4" onblur="check(this,'�豭����Ҷ��')" property="Course/Cups" attributesText='class="input" size="10" '/>
           
              ��</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="22">��&nbsp;&nbsp;&nbsp;&nbsp;ˮ��</td>
            <td class="td1" colspan="4" width="" height="22">
            <html:radio property="Course/IsUseTea" value="0" />
              �� 
                <html:radio property="Course/IsUseTea" value="1"/>
            ��</td> 
            <td align="right" class="td2" width="" height="22" colspan="2">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td class="td1" width="" height="22">
           <html:radio property="Course/IsUseFlower" value="0" />
  �� 
    <html:radio property="Course/IsUseFlower" value="1"/>
              ��</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="27">
              <p align="right">����������ʽ��</p>
            </td>
            <td class="td1" colspan="7" width="" height="27">
            <textarea name="Course/DeskArrange" cols="81" onblur="checkLen('����������ʽ',this,'100')"  rows="3"><bean:write property="Course/DeskArrange"/></textarea></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="" colspan="2" height="22">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td> 
            <td colspan="7" class="td1" width="" height="22">
            <html:textarea property="Course/Remarks" onblur="checkLen('��ע',this,'250')"rows="5" cols="81"/>
        </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="22">����֪ͨ��</td>
            <td colspan="7" class="td1" width="" height="22">
            <html:radio property="Course/IsSendNotice" value="0" tabindex="0"/>          
��
 <html:radio property="Course/IsSendNotice" value="1"/>
��</td>
          </tr>
        </table>
          <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="button" class="button_02" value="�� ��" onclick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onclick="history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
<p><font color="#C0C0C0"><b>˵����</b></font></p>
<p><font color="#C0C0C0">1������ѡ��ʱ����������磬��ʱ��Ĭ��Ϊ8:45������Ĭ��Ϊ14:30������Ĭ��Ϊ19:30��ȫ��Ĭ��Ϊ8:45��</font></p>
</body>
<script>
 var isAdd='<bean:write property="isAdd"/>';
 var time='<bean:write property="Course/ClassTime"/>';
 if(isAdd=="1"){
   document.courseForm.elements["ClassTime"].value="8:45";
 }else{
   document.courseForm.elements["ClassTime"].value=time;
 }
</script>
<script language="javascript">
var frm=document.courseForm;

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
       alert("����ѡ���ڿν�ʦ��");
       return;
  }
  var remark=new Date().getTime();
  var loc="teachWorkManage.prMakeTeachPlan.checTeacherDraft.do?Course/CourseID="+courseId+"&Course/ClassDate="+currentDate+"&Course/ClassNoon="+classNoon+"&Course/Teachers="+teacherId+"&remark="+remark;
  window.showModalDialog(loc,"","top:150px;left:150px;dialogWidth:600px;dialogHeight:400px");
}

function checkLen(theName,obj,limit){
   if(obj.value.length>250){
      alert(theName+"�������ܳ���"+limit+"����");
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
   alert("ѧ���������");
   obj.focus();
   
 }
}


function setClassTime(classNoon){
   if(classNoon=="0"||classNoon=="3"){
     frm.elements["ClassTime"].value="8:45";
   }
   if(classNoon=="1"){
     frm.elements["ClassTime"].value="14:30";
   }
  if(classNoon=="2"){
     frm.elements["ClassTime"].value="19:30";
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
      // acceptValue=window.showModalDialog(loc,"","dialogWidth:730px;DialogHeight=540px;status:yes;scroll:yes");  
       acceptValue=window.showModalDialog(loc,onlyOne,"dialogWidth:730px;DialogHeight=540px;status:no;scroll:yes");  
       ids=acceptValue[0];
       names=acceptValue[1];
     }catch(e){}
     
     if(roomTypeID=="1"){//����   
        var temp=ids.substring(1,ids.length-1);       
        frm.elements["Course/ClassRoomID"].value=temp;       
        frm.elements["classRoom"].value=names;
     }
  }
  
  function save(){
    var flag=checkTime();
    frm.elements["Course/ClassTime[@pattern='yyyy-MM-dd HH:mm']"].value="1900-01-01 "+ frm.elements["ClassTime"].value;
    if(flag){
    frm.action="teachWorkManage.prMakeTeachPlan.saveCourse.do";
    frm.submit();
    }
    
  }
  
 function check(obj,theName){ 
     if(obj.value!=""&&!isInteger(obj.value)){
        alert(theName+"������������");
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
  
  function selectTeacher(flag){//ѡ���ʦ
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
   
   if(flag=="0"){//������ڿν�ʦ
        frm.elements["Course/Teachers"].value=ids;      
        frm.elements["shouKe"].value=names;
   }else{//������ʦ
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
      alert("�γ̿�ʼ���ڲ���Ϊ�գ�");
      return false;
    }
    return true; 
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
  
  function initPage(){//Ϊר�������γ̲���ʾ�༶�͵�Ԫ2��
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
      classModel.selectedIndex=1;
   }
  }
 setSelectedIndex();
 initPage();
</script>