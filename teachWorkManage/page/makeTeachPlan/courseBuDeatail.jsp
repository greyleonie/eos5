<%@include file="/internet/common.jsp"%>

<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
}
</script>
<body>
<form name="courseForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ -&gt; ������� -&gt; ��ѧ�ƻ�����      
              -&gt; �鿴�γ�</td>     
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
      <html:hidden property="isAdd"/>   
       <html:hidden property="TeachingPlan/PlanID"/>  
       <html:hidden property="TeachingPlanUnit/PlanID"/> 
       <html:hidden property="loc"/>     
       </td>
    </tr>
    <tr>
      <td class="text"> &nbsp;      
       </td>
    </tr>
    <tr>
      <td class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" height="714">
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="27">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td colspan="7" class="td1" width="781" height="27">
           <bean:write property="Class/ClassName"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="117" nowrap align="right" class="td2" colspan="2" height="27">��ѧ��Ԫ��</td>
            <td colspan="7" class="td1" width="781" height="27">
            <bean:write property="TeachingPlanUnitBu/UnitName"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="27">��&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�</td> 
            <td colspan="7" class="td1" width="781" height="27">
            <bean:write property="CourseBu/ClassDate"/> 
            <bean:write property="CourseBu/ClassTime"/> 
            <logic:equal value="0" property="CourseBu/ClassNoon">����</logic:equal>
            <logic:equal value="1" property="CourseBu/ClassNoon">����</logic:equal>
            <logic:equal value="2" property="CourseBu/ClassNoon">����</logic:equal>
            <logic:equal value="3" property="CourseBu/ClassNoon">ȫ��</logic:equal>           
        
           </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">�γ̱��⣺</td>
            <td colspan="7" class="td1" width="781" height="27">
           <bean:write property="CourseBu/CourseTitle"/> 
           </td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">�Ƿַ�ʽ��</td>
            <td colspan="2" class="td1" height="27">
          <dict:write businTypeId="BNDICT_unitScoreType" property="CourseBu/ScoringMethod" />              
              </td>  
            <td colspan="3" class="td2" nowrap height="27">
              <p align="right">�Ƿ�ϰ��ϿΣ�</td>  
            <td colspan="2" class="td1"  height="27">          
               <logic:equal property="CourseBu/IsMeldClass" value="0">��</logic:equal>         
            <logic:equal property="CourseBu/IsMeldClass" value="1">��</logic:equal>  </td>  
          </tr>
           <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">ѧ&nbsp;&nbsp;&nbsp;&nbsp;ʱ��</td>
            <td colspan="2" class="td1" height="27">
               <bean:write property="CourseBu/ClassHour"/> 
              </td>  
            <td colspan="3" class="td2" nowrap height="27">
              <p align="right">ѧ&nbsp;&nbsp;&nbsp;&nbsp;�֣�</td>  
            <td colspan="2" class="td1" width="297" height="27">
      <bean:write property="CourseBu/Credit"/> 
          </td>   
          </tr>
          <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">�ڿν�ʦ��</td>
            <td colspan="7" class="td1" width="781" height="27">            
          <bean:write property="CourseBu/shouKe"/>    
          </td>     
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">������ʦ��</td>
            <td colspan="7" class="td1" width="781" height="27">          
         <bean:write property="CourseBu/fuDao"/>           
             </td>     
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">���ν�ʦ��</td>
            <td colspan="7" class="td1" width="781" height="27">
             <bean:write property="CourseBu/Attenders"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="27">�����ʦ��</td>
            <td width="80" class="td1" height="27">
           <bean:write property="CourseBu/Outsider"/>
            </td>
            <td align="right" class="td2" nowrap height="27" colspan="2">�����ʦ��λ��</td>
            <td width="190" class="td1" height="27">
            <bean:write property="CourseBu/OutSideOrg"/>
            </td>
            <td nowrap align="right" class="td2" height="27" colspan="2">�����ʦְ��</td>
            <td width="354" class="td1" height="27">
           <bean:write property="CourseBu/OutSidePost"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">��&nbsp;��&nbsp;�ˣ�</td>
            <td class="td1" colspan="4" width="333" height="27">
            <bean:write property="CourseBu/Compere"/>
            </td>
            <td align="right" class="td2" width="86" height="27" colspan="2">�����ʦ��</td>
            <td class="td1" width="354" height="27">           
           <bean:write property="CourseBu/Conventioneers"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">��ѧģʽ��</td>
            <td class="td1" colspan="4" width="333" height="27">        
            <logic:iterate id="resultEducatingMode" property="list[@type='EducatingMode']">
                   <logic:equal valueId="resultEducatingMode" valueType="variable" value="EducatingMode/EducatingModeID" property="CourseBu/TeahchingModelID">
                     <bean:write id="resultEducatingMode" property="EducatingMode/EducatingMode"/>
                   </logic:equal>
              </logic:iterate>   
         </td>
            <td align="right" class="td2" width="86" height="27" colspan="2">����ģʽ��</td>
            <td class="td1" width="354" height="27">           
              <logic:iterate id="resultClassModal" property="list[@type='RangeMode']">
                   <logic:equal valueId="resultClassModal" valueType="variable" value="RangeMode/RangeModeID" property="CourseBu/ClassModelID">
                     <bean:write id="resultClassModal" property="/RangeMode/RangeMode"/>
                   </logic:equal>
              </logic:iterate>       
          </td>
           </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2"nowrap colspan="2" height="27">��&nbsp;&nbsp;&nbsp;&nbsp;�ң�</td>
            <td colspan="7" class="td1" width="781" height="27">
         <bean:write property="CourseBu/classRoom"/> </td>
          </tr>
          <tr>
            <td align="right" class="td2" width="23" rowspan="5" height="123">����ѧ����</td>
            <td align="right" class="td2" nowrap height="22">��&nbsp;��&nbsp;����</td>
            <td colspan="7" class="td1" width="781" height="22">         
              <logic:equal property="CourseBu/IsUseKQJ" value="0">��</logic:equal>         
            <logic:equal property="CourseBu/IsUseKQJ" value="1">��</logic:equal>
            </td>  
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">��&nbsp;&nbsp;&nbsp;&nbsp;����</td> 
            <td class="td1" colspan="4" width="333" height="22">         
            <logic:equal property="CourseBu/IsUseCourseWare" value="0">��</logic:equal>         
            <logic:equal property="CourseBu/IsUseCourseWare" value="1">��</logic:equal>
            </td>   
            <td align="right" class="td2" width="86" height="22" colspan="2">������ԣ�</td>
            <td class="td1" width="354" height="22"> 
            <logic:equal property="CourseBu/IsUseNotebookPC" value="0">��</logic:equal>         
            <logic:equal property="CourseBu/IsUseNotebookPC" value="1">��</logic:equal>
  </td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">��&nbsp;��&nbsp;����</td>
            <td class="td1" colspan="4" width="333" height="22">          
             <logic:equal property="CourseBu/IsTakeFeature" value="0">��</logic:equal>         
            <logic:equal property="CourseBu/IsTakeFeature" value="1">��</logic:equal>
            </td>
            <td align="right" class="td2" width="86" height="22" colspan="2">�������ࣺ</td>
            <td class="td1" width="354" height="22">  
            <logic:equal property="CourseBu/IsUseCamera" value="0">��</logic:equal>         
            <logic:equal property="CourseBu/IsUseCamera" value="1">��</logic:equal>
  </td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">ȫ������</td>
            <td class="td1" colspan="4" width="333" height="22">           
            <logic:equal property="CourseBu/IsUseVideo" value="0">��</logic:equal>         
            <logic:equal property="CourseBu/IsUseVideo" value="1">��</logic:equal>              
            </td>
            <td align="right" class="td2" width="86" height="22" colspan="2">ý�岥�ţ�</td>
            <td class="td1" width="354" height="22">  
            <logic:equal property="CourseBu/IsUseMediaPlayer" value="0">��</logic:equal>         
            <logic:equal property="CourseBu/IsUseMediaPlayer" value="1">��</logic:equal>             
  </td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="27">���߻�Ͳ��</td>
            <td class="td1" colspan="4" width="333" height="27">
           <bean:write  property="CourseBu/RadioPhones"/>
            ��</td>
            <td align="right" class="td2" width="86" height="27" colspan="2">���߻�Ͳ��</td>
            <td class="td1" width="354" height="27">
           <bean:write  property="CourseBu/WiredPhones"/>
