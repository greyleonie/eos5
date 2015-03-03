
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
  talent.core.AllExecutedPlan.init(); 
  talent.core.AllExecutedPlan.saveSelectedClass(request,isFirst,ids);
  talent.core.AllExecutedPlan.queryTeacherName(request);
  classCondition=(String)request.getAttribute("classCondition");
  String executedPlan=talent.core.AllExecutedPlan.isExecutedTeachModel();
  if(classCondition!=null)talent.core.AllExecutedPlan.queryTeam(request,classCondition);  
  if(classCondition!=null)talent.core.AllExecutedPlan.saveAllPlan(request,classCondition,executedPlan,begTime,endTime);
   talent.core.AllTeachPlan.closeCon();

  String countWeek="";
  int weekIndex=0;
  String strWeekIndex="-1";
  int countClass=0;
  int countCourse=0;
  String selectedClass="";
  String beg="";
  String end="";
  try{
  weekIndex=((Integer)request.getAttribute("countWeek")).intValue();
  }catch(Exception e){
    System.out.println("====request.getAttribute(countWeek)==========error:"+e);
  }
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
  String subBeginTime=beg.substring(0,10);
  String subEndTime=end.substring(0,10);
 %>
<body>

  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
            <%=year %>年<dict:select businTypeId="season" property="sesson" /> 季&nbsp;
       
           
            </td>
        </tr>  
        <tr>
          <td class="text" id="selectedClasses">
               已选班级：<%=selectedClass%>
          </td>
        </tr>    
        <tr>
          <td class="text" >
          <%
      
   
		
		 if(countWeek!=null&&!countWeek.equals("")){
		  weekIndex=(new Integer(countWeek)).intValue()+1;
		  
		 }
           %>
               
          </td>
        </tr>       
      </table>
	  <table width="100%" id="listdetail" border="0" cellspacing="0" cellpadding="0"><tr><td>  
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center" colspan="2" ><%=year %>年<dict:write businTypeId="season" property="sesson" />
        教学执行计划执行总表
            </td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" valign="top" class="">（<%=subBeginTime%>至 <%=subEndTime%>）</td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" class="text">教务处制</td>
          </tr>
            <tr> <td height="30" align="left" ><logic:equal property="isFirst" value="1">第1周</logic:equal></td>
            <td height="30" align="right" >
           &nbsp;
              
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
        <table width="100%"  align="center"    border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF" >
          <tr align="center" > 
            <td colspan="3" align="center">班级</td>
         <%
  for(int w=0;w<countClass;w++){
             ClassEnt clazz=new ClassEnt();
             clazz=(ClassEnt)classList.get(w);
             
          %>   
			<td colspan="2" width="20%">
			<%=clazz.getClassName()%>
			</td>
           <%
           }//输出班级名结束
           %> 
          </tr>
         
          <tr> 
            <td width="1%" align="center" class="td_title">日<br>期</td>
            <td width="1%" align="center" class="td_title">星<br>期</td>
            <td width="1%" align="center" class="td_title">午<br>别</td>
           <%
     for(int w=0;w<countClass;w++){
          %>   
          <td colspan='2' align="center" class="td1">&nbsp;</td>     
     <%
     }//输出空格结束
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
 
 for(int m=0;m<countCourse;m++){//控制大循环(时间)
      Course course=(Course)courseList.get(m);
      String week=String.valueOf(course.getWeekIndex());
      rowSpan=String.valueOf(course.getRowSpan());
      weekDate=course.getWeekDate();
      classNoon=course.getClassNoon();
      classDate=course.getClassDate();
   if(m==0){//先记录输出是哪天哪个午别的
      remarkClassDate=classDate;
      remarkNoon=classNoon;
      }else{
      if(classDate.equals(remarkClassDate)&&classNoon==remarkNoon)print=false;//控制同一天同一午别只输出一次
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
   if(week!=null&&week.equals(strWeekIndex)&&print){//是本周的才输出
        %>
          <tr class="td1"> 
          <%
       if(rowSpan!=null&&!rowSpan.equals("0")){//每日只输出一次
           %>
            <td rowspan='<%=rowSpan %>'><%=month %><br>月<br><%=day %><br>日</td>
            <td rowspan='<%=rowSpan %>'><%=weekDate%></td>            
           <%
           }//每日只输出一次结束
            rowSpan="0";
            %>
            <td><%
            if(classNoon==0)out.write("上\n午");
            if(classNoon==1)out.write("下\n午");
            if(classNoon==2)out.write("晚\n上");
            if(classNoon==3)out.write("全\n天");
            %></td>	
            <%
     for(int p=0;p<countClass;p++){
          %> 
           <td colspan='2' width="20%">            
               <%
              int classIdInClass=0;//当前班级的id 
                ClassEnt clazz=new ClassEnt();
                clazz=(ClassEnt)classList.get(p);  
                classIdInClass=clazz.getClassId();
     
      String  courseDate="";
     int    courseNoon=0;
      String  courseName="";
     int    classId=0;
      String  courseId="";
      String  exists="";
      String  compere="";
      String  jiaoYuan="";
      String  roomName="";
      Course  co=new Course();
      
       for(int num=0;num<countCourse;num++){//for---1
                  co=(Course)courseList.get(num);
                  courseId=String.valueOf(co.getCourseId());
                  courseDate=co.getClassDate();
                  courseNoon=co.getClassNoon();
                  courseName=co.getCourseTitle();
                  classId=co.getClassId();
                  compere=co.getCompere();
                  jiaoYuan=co.getAttenders();
                  roomName=co.getClassRoom();
                 
                
    //System.out.println("=======classId:"+classId+"======classIdInClass:"+classIdInClass);
      if((String)request.getAttribute(courseId)!=null)
             exists=(String)request.getAttribute(courseId); 
      if(courseDate.equals(classDate)&&courseNoon==classNoon&&classId==classIdInClass){
          if(!exists.equals(courseId)){ 
              out.println(courseName+"<br>");
            if(compere!=""){
                 out.println("主持人："+compere+"<br>"); 
              }
            if(jiaoYuan!=""){
                out.println("任课教员："+jiaoYuan+"<br>"); 
              }
            if(roomName!=""){
              out.println("地点："+roomName+"<br>");
              } 
              request.setAttribute(courseId,courseId);
              }
             
             }
            }//---end for---1
          
              %>   
            </td>        	
        <%
        }
        %><!--课程内容单元格结束-->  
        
        
          </tr>
          <%
          }//控制日期必须是同一个星期的 %>
      
     <%} %> 
      
      
     </table>
     <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
           <td height="30" align="left" class="">
           <%if(printWeekIndex<=weekIndex){%>
            第<%=printWeekIndex %>周
            <%}%>
            </td>
            <td height="30" align="right" class="">
         
            
            </td>
          </tr>          
        </table>       
     <%} %>
	 </td></tr></table>  
       </td>
    </tr>    
  </table>
<TABLE><tr><td colspan="2" class="td1">
  备注：</td></tr>
    <tr > <td class="td1">上课地点</td> </tr>
  
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
       }//输出教室结束
       %> 
   </td>
</tr>
  </TABLE>
</body>