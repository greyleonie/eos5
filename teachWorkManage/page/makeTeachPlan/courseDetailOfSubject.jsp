
<%@include file="/internet/common.jsp"%>
<%base.util.RightParse RP = new base.util.RightParse();
	boolean issue = RP.parse("DX_teachWork_sc.DX_teachWork_sc_add",session) ;
	boolean canUpdate = RP.parse("DX_teachWork_sc.DX_teachWork_sc_u",session) ;
	boolean canDel = RP.parse("DX_teachWork_sc.DX_teachWork_sc_d",session) ;
	 %>

<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;ר���γ̱�</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">      
       <html:hidden property="TeachingPlan/ClassID"/>  
       <html:hidden property="Class/ClassName"/>        
          
       <html:hidden property="loc" value="6"/>    
       <html:hidden property="isAdd"/>   
       <html:hidden property="isAdopted"/> 
       
       <input type="hidden" name="fileName" value='<bean:write property="className"/>'>
       </td>
    </tr>
    
    
    <tr>
      <td class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text"> 
           <html:select property="TeachingPlan/PlanID" onchange="selectClass()" attributesText='id="printTable"'> 
              <html:option value="-1">--��ѡ��ѧ�ƻ�--</html:option> 
              <html:options property="list[@type='TeachingPlan']/TeachingPlan/PlanID" labelProperty="list[@type='TeachingPlan']/TeachingPlan/PlanName"/> 
              </html:select>
        <input name="view" type="button" class="button_02" value="�� ��" onClick="exp()">     
              <input name="view2" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"></td>
        </tr>       
      </table>   
      <table  width="100%" id="listdetail"><tr><td>
     
        <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
          <tr> 
            <td colspan="13"> <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr title="" onDBlclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>','3')"> 
                  <td width="71%" align="left" class="td_title">
                  ���⣺<bean:write  property="SpecialSubject/Title"/>&nbsp;&nbsp; 
                    &nbsp;&nbsp; </td>
                  <td  align="center" nowrap class="td_title">
       <%if(issue){ %>        
<input name="Submit53" type="button" class="button_02_blue" value="�½��γ�" onClick="addSubject('<bean:write  property="SpecialSubject/SpecialID"/>')">
  <%}else{ %> 
  <input name="Submit53" disabled="true" type="button" class="button_02_blue" value="�½��γ�" onClick="addSubject('<bean:write  property="SpecialSubject/SpecialID"/>')">
 
  <%} %>           
               </td>
                </tr>
                
                  <tr > 
                  <td width="71%" align="left" colspan="2" class="td_title">��ѵĿ�ģ�<bean:write id="resultSet" property="SpecialSubject/Purpose"/>
                 </td>
                 
                </tr>
              </table></td>
          </tr>
          <tr class="td2"> 
            <td width="10%" align="center">����</td>

            <td width="5%" align="center">ʱ��</td>
            <td width="5%" align="center">���</td>
            <td width="5%" align="center">����</td>
            <td width="15%" align="center">ѧϰ����</td>
            <td width="7%" align="center">�ء���</td>
            <td width="5%" align="center">����</td>
            <td width="8%" align="center">��ѧ��ʽ</td>
            <td width="11%" align="center">����ģʽ</td>
            <td width="7%" align="center">�ڿ���</td>
            <td width="6%" align="center">������</td>
            <td width="8%" align="center">�����ʦ</td>
            <td align="center" width="8%">�� ��</td>
          </tr>
        <logic:iterate id="courseResult" property="list[@type='Course']">
       <tr class="td1" onClick="changeTRBgColor(this)"  onDBlClick="courseDetail('<bean:write id="courseResult" property="Course/CourseID"/>','<bean:write id="courseResult" property="Course/ClassID"/>')"> 
            <td align="center"><bean:write id="courseResult" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="courseResult" property="Course/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/>&nbsp;</td>
            <td align="center"><dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="courseResult"/>&nbsp;</td>
            <td align="center"><bean:write id="courseResult" property="Course/weekDate"/></td>
                  <td >&nbsp;<bean:write id="courseResult" property="Course/CourseTitle"/>&nbsp;</td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/classRoom"/>&nbsp;</td>
            <td align="middle">
            <logic:equal id="courseResult" value="0" property="Course/IsUseKQJ">��</logic:equal>
            <logic:equal id="courseResult" value="1" property="Course/IsUseKQJ">��</logic:equal>
            </td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/TeahchingModelID"/>&nbsp;</td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/ClassModelID"/></td>
                  <td align="middle">&nbsp; <bean:write id="courseResult" property="Course/teachIngMan"/>&nbsp;</td>
                  <td align="middle">&nbsp; <bean:write id="courseResult" property="Course/dj"/>&nbsp;</td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/daoHui"/>&nbsp;</td>
            <td align="center"><p>
            <%if(canDel){ %>
            <a href="javascript:delSubject('<bean:write id="courseResult" property="Course/CourseID"/>')">ɾ��</a>
            <%}else{%>
            ɾ��
            <%}
            if(canUpdate){
             %>
            <a href="javascript:updateSubject('<bean:write id="courseResult" property="Course/CourseID"/>','<bean:write id="courseResult" property="Course/ClassID"/>')">�޸�</a>
           <%}else{ %> 
           �޸�
           <%} %>
            </p></td>
          </tr>
         
                 
        </logic:iterate>  
        </table>        
       
        </td></tr></table>
      </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script language="javascript">
