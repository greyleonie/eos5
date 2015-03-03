<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*;"%>
<%
  java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
  Date date=new Date();
  String today=sdf.format(date);  
 %>
<form name="refresh" method="post">
<html:hidden property="TeachingPlanUnit/ClassID"/>
<input type="hidden" name="TeachingPlan/ClassID" value='<bean:write property="TeachingPlanUnit/ClassID"/>'>
  <html:hidden property="TeachingPlan/PlanID"/>
</form>
<form name="frm" method="post">
 <html:hidden property="return/code"/> 
 <html:hidden property="loc"/> 
 <html:hidden property="CourseAdjust/AdjustContent"/><!--通知的内容，在定稿后如果要发通知用到-->
 <input type="hidden" name="TeachingPlan/ClassID" value='<bean:write property="TeachingPlanUnit/ClassID"/>'>
 <html:hidden property="Course/Teachers"/>
 <html:hidden property="Course/CourseID"/>
 <html:hidden property="Course/ClassID"/>
 <html:hidden property="Course/ClassName"/>
 <html:hidden property="Course/CourseTitle"/>
 <html:hidden property="Course/DateTime"/>
 <html:hidden property="Course/ClassRoomID"/>
 <html:hidden property="Course/RoomName"/>
 <html:hidden property="oldCourse/CourseTitle"/>
 <html:hidden property="oldCourse/DateTime"/>
 <html:hidden property="oldCourse/ClassRoomID"/>
 <html:hidden property="oldCourse/RoomName"/>
 <input type="hidden" name="CourseAdjust/AdjustTime[@pattern='yyyy-MM-dd HH:mm']" value="<%=today %>">
</form>
<script>
var msg='<bean:write property="msg"/>';
var loc=document.frm.elements["loc"].value;
var returnCode=document.frm.elements["return/code"].value;

if(msg!=""&&loc!="6"){
  alert(msg);
}else{
  if(returnCode=="1")//在终稿阶段如果保存一个课程成功
  {
   var temp=msg+"是否发送通知？";
   if(confirm(temp)==true){
       var path="teachWorkManage.prMakeTeachPlan.addNotice.do?path=1&Course/Teachers="+document.frm.elements["Course/Teachers"].value+"&isAdd=1&CourseAdjust/AdjustContent="+document.frm.elements["CourseAdjust/AdjustContent"].value+"&loc=6&TeachingPlan/ClassID="+document.frm.elements["TeachingPlan/ClassID"].value;
        document.frm.action=path
        document.frm.submit();
     
   }else{
     if(loc=="6"){//终稿阶段
        //  document.frm.action="teachWorkManage.prMakeTeachPlan.singleClassPlan.do?isAdopted=1";
        //  document.frm.action="teachWorkManage.prMakeTeachPlan.return2SingleClassPlan.do?isAdopted=1";
          document.frm.action="teachWorkManage.prMakeTeachPlan.singleClassPlan_new.do?TeachingPlan=&isAdopted=1";
          document.frm.submit();
      }
   }
  }
}
if(loc=="6"){
}else if(loc=="5"){//筛选阶段
 document.frm.action="teachWorkManage.prMakeTeachPlan.filterMainClass.do?isAdopted=";
 document.frm.submit();
}else if(loc=="4"){//上报阶段
  document.frm.action="teachWorkManage.prMakeTeachPlan.mainClassReport.do?TeachingPlan=";
  document.frm.submit();
  
}else{
document.refresh.action="teachWorkManage.prMakeTeachPlan.editUnit_new.do";
document.refresh.submit();
}

</script>