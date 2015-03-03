
<%@include file="/internet/common.jsp"%>
<%base.util.RightParse RP = new base.util.RightParse();
	boolean issue = RP.parse("DX_teachWork_sc.DX_teachWork_sc_add",session) ;
	boolean canUpdate = RP.parse("DX_teachWork_sc.DX_teachWork_sc_u",session) ;
	boolean canDel = RP.parse("DX_teachWork_sc.DX_teachWork_sc_d",session) ;
	 %>

<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—>教务管理—>教学计划编制—>教学计划定稿（单班教学计划）</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
       <html:hidden property="TeachingPlanBu/PlanID"/>         
       <input type="hidden" name="TeachingPlanUnitBu/ClassID" value="<bean:write property="TeachingPlanBu/ClassID"/>">     
       <html:hidden property="loc" value="6"/>    
       <html:hidden property="isAdd"/>   
       <html:hidden property="isAdopted"/> 
       <input type="hidden" name="CourseBu/ClassID" value="<bean:write property="TeachingPlanBu/ClassID"/>">      
       <input type="hidden" name="Class/ClassID" value="<bean:write property="TeachingPlanBu/ClassID"/>">     
       <input type="hidden" name="fileName" value='<bean:write property="className"/>'>
       </td>
    </tr>
    
    
    <tr>
      <td class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text"> 
         <bean:write property="className"/>
         <input name="B3" type="button" class="button_02" value="关 闭" onClick="window.close()">  
          </td>
          
        </tr>       
      </table>   
      <table  width="100%" id="listdetail"><tr><td>
      <logic:iterate id="resultSet" property="list[@type='TeachingPlanUnitBu']">   
        <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
          <tr> 
            <td colspan="13"> <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr title="双击可查看单元详细信息" onDBlclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnitBu/UnitID"/>','3')"> 
                  <td width="71%" align="left" class="td_title">
                  <bean:write id="resultSet" property="TeachingPlanUnitBu/UnitName"/>&nbsp;&nbsp; 
                    <bean:write id="resultSet" property="TeachingPlanUnitBu/UnitTitle"/>&nbsp;&nbsp; 开始日期:<bean:write id="resultSet" property="TeachingPlanUnitBu/BeginTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
                     结束日期:<bean:write id="resultSet" property="TeachingPlanUnitBu/EndTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td  align="center" nowrap class="td_title">
       <%if(issue){ %>        
 <%}else{ %> 
 
  <%} %>           
               </td>
                </tr>
                
                  <tr title="双击可查看单元详细信息" onDBlclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnitBu/UnitID"/>','3')"> 
                  <td width="71%" align="left" colspan="2" class="td_title">教学要求：<bean:write id="resultSet" property="TeachingPlanUnitBu/Demand"/>
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
        <logic:iterate id="courseResult" property="list[@type='CourseBu']">
        <logic:equal valueType="variable" valueId="resultSet" value="TeachingPlanUnitBu/UnitID" propertyId="courseResult" property="CourseBu/UnitID">
         <tr class="td1" onClick="changeTRBgColor(this)"  onDBlClick="courseDetail('<bean:write id="courseResult" property="CourseBu/CourseID"/>','<bean:write id="courseResult" property="CourseBu/ClassID"/>')"> 
            <td align="center"><bean:write id="courseResult" property="CourseBu/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="courseResult" property="CourseBu/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/></td>
            <td align="center"><dict:write businTypeId="BNDICT_classMoon" property="CourseBu/ClassNoon" id="courseResult"/></td>
            <td align="center"><bean:write id="courseResult" property="CourseBu/weekDate"/></td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="CourseBu/CourseTitle"/></td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="CourseBu/classRoom"/></td>
            <td align="middle">
            <logic:equal id="courseResult" value="0" property="CourseBu/IsUseKQJ">否</logic:equal>
            <logic:equal id="courseResult" value="1" property="CourseBu/IsUseKQJ">是</logic:equal>
            </td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="CourseBu/TeahchingModelID"/></td>
                  <td align="middle">&nbsp;<dict:write businTypeId="BNDICT_classRoomModal" property="CourseBu/ClassModelID" id="courseResult"/></td>
                  <td align="middle">&nbsp; <bean:write id="courseResult" property="CourseBu/teachIngMan"/></td>
                  <td align="middle">&nbsp; <bean:write id="courseResult" property="CourseBu/dj"/></td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="CourseBu/daoHui"/></td>
        
          </tr>
         
            </logic:equal>        
        </logic:iterate>  
        </table>        
        </logic:iterate>
        </td></tr></table>
      </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script language="javascript">
