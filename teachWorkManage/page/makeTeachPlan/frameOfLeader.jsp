
<%@include file="/internet/common.jsp"%>


<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;�쵼��������������</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">       
       <html:hidden property="TeachingPlanUnit/PlanID"/>   
       <html:hidden property="TeachingPlanUnit/ClassID"/>            
       <html:hidden property="isAdd"/>    
       <html:hidden property="TeachingPlanUnit/PlanType"/>        
       <input type="hidden" name="Course/ClassID" value="<bean:write property="TeachingPlanUnit/ClassID"/>">      
       <input type="hidden" name="Class/ClassID" value="<bean:write property="TeachingPlanUnit/ClassID"/>">     
        <html:hidden name="planStatus" property="TeachingPlan/State"/> 
       </td>
    </tr>
    <tr>
      <td class="text">  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
            <html:select property="TeachingPlan/PlanID" onchange="selectClass()" style="width:300px"> 
              <html:option value="-1">--��ѡ���ѧ�ƻ�--</html:option> 
              <html:options property="list[@type='TeachingPlan']/TeachingPlan/PlanID" labelProperty="list[@type='TeachingPlan']/TeachingPlan/PlanName"/> 
              </html:select>
          <logic:equal property="TeachingPlan/State" value="2">
           <qx:talentButton property="B3" type="button" styleClass="button_eight" value="����������" onclick="showOpinion()" operation="DX_teachWork_nk.DX_teachWork_nk_views"/>
          <!-- <input name="B3" type="button" class="button_eight" value="����������" style="width: 90; height: 18" onclick="showOpinion()"> -->
            <!--<input name="B1" type="button" class="button_eight" value="���ͨ��" style="width: 90; height: 18" onclick="setResult('3')"> -->
             <qx:talentButton property="B1" type="button" styleClass="button_eight" value="���ͨ��" onclick="setResult('3')" operation="DX_teachWork_nk.DX_teachWork_nk_y1"/>
          <qx:talentButton property="B2" type="button" styleClass="button_eight" value="��˲�ͨ��" onclick="setResult('-1')" operation="DX_teachWork_nk.DX_teachWork_nk_n1"/>
         
           <!-- <input name="B2" type="button" class="button_eight" value="��˲�ͨ��" style="width: 90; height: 18" onclick="setResult('-1')"> -->
          </logic:equal>
           <logic:equal property="TeachingPlan/State" value="4">
             <qx:talentButton property="B3" type="button" styleClass="button_eight" value="�����������" onclick="showOpinion()" operation="DX_teachWork_nk.DX_teachWork_nk_views"/>
          
           <!-- <input name="B3" type="button" class="button_eight" value="�����������" style="width: 90; height: 18" onclick="showOpinion()"> -->
            <!--<input name="B1" type="button" class="button_eight" value="����ͨ��" style="width: 90; height: 18" onclick="setResult('5')"> -->
             <qx:talentButton property="B1" type="button" styleClass="button_eight" value="����ͨ��" onclick="setResult('5')" operation="DX_teachWork_nk.DX_teachWork_nk_y2"/>
           <qx:talentButton property="B2" type="button" styleClass="button_eight" value="������ͨ��" onclick="setResult('3')" operation="DX_teachWork_nk.DX_teachWork_nk_n2"/>
          
           <!-- <input name="B2" type="button" class="button_eight" value="������ͨ��" style="width: 90; height: 18" onclick="setResult('3')"> -->
          </logic:equal>
          </td> 
        </tr>
      </table>
         
      <logic:iterate id="resultSet" property="list[@type='TeachingPlanUnit']">   
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td colspan="13"> <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr title="˫���ɲ鿴��Ԫ��ϸ��Ϣ" onDBlclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>','3')"> 
                  <td width="71%" align="left" class="td_title">
                  <bean:write id="resultSet" property="TeachingPlanUnit/UnitName"/>&nbsp;&nbsp; 
                    <bean:write id="resultSet" property="TeachingPlanUnit/UnitTitle"/>&nbsp;&nbsp; ��ʼ����:<bean:write id="resultSet" property="TeachingPlanUnit/BeginTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
                     ��������:<bean:write id="resultSet" property="TeachingPlanUnit/EndTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td width="29%" align="center" class="td_title">
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
            <td align="center" width="8%">�������</td>
          </tr>
        <logic:iterate id="courseResult" property="list[@type='Course']">
        <logic:equal valueType="variable" valueId="resultSet" value="TeachingPlanUnit/UnitID" propertyId="courseResult" property="Course/UnitID">
         <tr class="td1" onClick="changeTRBgColor(this)"  onDBlClick="courseDetail('<bean:write id="courseResult" property="Course/CourseID"/>','<bean:write id="courseResult" property="Course/ClassID"/>')"> 
            <td align="center"><bean:write id="courseResult" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="courseResult" property="Course/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/></td>
            <td align="center"><dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="courseResult"/></td>
            <td align="center"><bean:write id="courseResult" property="Course/weekDate"/></td>
            <td align="middle"><bean:write id="courseResult" property="Course/CourseTitle"/></td>
            <td align="middle"><bean:write id="courseResult" property="Course/classRoom"/></td>
            <td align="middle">
            <logic:equal id="courseResult" value="0" property="Course/IsUseKQJ">��</logic:equal>
            <logic:equal id="courseResult" value="1" property="Course/IsUseKQJ">��</logic:equal>
            </td>
            <td align="middle"><dict:write businTypeId="BNDICT_teachModal" property="Course/TeahchingModelID" id="courseResult"/></td>
            <td align="middle"><dict:write businTypeId="BNDICT_classRoomModal" property="Course/ClassModelID" id="courseResult"/></td>
            <td align="middle"> <bean:write id="courseResult" property="Course/teachIngMan"/></td>
            <td align="middle"> <bean:write id="courseResult" property="Course/dj"/></td>
            <td align="middle"><bean:write id="courseResult" property="Course/daoHui"/></td><!--�����ʦ-->
            <td align="center">
       <a href="javascript:showCheckPage('<bean:write id="courseResult" property="Course/CourseID"/>')">
       <img border="0" title="<bean:write id="courseResult" property="Course/msg"/>" src="<bean:write id="courseResult" property="Course/img"/>" width="22" height="24" ></a>
       </td>
          </tr>       
            </logic:equal>        
        </logic:iterate>  
        </table>        
        </logic:iterate>
        
        <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
             </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>

