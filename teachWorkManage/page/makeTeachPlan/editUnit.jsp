
<%@include file="/internet/common.jsp"%>


<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;�༭��ѧ�ƻ���Ԫ</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
       <html:hidden property="TeachingPlan/State"/>
       <html:hidden property="TeachingPlan/PlanID"/>
       <html:hidden property="TeachingPlan/ClassID"/>
       <html:hidden property="TeachingPlanUnit/ClassID"/>      
       <html:hidden property="isAdd"/>   
       
       <input type="hidden" name="Class/ClassID" value="<bean:write property="TeachingPlanUnit/ClassID"/>">     
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
          <b>�༶�� <logic:iterate id="clsssResult" property="list[@type='Class']">
             <logic:equal value="Class/ClassID" valueType="variable" valueId="clsssResult" property="TeachingPlan/ClassID">
               <bean:write id="clsssResult" property="Class/ClassName"/>
                </logic:equal>
            </logic:iterate></b>
            <p><b>��ѧ�ƻ����ͣ�   <dict:write businTypeId="BNDICT_teachPlanType" property="TeachingPlan/PlanType"/>
         </b></p>
          </td>
        </tr>
        <tr>
          <td height="30" class="text">         
            <input name="query" type="button" class="button_eight" value="����½�ѧ��Ԫ" onClick="addUnit()">
           <input name="query1" type="button" class="button_eight" value="�ύ�쵼����" onClick="send4Head()">           
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
                  <input name="Submit4" type="button" class="button_02_blue" value="ɾ ��" onclick="delUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>')"> 
                  <input name="Submit5" type="button" class="button_02_blue" value="�� ��" onclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>','2')"> 
                 <logic:notEqual property="TeachingPlan/State" value="6">
                    <input name="Submit53" type="button" class="button_02_blue" value="�½��γ�" onClick="addSubject('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>')"></td>
                 </logic:notEqual>
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
            <td width="5%" align="center">���ڻ�����</td>
            <td width="8%" align="center">��ѧ��ʽ</td>
            <td width="11%" align="center">����ģʽ</td>
            <td width="7%" align="center">�ڿ���</td>
            <td width="6%" align="center">������</td>
            <td width="8%" align="center">�����ʦ</td>
            <td align="center" width="8%">�� ��</td>
          </tr>
        <logic:iterate id="courseResult" property="list[@type='Course']">
        <%try{ %>
             <logic:equal propertyId="resultSet" property="TeachingPlanUnit/UnitID" valueType="variable" valueId="courseResult" value="Course/UnitID">   
         <tr class="td1" onClick="changeTRBgColor(this)"  onDBlClick="courseDetail('<bean:write id="courseResult" property="Course/CourseID"/>','<bean:write id="courseResult" property="Course/ClassID"/>')"> 
            <td align="center"><bean:write id="courseResult" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="courseResult" property="Course/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/></td>
            <td align="center"><dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="courseResult"/></td>
            <td align="center"><bean:write id="courseResult" property="Course/weekDate"/></td>
            <td ><bean:write id="courseResult" property="Course/CourseTitle"/></td>
            <td ><bean:write id="courseResult" property="Course/classRoom"/></td>
            <td align="middle">
            <logic:equal id="courseResult" value="0" property="Course/IsUseKQJ">��</logic:equal>
            <logic:equal id="courseResult" value="1" property="Course/IsUseKQJ">��</logic:equal>
            </td>
            <td align="middle">
            <!--<dict:write businTypeId="BNDICT_teachModal" property="Course/TeahchingModelID" id="courseResult"/>-->           
            <bean:write id="courseResult" property="Course/TeahchingModelID"/>
            </td>
            <td><bean:write id="courseResult" property="Course/ClassModelID"/>            
            <!--<dict:write businTypeId="BNDICT_classRoomModal" property="Course/ClassModelID" id="courseResult"/>-->
            </td>
            <td align="middle"> <bean:write id="courseResult" property="Course/teachIngMan"/></td>
            <td align="middle"> <bean:write id="courseResult" property="Course/dj"/></td>
            <td align="middle"><bean:write id="courseResult" property="Course/daoHui"/></td><!--�����ʦ-->
            <td align="center">
            <%try{ %>
           <a href="javascript:delSubject('<bean:write id="courseResult" property="Course/CourseID"/>')">ɾ��</a> <a href="javascript:updateSubject('<bean:write id="courseResult" property="Course/CourseID"/>','<bean:write id="courseResult" property="Course/ClassID"/>')">�޸�</a>
            <%}catch(Exception e){
                System.out.println("======errors:"+e);
            } %>
            </td>
          </tr>
         </logic:equal>
        <%}catch(Exception e){
          System.out.println("======errors:"+e);
        } %>          
        </logic:iterate>  
        </table>        
        </logic:iterate>
        
        <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onclick="goBack()"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
<p><font color="#C0C0C0">˵����������һ����ѧ��Ԫ��ϵͳӦ���ݸõ�Ԫ����ֹʱ�䣬�Զ����ɿγ̱��ܣ��������ڡ�ʱ�䡢�������ڣ�</font></p>
<p><font color="#C0C0C0">�������������ղ��������ڡ�</font></p>
</body>
<script language="javascript">
var frm=document.unitForm;
function goBak(){
 frm.elements["TeachingPlan/PlanID"].value="";
 frm.elements["TeachingPlan/ClassID"].value="";
 frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?PageCond="; 
 frm.submit();
}



function addUnit(){
   
 frm.action="teachWorkManage.prMakeTeachPlan.toAddUnit.do?";
 frm.submit();
}

function send4Head(){
   var loc="teachWorkManage.prMakeTeachPlan.putIn2HeadPage.do?TeachingPlan/State=1&Class/ClassID="+frm.elements["TeachingPlan/ClassID"].value+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
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
   frm.action="teachWorkManage.prMakeTeachPlan.toEditUnitPage.do?loc=1&unitId="+unitId;
   frm.elements["isAdd"].value=flag;
   frm.submit();
}
function addSubject(unitId){
  frm.action="teachWorkManage.prMakeTeachPlan.toAddCourse.do?Course/UnitID="+unitId+"&unitID="+unitId;
  frm.submit();
}

function delSubject(coruseId){
 if(confirm("�Ƿ�ȷ��ɾ��ָ����¼��")==false){
			return ;
		} 
  frm.action="teachWorkManage.prMakeTeachPlan.delCourse.do?Course/CourseID="+coruseId;
  frm.submit();
}

function updateSubject(coruseId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?loc=1&Course/CourseID="+coruseId+"&Course/ClassID="+frm.elements["TeachingPlanUnit/ClassID"].value;
  frm.elements["isAdd"].value="2";
  frm.submit();
}

function courseDetail(coruseId,classId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?Course/CourseID="+coruseId+"&Course/ClassID="+classId;
  frm.elements["isAdd"].value="3";
  frm.submit();
}

function setButtonStatus(){
var status=frm.elements["TeachingPlan/State"].value;
if(status>1){
  frm.elements["query"].disabled=true;
  frm.elements["query1"].disabled=true;
}
}

function goBack(){
 frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?TeachingPlan=&PageCond=";
 frm.submit();
}

</script>
<script>
//setButtonStatus();
</script>