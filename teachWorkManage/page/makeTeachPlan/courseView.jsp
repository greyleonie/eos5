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
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt; 教学计划编制      
              -&gt; 查看课程</td>     
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
            <td align="right" class="td2" width="117" colspan="2" height="27">班&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
            <td colspan="7" class="td1" width="781" height="27">
           <bean:write property="Class/ClassName"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="117" nowrap align="right" class="td2" colspan="2" height="27">教学单元：</td>
            <td colspan="7" class="td1" width="781" height="27">
            <bean:write property="TeachingPlanUnit/UnitName"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="27">日&nbsp;&nbsp;&nbsp;&nbsp;期：</td> 
            <td colspan="7" class="td1" width="781" height="27">
            <bean:write property="Course/ClassDate"/> 
            <bean:write property="Course/ClassTime"/> 
            <logic:equal value="0" property="Course/ClassNoon">上午</logic:equal>
            <logic:equal value="1" property="Course/ClassNoon">下午</logic:equal>
            <logic:equal value="2" property="Course/ClassNoon">晚上</logic:equal>
            <logic:equal value="3" property="Course/ClassNoon">全天</logic:equal>           
        
           </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">课程标题：</td>
            <td colspan="7" class="td1" width="781" height="27">
           <bean:write property="Course/CourseTitle"/> 
           </td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">记分方式：</td>
            <td colspan="2" class="td1" height="27">
          <dict:write businTypeId="BNDICT_unitScoreType" property="Course/ScoringMethod" />              
              </td>  
            <td colspan="3" class="td2" nowrap height="27">
              <p align="right">是否合班上课：</td>  
            <td colspan="2" class="td1"  height="27">          
               <logic:equal property="Course/IsMeldClass" value="0">否</logic:equal>         
            <logic:equal property="Course/IsMeldClass" value="1">是</logic:equal>  </td>  
          </tr>
           <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">学&nbsp;&nbsp;&nbsp;&nbsp;时：</td>
            <td colspan="2" class="td1" height="27">
               <bean:write property="Course/ClassHour"/> 
              </td>  
            <td colspan="3" class="td2" nowrap height="27">
              <p align="right">学&nbsp;&nbsp;&nbsp;&nbsp;分：</td>  
            <td colspan="2" class="td1" width="297" height="27">
      <bean:write property="Course/Credit"/> 
          </td>   
          </tr>
          <tr>
            <td align="right" class="td2" nowrap colspan="2" height="27">授课教师：</td>
            <td colspan="7" class="td1" width="781" height="27">            
          <bean:write property="Course/shouKe"/>    
          </td>     
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">辅导教师：</td>
            <td colspan="7" class="td1" width="781" height="27">          
         <bean:write property="Course/fuDao"/>           
             </td>     
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">到课教师：</td>
            <td colspan="7" class="td1" width="781" height="27">
             <bean:write property="Course/Attenders"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="27">外请教师：</td>
            <td width="80" class="td1" height="27">
           <bean:write property="Course/Outsider"/>
            </td>
            <td align="right" class="td2" nowrap height="27" colspan="2">外请教师单位：</td>
            <td width="190" class="td1" height="27">
            <bean:write property="Course/OutSideOrg"/>
            </td>
            <td nowrap align="right" class="td2" height="27" colspan="2">外请教师职务：</td>
            <td width="354" class="td1" height="27">
           <bean:write property="Course/OutSidePost"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">主&nbsp;持&nbsp;人：</td>
            <td class="td1" colspan="4" width="333" height="27">
            <bean:write property="Course/Compere"/>
            </td>
            <td align="right" class="td2" width="86" height="27" colspan="2">到会教师：</td>
            <td class="td1" width="354" height="27">           
           <bean:write property="Course/Conventioneers"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="27">教学模式：</td>
            <td class="td1" colspan="4" width="333" height="27">        
            <logic:iterate id="resultEducatingMode" property="list[@type='EducatingMode']">
                   <logic:equal valueId="resultEducatingMode" valueType="variable" value="EducatingMode/EducatingModeID" property="Course/TeahchingModelID">
                     <bean:write id="resultEducatingMode" property="EducatingMode/EducatingMode"/>
                   </logic:equal>
              </logic:iterate>   
         </td>
            <td align="right" class="td2" width="86" height="27" colspan="2">课堂模式：</td>
            <td class="td1" width="354" height="27">           
              <logic:iterate id="resultClassModal" property="list[@type='RangeMode']">
                   <logic:equal valueId="resultClassModal" valueType="variable" value="RangeMode/RangeModeID" property="Course/ClassModelID">
                     <bean:write id="resultClassModal" property="/RangeMode/RangeMode"/>
                   </logic:equal>
              </logic:iterate>       
          </td>
           </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2"nowrap colspan="2" height="27">课&nbsp;&nbsp;&nbsp;&nbsp;室：</td>
            <td colspan="7" class="td1" width="781" height="27">
         <bean:write property="Course/classRoom"/> </td>
          </tr>
          <tr>
            <td align="right" class="td2" width="23" rowspan="5" height="123">　教学辅助</td>
            <td align="right" class="td2" nowrap height="22">考&nbsp;勤&nbsp;机：</td>
            <td colspan="7" class="td1" width="781" height="22">         
              <logic:equal property="Course/IsUseKQJ" value="0">否</logic:equal>         
            <logic:equal property="Course/IsUseKQJ" value="1">是</logic:equal>
            </td>  
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">课&nbsp;&nbsp;&nbsp;&nbsp;件：</td> 
            <td class="td1" colspan="4" width="333" height="22">         
            <logic:equal property="Course/IsUseCourseWare" value="0">否</logic:equal>         
            <logic:equal property="Course/IsUseCourseWare" value="1">是</logic:equal>
            </td>   
            <td align="right" class="td2" width="86" height="22" colspan="2">手提电脑：</td>
            <td class="td1" width="354" height="22"> 
            <logic:equal property="Course/IsUseNotebookPC" value="0">否</logic:equal>         
            <logic:equal property="Course/IsUseNotebookPC" value="1">是</logic:equal>
  </td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">拍&nbsp;花&nbsp;絮：</td>
            <td class="td1" colspan="4" width="333" height="22">          
             <logic:equal property="Course/IsTakeFeature" value="0">否</logic:equal>         
            <logic:equal property="Course/IsTakeFeature" value="1">是</logic:equal>
            </td>
            <td align="right" class="td2" width="86" height="22" colspan="2">数码照相：</td>
            <td class="td1" width="354" height="22">  
            <logic:equal property="Course/IsUseCamera" value="0">否</logic:equal>         
            <logic:equal property="Course/IsUseCamera" value="1">是</logic:equal>
  </td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="22">全程摄像：</td>
            <td class="td1" colspan="4" width="333" height="22">           
            <logic:equal property="Course/IsUseVideo" value="0">否</logic:equal>         
            <logic:equal property="Course/IsUseVideo" value="1">是</logic:equal>              
            </td>
            <td align="right" class="td2" width="86" height="22" colspan="2">媒体播放：</td>
            <td class="td1" width="354" height="22">  
            <logic:equal property="Course/IsUseMediaPlayer" value="0">否</logic:equal>         
            <logic:equal property="Course/IsUseMediaPlayer" value="1">是</logic:equal>             
  </td>
          </tr>
          <tr>
            <td align="right" class="td2" nowrap height="27">无线话筒：</td>
            <td class="td1" colspan="4" width="333" height="27">
           <bean:write  property="Course/RadioPhones"/>
            个</td>
            <td align="right" class="td2" width="86" height="27" colspan="2">有线话筒：</td>
            <td class="td1" width="354" height="27">
           <bean:write  property="Course/WiredPhones"/>
