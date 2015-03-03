
<%@include file="/internet/common.jsp"%>
<%
base.util.RightParse RP = new base.util.RightParse();	
	 boolean canUpdate = RP.parse("DX_teachWorkMana_mainClass.DX_teachWorkMana_mainClass_update",session) ;
    boolean canAdd = RP.parse("DX_teachWorkMana_mainClass.DX_teachWorkMana_mainClass_add",session) ;
 %>

<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;课题筛选</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
       <html:hidden property="TeachingPlan/PlanID"/>     
       <html:hidden property="TeachingPlanUnit/ClassID"/>      
       <html:hidden property="TeachingPlan/State"/>      
       <html:hidden property="loc" value="5"/>    
       <html:hidden property="isAdd"/>   
       <input type="hidden" name="Course/ClassID" value="<bean:write property="TeachingPlanUnit/ClassID"/>">      
       <input type="hidden" name="Class/ClassID" value="<bean:write property="TeachingPlanUnit/ClassID"/>">     
       <html:hidden property="checkIds"/>   
       <html:hidden property="notCheckIds"/>  
       <html:hidden property="atMe"/>
       <html:hidden property="atClassRoom"/>
       <html:hidden property="atTeacher"/>
      
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">  <html:select property="TeachingPlan/ClassID" onchange="selectClass()" style="width:300px"> 
              <html:option value="-1">------请选择班级------</html:option> 
              <html:options property="list[@type='Class']/Class/ClassID" labelProperty="list[@type='Class']/Class/ClassName"/> 
              </html:select>  
           <logic:equal property="TeachingPlan/State" value="-4"><!--审批未通过或者刚送来筛选-->
            <qx:talentButton property="btn1" type="button" styleClass="button_02" value="定为初稿" onclick="send4Head()" operation="DX_teachWorkMana_mainClass.DX_teachWorkMana_mainClass_f"/>
           </logic:equal>
            <logic:equal property="TeachingPlan/State" value="3"><!--审批未通过或者刚送来筛选-->
              <qx:talentButton property="btn1" type="button" styleClass="button_02" value="定为初稿" onclick="send4Head()" operation="DX_teachWorkMana_mainClass.DX_teachWorkMana_mainClass_f"/>
          
           </logic:equal>
           <logic:equal property="TeachingPlan/State" value="5">
             <qx:talentButton property="btn2" type="button" styleClass="button_02" value="定为终稿" onclick="setStatus('6')" operation="DX_teachWorkMana_mainClass.DX_teachWorkMana_mainClass_e"/>
          
           </logic:equal> 
                <logic:present property="TeachingPlan/State">
             <logic:equal property="TeachingPlan/State" value="3">
             <qx:talentButton property="btn2" type="button" styleClass="button_02" value="意见汇总" onclick="showOpinion()" operation="DX_teachWorkMana_mainClass.DX_teachWorkMana_mainClass_views"/>
              
             </logic:equal>
              <logic:equal property="TeachingPlan/State" value="5">
            <qx:talentButton property="btn2" type="button" styleClass="button_02" value="意见汇总" onclick="showOpinion()" operation="DX_teachWorkMana_mainClass.DX_teachWorkMana_mainClass_views"/>
              
             </logic:equal>
             </logic:present>
          </td>
        </tr>       
      </table>   
            
      <logic:iterate id="resultSet" property="list[@type='TeachingPlanUnit']">   
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> <%int colspan=14; %>
           <logic:present property="TeachingPlan/State">
            <logic:greaterThan property="TeachingPlan/State" value="2">
                 <%colspan=15; %>
            </logic:greaterThan>
         
             
             </logic:present>
            <td colspan="<%=colspan %>"> <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr title="双击可查看单元详细信息" onDBlclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>','3')"> 
                  <td width="71%" align="left" class="td_title">
                  <bean:write id="resultSet" property="TeachingPlanUnit/UnitName"/>&nbsp;&nbsp; 
                    <bean:write id="resultSet" property="TeachingPlanUnit/UnitTitle"/>&nbsp;&nbsp; 开始日期:<bean:write id="resultSet" property="TeachingPlanUnit/BeginTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
                     结束日期:<bean:write id="resultSet" property="TeachingPlanUnit/EndTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td width="29%" align="center" colspan="2" class="td_title">
                 <%if(canAdd){ %>
                 <input name="Submit53" type="button" class="button_02_blue" value="新建课程" onClick="addSubject('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>')">
                <%}else{ %>
                  <input name="Submit53" disabled="true" type="button" class="button_02_blue" value="新建课程" onClick="addSubject('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>')">
                <%} %>
                </td>
                </tr>
                
                  <tr title="双击可查看单元详细信息" onDBlclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>','3')"> 
                  <td width="71%" align="left" class="td_title">教学要求：<bean:write id="resultSet" property="TeachingPlanUnit/Demand"/>
                 </td>
                   <td width="24%" colspan="2" align="center" class="td_title">
                    <input name="Submit53" type="button" class="button_blue_eight" onclick="showAdoptedCourse('1')" value="已采纳课题">
                     <input name="Submit53" type="button" class="button_02_blue" onclick="showAdoptedCourse('')" value="所有课题">
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
             <td nowrap align="center">是否被采纳</td>
             <logic:present property="TeachingPlan/State">
             <logic:greaterThan property="TeachingPlan/State" value="2">
                 <td nowrap align="center">审核/审批意见</td>
             </logic:greaterThan>         
             </logic:present>
            <td align="center" width="8%">操 作</td>
          </tr>
        <logic:iterate id="courseResult" property="list[@type='Course']">
        <%try{ %>
     <logic:equal propertyId="resultSet" property="TeachingPlanUnit/UnitID" valueType="variable" valueId="courseResult" value="Course/UnitID">
      <tr class="td1" onClick="changeTRBgColor(this)" title="双击可查看课程详细信息"  onDBlClick="courseDetail('<bean:write id="courseResult" property="Course/CourseID"/>','<bean:write id="courseResult" property="Course/ClassID"/>')"> 
           <%String style=""; %>
           <logic:in  propertyId="courseResult" property="Course/CourseID" valueType="variable" value="atMe"><%style="#FF3300"; %></logic:in>
            <td align="center" style="background-color:<%=style %>"><bean:write id="courseResult" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <%style=""; %>
            <td align="center"><bean:write id="courseResult" property="Course/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/></td>
            <td align="center"><dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="courseResult"/></td>
            <td align="center"><bean:write id="courseResult" property="Course/weekDate"/></td>
            <td align="middle"><bean:write id="courseResult" property="Course/CourseTitle"/></td>
             <%style=""; %>
            <logic:in  propertyId="courseResult" property="Course/CourseID" valueType="variable" value="atClassRoom"><%style="#FF3300"; %></logic:in>
            <td align="middle" style="background-color:<%=style %>"><bean:write id="courseResult" property="Course/classRoom"/></td>
             <%style=""; %>
            <td align="middle">
            <logic:equal id="courseResult" value="0" property="Course/IsUseKQJ">否</logic:equal>
            <logic:equal id="courseResult" value="1" property="Course/IsUseKQJ">是</logic:equal>
            </td>
            <td align="middle"><bean:write id="courseResult" property="Course/TeahchingModelID"/></td>
            <td align="middle"><bean:write id="courseResult" property="Course/ClassModelID"/></td>
                <%style=""; %>
                 <logic:in  propertyId="courseResult" property="Course/CourseID"  value="90"><%style="#FF3300"; %></logic:in>
           
            <td align="middle" style="background-color:<%=style %>"> <bean:write id="courseResult" property="Course/teachIngMan"/></td>
            <td align="middle"> <bean:write id="courseResult" property="Course/dj"/></td>
            <td align="middle"><bean:write id="courseResult" property="Course/daoHui"/></td><!--到会教师-->
              <%String status="";%>
              <logic:equal id="courseResult" property="Course/IsAdopted" value="1">
                  <%status="checked";%>
              </logic:equal>   
           <td align="center"> <input type="checkbox" name="chkBox" <%=status %> value='<bean:write id="courseResult" property="Course/CourseID"/>'>
         </td>
          <logic:present property="TeachingPlan/State">
            <%String view=""; %>
           <td nowrap align="center">
           
             <logic:equal property="TeachingPlan/State" value="3">
               <%
                   view=base.util.TalentContext.getValue(pageContext,"courseResult","Course/Opinion");                 
               %>
             </logic:equal>      
            
             <%if(view!=null&&!view.equals("")){ %>
                  <a href="javascript:showCheckPage('<%=view%>')">
       <img border="0" title="<bean:write id="courseResult" property="Course/msg"/>" src="<bean:write id="courseResult" property="Course/img"/>" width="22" height="24" ></a>
            <%}else{ %>
              &nbsp;
            <%} %>
                </td>
           
             </logic:present>
            <td align="center">   
            <%if(canUpdate){ %>      
		  <a href="javascript:updateSubject('<bean:write id="courseResult" property="Course/CourseID"/>','<bean:write id="courseResult" property="Course/ClassID"/>')">修改</a>
		 <%}else{ %>
		   修改
		 <%} %>
		  </p></td>
          </tr>
      </logic:equal>    
      <%}catch(Exception e){
        System.out.println("=============errors:"+e);
      } %>   
        </logic:iterate>  
        </table>        
        </logic:iterate>
      </td>
    </tr>
    <tr>
      <td class="text"><table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
           <input name="selectAll" type="button" class="button_02" value="全选" onClick="allAccept('true')">   
           <input name="unSelect" type="button" class="button_02" value="全不选" onClick="allAccept('')">               
           <qx:talentButton property="btnSave" type="button" styleClass="button_02" value="保 存" onclick="save()" operation="DX_teachWorkMana_mainClass.DX_teachWorkMana_mainClass_save"/>
              </td>
            </tr>
        </table></td>
    </tr>
  </table>