var frm=document.unitForm;
function goBak(){
 frm.elements["TeachingPlanBu/PlanID"].value="";
 frm.elements["TeachingPlanBu/ClassID"].value="";
 frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?PageCond="; 
 frm.submit();
}

function historyVersionView(){
  var re=(new Date()).getTime();
  var classId=frm.elements["TeachingPlanBu/ClassID"].value;
  var loc="teachWorkManage.prMakeTeachPlan.showHistoryVersion.do?TeachingPlanBu/ClassID="+classId+"&re="+re;
  window.showModalDialog(loc,'','top=200px;left=200px;dialogWidth=550px;dialogHeight=350px;status=no;scrro=yes');
}

function addUnit(){
   
 frm.action="teachWorkManage.prMakeTeachPlan.toAddUnit.do?";
 frm.submit();
}

function send4Head(){
   var loc="teachWorkManage.prMakeTeachPlan.putIn2HeadPage.do?Class/ClassID="+frm.elements["Class/ClassID"].value+"&TeachingPlanBu/PlanID="+frm.elements["TeachingPlanBu/PlanID"].value;
   window.open(loc,"","left=150,top=150,height=300,width=600,status=yes");  
}

function delUnit(unitId){
 if(confirm("删除该单元会删除其相关的课程，是否确定？")==false){
			return ;
		}
 frm.action="teachWorkManage.prMakeTeachPlan.delUnit.do?unitId="+unitId;
 frm.submit();
}

function updateUnit(unitId,flag){
   frm.action="teachWorkManage.prMakeTeachPlan.toEditUnitPage.do?loc=6&unitId="+unitId;
   frm.elements["isAdd"].value=flag;
   frm.submit();
}
function addSubject(unitId){
  frm.action="teachWorkManage.prMakeTeachPlan.toAddCourse.do?unitID="+unitId;
  frm.submit();
}



function updateSubject(coruseId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?loc=6&CourseBu/CourseID="+coruseId+"&CourseBu/ClassID="+frm.elements["TeachingPlanUnitBu/ClassID"].value;
  frm.elements["isAdd"].value="2";
  frm.submit();
}

function courseDetail(coruseId,classId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?loc=6&CourseBu/CourseID="+coruseId+"&CourseBu/ClassID="+classId;
  frm.elements["isAdd"].value="3";
  frm.submit();
}

function selectClass(){

 if(frm.elements["TeachingPlanBu/ClassID"].value!="-1"){ 
  frm.elements["TeachingPlanBu/PlanID"].value="";
  frm.elements["CourseBu/ClassID"].value="";
  frm.elements["TeachingPlanUnitBu/ClassID"].value=frm.elements["TeachingPlanBu/ClassID"].value;
   frm.elements["Class/ClassID"].value=frm.elements["TeachingPlanBu/ClassID"].value;
  frm.action="teachWorkManage.prMakeTeachPlan.singleClassPlan.do?TeachingPlanBu="; 
  frm.submit();    
 }
}

function showAdoptedCourse(remark){
 frm.action="teachWorkManage.prMakeTeachPlan.singleClassPlan.do?isAdopted="+remark;
 frm.submit();
}

function delSubject(coruseId){
 var time=(new Date()).getTime();
 var loc="teachWorkManage.prMakeTeachPlan.showMsg.do?rem="+time;
 var isBackUp="0";
 isBackUp=window.showModalDialog(loc,'','top=200px;left=200px;dialogWidth=320px;dialogHeight=180px;status=no');
 var dec="";
if(isBackUp=="-1"){
			return ;
} 

if(isBackUp=="1"){
 var path="teachWorkManage.prMakeTeachPlan.writeVersionDescription.do?rem="+time;
 dec=window.showModalDialog(path,'','top=200px;left=200px;dialogWidth=420px;dialogHeight=320px;status=no');

 if(dec=="undefined")dec="";
 
}

  frm.action="teachWorkManage.prMakeTeachPlan.delCourse.do?isBackUp="+isBackUp+"&CourseBu/CourseID="+coruseId+"&dec="+dec;
 frm.submit();
}

function export2Doc(){
 frm.action="teachWorkManage.prMakeTeachPlan.printFinalPlan.do?isAdopted="+frm.elements["isAdopted"].value+"&TeachingPlanBu/PlanID="+frm.elements["TeachingPlanBu/PlanID"].value;
 frm.target = "_blank";
 frm.submit();
}

function send2NetWork(){
  frm.action="teachWorkManage.prMakeTeachPlan.sendTeachPlan2NetWork.do";
  frm.target="_blank";
  frm.submit();
}
</script>