<%@include file="/internet/common.jsp"%>



<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;查看教学单元</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
      <html:hidden property="TeachingPlanUnit/UnitID"/>
      <html:hidden property="TeachingPlanUnit/PlanID"/>
      <html:hidden property="TeachingPlanUnit/ClassID"/>
      <html:hidden property="isAdd"/>      
      <html:hidden property="loc"/>
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
          </td>
        </tr>
      </table>      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">班&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
            <td width="88%" class="td1">
           <bean:write property="className"/>  
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">教学单元名称：</td>
            <td class="td1">
           <bean:write property="TeachingPlanUnit/UnitName"/>     
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">教学单元主题：</td>
            <td class="td1">
            <bean:write property="TeachingPlanUnit/UnitTitle"/>     
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">单元记分方式：</td>
            <td class="td1">
            <dict:write businTypeId="BNDICT_unitScoreType" property="TeachingPlanUnit/ScoringMethod"/>
            
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">负责教研部：</td>
            <td class="td1">           
           <bean:write property="TeachingPlanUnit/dep"/>             
             </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">负&nbsp;责&nbsp;人：</td>
            <td class="td1">            
           <bean:write property="TeachingPlanUnit/head"/>       
           
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">开始时间：</td>
            <td class="td1">
        <bean:write property="TeachingPlanUnit/BeginTime"/>          
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">结束时间：</td>
            <td class="td1">
               <bean:write property="TeachingPlanUnit/EndTime"/>         
              </td>
          </tr>
          
              <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">学&nbsp;&nbsp;&nbsp;&nbsp;时：</td>
            <td class="td1">
              <bean:write property="TeachingPlanUnit/ClassHour"/>
              </td>
          </tr>
               <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">学&nbsp;&nbsp;&nbsp;&nbsp;分：</td>
            <td class="td1">
             <bean:write property="TeachingPlanUnit/Credit"/>
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">教学要求：</td>
            <td class="td1"><bean:write property="TeachingPlanUnit/Demand"/>
           </td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">             
              <input name="Submit2" type="button" class="button_02" value="返 回" onclick="goBack()"></td>
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


function goBack(){
var loc=frm.elements["loc"].value;
var planID=frm.elements["TeachingPlanUnit/PlanID"].value;

frm.action="teachWorkManage.prMakeTeachPlan.editUnit_new.do?TeachingPlan/PlanID="+planID;
if(loc=="2"){
  frm.action="teachWorkManage.prMakeTeachPlan.leaderCheckFramPage.do?TeachingPlan/PlanID="+planID;
}
if(loc=="3"){
  frm.action="teachWorkManage.prMakeTeachPlan.framePassedInLeader.do?TeachingPlan/PlanID="+planID;
}
if(loc=="4"){
  frm.action="teachWorkManage.prMakeTeachPlan.mainClassReport.do?TeachingPlan/PlanID="+planID;
}
if(loc=="5"){
  frm.action="teachWorkManage.prMakeTeachPlan.filterMainClass.do?isAdopted=&TeachingPlan/PlanID="+planID;
}
if(loc=="6"){
  frm.action="teachWorkManage.prMakeTeachPlan.singleClassPlan.do?isAdopted=1&TeachingPlan/PlanID="+planID;
}

frm.submit();
}

</script>