
<%@include file="/internet/common.jsp"%>


<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;编辑教学计划单元</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
       <html:hidden property="TeachingPlan/State"/>
       <html:hidden property="TeachingPlan/PlanID"/>
       <html:hidden property="TeachingPlan/ClassID"/>
       <html:hidden property="TeachingPlanUnit/ClassID"/>      
       <html:hidden property="isAdd"/>   
       
       <input type="hidden" name="Class/ClassID" value="<bean:write property="TeachingPlanUnit/ClassID"/>">     
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
          <b>班级： <logic:iterate id="clsssResult" property="list[@type='Class']">
             <logic:equal value="Class/ClassID" valueType="variable" valueId="clsssResult" property="TeachingPlan/ClassID">
               <bean:write id="clsssResult" property="Class/ClassName"/>
                </logic:equal>
            </logic:iterate></b>
            <p><b>教学计划类型：   <dict:write businTypeId="BNDICT_teachPlanType" property="TeachingPlan/PlanType"/>
         </b></p>
          </td>
        </tr>
        <tr>
          <td height="30" class="text">         
            <input name="query" type="button" class="button_eight" value="添加新教学单元" onClick="addUnit()">
           <input name="query1" type="button" class="button_eight" value="提交领导审批" onClick="send4Head()">           
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
                  <input name="Submit4" type="button" class="button_02_blue" value="删 除" onclick="delUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>')"> 
                  <input name="Submit5" type="button" class="button_02_blue" value="修 改" onclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>','2')"> 
                 <logic:notEqual property="TeachingPlan/State" value="6">
                    <input name="Submit53" type="button" class="button_02_blue" value="新建课程" onClick="addSubject('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>')"></td>
                 </logic:notEqual>
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
            <td width="5%" align="center">考勤机考勤</td>
            <td width="8%" align="center">教学形式</td>
            <td width="11%" align="center">课堂模式</td>
            <td width="7%" align="center">授课人</td>
            <td width="6%" align="center">主持人</td>
            <td width="8%" align="center">到会教师</td>
            <td align="center" width="8%">操 作</td>
          </tr>
        <logic:iterate id="courseResult" property="list[@type='Course']">
        <%try{ %>
             <logic:equal propertyId="resultSet" property="TeachingPlanUnit/UnitID" valueType="variable" valueId="courseResult" value="Course/UnitID">   
         <tr class="td1" onClick="changeTRBgColor(this)"  onDBlClick="courseDetail('<bean:write id="courseResult" property="Course/CourseID"/>','<bean:write id="courseResult" property="Course/ClassID"/>')"> 
            <td align="center"><bean:write id="courseResult" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="courseResult" property="Course/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/></td>
            <td align="center"><dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="courseResult"/></td>
            <td align="center"><bean:write id="courseResult" property="Course/weekDate"/></td>
            <td ><bean:write id="courseResult" property="Course/CourseTitle"/></td>
            <td ><bean:write id="courseResult" property="Course/classRoom"/></td>
            <td align="middle">
            <logic:equal id="courseResult" value="0" property="Course/IsUseKQJ">否</logic:equal>
            <logic:equal id="courseResult" value="1" property="Course/IsUseKQJ">是</logic:equal>
            </td>
            <td align="middle">
            <!--<dict:write businTypeId="BNDICT_teachModal" property="Course/TeahchingModelID" id="courseResult"/>-->           
            <bean:write id="courseResult" property="Course/TeahchingModelID"/>
            </td>
            <td><bean:write id="courseResult" property="Course/ClassModelID"/>            
            <!--<dict:write businTypeId="BNDICT_classRoomModal" property="Course/ClassModelID" id="courseResult"/>-->
            </td>
            <td align="middle"> <bean:write id="courseResult" property="Course/teachIngMan"/></td>
            <td align="middle"> <bean:write id="courseResult" property="Course/dj"/></td>
            <td align="middle"><bean:write id="courseResult" property="Course/daoHui"/></td><!--到会教师-->
            <td align="center">
            <%try{ %>
           <a href="javascript:delSubject('<bean:write id="courseResult" property="Course/CourseID"/>')">删除</a> <a href="javascript:updateSubject('<bean:write id="courseResult" property="Course/CourseID"/>','<bean:write id="courseResult" property="Course/ClassID"/>')">修改</a>
            <%}catch(Exception e){
                System.out.println("======errors:"+e);
            } %>
            </td>
          </tr>
         </logic:equal>
        <%}catch(Exception e){
          System.out.println("======errors:"+e);
        } %>          
        </logic:iterate>  
        </table>        
        </logic:iterate>
        
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
<p><font color="#C0C0C0">说明：新增加一个教学单元后，系统应根据该单元的起止时间，自动生成课程表框架，包括日期、时间、午别和星期，</font></p>
<p><font color="#C0C0C0">星期六和星期日不包括在内。</font></p>
</body>
<script language="javascript">
var frm=document.unitForm;
function goBak(){
 frm.elements["TeachingPlan/PlanID"].value="";
 frm.elements["TeachingPlan/ClassID"].value="";
 frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?PageCond="; 
 frm.submit();
}



function addUnit(){
   
 frm.action="teachWorkManage.prMakeTeachPlan.toAddUnit.do?";
 frm.submit();
}

function send4Head(){
   var loc="teachWorkManage.prMakeTeachPlan.putIn2HeadPage.do?TeachingPlan/State=1&Class/ClassID="+frm.elements["TeachingPlan/ClassID"].value+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
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
   frm.action="teachWorkManage.prMakeTeachPlan.toEditUnitPage.do?loc=1&unitId="+unitId;
   frm.elements["isAdd"].value=flag;
   frm.submit();
}
function addSubject(unitId){
  frm.action="teachWorkManage.prMakeTeachPlan.toAddCourse.do?Course/UnitID="+unitId+"&unitID="+unitId;
  frm.submit();
}

function delSubject(coruseId){
 if(confirm("是否确定删除指定记录？")==false){
			return ;
		} 
  frm.action="teachWorkManage.prMakeTeachPlan.delCourse.do?Course/CourseID="+coruseId;
  frm.submit();
}

function updateSubject(coruseId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?loc=1&Course/CourseID="+coruseId+"&Course/ClassID="+frm.elements["TeachingPlanUnit/ClassID"].value;
  frm.elements["isAdd"].value="2";
  frm.submit();
}

function courseDetail(coruseId,classId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?Course/CourseID="+coruseId+"&Course/ClassID="+classId;
  frm.elements["isAdd"].value="3";
  frm.submit();
}

function setButtonStatus(){
var status=frm.elements["TeachingPlan/State"].value;
if(status>1){
  frm.elements["query"].disabled=true;
  frm.elements["query1"].disabled=true;
}
}

function goBack(){
 frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?TeachingPlan=&PageCond=";
 frm.submit();
}

</script>
<script>
//setButtonStatus();
</script>