var frm=document.unitForm;
function goBak(){
 frm.elements["TeachingPlan/PlanID"].value="";
 frm.elements["TeachingPlan/ClassID"].value="";
 frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?PageCond="; 
 frm.submit();
}

function historyVersionView(){
  var re=(new Date()).getTime();
  var classId=frm.elements["TeachingPlan/ClassID"].value;
  var loc="teachWorkManage.prMakeTeachPlan.showHistoryVersion.do?TeachingPlan/ClassID="+classId+"&re="+re;
//  window.showModalDialog(loc,'','top=200px;left=200px;dialogWidth=550px;dialogHeight=350px;status=yes;scrro=yes');
  window.open(loc,'','top=200,left=200,,Width=550px,,Height=350px,status=yes,scrro=yes');
}

function addUnit(){
   
 frm.action="teachWorkManage.prMakeTeachPlan.toAddUnit.do?";
 frm.submit();
}

function send4Head(){
   var loc="teachWorkManage.prMakeTeachPlan.putIn2HeadPage.do?TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
   window.open(loc,"","left=150,top=150,height=300,width=600,status=yes");  
}

function delUnit(unitId){
 if(confirm("ɾ���õ�Ԫ��ɾ������صĿγ̣��Ƿ�ȷ����")==false){
			return ;
		}
 frm.action="teachWorkManage.prMakeTeachPlan.delUnit.do?unitId="+unitId;
 frm.submit();
}

function updateUnit(unitId,flag){
   frm.action="teachWorkManage.prMakeTeachPlan.toEditUnitPage.do?loc=6";
   frm.elements["isAdd"].value=flag;
   frm.submit();
}
function addSubject(specialId){
  frm.action="teachWorkManage.prMakeTeachPlan.addSubjectCourse.do?Course/SpecialID="+specialId;
  frm.submit();
}



function updateSubject(coruseId){ 
  
  
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?Course/CourseID="+coruseId;
  frm.elements["isAdd"].value="2";
  frm.submit();
}

function courseDetail(coruseId,classId){  
    
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?Course/CourseID="+coruseId;
  frm.elements["isAdd"].value="3";
  frm.submit();
}

function selectClass(){
 if(frm.elements["TeachingPlan/PlanID"].value!="-1"){  
  frm.action="teachWorkManage.prMakeTeachPlan.courseOfSpecialSubject.do"; 
  frm.submit();    
 }
}

function showAdoptedCourse(remark){
 frm.action="teachWorkManage.prMakeTeachPlan.singleClassPlan.do?isAdopted="+remark;
 frm.submit();
}

function delSubject(coruseId){
  if(confirm("ȷ��ɾ���ÿγ���")){
  frm.action="teachWorkManage.prMakeTeachPlan.delCourseOfSubject.do?Course/CourseID="+coruseId;
  }else{
    return;
  }
  frm.submit();
}

function export2Doc(){
 frm.action="teachWorkManage.prMakeTeachPlan.printFinalPlan.do?isAdopted="+frm.elements["isAdopted"].value+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
 frm.target = "_blank";
 frm.submit();
}

function send2NetWork(){
  frm.action="teachWorkManage.prMakeTeachPlan.sendTeachPlan2NetWork.do";
  frm.target="_blank";
  frm.submit();
}


function exp(){
 var obj=frm.elements["TeachingPlan/PlanID"];
 var className=obj.options[obj.selectedIndex].text;
  frm.action="teachWorkManage.prMakeTeachPlan.expSubjectCourse.do?className="+className;
  frm.target="blank";
  frm.submit();
}
</script>