</body>

<script language="javascript">
var frm=document.unitForm;

function setStatus(){
try{
    if(frm.elements["Class/ClassID"].value=="-1"){
     frm.elements["B1"].disabled=true;
     frm.elements["B2"].disabled=true;
     frm.elements["B3"].disabled=true;
  }else{
     frm.elements["B1"].disabled=false;
     frm.elements["B2"].disabled=false;
     frm.elements["B3"].disabled=false;
  }
  }catch(e){}
}

function goBak(){
 frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?PageCond=";
 frm.target="_self";
 frm.submit();
}

function showCheckPage(courseId){
   var planStatus=frm.elements["planStatus"].value;
   var remark=new Date().getTime();   
   var loc="teachWorkManage.prMakeTeachPlan.getOpinionOfCourse.do?planStatus="+planStatus+"&remark="+remark+"&Course/CourseID="+courseId;
   window.open(loc,"","width=660px,height=480,status=yes,scroll=yes"); 
}

function addUnit(){
   
 frm.action="teachWorkManage.prMakeTeachPlan.toAddUnit.do?";
 frm.submit();
}

function send4Head(){
   var loc="teachWorkManage.prMakeTeachPlan.putIn2HeadPage.do?Class/ClassID="+frm.elements["Class/ClassID"].value+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
   window.showModalDialog(loc,'','DialogHeight=500px;DiaglogWidth=600px');
}

function delUnit(unitId){
 if(confirm("ɾ���õ�Ԫ��ɾ������صĿγ̣��Ƿ�ȷ����")==false){
			return ;
		}
 frm.action="teachWorkManage.prMakeTeachPlan.delUnit.do?unitId="+unitId;
 frm.submit();
}

function updateUnit(unitId,flag){
   frm.action="teachWorkManage.prMakeTeachPlan.toEditUnitPage.do?loc=2&unitId="+unitId;
   frm.elements["isAdd"].value=flag;
   frm.submit();
}


function setResult(state){
  frm.action="teachWorkManage.prMakeTeachPlan.leaderSetStateOfPlan.do?TeachingPlan/State="+state;
  frm.submit();
}


function courseDetail(coruseId,classId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?loc=2&Course/CourseID="+coruseId+"&Course/ClassID="+classId;
  frm.elements["isAdd"].value="3";
  frm.submit();
}

function selectClass(){
 setStatus();
 

 if(frm.elements["TeachingPlan/PlanID"].value!="-1"){
  frm.action="teachWorkManage.prMakeTeachPlan.headSelectOtherPlan.do?TeachingPlan="; 
  frm.submit();    
 }
}

function showOpinion(){
   var planStatus=frm.elements["planStatus"].value;
   var remark=new Date().getTime();   //planStatus������������˽׶λ��������׶� 4:�����׶�
   var loc="teachWorkManage.prMakeTeachPlan.showAllOpinion.do?planStatus="+planStatus+"&remark="+remark+"&TeachingPlan/ClassID="+frm.elements["Class/ClassID"].value+"&TeachingPlan/PlanID="+frm.elements["TeachingPlanUnit/PlanID"].value;
   window.open(loc,"","top=130,left=130,width=660px,height=480,status=yes,scrollbars=yes"); 
  
}

 setStatus();
</script>