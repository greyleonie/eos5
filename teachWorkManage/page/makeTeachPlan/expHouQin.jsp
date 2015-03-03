
<%@ page import="java.util.*,talent.core.*;"%>
<%
  response.setContentType("application/msword;charset=gb2312");
  String ids="";
  String path="";
  String currentWeek="";
  String start="";
  String end="";
  
  String st="";
  String en="";
  
 try{
  currentWeek=request.getParameter("currentWeek");
  if(currentWeek==null||currentWeek.equals("")){
    currentWeek="1";
  }
  path=request.getParameter("isFirst");
  ids=request.getParameter("classIds");
  start=request.getParameter("start[@pattern='yyyy-MM-dd']");
  end=request.getParameter("end[@pattern='yyyy-MM-dd']");
  }catch(Exception e){
    System.out.println("===========errors:"+e);
  }
  if(currentWeek==null)currentWeek="";
  if(ids==null)ids="";
  talent.core.HouQinService.init();     
  if(currentWeek!=null)talent.core.HouQinService.saveAllPlan(request,currentWeek,start,end);
   talent.core.HouQinService.closeCon();

  ArrayList  allCourse=(ArrayList)request.getAttribute("allCourse");
  int countCourse=0;
  if(allCourse!=null)countCourse=allCourse.size();
  
  st=(String)request.getAttribute("start");
  en=(String)request.getAttribute("en");
  if(st==null)st="";
  if(en==null)en="";
 %>

  <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC">
  
    <tr>
      <td class="text">      
        
          <table width="100%"   id="listdetail" border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC"><tr><td align="center"> 
       <%
       Course course=new Course();
       String classTime="";
       String weekDate="";
      int    rowSpan=0; 
       String  classDate="";
       String remarkClassDate="";
       
    for(int i=0;i<countCourse;i++){
          course=(Course)allCourse.get(i);
          classTime=course.getClassTime();
          weekDate=course.getWeekDate();
          rowSpan=course.getRowSpan();
          classDate=course.getClassDate().trim();;
          

       if(!classDate.equals(remarkClassDate)||i==0){
             remarkClassDate=classDate;
        %>
       
        <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC">
          <tr align="center" class="td_title">
            <td align="center">
            <%=classDate%>
            星期<%=weekDate%></td>     
          </tr>
          <tr class="td2">
            <td align="left">
            <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC">
              <tr align="center" class="td1"  border="0"  cellpadding="0">
                <td width="40">时间</td>
                <td width="67">地点</td>
                <td width="227">课程</td>     
                <td width="207">课程/任务说明</td>         
                <td width="207">任务</td>
              </tr>
             
           <%int count=0;
           Course singleCourse=new Course();
           String courseDate="";
           String courseTime="";
          int   timeRowSpan=0;
          int   courseRowSpan=0;
           String classRoom="";
           String courseTitle="";
           String remarkTime="";
           ArrayList services=new ArrayList();
          int   countService=0;
           String remarks="";
           String deskArrange="";
           HashMap hm=new HashMap();
          
       for(int k=0;k<countCourse;k++){  //for2
              singleCourse=(Course)allCourse.get(k);
              courseDate  =singleCourse.getClassDate().trim();
              courseTime  =singleCourse.getClassTime();
              timeRowSpan =singleCourse.getTimeRowSpan();
              courseRowSpan=singleCourse.getRowSpan();
              classRoom   =singleCourse.getClassRoom();
              courseTitle=singleCourse.getCourseTitle();
              services   =singleCourse.getServices();
              remarks    =singleCourse.getRemarks();
              deskArrange=singleCourse.getDeskArrange();
            if(classRoom==null)classRoom="";
            if(services!=null)countService=services.size();
            
        if(courseDate.equals(classDate)){//classDate is equal
          //  if(k==0||!courseTime.equals(remarkTime)){//remakTime
                remarkTime=courseTime;
              
            %>
           <tr class="td1">
               <%if(!hm.containsKey(courseDate+courseTime)){ %>
                <td rowspan='<%=timeRowSpan%>' align="center" width="40">
                  <%=courseTime%>
                </td>
            <% }
           count++;
          
           %>
           
                <td rowspan='<%=courseRowSpan%>' width="67">
                 <%=classRoom%>                
                &nbsp;</td>
                <td width="227" rowspan='<%=courseRowSpan%>'><%=courseTitle%>&nbsp;</td>
                <td width="207" rowspan='<%=courseRowSpan%>' valign="top">课桌布置形式说明：<%=deskArrange%><br><br>备注：<%=remarks%>&nbsp;</td>
               <td width="207"> <%if(services!=null&&countService>0){out.println(services.get(0)); }%></td>
           </tr>
            
             
          <%
          for(int p=0;p<countService;p++){//输出其他任务
               if(p>0){               
           %>
              <tr class="td1">
                <td width="207"><%out.println(services.get(p)); %></td>
              </tr>
           
              <%}
              }//end输出其他任务
            //  }//end 
              hm.put(courseDate+courseTime,courseTime);
                }//end classDate is equal
              }//end for2 %>           
            </table></td>
          </tr> 
          
          </table>         
        
         <%
         }//判断是否和上个日期一致
         }//大循环
         
         if(countCourse==0)out.println("<font font-size:3>没有任务!</font>");
         %>
        </td></tr></table> 
        </td>
    </tr>
   
  </table>