��</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="23" rowspan="4" height="121">�����ڸ���</td>
            <td align="right" class="td2" nowrap height="20">��ϯ̨��λ��</td>
            <td colspan="7" class="td1" width="781" height="20">
           <bean:write  property="CourseBu/PlatformSeats"/>
            ��</td>  
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="22">ѧԱ��λ��</td>
            <td class="td1" colspan="4" width="333" height="22">
             <bean:write  property="CourseBu/StudentSeats"/>
             ��</td>  
            <td align="right" class="td2" width="86" height="22" colspan="2">�豭����Ҷ����</td>
            <td class="td1" width="354" height="22">
          <bean:write  property="CourseBu/Cups"/>
              ��</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="22">��&nbsp;&nbsp;&nbsp;&nbsp;ˮ��</td>
            <td class="td1" colspan="4" width="333" height="22">           
              <logic:equal property="CourseBu/IsUseTea" value="0">��</logic:equal>         
            <logic:equal property="CourseBu/IsUseTea" value="1">��</logic:equal>         
            
            </td> 
            <td align="right" class="td2" width="86" height="22" colspan="2">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td class="td1" width="354" height="22">  
            <logic:equal property="CourseBu/IsUseFlower" value="0">��</logic:equal>         
            <logic:equal property="CourseBu/IsUseFlower" value="1">��</logic:equal> 
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="27">
              <p align="right">����������ʽ��</p>
            </td>
            <td class="td1" colspan="7" width="773" height="27">
            <bean:write property="CourseBu/DeskArrange"/>
           </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="22">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td> 
            <td colspan="7" class="td1" width="781" height="22">
          <bean:write property="CourseBu/Remarks"/>
        </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="22">����֪ͨ��</td>
            <td colspan="7" class="td1" width="781" height="22">
            <logic:equal property="CourseBu/IsSendNotice" value="0">��</logic:equal>         
            <logic:equal property="CourseBu/IsSendNotice" value="1">��</logic:equal> 
