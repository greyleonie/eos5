<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*,talent.core.*;"%>

<%
  String ids="";
  String path="";
  String isFirst="";
  String classCondition="";
 try{
  isFirst=request.getParameter("isFirst");
  path=request.getParameter("isFirst");
  ids=request.getParameter("classIds");
  }catch(Exception e){
    System.out.println("===========errors:"+e);
  }
  if(isFirst==null)isFirst="";
  if(ids==null)ids="";
  talent.core.AllTeachPlan.init(); 
  talent.core.AllTeachPlan.saveSelectedClass(request,isFirst,ids);
  classCondition=(String)request.getAttribute("classCondition");
  System.out.println("==============printTable:"+request.getParameter("printTable"));
  if(classCondition!=null)talent.core.AllTeachPlan.saveAllPlan(request,classCondition);
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
<body>
<form name="form1" method="post">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;
            教学计划汇总表
           
            </td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">   
      <html:hidden property="classIds"/>
      <html:hidden property="exp"/>
      <html:hidden property="printTable" value="教学计划日程安排总表"/>
      <html:hidden property="path"/>
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
            <%=year %>年<dict:select businTypeId="season" property="sesson" /> 季&nbsp;
       <input name="B32" type="button" onclick="selectClasses()" class="button_02" value="选择班级">       
            <input name="B3" type="button" class="button_02" value="导 出" onclick="exportPlan()">
            <input name="B3" type="button" class="button_02" value="打 印" onclick="iePrint()">(每页最多显示5个班的信息)        
            <input name="B3" type="button" class="button_02" value="教学模式" onclick="selectTeachModal()">
              <!--<input name="B3" type="button" class="button_02" value="生成总表" onclick="createReport()">-->
           
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
            <td align="center" colspan="2" class="text_title"><%=year %>年<dict:write businTypeId="season" property="sesson" /><logic:equal property="path" value="1">教学计划日程安排总表</logic:equal><logic:equal property="path" value="2">教学执行计划安排总表</logic:equal>
            </td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" valign="top" class="text_red">（<%=beg%>至 <%=end%>）</td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" class="text">教务处制</td>
          </tr>
            <tr> <td height="30" align="left" class="text_red"><logic:equal property="isFirst" value="1">第1周</logic:equal></td>
            <td height="30" align="right" class="text">
            <%
             int temp=0;
             for(int p=0;p<weekIndex;p++){
               temp++;
             %>
             <a href="#week<%=p%>">第<%=temp %>周</a>
             <%
             }
             %>
              
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
        <table width="100%"  align="center"    border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
          <tr align="center" class="td_title"> 
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
          <tr class="td2"> 
            <td colspan="3" align="center">上课<br>教室</td>     
    <%
   for(int w=0;w<countClass;w++){
             ClassEnt clazz=new ClassEnt();
             clazz=(ClassEnt)classList.get(w);
             
          %>   
      <td colspan="2" align="left">
        <%=clazz.getClassRoom()%>
	 </td>
      
       <%
       }//输出教室结束
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
            <td rowspan='<%=rowSpan %>'><br><%=month %>月<br><%=day %><br>日</td>
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
           <td colspan='2' width="20%">&nbsp;             
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
              out.println(courseName+"<br><br>"); 
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
           <td height="30" align="left" class="text_red">
           <%if(printWeekIndex<=weekIndex){%>
            第<%=printWeekIndex %>周
            <%}%>
            </td>
            <td height="30" align="right" class="text">
           <%
             int temp2=0;
             for(int x=0;x<weekIndex;x++){
               temp2++;
             %>
             <a href="#week<%=x%>">第<%=temp2 %>周</a>
             <%
             }
             %>
            </td>
          </tr>          
        </table>       
     <%} %>
	 </td></tr></table>  
       </td>
    </tr>    
  </table>
</form>
</body>
<script language="javascript">
 var frm=document.form1;
 
 function selectClasses(){
    var remark=(new Date()).getTime();
    var loc="teachWorkManage.prMakeTeachPlan.selectClasses.do?single=false&remark="+remark;
    var returnArray=new Array();
    var path=frm.elements["path"].value;
  
    try{
           returnArray=window.showModalDialog(loc,'','dialogWidth:570px;dialogHeight:420px');         
           if(returnArray!=undefined){
           frm.classIds.value=returnArray[0];                  
           document.getElementById("selectedClasses").innerHTML="已选班级："+returnArray[1];
           }
   
       }catch(e){}      
    
   if(returnArray!=undefined&&path=="1"){ 
      frm.elements["exp"].value="0";
      frm.action="teachWorkManage.prMakeTeachPlan.allTeachPlan.do?beg=&end=&conditionSql=&isFirst=1";
      frm.submit();
    }  
 }
 
 function exportPlan(){
    frm.elements["exp"].value="1";
    frm.action="teachWorkManage.prMakeTeachPlan.allTeachPlan.do?beg=&end=&conditionSql=&isFirst=1";
    frm.target="_blank";
    frm.submit();
 }
 
 function selectTeachModal(){
    var remark=(new Date()).getTime();
    var loc="teachWorkManage.prMakeTeachPlan.selectTeachModal.do?remark="+remark;
    window.open(loc,'','left=220,top=250,width=400,height=300,status=yes');     
 }

function createReport(){
      frm.elements["exp"].value="0";//不是导出操作
      frm.action="teachWorkManage.prMakeTeachPlan.allTeachPlan.do?beg=&end=&conditionSql=&isFirst=1";
      frm.submit();
}
</script>