<%@include file="/internet/common.jsp"%>
<%
base.util.RightParse RP = new base.util.RightParse();
	boolean canAdd = RP.parse("DX_teachWorkManage_subject.DX_teachWorkManage_subject_add",session) ;
	boolean canUpdate = RP.parse("DX_teachWorkManage_subject.DX_teachWorkManage_subject_update",session) ;
	boolean canDel = RP.parse("DX_teachWorkManage_subject.DX_teachWorkManage_subject_del",session) ;
 %>
<body>
<form name="frm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ�����</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">       
      <html:hidden property="TeachingPlan/State"/>
      <html:hidden property="export"/>
      <html:hidden property="isAdd"/>
      <html:hidden property="loc"/>
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
          <html:select property="TeachingPlan/PlanID" onchange="selectClass()" > 
              <html:option value="-1">--��ѡ���ѧ�ƻ�--</html:option> 
              <html:options property="list[@type='TeachingPlan']/TeachingPlan/PlanID" labelProperty="list[@type='TeachingPlan']/TeachingPlan/PlanName"/> 
              </html:select> &nbsp;
             �ϱ���ֹʱ�䣺<bean:write property="TeachingPlan/DateLine" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
           <input name="B3" type="button" class="button_02" value="�� ��" onclick="export2Doc()">   
            <input name="B3" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">   
          
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
      <table width="98%" id="listdetail"><tr><td>
      <logic:iterate id="subjectList" property="list[@type='SpecialSubject']">       
        <table width="98%"  border="1" align="center" cellpadding="0"   cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
         <tr  align="left" class="td_title">
         <td colspan="2" align="left">���в���<bean:write id="subjectList" property="SpecialSubject/TeachingGroupID"/></td><td colspan="7" align="right">
            <%if(canAdd){%>
         <input type="button" onclick="addCourse('<bean:write id="subjectList" property="SpecialSubject/SpecialID"/>')" class="button_02_blue" value="�����γ�">
          <% }else{               
               %>
                 <input type="button" disabled="true" onclick="addCourse('<bean:write id="subjectList" property="SpecialSubject/SpecialID"/>')" class="button_02_blue" value="�����γ�">
         
            <%} %>
         </td></tr>
          <tr align="center" class="td2">
            <td width="7%" height="20">ר���</td>
            <td width="15%" height="20">ר����Ŀ</td>
            <td width="9%" height="20">����ʱ��</td>
            <td width="5%" height="20">ѧʱ</td>
            <td width="25%" height="20">�γ�����</td>
            <td width="11%" height="20">�ڿ���</td>
            <td width="6%" height="20">ѧʱ</td>
            <td width="9%" height="20">��ѧ��ʽ</td>
            <td width="13%" height="20">����</td>
          </tr>
          <tr class="td1">
            <td width="7%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>' nowrap>
           
            ר��<%=array[count]%></td>
            <td width="15%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <a href="#"><bean:write id="subjectList" property="SpecialSubject/Title"/></a>
            </td>
            <td width="9%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <bean:write id="subjectList" property="SpecialSubject/ClassTime"/>
            </td>
            <td width="5%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
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
               <td width="25%" height="20"><bean:write id="forCourse" property="Course/CourseTitle"/>&nbsp;</td>
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
              <td width="25%" height="20">��û�пγ̣�</td>
            <%} %>
            <td width="11%" height="20"><%=teacher %>&nbsp;</td>
            <td width="6%" height="20"><%=classHour %>&nbsp;</td>
            <td width="9%" height="20"><%=teahchingModelID %>&nbsp;</td>
            <td width="13%" height="20" align="center">
             <%if(hasCourse==0){ %>
               &nbsp;
             <%}else{%>
            <%if(canDel){%>
            <a href="javascript:delCourse('<%=courseId %>')">ɾ��</a> 
            <%}else{ %>
              ɾ��
            <%} %>
            <%if(canUpdate){%>
            <a href="javascript:updateCourse('<%=courseId %>')">�޸�</a>
             <%}else{ %>
             �޸�
             <%} %>
             <%}%>
            </td>
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
            <td width="25%" height="15" ><bean:write id="otherCourse" property="Course/CourseTitle"/>&nbsp;</td>
            <td width="11%" height="15" ><bean:write id="otherCourse" property="Course/Teachers"/>&nbsp;</td>
            <td width="6%" height="15" ><bean:write id="otherCourse" property="Course/ClassHour"/>&nbsp;</td>
            <td width="9%" height="15" ><bean:write id="otherCourse" property="Course/TeahchingModelID"/>&nbsp;</td>
            <td width="13%" height="15" align="center" > 
           <%if(canDel){%>
            <a href="javascript:delCourse('<bean:write id="otherCourse" property="Course/CourseID"/>')">ɾ��</a> 
             <%}else{ %>
              ɾ��
            <%} %>
           <%if(canUpdate){%>
            <a href="javascript:updateCourse('<bean:write id="otherCourse" property="Course/CourseID"/>')">�޸�</a></td>
             <%}else{ %>
          �޸�
          <%} %>
          </tr> 
          <%} %>
          </logic:equal>
          </logic:iterate>    
        </table>
        <%count++; %>
        </logic:iterate> 
        <%if(count==0){ %>
        <table width="98%"  border="1" align="center" cellpadding="0"   cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
          <tr><td class="td1" align="center">
        &nbsp;
           </td></tr>
            <tr><td class="td1" align="center">
        &nbsp;
           </td></tr>
            <tr><td class="td1" align="center">
        &nbsp;
           </td></tr>
         <tr><td class="td1" align="center">
         û��ר��!
           </td></tr>    
        </table>
        <%} %>        
       </td></tr></table>
        </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