</form>

</body>
<script>
  var classId=document.unitForm.elements["TeachingPlan/ClassID"].value;
  if(classId=="-1"){
     document.unitForm.elements["selectAll"].style.display="none";
     document.unitForm.elements["unSelect"].style.display="none";
     document.unitForm.elements["btnSave"].style.display="none";
  }
 
</script>
<script language="javascript">
var frm=document.unitForm;

function allAccept(status){
  var ele=frm.elements;
  var count=ele.length;
  
  for(var i=0;i<count;i++){
    var obj=ele[i];
   
    if(obj.type=="checkbox"&&obj.disabled==false){
     obj.checked=status;
     }
   }
}

function setStatus(state){
   var atMe=frm.elements["atMe"].value;
   var atClassRoom=frm.elements["atClassRoom"].value;
   var atTeacher=frm.elements["atTeacher"].value;
   if(atMe!="-1"||atClassRoom!="-1"||atTeacher!="-1"){
     // alert("课程安排还存在冲突，需要再调整！");
     // return;
   }
   groupCourseId();
 if(frm.elements["checkIds"].value==""){
   alert("至少采纳课程后才能执行该操作！");
   return;
 }
   var remark=new Date().getTime();
   var loc="teachWorkManage.prMakeTeachPlan.setStatusOfPlan.do?remark="+remark+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value+"&status="+state;
  if(state=="6"){
    if(confirm("确实要定为终稿吗！")){
   window.showModalDialog(loc,"","top:200px;left:200px;dialogWidth:250px;dialogHeight:200px;");
   }
   }
}       

