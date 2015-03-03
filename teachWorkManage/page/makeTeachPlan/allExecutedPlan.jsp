<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*,talent.core.*"%>


<%
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
  talent.core.AllExecutedPlan.getAllTeacher(request);
  talent.core.AllExecutedPlan.getAllClassRoom(request);
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
<form name="form1" method="post">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;
            ��ѧ�ƻ����ܱ�
           
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
      <html:hidden property="printTable" value="��ѧ�ƻ��ճ̰����ܱ�"/>
      <html:hidden property="path"/>
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
            <%=year %>��<dict:select businTypeId="season" property="sesson" /> ��&nbsp;
             <html:text property="regTime[@pattern='yyyy-MM-dd']" value="<%=beg %>" attributesText='class="input" size="12"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["regTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
           ---  <html:text property="reachTime[@pattern='yyyy-MM-dd']" value="<%=end %>" attributesText='class="input" size="12"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["reachTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
         <input name="B32" type="button" onclick="selectClasses()" class="button_02" value="ѡ��༶">  
        <input name="B3" type="button" class="button_02" value="�� ��" onclick="queryPlan()">        
            <input name="B3" type="button" class="button_02" value="�� ��" onclick="exportPlan()">
            <input name="B3" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">       
            <input name="B3" type="button" class="button_eight" value="ѡ���ѧģʽ" onclick="selectTeachModal()"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(ÿҳ�����ʾ5�������Ϣ) 
           
            </td>
        </tr>  
        <tr>
          <td class="text" id="selectedClasses">
               ��ѡ�༶��<%=selectedClass%>
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
            <td align="center" colspan="2" class="text_title"><%=year %>��<dict:write businTypeId="season" property="sesson" />
        ��ѧִ�мƻ�ִ���ܱ�
            </td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" valign="top" class="text_red">��<%=subBeginTime%>�� <%=subEndTime%>��</td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" class="text">������</td>
          </tr>
            <tr> <td height="30" align="left" class="text_red"><logic:equal property="isFirst" value="1">��1��</logic:equal></td>
            <td height="30" align="right" class="text">
            <%
             int temp=0;
             for(int p=0;p<weekIndex;p++){
               temp++;
             %>
             <a href="#week<%=p%>">��<%=temp %>��</a>
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
            <td rowspan='<%=rowSpan %>'><%=month %><br>��<br><%=day %><br>��</td>
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
      String  compere="";
      String  jiaoYuan="";
      String  roomName="";
     int    TeahchingModelID=0;
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
                  TeahchingModelID=co.getTeachingModelId();
                  
             //    if(compere==null)compere="";
                
                 if(roomName==null)roomName="";
    //System.out.println("=======classId:"+classId+"======classIdInClass:"+classIdInClass);
      if((String)request.getAttribute(courseId)!=null)
             exists=(String)request.getAttribute(courseId); 
      if(courseDate.equals(classDate)&&courseNoon==classNoon&&classId==classIdInClass){
          if(!exists.equals(courseId)){ 
              out.println(courseName+"<br>"); 
            if(compere!=""){
                 out.println("�����ˣ�"+compere+"<br>"); 
              }
            if(jiaoYuan!=""){
                out.println("�ον�Ա��"+jiaoYuan+"<br>"); 
              }
           if(TeahchingModelID!=6&&TeahchingModelID!=23){
              out.println("�ص㣺"+roomName+"<br>"); 
              }
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
           <%
             int temp2=0;
             for(int x=0;x<weekIndex;x++){
               temp2++;
             %>
             <a href="#week<%=x%>">��<%=temp2 %>��</a>
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
           document.getElementById("selectedClasses").innerHTML="��ѡ�༶��"+returnArray[1];
           }
   
       }catch(e){}      
   
   if(returnArray!=undefined){ 
      frm.elements["exp"].value="0";
      frm.action="teachWorkManage.prMakeTeachPlan.allExecutedPlan.do?beg=&end=&conditionSql=&isFirst=1";
      frm.target="";
      frm.submit();
    }  
 }
 
 function exportPlan(){
   var beg=frm.elements["regTime[@pattern='yyyy-MM-dd']"].value;
   var end=frm.elements["reachTime[@pattern='yyyy-MM-dd']"].value;
 
    frm.elements["exp"].value="1";
    frm.action="teachWorkManage.prMakeTeachPlan.allExecutedPlan.do?beg="+beg+"&end="+end+"&conditionSql=&isFirst=1";
    frm.target="_blank";
    frm.submit();
 }
 
 function selectTeachModal(){
    var remark=(new Date()).getTime();
    var loc="teachWorkManage.prMakeTeachPlan.selectTeachModal.do?remark="+remark;
    window.open(loc,'','left=220,top=250,width=400,height=300,status=yes');     
 }

function createReport(){
      frm.elements["exp"].value="0";//���ǵ�������
      frm.action="teachWorkManage.prMakeTeachPlan.allTeachPlan.do?beg=&end=&conditionSql=&isFirst=1";
      frm.submit();
}

function queryPlan(){
     var beg=frm.elements["regTime[@pattern='yyyy-MM-dd']"].value;
     var end=frm.elements["reachTime[@pattern='yyyy-MM-dd']"].value;
     if(beg!=""||end!=""){
        frm.elements["exp"].value="0";
        frm.action="teachWorkManage.prMakeTeachPlan.allTeachPlan.do?beg="+beg+"&end="+end+"&conditionSql=&isFirst=1";
        frm.submit();
      }
     if(beg==""&&end==""){
        frm.elements["exp"].value="0";
        frm.action="teachWorkManage.prMakeTeachPlan.allExecutedPlan.do?exp=0&sesson=1"+"&beg=&end=&conditionSql=&classIds=&isFirst=0&path=2";
        frm.submit();
     }
}
</script>