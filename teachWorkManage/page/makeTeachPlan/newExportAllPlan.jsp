
<%@ page import="java.util.*,talent.core.*;"%>

<%
response.setContentType("application/msword;charset=gb2312");

  String ids="";
  String path="";
  String isFirst="";
  String classCondition="";
  String begTime="";
  String endTime="";
  
  
 try{
  isFirst=request.getParameter("isFirst");
  path=request.getParameter("isFirst");
  ids=request.getParameter("classIds");
  begTime=request.getParameter("beg");  
  endTime=request.getParameter("end");  
  }catch(Exception e){
    System.out.println("===========errors:"+e);
  }
  if(isFirst==null)isFirst="";
  if(ids==null)ids="";
  talent.core.AllTeachPlan.init(); 
  talent.core.AllTeachPlan.saveSelectedClass(request,isFirst,ids);
  classCondition=(String)request.getAttribute("classCondition");
  //System.out.println("==============printTable:"+request.getParameter("printTable"));
  if(classCondition!=null)talent.core.AllTeachPlan.saveAllPlan(request,classCondition,begTime,endTime);
   talent.core.AllTeachPlan.closeCon();

  String countWeek="";
  int weekIndex=0;
  String strWeekIndex="-1";
  int countClass=0;
  int countCourse=0;
  String selectedClass="";
  String beg="";
  String end="";
  weekIndex=((Integer)request.getAttribute("countWeek")).intValue();
  ArrayList classList=(ArrayList)request.getAttribute("classList");
  ArrayList courseList=(ArrayList)request.getAttribute("allCourse");
  ArrayList courses=(ArrayList)request.getAttribute("courses");
  selectedClass=(String)request.getAttribute("className");  
  beg=(String)request.getAttribute("begTime");
  end=(String)request.getAttribute("endTime");
  
  if(beg==null)beg="";
  if(end==null)end="";
  if(selectedClass==null)selectedClass="";
  if(classList!=null)countClass=classList.size();
  if(courseList!=null)countCourse=courseList.size();

  java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd");
  Date date=new Date();
  String year=sdf.format(date).substring(0,4);  
 %>

  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">       
      </td>
    </tr>
    <tr>
      <td >
   <%       

if(countWeek!=null&&!countWeek.equals("")){
		  weekIndex=(new Integer(countWeek)).intValue()+1;
		  
		 }
           %>
    <table width="100%"   border="0" cellspacing="0" cellpadding="0"><tr><td>  
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center" colspan="2" bgcolor="#FFFFFF"><%=year %>��<dict:write businTypeId="season" property="sesson" /><logic:equal property="path" value="1">��ѧ�ƻ��ճ̰����ܱ�</logic:equal><logic:equal property="path" value="2">��ѧִ�мƻ������ܱ�</logic:equal>
            </td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" valign="top" bgcolor="#FFFFFF">��<%=beg%>�� <%=end%>��</td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" bgcolor="#FFFFFF">������</td>
          </tr>
            <tr bgcolor="#FFFFFF"> <td height="30" align="left" bgcolor="#FFFFFF"><logic:equal property="isFirst" value="1">��1��</logic:equal></td>
            <td height="30" align="right" class="text">
       </td>
          </tr>
        </table>   
		<%		
		 int printWeekIndex=1;
