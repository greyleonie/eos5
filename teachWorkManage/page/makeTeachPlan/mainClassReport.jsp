
<%@include file="/internet/common.jsp"%>
<%
base.util.RightParse RP = new base.util.RightParse();
	boolean issue = RP.parse("DX_teachWorkManage_mainClassReport.DX_teachWorkManage_mainClassReport_add",session) ;
	boolean canDel = RP.parse("DX_teachWorkManage_mainClassReport.DX_teachWorkManage_mainClassReport_del",session) ;
	boolean canUpdate = RP.parse("DX_teachWorkManage_mainClassReport.DX_teachWorkManage_mainClassReport_u",session) ;
	//System.out.println("============canUpdate:"+canUpdate);
	String delegateOrg="";
	String currentUserOrg="";
	currentUserOrg=base.util.TalentContext.getValue(pageContext,null,"currentOrgID");
 %>

<body>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;���������</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
       <html:hidden property="TeachingPlan/PlanID"/>     
       <html:hidden property="TeachingPlanUnit/ClassID"/>      
       <html:hidden property="loc" value="4"/>    
       <html:hidden property="isAdd"/>   
       <input type="hidden" name="Course/ClassID" value="<bean:write property="TeachingPlanUnit/ClassID"/>">      
       <input type="hidden" name="Class/ClassID" value="<bean:write property="TeachingPlanUnit/ClassID"/>">     
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="40" class="text">
            <html:select property="TeachingPlan/ClassID" onchange="selectClass()"  style="width:300px"> 
              <html:option value="-1">  ------��ѡ��༶------   </html:option> 
              <html:options property="list[@type='Class']/Class/ClassID" labelProperty="list[@type='Class']/Class/ClassName"/> 
              </html:select>         
          </td>
        </tr>       
      </table>   
         
      <logic:iterate id="resultSet" property="list[@type='TeachingPlanUnit']">   
         <%
           delegateOrg=base.util.TalentContext.getValue(pageContext,"resultSet","TeachingPlanUnit/org");
           if(delegateOrg==null)delegateOrg="";
          %> 
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td colspan="13"> <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr title="˫���ɲ鿴��Ԫ��ϸ��Ϣ" onDBlclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>','3')"> 
                  <td width="71%" align="left" class="td_title">
                  <bean:write id="resultSet" property="TeachingPlanUnit/UnitName"/>&nbsp;&nbsp; 
                    <bean:write id="resultSet" property="TeachingPlanUnit/UnitTitle"/>&nbsp;&nbsp; ��ʼ����:<bean:write id="resultSet" property="TeachingPlanUnit/BeginTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
                     ��������:<bean:write id="resultSet" property="TeachingPlanUnit/EndTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td width="29%" align="center" class="td_title">
              <%if(issue){%>
              <input name="Submit53" type="button" class="button_02_blue" value="�½��γ�" onClick="addSubject('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>')">
              <% }else{               
               %>
                    <input name="Submit53" type="button" disabled="true" class="button_02_blue" value="�½��γ�" onClick="addSubject('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>')">
              
               <%} %>
                 <input name="Submit53" type="button" title="���в��������" class="button_02_blue" value="�������" onClick="showAllOrgView('<bean:write id="resultSet" property="TeachingPlanUnit/UnitName"/>','<bean:write id="resultSet" property="TeachingPlanUnit/ClassID"/>')">
              </td>
                </tr>
                
                  <tr title="˫���ɲ鿴��Ԫ��ϸ��Ϣ" onDBlclick="updateUnit('<bean:write id="resultSet" property="TeachingPlanUnit/UnitID"/>','3')"> 
                  <td width="71%" align="left" colspan="2" class="td_title">��ѧҪ��<bean:write id="resultSet" property="TeachingPlanUnit/Demand"/>
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
          <%try{ %>
      <logic:equal propertyId="resultSet" property="TeachingPlanUnit/UnitID" valueType="variable" valueId="courseResult" value="Course/UnitID">
     
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
            <td align="middle"><bean:write id="courseResult" property="Course/TeahchingModelID"/></td>
            <td align="middle"><dict:write businTypeId="BNDICT_classRoomModal" property="Course/ClassModelID" id="courseResult"/></td>
            <td align="middle"> <bean:write id="courseResult" property="Course/teachIngMan"/></td>
            <td align="middle"> <bean:write id="courseResult" property="Course/dj"/></td>
            <td align="middle"><bean:write id="courseResult" property="Course/daoHui"/></td><!--�����ʦ-->
            <td align="center" nowrap>
            <%try{              
              
            %>
            <logic:equal valueType="variable" valueId="courseResult" value="Course/TeachingGroupID" property="currentOrgID">         
          <% if(canDel){ %>
          <a href="javascript:delSubject('<bean:write id="courseResult" property="Course/CourseID"/>')">ɾ��</a>
           <%}else{ %>
            ɾ��
           <%} %>
          </logic:equal>
            <%           
            }catch(Exception e){
             System.out.println("========errors:"+e);
            } %>
             <% if(canUpdate||delegateOrg.equals(currentUserOrg)){ %>
           <a href="javascript:updateSubject('<bean:write id="courseResult" property="Course/CourseID"/>','<bean:write id="courseResult" property="Course/ClassID"/>')">�޸�</a>
          <%}%>           
          <a href="javascript:writeView('<bean:write id="courseResult" property="Course/CourseID"/>')"><img src="image/pen.JPG" title="���в���ע���" name="selRoomImg" width="18" border="0" height="15" align="absmiddle"></a>
           </td>
          </tr>
        </logic:equal>   
        <%}catch(Exception e){
             System.out.println("========errors:"+e);
            } %>    
        </logic:iterate>  
        </table>        
        </logic:iterate>
      </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
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