function showAdoptedCourse(remark){
 frm.action="teachWorkManage.prMakeTeachPlan.filterMainClass.do?isAdopted="+remark;
 frm.submit();
}

function save(){
 frm.action="teachWorkManage.prMakeTeachPlan.acceptCourses.do";
 groupCourseId();
 if(frm.elements["checkIds"].value==""){
   alert("至少采纳一个课程后才能保存！");
   return;
 }
 frm.submit();
 
}

function groupCourseId(){
   var checkIds="";
   var notCheckIds="";
   var array=frm.elements["chkBox"];
   var len=array.length;
   
   for(var i=0;i<len;i++){
       var obj=array[i];
       if(obj.type=="checkbox"){
        if(obj.checked){
           if(checkIds==""){
              checkIds=obj.value;
           }else{
              checkIds+=","+obj.value; 
           }//end else
        }else{
           if(notCheckIds==""){
              notCheckIds=obj.value;
           }else{
              notCheckIds+=","+obj.value; 
           }//end else
        }//end else
        
       }// end if(obj.type=="checkbox")
   }//end for
   
 frm.elements["notCheckIds"].value=notCheckIds;
 frm.elements["checkIds"].value=checkIds;

}

function addUnit(){
   
 frm.action="teachWorkManage.prMakeTeachPlan.toAddUnit.do?";
 frm.submit();
}