</td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
               <input name="Submit2" type="button" class="button_02" value="�ر�" onClick="window.close()"></td>
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
var frm=document.courseForm;

 function goBack(){
  var planID=frm.elements["TeachingPlanUnit/PlanID"].value;
  var loc=frm.elements["loc"].value;
  frm.action="teachWorkManage.prMakeTeachPlan.editUnit.do?TeachingPlan/PlanID="+frm.elements["TeachingPlan/PlanID"].value;

if(loc=="2"){
  frm.action="teachWorkManage.prMakeTeachPlan.leaderCheckFramPage.do?TeachingPlan/PlanID="+planID;
}

if(loc=="3"){
  frm.action="teachWorkManage.prMakeTeachPlan.framePassedInLeader.do?TeachingPlan/PlanID="+planID;
}
if(loc=="4"){
  frm.action="teachWorkManage.prMakeTeachPlan.mainClassReport.do?TeachingPlan/PlanID="+planID;
}
if(loc=="5"){
  frm.action="teachWorkManage.prMakeTeachPlan.filterMainClass.do?isAdopted=&TeachingPlan/PlanID="+planID;
}
if(loc=="6"){
  frm.action="teachWorkManage.prMakeTeachPlan.singleClassPlan.do?isAdopted=1&TeachingPlan/PlanID="+planID;
}
  frm.submit();
 }
</script>