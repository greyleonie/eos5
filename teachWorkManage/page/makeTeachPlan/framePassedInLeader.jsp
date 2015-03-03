
<%@include file="/internet/common.jsp"%>


<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;领导审批（已审批）</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">       
       <html:hidden property="TeachingPlanUnit/PlanID"/>   
       <html:hidden property="TeachingPlanUnit/ClassID"/>      
       <html:hidden property="isAdd"/>    
       <input type="hidden" name="Course/ClassID" value="<bean:write property="TeachingPlanUnit/ClassID"/>">      
       <input type="hidden" name="Class/ClassID" value="<bean:write property="TeachingPlanUnit/ClassID"/>">     
       </td>
    </tr>
    <tr>
      <td class="text"> 
       <table width="98%" id=classTab border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text" colspan="2">
            <html:select property="TeachingPlan/ClassID" onchange="selectClass()" style="width:300px"> 
              <html:option value="-1">--请选择班级--</html:option> 
              <html:options property="list[@type='Class']/Class/ClassID" labelProperty="list[@type='Class']/Class/ClassName"/> 
              </html:select>
         </td> 
        </tr>
         <tr id="leaderOpinion">
          <td width="8%"  align="right" class="text">领导意见：<br>
            （<bean:write property="TeachingPlan/LeaderID"/>）</td>
          <td width="92%" height="30" class="text"><bean:write property="TeachingPlan/Opinion"/></td>
        </tr>
      </table>
         
      <logic:iterate id="resultSet" property="list[@type='TeachingPlanUnit']">   
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td colspan="13"> <table cellspacing="0" cellpadding="0" width="100%" border="0">
               
                <tr title="双击可查看单元详细信息" onDBlclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>','3')"> 
                  <td width="71%" align="left" colspan="2" class="td_title">
                  <bean:write id="resultSet" property="TeachingPlanUnit/UnitName"/>&nbsp;&nbsp; 
                    <bean:write id="resultSet" property="TeachingPlanUnit/UnitTitle"/>&nbsp;&nbsp; 开始日期:<bean:write id="resultSet" property="TeachingPlanUnit/BeginTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
                     结束日期:<bean:write id="resultSet" property="TeachingPlanUnit/EndTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                 
                </tr>
              
               <tr title="双击可查看单元详细信息" onDBlclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>','3')"> 
                  <td width="71%" align="left" class="td_title">
              教学要求：<bean:write id="resultSet" property="TeachingPlanUnit/Demand"/> <td width="29%" align="center" class="td_title">
                <!--<input name="Submit53" type="button" class="button_blue_eight" value="查看所有上报课题" onClick="addSubject('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>')">-->
                </td>
                </tr>  
                
              </table></td>
          </tr>
          <tr class="td2"> 
            <td width="10%" align="center">日期</td>
            <td width="5%" align="center">时间</td>
            <td width="5%" align="center">午别</td>
            <td width="5%" align="center">星期</td>
            <td width="15%" align="center">学习内容</td>
            <td width="7%" align="center">地　点</td>
            <td width="5%" align="center">考勤</td>
            <td width="8%" align="center">教学形式</td>
            <td width="11%" align="center">课堂模式</td>
            <td width="7%" align="center">授课人</td>
            <td width="6%" align="center">主持人</td>
            <td width="8%" align="center">到会教师</td>
           
          </tr>
        <logic:iterate id="courseResult" property="list[@type='Course']">
        <logic:greaterEqual valueType="variable" valueId="resultSet" value="TeachingPlanUnit/BeginTime" propertyId="courseResult" property="Course/ClassDate">
              <logic:lessEqual valueType="variable" valueId="resultSet" value="TeachingPlanUnit/EndTime" propertyId="courseResult" property="Course/ClassDate">
         <tr class="td1" onClick="changeTRBgColor(this)"  onDBlClick="courseDetail('<bean:write id="courseResult" property="Course/CourseID"/>','<bean:write id="courseResult" property="Course/ClassID"/>')"> 
            <td align="center"><bean:write id="courseResult" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="courseResult" property="Course/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/></td>
            <td align="center"><dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="courseResult"/></td>
            <td align="center"><bean:write id="courseResult" property="Course/weekDate"/></td>
            <td align="middle"><bean:write id="courseResult" property="Course/CourseTitle"/></td>
            <td align="middle"><bean:write id="courseResult" property="Course/classRoom"/></td>
            <td align="middle">
            <logic:equal id="courseResult" value="0" property="Course/IsUseKQJ">否</logic:equal>
            <logic:equal id="courseResult" value="1" property="Course/IsUseKQJ">是</logic:equal>
            </td>
            <td align="middle"><dict:write businTypeId="BNDICT_teachModal" property="Course/TeahchingModelID" id="courseResult"/></td>
            <td align="middle"><dict:write businTypeId="BNDICT_classRoomModal" property="Course/ClassModelID" id="courseResult"/></td>
            <td align="middle"> <bean:write id="courseResult" property="Course/teachIngMan"/></td>
            <td align="middle"> <bean:write id="courseResult" property="Course/dj"/></td>
            <td align="middle"><bean:write id="courseResult" property="Course/daoHui"/></td><!--到会教师-->
         
          </tr>
          </logic:lessEqual>
            </logic:greaterEqual>        
        </logic:iterate>  
        </table>        
        </logic:iterate>
        
        <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
             </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>

</body>

<script language="javascript">
var frm=document.unitForm;



function goBak(){
 frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?PageCond=";
 frm.target="_self";
 frm.submit();
}

function showCheckPage(courseId){

   var remark=new Date().getTime();   
   var loc="teachWorkManage.prMakeTeachPlan.getOpinionOfCourse.do?remark="+remark+"&Course/CourseID="+courseId;
   window.open(loc,"","width=660px,height=480,scroll=yes"); 
}

function addUnit(){
   
 frm.action="teachWorkManage.prMakeTeachPlan.toAddUnit.do?";
 frm.submit();
}

function send4Head(){
   var loc="teachWorkManage.prMakeTeachPlan.putIn2HeadPage.do?Class/ClassID="+frm.elements["Class/ClassID"].value+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
   window.showModalDialog(loc,'','DialogHeight=500px;DiaglogWidth=600px');
}

function delUnit(unitId){
 if(confirm("删除该单元会删除其相关的课程，是否确定？")==false){
			return ;
		}
 frm.action="teachWorkManage.prMakeTeachPlan.delUnit.do?unitId="+unitId;
 frm.submit();
}

function updateUnit(unitId,flag){
   frm.action="teachWorkManage.prMakeTeachPlan.toEditUnitPage.do?loc=3&unitId="+unitId;
   frm.elements["isAdd"].value=flag;
   frm.submit();
}



function courseDetail(coruseId,classId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?loc=3&Course/CourseID="+coruseId+"&Course/ClassID="+classId;
  frm.elements["isAdd"].value="3";
  frm.submit();
}

function selectClass(){
 setStatus();
 if(frm.elements["TeachingPlan/ClassID"].value!="-1"){
  frm.action="teachWorkManage.prMakeTeachPlan.framePassedInLeader.do?TeachingPlan/PlanID="; 
  frm.submit();    
 }
}

function setStatus(){
if(frm.elements["TeachingPlan/ClassID"].value=="-1"){
 var tab=document.getElementById("classTab");
 tab.rows[1].style.display="none";
}
}
setStatus();
</script>