for(int h=0;h<weekIndex;h++){
		   strWeekIndex=(new Integer(h)).toString();
		   printWeekIndex++;
		%> 
	   <a name='week<%=h%>'></a>
        <table width="100%"  align="center"    border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF"  >
          <tr align="center" > 
            <td colspan="3" align="center">�༶</td>
         <%
  for(int w=0;w<countClass;w++){
             ClassEnt clazz=new ClassEnt();
             clazz=(ClassEnt)classList.get(w);
             
          %>   
			<td colspan="2" width="20%">
			<%=clazz.getClassName()%>
			</td>
           <%
           }//����༶������
           %> 
          </tr>
          
          <tr> 
            <td width="1%" align="center" class="td_title">��<br>��</td>
            <td width="1%" align="center" class="td_title">��<br>��</td>
            <td width="1%" align="center" class="td_title">��<br>��</td>
           <%
     for(int w=0;w<countClass;w++){
          %>   
          <td colspan='2' align="center" class="td1">&nbsp;</td>     
     <%
     }//����ո����
     %> 
          </tr>
      <%
    int    i=0;
     String rowSpan="0";
     String weekDate="";
    int    classNoon=0;
     String classDate="";
     String  month="";
     String  day="";
     String remarkClassDate="";
    int remarkNoon=0;
    boolean print=true;
 
 for(int m=0;m<countCourse;m++){//���ƴ�ѭ��(ʱ��)
      Course course=(Course)courseList.get(m);
      String week=String.valueOf(course.getWeekIndex());
      rowSpan=String.valueOf(course.getRowSpan());
      weekDate=course.getWeekDate();
      classNoon=course.getClassNoon();
      classDate=course.getClassDate();
   if(m==0){//�ȼ�¼����������ĸ�����
      remarkClassDate=classDate;
      remarkNoon=classNoon;
      }else{
      if(classDate.equals(remarkClassDate)&&classNoon==remarkNoon)print=false;//����ͬһ��ͬһ���ֻ���һ��
      if(classDate.equals(remarkClassDate)&&classNoon!=remarkNoon){print=true;remarkNoon=classNoon;}
      if(!classDate.equals(remarkClassDate)){print=true;remarkClassDate=classDate;remarkNoon=classNoon;}
     
      }
   
       if(classDate!=null&&classDate.length()>5){
                month=classDate.substring(5,7);              
             }
       if(classDate!=null&&classDate.length()>7){
                day=classDate.substring(8,10);
             }
 %>
 
    
        <%
   if(week!=null&&week.equals(strWeekIndex)&&print){//�Ǳ��ܵĲ����
        %>
          <tr class="td1"> 
          <%
       if(rowSpan!=null&&!rowSpan.equals("0")){//ÿ��ֻ���һ��
           %>
            <td rowspan='<%=rowSpan %>'><br><%=month %>��<br><%=day %><br>��</td>
            <td rowspan='<%=rowSpan %>'><%=weekDate%></td>            
           <%
           }//ÿ��ֻ���һ�ν���
            rowSpan="0";
            %>
            <td><%
            if(classNoon==0)out.write("��\n��");
            if(classNoon==1)out.write("��\n��");
            if(classNoon==2)out.write("��\n��");
            if(classNoon==3)out.write("ȫ\n��");
            %></td>	
            <%
     for(int p=0;p<countClass;p++){
          %> 
           <td colspan='2' width="20%">             
               <%
              int classIdInClass=0;//��ǰ�༶��id 
                ClassEnt clazz=new ClassEnt();
                clazz=(ClassEnt)classList.get(p);  
                classIdInClass=clazz.getClassId();
     
      String  courseDate="";
     int    courseNoon=0;
      String  courseName="";
     int    classId=0;
      String  courseId="";
      String  exists="";
     
      Course  co=new Course();
      
       for(int num=0;num<countCourse;num++){//for---1
                  co=(Course)courseList.get(num);
                  courseId=String.valueOf(co.getCourseId());
                  courseDate=co.getClassDate();
                  courseNoon=co.getClassNoon();
                  courseName=co.getCourseTitle();
                  classId=co.getClassId();
                
                 
    //System.out.println("=======classId:"+classId+"======classIdInClass:"+classIdInClass);
      if((String)request.getAttribute(courseId)!=null)
             exists=(String)request.getAttribute(courseId); 
      if(courseDate.equals(classDate)&&courseNoon==classNoon&&classId==classIdInClass){
          if(!exists.equals(courseId)){ 
              out.println(courseName+"<br>"); 
              request.setAttribute(courseId,courseId);
              }
             
             }
            }//---end for---1
          
              %>   
            </td>        	
        <%
        }
        %><!--�γ����ݵ�Ԫ�����-->  
        
        
          </tr>
          <%
          }//�������ڱ�����ͬһ�����ڵ� %>
      
     <%} %> 
      
      
     </table>
     <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
           <td height="30" align="left" class="text_red">
           <%if(printWeekIndex<=weekIndex){%>
            ��<%=printWeekIndex %>��
            <%}%>
            </td>
            <td height="30" align="right" class="text">
        
            </td>
          </tr>          
        </table>       
     <%} %>
	 </td></tr></table>  
	 
       </td>
    </tr>    
  </table>
  <TABLE><tr><td colspan="2" class="td1">
  ��ע��</td></tr>
    <tr > <td class="td1">�Ͽεص�</td> </tr>
  
    <%
   for(int w=0;w<countClass;w++){
             ClassEnt clazz=new ClassEnt();
             clazz=(ClassEnt)classList.get(w);
             
          %>   
      <tr><td class="td1">    
       <%=clazz.getClassName()%>:
       </td>
       <td class="text_red">
        <%=clazz.getClassRoom()%>
        </td>
      </tr>
       <%
       }//������ҽ���
       %> 
   </td>
</tr>
  </TABLE>