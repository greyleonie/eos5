<%@include file="/internet/common.jsp"%>

<body>
<form name="frm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> 
      <html:hidden property="TeachingPlan/PlanID"/>
      <html:hidden property="TeachingPlan/State"/>
      <html:hidden property="export"/>
      <html:hidden property="isAdd"/>
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
          <bean:write property="TeachingPlan/PlanName"/>&nbsp;
             上报截止时间：<bean:write property="TeachingPlan/DateLine" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            <input name="B1" type="button" class="button_02" value="新增专题" onclick="addMajorSubject()">
            <input name="B2" type="button" class="button_02" value="修改专题" onclick="updateSubject()">
            <input name="B3" type="button" class="button_02" value="删除专题" onclick="delSubject()">
            <input name="B4" type="button" class="button_02" value="导 出" onclick="export2Doc()">   
            <input name="B5" type="button" class="button_02" value="打 印" onclick="iePrint()">   
            <input name="B6" type="button" class="button_eight" value="提交领导审批" onclick="send2Head()">
         </td>   
        </tr>
      </table>    
      <%
      int count=0; 
       String array[]=new String[10];
       array[0]="一";
       array[1]="二";
       array[2]="三";
       array[3]="四";
       array[4]="五";
       array[5]="六";
       array[6]="七";
       array[7]="八";
       array[8]="九";
       array[9]="十";
       
      
      %>
      <table width="98%" id="listdetail"><tr><td>
      <logic:iterate id="subjectList" property="list[@type='SpecialSubject']">       
        <table width="98%"  border="1" align="center" cellpadding="0"   cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
         <tr  align="left" class="td_title">
         <td colspan="2" align="left">教研部：<bean:write id="subjectList" property="SpecialSubject/TeachingGroupID"/></td><td colspan="8" align="right">
         <input type="button" onclick="addCourse('<bean:write id="subjectList" property="SpecialSubject/SpecialID"/>')" class="button_02_blue" value="新增课程"></td></tr>
          <tr align="center" class="td2">
            <td width="7%" height="20">专题号</td>
            <td width="15%" height="20">专题题目</td>
            <td width="9%" height="20">开班时间</td>
            <td width="5%" height="20">学时</td>
            <td width="25%" height="20">课程内容</td>
            <td width="" height="20">考勤</td>
            <td width="11%" height="20">授课人</td>
            <td width="6%" height="20">学时</td>
            <td width="9%" height="20">教学形式</td>
            <td width="10%" height="20">操作</td>
          </tr>
          <tr class="td1">
            <td width="7%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>' nowrap>
            <html:checkbox id="subjectList" name="list[@name='update']/SpecialSubject/SpecialID" property="SpecialSubject/SpecialID" indexed="true"/>
            专题<%=array[count]%></td>
            <td width="15%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <bean:write id="subjectList" property="SpecialSubject/Title"/>&nbsp;
            </td>
       
            <td width="9%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <bean:write id="subjectList" property="SpecialSubject/ClassTime"/>&nbsp;
            </td>
            <td width="5%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <bean:write id="subjectList" property="SpecialSubject/ClassHour"/>&nbsp;
            </td>
           <%          
             String classHour="";
             String teacher="";
             String teahchingModelID="";
             String courseId="";
           int    hasCourse=0; 
           %>
            <logic:iterate id="forCourse" property="list[@type='Course']">
                <logic:equal propertyId="subjectList" property="SpecialSubject/SpecialID" valueType="variable" valueId="forCourse" value="Course/SpecialID">
                 <%               
                 
                 if(hasCourse==0){ %>
               <td width="25%" height="20"><bean:write id="forCourse" property="Course/CourseTitle"/>&nbsp;</td>
               <td  height="20">
                  <logic:equal id="forCourse" property="Course/IsUseKQJ" value="1">是</logic:equal>
           <logic:equal id="forCourse" property="Course/IsUseKQJ" value="0">否</logic:equal>
               </td>
                 <%
                 
                
                 try{
                 String title=base.util.TalentContext.getValue(pageContext,"forCourse","Course/CourseTitle");
                 courseId=base.util.TalentContext.getValue(pageContext,"forCourse","Course/CourseID");
                 classHour=base.util.TalentContext.getValue(pageContext,"forCourse","Course/ClassHour");
                 teacher=base.util.TalentContext.getValue(pageContext,"forCourse","Course/Teachers");
                 teahchingModelID=base.util.TalentContext.getValue(pageContext,"forCourse","Course/TeahchingModelID");
             
               if(classHour==null){
                   classHour="";
                 }
               if(teacher==null){
                   teacher="";
                 }
               if(teahchingModelID==null){
                   teahchingModelID="";
                 }
                 }catch(Exception e){
                  System.out.println("============错误："+e);
                 }
                 session.setAttribute("courseId",courseId);
                 hasCourse++; 
                 
                  } 
                 %>
                 </logic:equal>
            </logic:iterate>
            <%if(hasCourse==0){ %>
              <td width="25%" height="20">还没有课程！</td>
              
            <%} %>
            <td width="11%" height="20"><%=teacher %>&nbsp;</td>
            <td width="6%" height="20"><%=classHour %>&nbsp;</td>
            <td width="9%" height="20"><%=teahchingModelID %>&nbsp;</td>
            <td  height="20" align="center">
             <%if(hasCourse==0){ %>
               &nbsp;
             <%}else{%>
            <a href="javascript:delCourse('<%=courseId %>')">删除</a> <a href="javascript:updateCourse('<%=courseId %>')">修改</a>
             <%}%>
            </td>
                <%if(hasCourse==0){ %>
           <td height="20">&nbsp;</td>      
                 <%}%>
          </tr>
          
          <logic:iterate id="otherCourse" property="list[@type='Course']">
             <logic:equal propertyId="subjectList" property="SpecialSubject/SpecialID" valueType="variable" valueId="otherCourse" value="Course/SpecialID">
                
           <%
           String courseID="";
           String lastCourseID="";         
           try{
           courseID=base.util.TalentContext.getValue(pageContext,"otherCourse","Course/CourseID");
           }catch(Exception e){
            System.out.println("===========错误："+e);
           }
                
         if((String)session.getAttribute("courseId")!=null){
             lastCourseID=(String)session.getAttribute("courseId");
           }
           if(!lastCourseID.equals(courseID)){              
            %>
          <tr class="td1">
            <td width="25%" height="15" ><bean:write id="otherCourse" property="Course/CourseTitle"/>&nbsp;</td>
            <td  height="15" >
           <logic:equal id="otherCourse" property="Course/IsUseKQJ" value="1">是</logic:equal>
           <logic:equal id="otherCourse" property="Course/IsUseKQJ" value="0">否</logic:equal>
            </td>
            <td width="11%" height="15" ><bean:write id="otherCourse" property="Course/Teachers"/>&nbsp;</td>
            <td width="6%" height="15" ><bean:write id="otherCourse" property="Course/ClassHour"/>&nbsp;</td>
            <td width="9%" height="15" ><bean:write id="otherCourse" property="Course/TeahchingModelID"/>&nbsp;</td>
            <td  height="15" align="center" > 
            <a href="javascript:delCourse('<bean:write id="otherCourse" property="Course/CourseID"/>')">删除</a> 
            <a href="javascript:updateCourse('<bean:write id="otherCourse" property="Course/CourseID"/>')">修改</a></td>
          </tr> 
          <%} %>
          </logic:equal>
          </logic:iterate>    
        </table>
        <%count++; %>
        </logic:iterate> 
        <%if(count==0){ %>
        <table width="98%"  border="1" align="center" cellpadding="0"   cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
          <tr><td class="td1" align="center">
        &nbsp;
           </td></tr>
            <tr><td class="td1" align="center">
        &nbsp;
           </td></tr>
            <tr><td class="td1" align="center">
        &nbsp;
           </td></tr>
         <tr><td class="td1" align="center">
         没有专题!
           </td></tr>    
        </table>
        <%} %>        
       </td></tr></table>
        </td>
    </tr>
    <tr>
     <td align="center">
              <input name="Submit2" type="button" class="button_02" value="返 回" onclick="goBack()"></td>
    </tr>
  </table>
