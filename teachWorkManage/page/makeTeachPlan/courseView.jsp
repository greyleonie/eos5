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
            <bean:write property="TeachingPlanUnit/UnitName"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="27">��&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�</td> 
            <td colspan="7" class="td1" width="781" height="27">
            <bean:write property="Course/ClassDate"/> 
            <bean:write property="Course/ClassTime"/> 
            <logic:equal value="0" property="Course/ClassNoon">����</logic:equal>
            <logic:equal value="1" property="Course/ClassNoon">����</logic:equal>
            <logic:equal value="2" property="Course/ClassNoon">����</logic:equal>
            <logic:equal value="3" property="Course/ClassNoon">ȫ��</logic:equal>           
        
           </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">�γ̱��⣺</td>
            <td colspan="7" class="td1" width="781" height="27">
           <bean:write property="Course/CourseTitle"/> 
           </td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">�Ƿַ�ʽ��</td>
            <td colspan="2" class="td1" height="27">
          <dict:write businTypeId="BNDICT_unitScoreType" property="Course/ScoringMethod" />              
              </td>  
            <td colspan="3" class="td2" nowrap height="27">
              <p align="right">�Ƿ�ϰ��ϿΣ�</td>  
            <td colspan="2" class="td1"  height="27">          
               <logic:equal property="Course/IsMeldClass" value="0">��</logic:equal>         
            <logic:equal property="Course/IsMeldClass" value="1">��</logic:equal>  </td>  
          </tr>
           <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">ѧ&nbsp;&nbsp;&nbsp;&nbsp;ʱ��</td>
            <td colspan="2" class="td1" height="27">
               <bean:write property="Course/ClassHour"/> 
              </td>  
            <td colspan="3" class="td2" nowrap height="27">
              <p align="right">ѧ&nbsp;&nbsp;&nbsp;&nbsp;�֣�</td>  
            <td colspan="2" class="td1" width="297" height="27">
      <bean:write property="Course/Credit"/> 
          </td>   
          </tr>
          <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">�ڿν�ʦ��</td>
            <td colspan="7" class="td1" width="781" height="27">            
          <bean:write property="Course/shouKe"/>    
          </td>     
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">������ʦ��</td>
            <td colspan="7" class="td1" width="781" height="27">          
         <bean:write property="Course/fuDao"/>           
             </td>     
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">���ν�ʦ��</td>
            <td colspan="7" class="td1" width="781" height="27">
             <bean:write property="Course/Attenders"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="27">�����ʦ��</td>
            <td width="80" class="td1" height="27">
           <bean:write property="Course/Outsider"/>
            </td>
            <td align="right" class="td2" nowrap height="27" colspan="2">�����ʦ��λ��</td>
            <td width="190" class="td1" height="27">
            <bean:write property="Course/OutSideOrg"/>
            </td>
            <td nowrap align="right" class="td2" height="27" colspan="2">�����ʦְ��</td>
            <td width="354" class="td1" height="27">
           <bean:write property="Course/OutSidePost"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">��&nbsp;��&nbsp;�ˣ�</td>
            <td class="td1" colspan="4" width="333" height="27">
            <bean:write property="Course/Compere"/>
            </td>
            <td align="right" class="td2" width="86" height="27" colspan="2">�����ʦ��</td>
            <td class="td1" width="354" height="27">           
           <bean:write property="Course/Conventioneers"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">��ѧģʽ��</td>
            <td class="td1" colspan="4" width="333" height="27">        
            <logic:iterate id="resultEducatingMode" property="list[@type='EducatingMode']">
                   <logic:equal valueId="resultEducatingMode" valueType="variable" value="EducatingMode/EducatingModeID" property="Course/TeahchingModelID">
                     <bean:write id="resultEducatingMode" property="EducatingMode/EducatingMode"/>
                   </logic:equal>
              </logic:iterate>   
         </td>
            <td align="right" class="td2" width="86" height="27" colspan="2">����ģʽ��</td>
            <td class="td1" width="354" height="27">           
              <logic:iterate id="resultClassModal" property="list[@type='RangeMode']">
                   <logic:equal valueId="resultClassModal" valueType="variable" value="RangeMode/RangeModeID" property="Course/ClassModelID">
                     <bean:write id="resultClassModal" property="/RangeMode/RangeMode"/>
                   </logic:equal>
              </logic:iterate>       
          </td>
           </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2"nowrap colspan="2" height="27">��&nbsp;&nbsp;&nbsp;&nbsp;�ң�</td>
            <td colspan="7" class="td1" width="781" height="27">
         <bean:write property="Course/classRoom"/> </td>
          </tr>
          <tr>
            <td align="right" class="td2" width="23" rowspan="5" height="123">����ѧ����</td>
            <td align="right" class="td2" nowrap height="22">��&nbsp;��&nbsp;����</td>
            <td colspan="7" class="td1" width="781" height="22">         
              <logic:equal property="Course/IsUseKQJ" value="0">��</logic:equal>         
            <logic:equal property="Course/IsUseKQJ" value="1">��</logic:equal>
            </td>  
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">��&nbsp;&nbsp;&nbsp;&nbsp;����</td> 
            <td class="td1" colspan="4" width="333" height="22">         
            <logic:equal property="Course/IsUseCourseWare" value="0">��</logic:equal>         
            <logic:equal property="Course/IsUseCourseWare" value="1">��</logic:equal>
            </td>   
            <td align="right" class="td2" width="86" height="22" colspan="2">������ԣ�</td>
            <td class="td1" width="354" height="22"> 
            <logic:equal property="Course/IsUseNotebookPC" value="0">��</logic:equal>         
            <logic:equal property="Course/IsUseNotebookPC" value="1">��</logic:equal>
  </td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">��&nbsp;��&nbsp;����</td>
            <td class="td1" colspan="4" width="333" height="22">          
             <logic:equal property="Course/IsTakeFeature" value="0">��</logic:equal>         
            <logic:equal property="Course/IsTakeFeature" value="1">��</logic:equal>
            </td>
            <td align="right" class="td2" width="86" height="22" colspan="2">�������ࣺ</td>
            <td class="td1" width="354" height="22">  
            <logic:equal property="Course/IsUseCamera" value="0">��</logic:equal>         
            <logic:equal property="Course/IsUseCamera" value="1">��</logic:equal>
  </td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">ȫ������</td>
            <td class="td1" colspan="4" width="333" height="22">           
            <logic:equal property="Course/IsUseVideo" value="0">��</logic:equal>         
            <logic:equal property="Course/IsUseVideo" value="1">��</logic:equal>              
            </td>
            <td align="right" class="td2" width="86" height="22" colspan="2">ý�岥�ţ�</td>
            <td class="td1" width="354" height="22">  
            <logic:equal property="Course/IsUseMediaPlayer" value="0">��</logic:equal>         
            <logic:equal property="Course/IsUseMediaPlayer" value="1">��</logic:equal>             
  </td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="27">���߻�Ͳ��</td>
            <td class="td1" colspan="4" width="333" height="27">
           <bean:write  property="Course/RadioPhones"/>
            ��</td>
            <td align="right" class="td2" width="86" height="27" colspan="2">���߻�Ͳ��</td>
            <td class="td1" width="354" height="27">
           <bean:write  property="Course/WiredPhones"/>