个</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="23" rowspan="4" height="121">　后勤辅助</td>
            <td align="right" class="td2" nowrap height="20">主席台座位：</td>
            <td colspan="7" class="td1" width="781" height="20">
           <bean:write  property="Course/PlatformSeats"/>
            张</td>  
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="22">学员座位：</td>
            <td class="td1" colspan="4" width="333" height="22">
             <bean:write  property="Course/StudentSeats"/>
             张</td>  
            <td align="right" class="td2" width="86" height="22" colspan="2">茶杯（茶叶）：</td>
            <td class="td1" width="354" height="22">
          <bean:write  property="Course/Cups"/>
              个</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="22">倒&nbsp;&nbsp;&nbsp;&nbsp;水：</td>
            <td class="td1" colspan="4" width="333" height="22">           
              <logic:equal property="Course/IsUseTea" value="0">否</logic:equal>         
            <logic:equal property="Course/IsUseTea" value="1">是</logic:equal>         
            
            </td> 
            <td align="right" class="td2" width="86" height="22" colspan="2">摆&nbsp;&nbsp;&nbsp;&nbsp;花：</td>
            <td class="td1" width="354" height="22">  
            <logic:equal property="Course/IsUseFlower" value="0">否</logic:equal>         
            <logic:equal property="Course/IsUseFlower" value="1">是</logic:equal> 
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap height="27">
              <p align="right">课桌布置形式：</p>
            </td>
            <td class="td1" colspan="7" width="773" height="27">
            <bean:write property="Course/DeskArrange"/>
           </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" width="117" colspan="2" height="22">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td> 
            <td colspan="7" class="td1" width="781" height="22">
          <bean:write property="Course/Remarks"/>
        </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2" nowrap colspan="2" height="22">发送通知：</td>
            <td colspan="7" class="td1" width="781" height="22">
            <logic:equal property="Course/IsSendNotice" value="0">否</logic:equal>         
            <logic:equal property="Course/IsSendNotice" value="1">是</logic:equal> 
</td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
               <input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>