</form>
</body>
<script language="javascript">
var frm=document.frm;

function addMajorSubject(){
  frm.action="teachWorkManage.prMakeTeachPlan.editSubjectPage.do";
  frm.submit();
}

function addCourse(specialId){ 
  frm.action="teachWorkManage.prMakeTeachPlan.addCourse.do?specialId="+specialId;
  frm.submit();
}



function updateSubject(){
   if(chechedCount(frm)<1){
    alert("至少必须选择一行！");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
  }
  
  frm.action="teachWorkManage.prMakeTeachPlan.querySubject.do";
  frm.submit();
}

function delSubject(){
 if(chechedCount(frm)<1){
    alert("至少必须选择一行！");
    		return ;
  }
  if(confirm("删除专题会删除相关的课程，是否确定！")==true){
  frm.action="teachWorkManage.prMakeTeachPlan.delSubject.do";
  frm.submit();
  }
}

function export2Doc(){
  frm.elements["export"].value="1";
  frm.action="teachWorkManage.prMakeTeachPlan.editMajorSuject.do";
  frm.target="_blank";
  frm.submit();
}

function send2Head(){
     var loc="teachWorkManage.prMakeTeachPlan.subject4HeadChecked.do?TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
   window.open(loc,"","left=150,top=150,height=300,width=600,status=yes"); 
}

function delCourse(coruseId){
  if(confirm("是否确定删除指定记录？")==false){
			return ;
		} 
  frm.action="teachWorkManage.prMakeTeachPlan.delCourseInMajorSubject.do?Course/CourseID="+coruseId;
  frm.submit();
}

function updateCourse(coruseId){
  frm.action="teachWorkManage.prMakeTeachPlan.queryOneCourse.do?courseInSubject=1&Course/CourseID="+coruseId;
  frm.elements["isAdd"].value="2";
  frm.submit();
}

function setButtonStatus(){
 var status=frm.elements["TeachingPlan/State"].value;
 if(status>1){
   frm.elements["B1"].disabled=true;
   frm.elements["B2"].disabled=true;
   frm.elements["B3"].disabled=true;
   frm.elements["B6"].disabled=true;
 }
}


function goBack(){
  frm.elements["TeachingPlan/PlanID"].value="";
  frm.elements["TeachingPlan/State"].value="";
  frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?TeachingPlan=&PageCond=";
  frm.submit();
}
setButtonStatus();

</script>