��</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="23" rowspan="4" height="121">�����ڸ���</td>
            <td align="right" class="td2" nowrap height="20">��ϯ̨��λ��</td>
            <td colspan="7" class="td1" width="781" height="20">
           <bean:write  property="Course/PlatformSeats"/>
            ��</td>  
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="22">ѧԱ��λ��</td>
            <td class="td1" colspan="4" width="333" height="22">
             <bean:write  property="Course/StudentSeats"/>
             ��</td>  
            <td align="right" class="td2" width="86" height="22" colspan="2">�豭����Ҷ����</td>
            <td class="td1" width="354" height="22">
          <bean:write  property="Course/Cups"/>
              ��</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="22">��&nbsp;&nbsp;&nbsp;&nbsp;ˮ��</td>
            <td class="td1" colspan="4" width="333" height="22">           
              <logic:equal property="Course/IsUseTea" value="0">��</logic:equal>         
            <logic:equal property="Course/IsUseTea" value="1">��</logic:equal>         
            
            </td> 
            <td align="right" class="td2" width="86" height="22" colspan="2">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td class="td1" width="354" height="22">  
            <logic:equal property="Course/IsUseFlower" value="0">��</logic:equal>         
            <logic:equal property="Course/IsUseFlower" value="1">��</logic:equal> 
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="27">
              <p align="right">����������ʽ��</p>
            </td>
            <td class="td1" colspan="7" width="773" height="27">
            <bean:write property="Course/DeskArrange"/>
           </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="22">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td> 
            <td colspan="7" class="td1" width="781" height="22">
          <bean:write property="Course/Remarks"/>
        </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="22">����֪ͨ��</td>
            <td colspan="7" class="td1" width="781" height="22">
            <logic:equal property="Course/IsSendNotice" value="0">��</logic:equal>         
            <logic:equal property="Course/IsSendNotice" value="1">��</logic:equal> 
</td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
               <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>