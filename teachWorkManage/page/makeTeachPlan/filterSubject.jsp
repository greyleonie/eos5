<%@include file="/internet/common.jsp"%>
<%
base.util.RightParse RP = new base.util.RightParse();	
	  boolean canUpdate = RP.parse("DX_teachWork_selectSubject.DX_teachWork_selectSubject_update",session) ;
     boolean canAdd = RP.parse("DX_teachWork_selectSubject.DX_teachWork_selectSubject_add",session) ;
     boolean canDel = RP.parse("DX_teachWork_selectSubject.DX_teachWork_selectSubject_del",session) ;
 %>
<body>
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
}
</script>
<form name="frm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;����ɸѡ</td>
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
      <html:hidden property="atMe"/>
      <html:hidden property="atClassRoom"/>
      <html:hidden property="atTeacher"/>
      <html:hidden property="checkIds"/>   
      <html:hidden property="notCheckIds"/>
      <html:hidden property="page"/>
      <html:hidden property="fileName"/>
      <html:hidden property="url"/>
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text" nowrap>
          <html:select property="TeachingPlan/PlanID" onchange="selectClass()" > 
              <html:option value="-1">--��ѡ���ѧ�ƻ�--</html:option> 
              <html:options property="list[@type='TeachingPlan']/TeachingPlan/PlanID" labelProperty="list[@type='TeachingPlan']/TeachingPlan/PlanName"/> 
              </html:select> &nbsp;
             �ϱ���ֹʱ�䣺<bean:write property="TeachingPlan/DateLine" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
           <qx:talentButton property="B5" type="button" styleClass="button_eight" value="�ύ�쵼����" onclick="send4Head()" operation="DX_teachWork_selectSubject.DX_teachWork_selectSubject_h"/> 
           <qx:talentButton property="B4" type="button" styleClass="button_eight" value="��Ϊ�⿪ר��˵�" onclick="setStatus('6')" operation="DX_teachWork_selectSubject.DX_teachWork_selectSubject_e"/> 
            <qx:talentButton property="B6" type="button" styleClass="button_eight" value="���ͱ���������" onclick="send2NetWork()" operation="DX_teachWork_selectSubject.DX_teachWork_selectSubject_w"/> 
             <qx:talentButton property="B7" type="button" styleClass="button_eight" value="���ͽ�ѧ�ƻ�������" onclick="sendPlan()" operation="DX_teachWork_selectSubject.DX_teachWork_selectSubject_t"/> 
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
         <td colspan="2" align="left">���в���<bean:write id="subjectList" property="SpecialSubject/TeachingGroupID"/></td><td colspan="9" align="right">
       <%if(canAdd){ %>
         <input type="button" onclick="addCourse('<bean:write id="subjectList" property="SpecialSubject/SpecialID"/>')" class="button_02_blue" value="�����γ�">
        <%}else{ %> 
          <input type="button" disabled="true" onclick="addCourse('<bean:write id="subjectList" property="SpecialSubject/SpecialID"/>')" class="button_02_blue" value="�����γ�">
        <%} %>
        <logic:lessThan property="TeachingPlan/State" value="5">        
         <input name="Submit53" type="button" class="button_blue_eight" onclick="showAdoptedCourse('1')" value="�Ѳ��ɿ���">
         <input name="Submit53" type="button" class="button_02_blue" onclick="showAdoptedCourse('')" value="���п���">
       </logic:lessThan>
       
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
             <td width="9%" height="20">�Ƿ����</td>
            <td  height="20">����</td>
          </tr>
          <tr class="td1">
            <td width="7%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>' nowrap>
           
            ר��<%=array[count]%></td>
            <td width="15%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
               <bean:write id="subjectList" property="SpecialSubject/Title"/>&nbsp;
            </td>
            <td width="9%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <bean:write id="subjectList" property="SpecialSubject/ClassTime"/>&nbsp;
            </td>
            <td width="5%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <bean:write id="subjectList" property="SpecialSubject/ClassHour"/>&nbsp;
            </td>
           <%          
             String classHour="";
             String teacher="";
             String teahchingModelID="";
             String courseId="";
           int    hasCourse=0; 
             String state="";
           %>
            <logic:iterate id="forCourse" property="list[@type='Course']">
                <logic:equal propertyId="subjectList" property="SpecialSubject/SpecialID" valueType="variable" valueId="forCourse" value="Course/SpecialID">
                 <%               
                 
                 if(hasCourse==0){ %>
               <td width="25%" height="20"><bean:write id="forCourse" property="Course/CourseTitle"/>&nbsp;</td>
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
                 String adopted=base.util.TalentContext.getValue(pageContext,"forCourse","Course/IsAdopted");
                if(adopted==null)adopted="";
                
               if(adopted.equals("1"))  state="checked";      
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
            <%
              String status="";
            if(hasCourse==0){ %>
              <td width="25%" height="20">û�пγ̣�</td>
            <%} %>
            <td width="11%" height="20"><%=teacher %>&nbsp;</td>
            <td width="6%" height="20"><%=classHour %>&nbsp;</td>
            <td width="9%" height="20"><%=teahchingModelID %>&nbsp;</td>
             <td width="9%" height="20" align="center">
              <%if(hasCourse==0){ %>
               &nbsp;
             <%}else{     
               %>
             
                 <input type="checkbox" name="chkBox" <%=state %> value='<%=courseId %>'>
                &nbsp;
              <%}%>
             </td>
            <td  height="20" nowrap align="center">
             <%if(hasCourse==0){ %>
               &nbsp;
             <%}else{            
               %>             
                <logic:notEqual property="TeachingPlan/State" value="3">
                   <a href="javascript:delCourse('<%=courseId %>')">ɾ��</a>
                </logic:notEqual>
            <a href="javascript:updateCourse('<%=courseId %>')">�޸�</a>
             <%}%>
            </td>
             <%if(hasCourse==0){ %>
              <td  height="20" nowrap align="center">&nbsp; </td>
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
             <td height="15" >
            <logic:equal id="otherCourse" property="Course/IsUseKQJ" value="1">
              ��
            </logic:equal>
             <logic:equal id="otherCourse" property="Course/IsUseKQJ" value="0">
             ��
            </logic:equal>
             </td>
            <td width="11%" height="15" ><bean:write id="otherCourse" property="Course/Teachers"/>&nbsp;</td>
            <td width="6%" height="15" ><bean:write id="otherCourse" property="Course/ClassHour"/>&nbsp;</td>
            <td width="9%" height="15" ><bean:write id="otherCourse" property="Course/TeahchingModelID"/>&nbsp;</td>
            <td align="center">
            <%
               try{
                  String isAdopted=base.util.TalentContext.getValue(pageContext,"otherCourse","Course/IsAdopted");                 
                if(isAdopted==null)isAdopted="";
                
               if(isAdopted.equals("1"))  status="checked";              
               
               }catch(Exception e){
                System.out.println("===============:error:"+e);
               }
               
               %>
           
                 <input type="checkbox" name="chkBox" <%=status %> value='<bean:write id="otherCourse" property="Course/CourseID"/>'>
                &nbsp;</td>
            <td nowrap height="15" align="center" > 
               
               
               <logic:notEqual property="TeachingPlan/State" value="3">
               <%if(canDel){ %>
                 <a href="javascript:delCourse('<bean:write id="otherCourse" property="Course/CourseID"/>')">ɾ��</a>
                 <%}else{ %>
                 ɾ��
                 <%} %>
               </logic:notEqual>
                 <%if(canUpdate){ %>
                 <a href="javascript:updateCourse('<bean:write id="otherCourse" property="Course/CourseID"/>')">�޸�</a>
               <%}else{ %>
                �޸�
                 <%} %>
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
       <tr>
      <td class="text"><table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <input name="btnSave" type="button" class="button_02" value="�� ��" onclick="save()"></td>
            </tr>
        </table></td>
    </tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
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
  frm.target="";
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
  frm.target="";
  frm.submit();
}

function updateCourse(coruseId){
  frm.action="teachWorkManage.prMakeTeachPlan.queryOneCourse.do?courseInSubject=1&Course/CourseID="+coruseId;
  frm.elements["isAdd"].value="2";
  frm.target="";
  frm.submit();
}

function setStatus(state){
   var atMe=frm.elements["atMe"].value;
   var atClassRoom=frm.elements["atClassRoom"].value;
   var atTeacher=frm.elements["atTeacher"].value;
   if(atMe!="-1"||atClassRoom!="-1"||atTeacher!="-1"){
    //  alert("�γ̰��Ż����ڳ�ͻ����Ҫ�ٵ�����");
   //   return;
   }

   frm.action="teachWorkManage.prMakeTeachPlan.setSubject2Final.do?status=6";
   frm.submit();
   //window.showModalDialog(loc,"","top:200px;left:200px;dialogWidth:250px;dialogHeight:200px;");
}

function groupCourseId(){
   var checkIds="";
   var notCheckIds="";
   var array=document.getElementsByName("chkBox");
   var len=array.length;

   for(var i=0;i<len;i++){
       var obj=array[i];
    
       if(obj.type=="checkbox"){
        if(obj.checked){  
         
           if(checkIds==""){  
              checkIds=obj.value;
           }else{
              checkIds+=","+obj.value; 
           }//end else
        }else{
           if(notCheckIds==""){
              notCheckIds=obj.value;
           }else{
              notCheckIds+=","+obj.value; 
           }//end else
        }//end else
        
       }// end if(obj.type=="checkbox")
   }//end for
  
 frm.elements["notCheckIds"].value=notCheckIds;
 frm.elements["checkIds"].value=checkIds;

}

function save(){
 frm.action="teachWorkManage.prMakeTeachPlan.acceptSubject.do";
 groupCourseId();
 frm.submit();
 
}

function showAdoptedCourse(remark){
 frm.action="teachWorkManage.prMakeTeachPlan.filterSubject.do?isAdopted="+remark;
 frm.submit();
}

function setButtonStatus(){
  var state=frm.elements["TeachingPlan/State"].value;
  var planId=frm.elements["TeachingPlan/PlanID"].value;
  if(state=="5"){
    frm.elements["B4"].disabled=false;
    frm.elements["B6"].disabled=false;
    frm.elements["B7"].disabled=false;
    }else{
    frm.elements["B4"].disabled=true;
    frm.elements["B6"].disabled=true;
    frm.elements["B7"].disabled=true;
    }
  if(state=="3"){
      frm.elements["B5"].disabled=false; 
      frm.elements["btnSave"].sty=false;
    }else{
      frm.elements["B5"].disabled=true;
      frm.elements["btnSave"].style.display="none";
    }
   
  if(state=="6"){
    frm.elements["B6"].disabled=false;
    frm.elements["B7"].disabled=false;
  } 
  
}

function send4Head(){

   var loc="teachWorkManage.prMakeTeachPlan.putIn2HeadPage.do?TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
   window.open(loc,"","left=150,top=150,height=300,width=600,status=yes");  
}

function selectClass(){
  if(frm.elements["TeachingPlan/PlanID"].value!="-1"){
    frm.elements["TeachingPlan/State"].value="";
    frm.target="";
    frm.submit();
  }
}

function sendPlan(){
  var obj=frm.elements["TeachingPlan/PlanID"];
  frm.elements["fileName"].value=obj.options[obj.selectedIndex].text;
  frm.action="teachWorkManage.prMakeTeachPlan.sendTeachPlan2NetWork.do?isPecialSubject=2";
  frm.target="_blank"; 
  frm.submit();
}


function send2NetWork(){
var reportTable = document.all.listdetail;
var  exml = tabletoxml(reportTable);

var index=frm.elements["TeachingPlan/PlanID"].selectedIndex;
var title=frm.elements["TeachingPlan/PlanID"].options[index].text;
frm.elements["fileName"].value=title;
var remark=(new Date()).getTime();
frm.target="_blank";
frm.action="teachWorkManage.prMakeTeachPlan.sendSubject2NetWork.do?isAdopted=1";
var loc="teachWorkManage.prMakeTeachPlan.setDyNewsDate.do?fileName="+title+"&remark="+remark+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
window.open(loc,"","width=400,height=300,top=100,left=100,status=yes");
//frm.submit();
}
setButtonStatus();
</script>