function send4Head(){
groupCourseId();
 if(frm.elements["checkIds"].value==""){
   alert("没有采纳任何课程，不能提交！");
   return;
 }
   var loc="teachWorkManage.prMakeTeachPlan.putIn2HeadPage.do?Class/ClassID="+frm.elements["Class/ClassID"].value+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
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
   frm.action="teachWorkManage.prMakeTeachPlan.toEditUnitPage.do?loc=5&unitId="+unitId;
   frm.elements["isAdd"].value=flag;
   frm.submit();
}


function addSubject(unitId){
  frm.action="teachWorkManage.prMakeTeachPlan.toAddCourse.do?unitID="+unitId;
  frm.submit();
}


function updateSubject(coruseId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?Course/CourseID="+coruseId;
  frm.elements["isAdd"].value="2";
  frm.submit();
}

function courseDetail(coruseId,classId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?Course/CourseID="+coruseId+"&Course/ClassID="+classId;
  frm.elements["isAdd"].value="3";
  frm.submit();
}

function selectClass(){

 if(frm.elements["TeachingPlan/ClassID"].value!="-1"){
  frm.elements["TeachingPlan/PlanID"].value="";
  frm.elements["TeachingPlan/State"].value="";
  frm.elements["Course/ClassID"].value="";
  frm.elements["Class/ClassID"].value="";
  frm.action="teachWorkManage.prMakeTeachPlan.filterMainClass.do?isAdopted="; 
  frm.submit();    
 }
}


function send4Head(){
groupCourseId();
 if(frm.elements["checkIds"].value==""){
   alert("没有采纳任何课程，不能提交！");
   return;
 }
   var status=frm.elements["TeachingPlan/State"].value;
   var loc="teachWorkManage.prMakeTeachPlan.putIn2HeadPage.do?TeachingPlan/State="+status+"&Class/ClassID="+frm.elements["Class/ClassID"].value+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
   window.open(loc,"","left=150,top=150,height=300,width=600,status=yes");   
}

function showCheckPage(view){
   var planStatus=frm.elements["TeachingPlan/State"].value;
   var remark=new Date().getTime();   
   var loc="teachWorkManage.prMakeTeachPlan.opinionDetail.do?planStatus="+planStatus+"&view="+view;  
     window.showModalDialog(loc,"","top:130px;left:130px;dialogWidth:480px;DialogHeight:300px;status:no"); 
}

function showOpinion(){
   var planStatus=frm.elements["TeachingPlan/State"].value;
   var remark=new Date().getTime();   //planStatus是区分是在审核阶段还是审批阶段 4:审批阶段
   var loc="teachWorkManage.prMakeTeachPlan.joinOpinion.do?TeachingPlan/ClassID="+frm.elements["Class/ClassID"].value+"&planStatus="+planStatus+"&remark="+remark+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
   window.showModalDialog(loc,"","top:130px;left:130px;dialogWidth:460px;DialogHeight:300px;status:yes"); 
  
}
</script>