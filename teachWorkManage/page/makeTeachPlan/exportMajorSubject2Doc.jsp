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
       array[0]="һ";
       array[1]="��";
       array[2]="��";
       array[3]="��";
       array[4]="��";
       array[5]="��";
       array[6]="��";
       array[7]="��";
       array[8]="��";
       array[9]="ʮ";
       
      
      %>
      <table width="98%" id="listdetail" border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" ><tr><td>
      <logic:iterate id="subjectList" property="list[@type='SpecialSubject']">       
        <table width="98%"  border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC">
         <tr align="left" class="td1">
         <td colspan="2" align="left">���в���<bean:write id="subjectList" property="SpecialSubject/TeachingGroupID"/></td>
                  <td colspan="7" align="right">&nbsp;</td>
                </tr>
          <tr align="center" class="td1">
            <td width="18%" height="20">ר���</td>
            <td width="10%" height="20">ר����Ŀ</td>
            <td width="6%" height="20">����ʱ��</td>
            <td width="6%" height="20">ѧʱ</td>
            <td width="18%" height="20">�γ�����</td>
            <td  height="20">����</td>
            <td width="18%" height="20">�ڿ���</td>
            <td width="7%" height="20">ѧʱ</td>
            <td width="6%" height="20" colspan="2">��ѧ��ʽ</td>
           
          </tr>
          <tr class="td1">
            <td width="18%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>' nowrap>
           ר��<%=array[count]%></td>
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
              ��
            </logic:equal>
             <logic:equal id="forCourse" property="Course/IsUseKQJ" value="0">
             ��
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
                  System.out.println("============����"+e);
                 }
                 session.setAttribute("courseId",courseId);
                 hasCourse++; 
                 
                  } 
                 %>
                 </logic:equal>
            </logic:iterate>
            <%if(hasCourse==0){ %>
              <td width="18%" height="20">��û�пγ̣�</td>
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
            System.out.println("===========����"+e);
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
              ��
            </logic:equal>
             <logic:equal id="otherCourse" property="Course/IsUseKQJ" value="0">
             ��
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
         û��ר��!
           </td></tr>    
        </table>
        <%} %>        
       </td></tr></table>
        </td>
    </tr>
  
  </table>