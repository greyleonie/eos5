<%@include file="/internet/common.jsp"%>

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
      <html:hidden property="TeachingPlan/PlanID"/>
      <html:hidden property="export"/>
      <html:hidden property="isAdd"/>
      <html:hidden name="planStatus" property="TeachingPlan/State"/> 
      <html:hidden property="TeachingPlanUnit/PlanID"/>   
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
          <bean:write property="TeachingPlan/PlanName"/>&nbsp;
             �ϱ���ֹʱ�䣺<bean:write property="TeachingPlan/DateLine" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            <input name="B3" type="button" class="button_02" value="�� ��" onclick="export2Doc()">   
            <input name="B3" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">   
            <logic:equal property="TeachingPlan/State" value="2">
              <qx:talentButton property="B3" type="button" styleClass="button_eight" value="����������" onclick="showOpinion()" operation="DX_teachWork_nk.DX_teachWork_nk_views"/>
         
           <!-- <input name="B3" type="button" class="button_eight" value="����������" style="width: 90; height: 18" onclick="showOpinion()"> -->
           <!-- <input name="B1" type="button" class="button_eight" value="���ͨ��" style="width: 90; height: 18" onclick="setResult('3')"> -->
             <qx:talentButton property="B1" type="button" styleClass="button_eight" value="���ͨ��" onclick="setResult('3')" operation="DX_teachWork_nk.DX_teachWork_nk_y1"/>
             <qx:talentButton property="B2" type="button" styleClass="button_eight" value="��˲�ͨ��" onclick="setResult('-1')" operation="DX_teachWork_nk.DX_teachWork_nk_n1"/>
         <!--
            <input name="B2" type="button" class="button_eight" value="��˲�ͨ��" style="width: 90; height: 18" onclick="setResult('-1')"> -->
          </logic:equal>
           <logic:equal property="TeachingPlan/State" value="4">
            <qx:talentButton property="B3" type="button" styleClass="button_eight" value="�����������" onclick="showOpinion()" operation="DX_teachWork_nk.DX_teachWork_nk_views"/>
          
           <!-- <input name="B3" type="button" class="button_eight" value="�����������" style="width: 90; height: 18" onclick="showOpinion()"> -->
              <qx:talentButton property="B1" type="button" styleClass="button_eight" value="����ͨ��" onclick="setResult('5')" operation="DX_teachWork_nk.DX_teachWork_nk_y2"/>
          <!--
            <input name="B1" type="button" class="button_eight" value="����ͨ��" style="width: 90; height: 18" onclick="setResult('5')"> -->
           <!-- <input name="B2" type="button" class="button_eight" value="������ͨ��" style="width: 90; height: 18" onclick="setResult('3')"> -->
           <qx:talentButton property="B2" type="button" styleClass="button_eight" value="������ͨ��" onclick="setResult('3')" operation="DX_teachWork_nk.DX_teachWork_nk_n2"/>
          
          </logic:equal>
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
         <td colspan="2" align="left">���в���<bean:write id="subjectList" property="SpecialSubject/TeachingGroupID"/></td><td colspan="8" align="right">
         </td></tr>
          <tr align="center" class="td2">
            <td width="7%" height="20">ר���</td>
            <td width="15%" height="20">ר����Ŀ</td>
            <td width="9%" height="20">����ʱ��</td>
            <td width="5%" height="20">ѧʱ</td>
            <td width="25%" height="20">�γ�����</td>
            <td  height="20">����</td>
            <td width="11%" height="20">�ڿ���</td>
            <td width="6%" height="20">ѧʱ</td>
            <td width="9%" height="20">��ѧ��ʽ</td>
            <td width="13%" height="20">����</td>
          </tr>
          <tr class="td1" onDBlClick="updateCourse('<bean:write id="courseResult" property="Course/ClassID"/>')">
          <html:hidden id="subjectList" property="SpecialSubject/SpecialID"/>
            <td width="7%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>' nowrap>           
            ר��<%=array[count]%></td>
            <td width="15%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <bean:write id="subjectList" property="SpecialSubject/Title"/>
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
             String img="";
             String msg="";
           %>
            <logic:iterate id="forCourse" property="list[@type='Course']">
                <logic:equal propertyId="subjectList" property="SpecialSubject/SpecialID" valueType="variable" valueId="forCourse" value="Course/SpecialID">
                 <%               
                 
                 if(hasCourse==0){ %>
               <td width="25%" height="20"><bean:write id="forCourse" property="Course/CourseTitle"/>&nbsp;</td>
                <td  height="20">
                  <logic:equal id="forCourse" property="Course/IsUseKQJ" value="1">��</logic:equal>
                  <logic:equal id="forCourse" property="Course/IsUseKQJ" value="0">��</logic:equal>
                </td>
                 <%
                 
                
                 try{
                 String title=base.util.TalentContext.getValue(pageContext,"forCourse","Course/CourseTitle");
                 courseId=base.util.TalentContext.getValue(pageContext,"forCourse","Course/CourseID");
                 classHour=base.util.TalentContext.getValue(pageContext,"forCourse","Course/ClassHour");
                 teacher=base.util.TalentContext.getValue(pageContext,"forCourse","Course/Teachers");
                 teahchingModelID=base.util.TalentContext.getValue(pageContext,"forCourse","Course/TeahchingModelID");
                 img=base.util.TalentContext.getValue(pageContext,"forCourse","Course/img");
                 msg=base.util.TalentContext.getValue(pageContext,"forCourse","Course/msg");
                 
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
             <a href="javascript:showCheckPage('<%=courseId %>')">
       <img border="0" title="<%=msg%>" src="<%=img%>" width="22" height="24" ></a>      
             <%}%>
            </td>
            <%if(hasCourse==0){ %>
             <td  height="20" align="center">&nbsp; </td>
                  <%}%>
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
            <td  height="20">
                  <logic:equal id="otherCourse" property="Course/IsUseKQJ" value="1">��</logic:equal>
                  <logic:equal id="otherCourse" property="Course/IsUseKQJ" value="0">��</logic:equal>
                </td>
            <td width="11%" height="15" ><bean:write id="otherCourse" property="Course/Teachers"/>&nbsp;</td>
            <td width="6%" height="15" ><bean:write id="otherCourse" property="Course/ClassHour"/>&nbsp;</td>
            <td width="9%" height="15" ><bean:write id="otherCourse" property="Course/TeahchingModelID"/>&nbsp;</td>
            <td width="13%" height="15" align="center" > 
             <a href="javascript:showCheckPage('<bean:write id="otherCourse" property="Course/CourseID"/>')">
       <img border="0" title="<bean:write id="otherCourse" property="Course/msg"/>" src="<bean:write id="otherCourse" property="Course/img"/>" width="22" height="24" ></a>
      </td>
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
var frm=document.forms[0];

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

function showCheckPage(courseId){
   var planStatus=frm.elements["planStatus"].value;
   var remark=new Date().getTime();   
   var loc="teachWorkManage.prMakeTeachPlan.getOpinionOfCourse.do?planStatus="+planStatus+"&remark="+remark+"&Course/CourseID="+courseId;
   window.open(loc,"","width=460,height=200,left=200,top=200,status=yes,scroll=yes"); 
}


function showOpinion(){
   var planStatus=frm.elements["planStatus"].value;
   var sql=specialIds();
   var remark=new Date().getTime();   //planStatus������������˽׶λ��������׶� 4:�����׶�
   var loc="teachWorkManage.prMakeTeachPlan.optionsOfLeader.do?planStatus="+planStatus+"&remark="+remark+"&conditionSql="+sql+"&TeachingPlan/PlanID="+frm.elements["TeachingPlanUnit/PlanID"].value;
   window.open(loc,"","top=130,left=130,width=660,height=480,status=yes,scrollbars=yes"); 
  
}

function specialIds(){
   var specialIds=frm.elements;
   var sql="";  
   for(var i=0;i<specialIds.length;i++){
    var obj=specialIds[i];
   if(obj.name=="SpecialSubject/SpecialID"&&obj.type=="hidden"){
      if(sql==""){
         sql="specialId="+specialIds[i].value;
      }else{
        sql+=" or specialId="+specialIds[i].value;
      }
      }
      
   }//for
  
  return sql; 
   
}

function setResult(state){
  frm.action="teachWorkManage.prMakeTeachPlan.leaderSetStateOfPlan.do?TeachingPlan/State="+state;
  frm.submit();
}

function updateCourse(coruseId){
  frm.action="teachWorkManage.prMakeTeachPlan.queryOneCourse.do?courseInSubject=1&Course/CourseID="+coruseId;
  frm.elements["isAdd"].value="3";
  frm.submit();
}
</script>