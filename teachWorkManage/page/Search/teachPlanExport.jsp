<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*;"%>
<%response.setContentType("application/msword;charset=gb2312");
  java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd");
  Date date=new Date();
  String year=sdf.format(date).substring(0,4);  
 %>

  
  <table width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="1">
   
    <tr bgcolor="#FFFFFF">
      <td bgcolor="#FFFFFF">
<table width="100%"  border="0" cellspacing="1" cellpadding="0" bgcolor="#FFFFFF">
          <tr bgcolor="#FFFFFF">
            <td align="center" bgcolor="#FFFFFF"><%=year %>��<dict:write businTypeId="season" property="sesson" />��ѧ�ƻ��ճ̰����ܱ�</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td height="30" align="center" valign="top" class="text_red">��<bean:write property="beg" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>�� <bean:write property="end" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>��</td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td height="30" align="center" bgcolor="#FFFFFF">������</td>
          </tr>
            <tr bgcolor="#FFFFFF">
            <td height="30" align="right" bgcolor="#FFFFFF">
           
              
          </td>
          </tr>
        </table>   
		<%		
		     int weekIndex=0;
		 String strWeekIndex="-1";
		 String countWeek=base.util.TalentContext.getValue(pageContext,null,"weekIndex");
		
		 if(countWeek!=null&&!countWeek.equals("")){
		  weekIndex=(new Integer(countWeek)).intValue()+1;
		  
		 }
		 for(int h=0;h<weekIndex;h++){
		 strWeekIndex=(new Integer(h)).toString();
		%> 
	   <a name='week<%=h%>'></a>
        <table width="100%" align="center" bgcolor="#FFFFFF" cellpadding="0" cellspacing="1" bgcolor="0">
          <tr align="center" bgcolor="#FFFFFF"> 
            <td colspan="3" bgcolor="#FFFFFF" align="center">�༶</td>
			<logic:iterate id="forClassName" property="list[@type='Class']">
              <td colspan="2" bgcolor="#FFFFFF" width="20%"><bean:write id="forClassName" property="Class/ClassName"/></td>
            </logic:iterate>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="3" bgcolor="#FFFFFF" align="center">�Ͽν���</td>
     <logic:iterate id="forRoom" property="list[@type='Class']">
        <td colspan="2" bgcolor="#FFFFFF" align="center">&nbsp;
		<bean:write id="forRoom" property="Class/ClassroomID"/></td>
      </logic:iterate>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="1%" align="center" bgcolor="#FFFFFF">��<br>��</td>
            <td width="1%" align="center" bgcolor="#FFFFFF">��<br>��</td>
            <td width="1%" align="center" bgcolor="#FFFFFF">��<br>��</td>
          <logic:iterate id="resultSet" property="list[@type='Class']">
			  <td colspan='2' align="center" bgcolor="#FFFFFF">&nbsp;</td>     
          </logic:iterate>
     
          </tr>
      <%
    int i=0;
     String rowSpan="0";
     ArrayList list=new ArrayList();     
 %>
      <logic:iterate id="forCourse" property="list[@type='Course']"><!--��������,����-->
        <%
           rowSpan=base.util.TalentContext.getValue(pageContext,"forCourse","Course/rowSpan");
             String  classId=base.util.TalentContext.getValue(pageContext,"forCourse","Course/ClassID");
             String  classDate=base.util.TalentContext.getValue(pageContext,"forCourse","Course/ClassDate");
             String  noon=base.util.TalentContext.getValue(pageContext,"forCourse","Course/ClassNoon");
             String  title=base.util.TalentContext.getValue(pageContext,"forCourse","Course/CourseTitle");
             String  week=base.util.TalentContext.getValue(pageContext,"forCourse","Course/weekIndex");
             String  dateArray[]=classDate.split("-");
             String  month="";
             String  day="";
         // System.out.println("=====week:"+week);
           if(classDate.length()>5){
                month=classDate.substring(4,6);              
             }
           if(classDate.length()>7){
                day=classDate.substring(6,8);
             }
             
         if(week.equals(strWeekIndex)){
        %>
          <tr bgcolor="#FFFFFF"> 
          <%
            
       if(rowSpan!=null&&!rowSpan.equals("0")){//ÿ��ֻ���һ��
           %>
            <td rowspan='<bean:write id="forCourse" property="Course/rowSpan"/>'><%=month %><br>��<%=day %><br>��</td>
            <td rowspan='<bean:write id="forCourse" property="Course/rowSpan"/>'><bean:write id="forCourse" property="Course/weekDate"/></td>            
           <%
           }
            rowSpan="0";
            %>
            <td bgcolor="#FFFFFF"><bean:write id="forCourse" property="Course/ClassNoon"/></td>	
        <logic:iterate id="classNum" property="list[@type='Class']"><!--�γ����ݵ�Ԫ��-->
             <td colspan='2' bgcolor="#FFFFFF" width="20%">             
               <%
                 String classIdInClass=base.util.TalentContext.getValue(pageContext,"classNum","Class/ClassID");//��ǰ�༶��id 
                 
                 
               %> 
                <logic:iterate id="printCourse" property="list[@type='Course']"><!--�γ���������-->
                    <%          
             String  classID=base.util.TalentContext.getValue(pageContext,"forCourse","Course/ClassID");  
             String  classDate2=base.util.TalentContext.getValue(pageContext,"forCourse","Course/ClassDate");
             String  noon2     =base.util.TalentContext.getValue(pageContext,"forCourse","Course/ClassNoon");
             String  title2    =base.util.TalentContext.getValue(pageContext,"forCourse","Course/CourseTitle");
             String  courseId  =base.util.TalentContext.getValue(pageContext,"forCourse","Course/CourseID");
             String  canPrint="1";
             HashMap hm=new HashMap();
             if(title2==null)title2="";
       if(classIdInClass.equals(classID)&&classDate.equals(classDate2)&&noon.equals(noon2)){
            if(!hm.containsKey(courseId)){ 
             %>
               &nbsp;<%= title2%>
               <%
               hm.put(courseId,courseId);
               
               }
                } //end if    
                       
            %>  
                </logic:iterate><!--�γ����ݵ�Ԫ��-->
            </td>        	
        </logic:iterate><!--�γ����ݵ�Ԫ�����-->  
          </tr>
          <%}//�������ڱ�����ͬһ�����ڵ� %>
      </logic:iterate><!--�������ڽ���-->
     </table>
     <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" bgcolor="#FFFFFF">
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            </td>
          </tr>
          
        </table>
       
     <%} %>
       </td>
    </tr>
   
  </table>