<script language="javascript">
var frm=document.frm;

function addMajorSubject(){
  frm.action="teachWorkManage.prMakeTeachPlan.editSubjectPage.do";
  frm.submit();
}

function addCourse(specialId){ 
  frm.action="teachWorkManage.prMakeTeachPlan.addCourse.do?specialId="+specialId;
  frm.submit();
}



function updateSubject(){
   if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
  
  frm.action="teachWorkManage.prMakeTeachPlan.querySubject.do";
  frm.submit();
}

function delSubject(){
 if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(confirm("ɾ��ר���ɾ����صĿγ̣��Ƿ�ȷ����")==true){
  frm.action="teachWorkManage.prMakeTeachPlan.delSubject.do";
  frm.submit();
  }
}

function export2Doc(){
  frm.elements["export"].value="1";
  frm.action="teachWorkManage.prMakeTeachPlan.editMajorSuject.do";
  frm.target="_blank";
  frm.submit();
}


function send2Head(){
     var loc="teachWorkManage.prMakeTeachPlan.subject4HeadChecked.do?TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
   window.open(loc,"","left=150,top=150,height=300,width=600,status=yes"); 
}

function delCourse(coruseId){
  if(confirm("�Ƿ�ȷ��ɾ��ָ����¼��")==false){
			return ;
		} 
  frm.action="teachWorkManage.prMakeTeachPlan.delCourseInMajorSubject.do?Course/CourseID="+coruseId;
  frm.submit();
}

function updateCourse(coruseId){
  frm.action="teachWorkManage.prMakeTeachPlan.queryOneCourse.do?courseInSubject=1&Course/CourseID="+coruseId;
  frm.elements["isAdd"].value="2";
  frm.submit();
}

function selectClass(){
frm.elements["TeachingPlan/State"].value="";
 if(frm.elements["TeachingPlan/PlanID"].value!="-1"){
  frm.action="teachWorkManage.prMakeTeachPlan.headSelectOtherPlan.do?TeachingPlan="; 
  frm.submit();    
 }
}
</script>