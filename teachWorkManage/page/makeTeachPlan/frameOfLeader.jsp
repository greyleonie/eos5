
<%@include file="/internet/common.jsp"%>


<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;领导审批（待审批）</td>
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
       <html:hidden property="TeachingPlanUnit/PlanType"/>        
       <input type="hidden" name="Course/ClassID" value="<bean:write property="TeachingPlanUnit/ClassID"/>">      
       <input type="hidden" name="Class/ClassID" value="<bean:write property="TeachingPlanUnit/ClassID"/>">     
        <html:hidden name="planStatus" property="TeachingPlan/State"/> 
       </td>
    </tr>
    <tr>
      <td class="text">  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
            <html:select property="TeachingPlan/PlanID" onchange="selectClass()" style="width:300px"> 
              <html:option value="-1">--请选择教学计划--</html:option> 
              <html:options property="list[@type='TeachingPlan']/TeachingPlan/PlanID" labelProperty="list[@type='TeachingPlan']/TeachingPlan/PlanName"/> 
              </html:select>
          <logic:equal property="TeachingPlan/State" value="2">
           <qx:talentButton property="B3" type="button" styleClass="button_eight" value="汇总审核意见" onclick="showOpinion()" operation="DX_teachWork_nk.DX_teachWork_nk_views"/>
          <!-- <input name="B3" type="button" class="button_eight" value="汇总审核意见" style="width: 90; height: 18" onclick="showOpinion()"> -->
            <!--<input name="B1" type="button" class="button_eight" value="审核通过" style="width: 90; height: 18" onclick="setResult('3')"> -->
             <qx:talentButton property="B1" type="button" styleClass="button_eight" value="审核通过" onclick="setResult('3')" operation="DX_teachWork_nk.DX_teachWork_nk_y1"/>
          <qx:talentButton property="B2" type="button" styleClass="button_eight" value="审核不通过" onclick="setResult('-1')" operation="DX_teachWork_nk.DX_teachWork_nk_n1"/>
         
           <!-- <input name="B2" type="button" class="button_eight" value="审核不通过" style="width: 90; height: 18" onclick="setResult('-1')"> -->
          </logic:equal>
           <logic:equal property="TeachingPlan/State" value="4">
             <qx:talentButton property="B3" type="button" styleClass="button_eight" value="汇总审批意见" onclick="showOpinion()" operation="DX_teachWork_nk.DX_teachWork_nk_views"/>
          
           <!-- <input name="B3" type="button" class="button_eight" value="汇总审批意见" style="width: 90; height: 18" onclick="showOpinion()"> -->
            <!--<input name="B1" type="button" class="button_eight" value="审批通过" style="width: 90; height: 18" onclick="setResult('5')"> -->
             <qx:talentButton property="B1" type="button" styleClass="button_eight" value="审批通过" onclick="setResult('5')" operation="DX_teachWork_nk.DX_teachWork_nk_y2"/>
           <qx:talentButton property="B2" type="button" styleClass="button_eight" value="审批不通过" onclick="setResult('3')" operation="DX_teachWork_nk.DX_teachWork_nk_n2"/>
          
           <!-- <input name="B2" type="button" class="button_eight" value="审批不通过" style="width: 90; height: 18" onclick="setResult('3')"> -->
          </logic:equal>
          </td> 
        </tr>
      </table>
         
      <logic:iterate id="resultSet" property="list[@type='TeachingPlanUnit']">   
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td colspan="13"> <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr title="双击可查看单元详细信息" onDBlclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>','3')"> 
                  <td width="71%" align="left" class="td_title">
                  <bean:write id="resultSet" property="TeachingPlanUnit/UnitName"/>&nbsp;&nbsp; 
                    <bean:write id="resultSet" property="TeachingPlanUnit/UnitTitle"/>&nbsp;&nbsp; 开始日期:<bean:write id="resultSet" property="TeachingPlanUnit/BeginTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
                     结束日期:<bean:write id="resultSet" property="TeachingPlanUnit/EndTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td width="29%" align="center" class="td_title">
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
            <td align="center" width="8%">审批意见</td>
          </tr>
        <logic:iterate id="courseResult" property="list[@type='Course']">
        <logic:equal valueType="variable" valueId="resultSet" value="TeachingPlanUnit/UnitID" propertyId="courseResult" property="Course/UnitID">
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
            <td align="center">
       <a href="javascript:showCheckPage('<bean:write id="courseResult" property="Course/CourseID"/>')">
       <img border="0" title="<bean:write id="courseResult" property="Course/msg"/>" src="<bean:write id="courseResult" property="Course/img"/>" width="22" height="24" ></a>
       </td>
          </tr>       
            </logic:equal>        
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

function setStatus(){
try{
    if(frm.elements["Class/ClassID"].value=="-1"){
     frm.elements["B1"].disabled=true;
     frm.elements["B2"].disabled=true;
     frm.elements["B3"].disabled=true;
  }else{
     frm.elements["B1"].disabled=false;
     frm.elements["B2"].disabled=false;
     frm.elements["B3"].disabled=false;
  }
  }catch(e){}
}

function goBak(){
 frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?PageCond=";
 frm.target="_self";
 frm.submit();
}

function showCheckPage(courseId){
   var planStatus=frm.elements["planStatus"].value;
   var remark=new Date().getTime();   
   var loc="teachWorkManage.prMakeTeachPlan.getOpinionOfCourse.do?planStatus="+planStatus+"&remark="+remark+"&Course/CourseID="+courseId;
   window.open(loc,"","width=660px,height=480,status=yes,scroll=yes"); 
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
   frm.action="teachWorkManage.prMakeTeachPlan.toEditUnitPage.do?loc=2&unitId="+unitId;
   frm.elements["isAdd"].value=flag;
   frm.submit();
}


function setResult(state){
  frm.action="teachWorkManage.prMakeTeachPlan.leaderSetStateOfPlan.do?TeachingPlan/State="+state;
  frm.submit();
}


function courseDetail(coruseId,classId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?loc=2&Course/CourseID="+coruseId+"&Course/ClassID="+classId;
  frm.elements["isAdd"].value="3";
  frm.submit();
}

function selectClass(){
 setStatus();
 

 if(frm.elements["TeachingPlan/PlanID"].value!="-1"){
  frm.action="teachWorkManage.prMakeTeachPlan.headSelectOtherPlan.do?TeachingPlan="; 
  frm.submit();    
 }
}

function showOpinion(){
   var planStatus=frm.elements["planStatus"].value;
   var remark=new Date().getTime();   //planStatus是区分是在审核阶段还是审批阶段 4:审批阶段
   var loc="teachWorkManage.prMakeTeachPlan.showAllOpinion.do?planStatus="+planStatus+"&remark="+remark+"&TeachingPlan/ClassID="+frm.elements["Class/ClassID"].value+"&TeachingPlan/PlanID="+frm.elements["TeachingPlanUnit/PlanID"].value;
   window.open(loc,"","top=130,left=130,width=660px,height=480,status=yes,scrollbars=yes"); 
  
}

 setStatus();
</script>