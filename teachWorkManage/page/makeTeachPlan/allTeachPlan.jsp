<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*;"%>
<%
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
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;
            <logic:equal property="path" value="1">��ѧ�ƻ��ܱ�</logic:equal>
            <logic:equal property="path" value="2">��ѧ�ƻ�ִ���ܱ�</logic:equal>
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
            <%=year %>��<dict:select businTypeId="season" property="sesson" /> 5��&nbsp;
       <input name="B32" type="button" onclick="selectClasses()" class="button_02" value="ѡ��༶">       
            <input name="B3" type="button" class="button_02" value="�� ��" onclick="exportPlan()">
            <input name="B3" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">(ÿҳ�����ʾ5�������Ϣ)        
            <logic:equal property="path" value="2">
            
              <input name="B3" type="button" class="button_02" value="�����ܱ�" onclick="createReport()">
            </logic:equal>
            </td>
        </tr>  
        <tr>
          <td class="text" id="selectedClasses">
               ��ѡ�༶��<bean:write property="classNames"/>
          </td>
        </tr>    
        <tr>
          <td class="text" >
          <%
      
        int weekIndex=0;//�ܵ�����
		 String strWeekIndex="-1";
		 String countWeek=base.util.TalentContext.getValue(pageContext,null,"weekIndex");
		
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
            <td align="center" colspan="2" class="text_title"><%=year %>��<dict:write businTypeId="season" property="sesson" /><logic:equal property="path" value="1">��ѧ�ƻ��ճ̰����ܱ�</logic:equal><logic:equal property="path" value="2">��ѧִ�мƻ������ܱ�</logic:equal>
            </td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" valign="top" class="text_red">��<bean:write property="beg" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>�� <bean:write property="end" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>��</td>
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
        <table width="100%"  align="center"    border="1"   cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
          
          <tr align="center" class="td_title"> 
            <td colspan="3" align="center">�༶</td>
			<logic:iterate id="forClassName" property="list[@type='Class']">
              <td colspan="2" width="20%">
                <bean:write id="forClassName" property="Class/ClassName"/>
              </td>
            </logic:iterate>
          </tr>
       
          <tr class="td2"> 
            <td colspan="3" align="center">�Ͽ�<br>����</td>     
     <logic:iterate id="forRoom" property="list[@type='Class']">
        <td colspan="2" align="left">
        <logic:equal property="path" value="1">
		   <bean:write id="forRoom" property="Class/ClassroomID"/>
		</logic:equal>
		<logic:equal property="path" value="2">��С�������ң�<br>
		   <bean:write id="forRoom" property="Class/teamInfo"/>
		</logic:equal>
		</td>
      </logic:iterate>
          </tr>
        <tr> 
            <td width="1%" align="center" class="td_title">��<br>��</td>
            <td width="1%" align="center" class="td_title">��<br>��</td>
            <td width="1%" align="center" class="td_title">��<br>��</td>
          <logic:iterate id="resultSet" property="list[@type='Class']">
			  <td colspan='2' align="center" class="td1">&nbsp;</td>     
          </logic:iterate>     
          </tr>
    <%
    int i=0;
     String rowSpan="0";
   
 %>
      <logic:iterate id="forCourse" property="list[@type='Course']"><!--��������,����,��ѭ��-->
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
                    
           if(classDate!=null&&classDate.length()>5){
                month=classDate.substring(4,6);              
             }
           if(classDate!=null&&classDate.length()>7){
                day=classDate.substring(6,8);
             }
   
       
     if(week!=null&&week.equals(strWeekIndex)){//�������ڱ�����ͬһ�����ڵ�
        %>
          <tr class="td1"> 
          <%
            
           
       if(rowSpan!=null&&!rowSpan.equals("0")){//ÿ��ֻ���һ��
           %>
            <td rowspan='<bean:write id="forCourse" property="Course/rowSpan"/>'><%=month%><br>��<br><%=day%><br>��</td>
            <td rowspan='<bean:write id="forCourse" property="Course/rowSpan"/>'><bean:write id="forCourse" property="Course/weekDate"/></td>            
           <%
           }//end ÿ��ֻ���һ��
            rowSpan="0";
            %>
            <td><bean:write id="forCourse" property="Course/ClassNoon"/></td>	
     <logic:iterate id="classNum" property="list[@type='Class']"><!--�γ����ݵ�Ԫ��-->
             <td colspan='2' width="20%">&nbsp;             
               <%
                 String classIdInClass=base.util.TalentContext.getValue(pageContext,"classNum","Class/ClassID");//��ǰ�༶��id 
                 
                 
               %> 
                <logic:iterate id="printCourse" property="list[@type='Course']"><!--�γ�����-->
                    <%          
             String  classID   =base.util.TalentContext.getValue(pageContext,"forCourse","Course/ClassID");  
             String  classDate2=base.util.TalentContext.getValue(pageContext,"forCourse","Course/ClassDate");
             String  noon2     =base.util.TalentContext.getValue(pageContext,"forCourse","Course/ClassNoon");
             String  title2    =base.util.TalentContext.getValue(pageContext,"forCourse","Course/CourseTitle");
             String  courseId  =base.util.TalentContext.getValue(pageContext,"forCourse","Course/CourseID");
             String  teahchingModelID  =base.util.TalentContext.getValue(pageContext,"forCourse","Course/TeahchingModelID");
             String  org=base.util.TalentContext.getValue(pageContext,"forCourse","Course/org");
             String  orgHead=base.util.TalentContext.getValue(pageContext,"forCourse","Course/head");
             String  dj=base.util.TalentContext.getValue(pageContext,"forCourse","Course/Compere");
             String  teachers=base.util.TalentContext.getValue(pageContext,"forCourse","Course/Teachers");
             String  attenders=base.util.TalentContext.getValue(pageContext,"forCourse","Course/Conventioneers");
             String  team=base.util.TalentContext.getValue(pageContext,"forCourse","Course/team");  
             String  deskArrange=base.util.TalentContext.getValue(pageContext,"forCourse","Course/DeskArrange");  
             String  isUseCourseWare=base.util.TalentContext.getValue(pageContext,"forCourse","Course/IsUseCourseWare");        
             
           if(title==null)title="";
           if(teahchingModelID==null)teahchingModelID="";
           if(org==null)org="";
           if(orgHead==null)orgHead="";
           if(teachers==null)teachers="";
           if(attenders==null)attenders="";
           if(!attenders.equals("")) attenders="��"+attenders+"��";
           if(team==null)team="";
           if(dj==null)dj="";
           if(deskArrange==null)deskArrange="";
           if(isUseCourseWare==null)isUseCourseWare="";
           if(isUseCourseWare.equals("0")){
              isUseCourseWare="��";
             }
           if(isUseCourseWare.equals("1")){
              isUseCourseWare="��";
             }
       
        if(classIdInClass.equals(classID)&&classDate.equals(classDate2)&&noon.equals(noon2)){             
             String exists="";
             if((String)request.getAttribute(courseId)!=null)
             exists=(String)request.getAttribute(courseId);  
                      
        if(exists.equals("")&&!exists.equals(courseId)){  
         if(teahchingModelID!=null&&teahchingModelID.equals("6")){          
            %>            
           �������ۣ�
             <% 
            }
       if(teahchingModelID!=null&&teahchingModelID.equals("11")){               
          %>
           ������
          <%
          }
       if(teahchingModelID!=null&&teahchingModelID.equals("11")){  
         %>
         ר�⸨����
         <%
       }         
        out.println(title);
        request.setAttribute(courseId,courseId);
           %>      
            
            
              <br>                
              <%if(teahchingModelID.equals("6")){ %>
              ��С�����۵ص㣺<br>
              
              <% 
              out.println(team);              
               }              
                  }//end if2
              } //end if1    
              
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
      frm.elements["exp"].value="0";//���ǵ�������
      frm.action="teachWorkManage.prMakeTeachPlan.allTeachPlan.do?beg=&end=&conditionSql=&isFirst=1";
      frm.submit();
}
</script>