function writeView(courseId){
   var loc="teachWorkManage.prMakeTeachPlan.toWriteViewPage.do?planStatus=&remark="+remark+"&Course/CourseID="+courseId;
   var remark=new Date().getTime();  
   window.open(loc,"","left=150,top=150,height=230,width=550,status=yes");
}


function addUnit(){   
 frm.action="teachWorkManage.prMakeTeachPlan.toAddUnit.do";
 frm.submit();
}

function showAllOrgView(unitName,classId){
  var remark=new Date().getTime();   
  var loc="teachWorkManage.prMakeTeachPlan.showAllOrgView.do?remark="+remark+"&unitName="+unitName+"&Course/ClassID="+classId;
 window.showModalDialog(loc,"","top=130;left=130;dialogWidth=660px;height=480px;status=yes;scrollbars=yes"); 
}

function send4Head(){
   var loc="teachWorkManage.prMakeTeachPlan.putIn2HeadPage.do?Class/ClassID="+frm.elements["Class/ClassID"].value+"&TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;
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
   frm.action="teachWorkManage.prMakeTeachPlan.toEditUnitPage.do?loc=4&unitId="+unitId;
   frm.elements["isAdd"].value=flag;
   frm.submit();
}
function addSubject(unitId){
  frm.action="teachWorkManage.prMakeTeachPlan.toAddCourse.do?Course/UnitID="+unitId+"&unitID="+unitId;
  frm.submit();
}



function updateSubject(coruseId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?loc=4&Course/CourseID="+coruseId;
  frm.elements["isAdd"].value="2";
  frm.submit();
}

function courseDetail(coruseId,classId){
  frm.action="teachWorkManage.prMakeTeachPlan.toEditCorusePage.do?Course/CourseID="+coruseId+"&Course/ClassID="+classId;
  frm.elements["isAdd"].value="3";
  frm.submit();
}

function selectClass(){

 if(frm.elements["TeachingPlan/ClassID"].value!="-1"){
  frm.elements["TeachingPlan/PlanID"].value=""; 
  frm.elements["Course/ClassID"].value="";
  frm.elements["Class/ClassID"].value="";
  frm.action="teachWorkManage.prMakeTeachPlan.mainClassReport.do?TeachingPlan="; 
  frm.submit();    
 }
}

function delSubject(coruseId){
 if(confirm("�Ƿ�ȷ��ɾ��ָ����¼��")==false){
			return ;
		} 
  frm.action="teachWorkManage.prMakeTeachPlan.delCourse.do?Course/CourseID="+coruseId;
  frm.submit();
}
</script>