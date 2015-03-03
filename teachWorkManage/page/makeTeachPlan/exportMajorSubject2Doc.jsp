<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%response.setContentType("application/msword;charset=gb2312"); %>
 
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  
    <tr>
      <td class="text"><table width="98%"  border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC">
        <tr>
          <td height="30" class="text">
          <bean:write property="TeachingPlan/PlanName"/>&nbsp;   
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
      <table width="98%" id="listdetail" border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" ><tr><td>
      <logic:iterate id="subjectList" property="list[@type='SpecialSubject']">       
        <table width="98%"  border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC">
         <tr align="left" class="td1">
         <td colspan="2" align="left">教研部：<bean:write id="subjectList" property="SpecialSubject/TeachingGroupID"/></td>
                  <td colspan="7" align="right">&nbsp;</td>
                </tr>
          <tr align="center" class="td1">
            <td width="18%" height="20">专题号</td>
            <td width="10%" height="20">专题题目</td>
            <td width="6%" height="20">开班时间</td>
            <td width="6%" height="20">学时</td>
            <td width="18%" height="20">课程内容</td>
            <td  height="20">考勤</td>
            <td width="18%" height="20">授课人</td>
            <td width="7%" height="20">学时</td>
            <td width="6%" height="20" colspan="2">教学形式</td>
           
          </tr>
          <tr class="td1">
            <td width="18%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>' nowrap>
           专题<%=array[count]%></td>
            <td width="10%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <bean:write id="subjectList" property="SpecialSubject/Title"/>
            </td>
            <td width="6%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <bean:write id="subjectList" property="SpecialSubject/ClassTime"/>
            </td>
            <td width="6%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <bean:write id="subjectList" property="SpecialSubject/ClassHour"/>
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
               <td width="18%" height="20"><bean:write id="forCourse" property="Course/CourseTitle"/>&nbsp;</td>
                <td  height="15" >
            <logic:equal id="forCourse" property="Course/IsUseKQJ" value="1">
              是
            </logic:equal>
             <logic:equal id="forCourse" property="Course/IsUseKQJ" value="0">
             否
            </logic:equal>
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
              <td width="18%" height="20">还没有课程！</td>
            <%} %>
            <td width="7%" height="20"><%=teacher %>&nbsp;</td>
            <td width="6%" height="20"><%=classHour %>&nbsp;</td>
            <td width="11%" height="20" colspan="2"><%=teahchingModelID %>&nbsp;</td>
            
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
            <td width="18%" height="15" ><bean:write id="otherCourse" property="Course/CourseTitle"/>&nbsp;</td>
             <td height="15" >
            <logic:equal id="otherCourse" property="Course/IsUseKQJ" value="1">
              是
            </logic:equal>
             <logic:equal id="otherCourse" property="Course/IsUseKQJ" value="0">
             否
            </logic:equal>
             </td>
            <td width="10%" height="15" ><bean:write id="otherCourse" property="Course/Teachers"/>&nbsp;</td>
            <td width="6%" height="15" ><bean:write id="otherCourse" property="Course/ClassHour"/>&nbsp;</td>
            <td width="6%" height="15" colspan="2"><bean:write id="otherCourse" property="Course/TeahchingModelID"/>&nbsp;</td>
           
          </tr> 
          <%} %>
          </logic:equal>
          </logic:iterate>    
        </table>
        <%count++; %>
        </logic:iterate> 
        <%if(count==0){ %>
        <table width="98%"  border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC">
          <tr><td class="td1" align="center">&nbsp;
        
           </td></tr>
            <tr><td class="td1" align="center">&nbsp;
        
           </td></tr>
            <tr><td class="td1" align="center">&nbsp;
        
           </td></tr>
         <tr><td class="td1" align="center">
         没有专题!
           </td></tr>    
        </table>
        <%} %>        
       </td></tr></table>
        </td>
    </tr>
  
  </table>